# frozen_string_literal: true

module Playbook
  module PbAvatar
    class Avatar < Playbook::PbKit::Base
      PROPS = %i[configured_aria
                 configured_classname
                 configured_data
                 configured_id
                 configured_image
                 configured_name
                 configured_size
                 configured_status].freeze

      def initialize(aria: default_configuration,
                     classname: default_configuration,
                     data: default_configuration,
                     id: default_configuration,
                     image: default_configuration,
                     name: default_configuration,
                     size: default_configuration,
                     status: default_configuration)
        self.configured_aria = aria
        self.configured_classname = classname
        self.configured_data = data
        self.configured_id = id
        self.configured_image = image
        self.configured_name = name
        self.configured_size = size
        self.configured_status = status
      end

      def image
        if is_set? configured_image
          pb_image = Playbook::PbImage::Image.new(configured_image)
          ApplicationController.renderer.render(partial: pb_image, as: :object)
        end
      end

      def initials
        adjusted_value(configured_name, configured_name.split.map(&:first).join.downcase, "")
      end

      def size
        size_options = %w[xs sm md base lg xl]
        one_of_value(configured_size, size_options, "md")
      end

      def status
        if is_set? configured_status
          online_status_props = { status: configured_status, classname: "size_#{size}" }
          pb_status = Playbook::PbOnlineStatus::OnlineStatus.new(online_status_props)
          ApplicationController.renderer.render(partial: pb_status, as: :object)
        end
      end

      def kit_class
        avatar_options = [
          "pb_avatar",
          size,
        ]
        avatar_options.join("_")
      end

      def to_partial_path
        "pb_avatar/avatar"
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
