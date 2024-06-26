# frozen_string_literal: true

module Playbook
  module PbTable
    class TableHead < Playbook::KitBase
      prop :tag, type: Playbook::Props::Enum,
                 values: %w[table div],
                 default: "table"

      def classname
        generate_classname("pb_table_thead")
      end
    end
  end
end
