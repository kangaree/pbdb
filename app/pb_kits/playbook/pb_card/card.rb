module Playbook
  module PbCard
    class Card < Playbook::PbKit::Base
      PROPS = [:configured_aria,
            :configured_classname,
            :configured_data,
            :configured_id,
            :configured_shadow,
            :block].freeze

      def initialize(aria: default_configuration,
                   classname: default_configuration,
                   data: default_configuration,
                   id: default_configuration,
                   shadow: default_configuration,
                   &block)
        self.configured_aria = aria
        self.configured_classname = classname
        self.configured_data = data
        self.configured_id = id
        self.configured_shadow = shadow
        self.block = block_given? ? block : nil
      end

      def shadow
        shadow_options = %w(shallow default deep deeper deepest)
        one_of_value(configured_shadow, shadow_options, "")
      end

      def shadow_class
        adjusted_value(self.shadow, "shadow_#{self.shadow}", nil)
      end

      def yield(context:)
        context.capture(&block)
      end

      def kit_class
        card_options = [
          "pb_card",
          shadow_class
        ]
        card_options.reject(&:nil?).join(" ")
      end

      def to_partial_path
        "pb_card/card"
      end

    private

      DEFAULT = Object.new
      private_constant :DEFAULT
      def default_configuration
        DEFAULT
      end
      attr_accessor(*PROPS)
    end
  end
end
