# frozen_string_literal: true

module Playbook
  module PbBarGraph
    class BarGraph
      include Playbook::Props
      partial "pb_bar_graph/bar_graph"

      prop :axis_title
      prop :chart_data, type: Playbook::Props::Array,
                        default: []
      prop :orientation, type: Playbook::Props::Enum,
                         values: %w[vertical horizontal],
                         default: "vertical"
      prop :point_start, type: Playbook::Props::Numeric
      prop :subtitle
      prop :title

      def chart_type
        orientation == "horizontal" ? "bar" : "column"
      end

      def chart_options
        {
          id: id,
          chartData: chart_data,
          type: chart_type,
          title: title,
          subtitle: subtitle,
          axisTitle: axis_title,
          pointStart: point_start,
        }.to_json.html_safe
      end

      def classname
        generate_classname("pb_bar_graph")
      end
    end
  end
end
