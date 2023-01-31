# frozen_string_literal: true

require "yaml"
require "redcarpet"
require "rouge"

require_relative "application_controller"

class PagesController < ApplicationController
  before_action :set_js, only: %i[visual_guidelines]
  before_action :set_kit, only: %i[kit_show_rails kit_show_react]
  before_action :ensure_kit_type_exists, only: %i[kit_show_rails kit_show_react]
  before_action :set_category, only: %i[kit_category_show_rails kit_category_show_react]
  before_action :delete_dark_mode_cookie, only: %i[home getting_started visual_guidelines]

  def disable_dark_mode
    cookies[:dark_mode] = {
      value: "false",
    }
    redirect_back(fallback_location: root_path)
  end

  def enable_dark_mode
    cookies[:dark_mode] = {
      value: "true",
    }
    redirect_back(fallback_location: root_path)
  end

  def getting_started
    @rails_getting_started = Rails.root.join("app/views/pages/getting_started_partials/_rails_getting_started.md").read
    @react_getting_started = Rails.root.join("app/views/pages/getting_started_partials/_react_getting_started.md").read
  end

  def changelog
    @data = Playbook::Engine.root.join("CHANGELOG.md").read
  end

  def grid
    render layout: "layouts/grid"
  end

  def home; end

  def kits
    params[:type] ||= "react"
    @type = params[:type]
    render layout: "layouts/kits"
  end

  def all_kit_examples
    params[:type] ||= "react"
    @type = params[:type]
    render layout: "layouts/kits"
  end

  def kit_category_show_rails
    params[:type] ||= "rails"
    @type = params[:type]
    render template: "pages/kit_category_show", layout: "layouts/kits"
  end

  def kit_category_show_react
    render template: "pages/kit_category_show", layout: "layouts/kits"
  end

  def kit_show_rails
    @type = "rails"
    render "pages/kit_show", layout: "layouts/kits"
  end

  def kit_show_react
    @type = "react"
    render template: "pages/kit_show", layout: "layouts/kits"
  end

  def kit_show_new
    @kit = params[:name]
    @examples = kit_examples
    render "pages/kit_show_new", layout: "layouts/kits"
  end

  def kit_show_demo
    @kit = params[:name]
    @examples = kit_examples
    render "pages/kit_show_demo", layout: "layouts/kits"
  end

  def principles; end

  # TODO: rename this method once all guidelines are completed
  def visual_guidelines
    formatter = Rouge::Formatters::HTML.new
    lexer = Rouge::Lexer.find("react")
    kit_examples = {}
    Dir.glob(Rails.root.join("app/views/pages/code_snippets/*.txt")).each do |example_path|
      example_txt = File.read(example_path)

      formatted_example_txt = formatter.format(lexer.lex(example_txt))
      kit_examples[example_path.split("/").last.sub(".txt", "")] = formatted_example_txt
    end
    @kit_examples_json = kit_examples
    render "pages/visual_guidelines", layout: "layouts/visual_guidelines"
  end

  def get_source(example)
    read_kit_file("_#{example}.jsx")
  end
  helper_method :get_source

private

  def set_js
    @application_js.concat ["visual_guidelines"]
  end

  def set_category
    categories = MENU["kits"].map { |link| link.first.first if link.is_a?(Hash) }.compact
    @category = params[:name]
    if categories.flatten.include?(@category)
      @category_kits = MENU["kits"].map { |link| link.first.last if link.is_a?(Hash) && link.first.first == @category }.compact.flatten
      @kits = params[:name]
    else
      redirect_to root_path, flash: { error: "That kit does not exist" }
    end
  end

  def set_kit
    menu = MENU["kits"].map { |link| link.is_a?(Hash) ? link.first.last : link }
    if menu.flatten.include?(params[:name])
      @kit = params[:name]
    else
      redirect_to root_path, flash: { error: "That kit does not exist" }
    end
  end

  def ensure_kit_type_exists
    # TODO: unsure why we cannot simply use the helpers that are included in ApplicationController - fix this
    is_rails_kit = action_name == "kit_show_rails"
    files = is_rails_kit ? File.join("**", "*.erb") : File.join("**", "*.jsx")
    kit_files = Dir.glob(files, base: "#{Playbook::Engine.root}/app/pb_kits/playbook/pb_#{@kit}/docs").present?
    unless kit_files.present?
      redirect_to action: is_rails_kit ? "kit_show_react" : "kit_show_rails"
    end
  end

  def pb_doc_kit_path(kit, *args)
    Playbook.kit_path(kit, "docs", *args)
  end

  def pb_doc_kit_examples(kit, type)
    example_file = pb_doc_kit_path(kit, "example.yml")
    if File.exist?(example_file)
      examples_list = YAML.load_file(example_file)
                          .inject({}) { |item, (k, v)| item[k.to_sym] = v; item }
      examples_list.dig(:examples, type) || []
    else
      []
    end
  end

  def kit_examples
    pb_doc_kit_examples(params[:name], "rails")
  end

  def read_kit_file(*args)
    path = ::Playbook.kit_path(@kit, "docs", *args)
    path.exist? ? path.read : ""
  end
end
