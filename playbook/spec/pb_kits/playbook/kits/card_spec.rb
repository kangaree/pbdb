# frozen_string_literal: true

require_relative "../../../../app/pb_kits/playbook/pb_card/card"

RSpec.describe Playbook::PbCard::Card do
  subject { Playbook::PbCard::Card }

  it { is_expected.to define_boolean_prop(:selected).with_default(false) }
  it {
    is_expected.to define_prop(:highlight)
      .of_type(Playbook::Props::Hash)
      .with_default({})
  }
  it {
    is_expected.to define_boolean_prop(:border_none)
      .with_default(false)
  }
  it do
    is_expected.to define_enum_prop(:shadow)
      .with_default("none")
      .with_values("none", "deep", "deeper", "deepest")
  end
  it do
    is_expected.to define_enum_prop(:background)
      .with_default("white")
      .with_values("white", "light", "dark", "windows", "siding", "doors", "solar", "roofing", "gutters", "insulation")
  end

  describe "#classname" do
    it "returns namespaced class name", :aggregate_failures do
      expect(subject.new({}).classname).to eq "pb_card_kit_deselected_background_white"
      expect(subject.new(selected: true).classname).to eq "pb_card_kit_selected_background_white"
      expect(subject.new(border_none: true).classname).to eq "pb_card_kit_deselected_background_white_border_none"
      expect(subject.new(shadow: "deeper").classname).to eq "pb_card_kit_deselected_shadow_deeper_background_white"
      expect(subject.new(selected: true, shadow: "deep").classname).to eq "pb_card_kit_selected_shadow_deep_background_white"
      expect(subject.new(classname: "additional_class").classname).to eq "pb_card_kit_deselected_background_white additional_class"
      expect(subject.new(highlight: { position: "top" }).classname).to eq "pb_card_kit_deselected_highlight_top_background_white"
      expect(subject.new(highlight: { position: "side" }).classname).to eq "pb_card_kit_deselected_highlight_side_background_white"
      expect(subject.new(highlight: { color: "windows" }).classname).to eq "pb_card_kit_deselected_highlight_windows_background_white"
      expect(subject.new(highlight: { color: "error" }).classname).to eq "pb_card_kit_deselected_highlight_error_background_white"
      expect(subject.new(highlight: { color: "category_2" }).classname).to eq "pb_card_kit_deselected_highlight_category_2_background_white"
      expect(subject.new(background: "dark", classname: "dark").classname).to eq "pb_card_kit_deselected_background_dark dark"
      expect(subject.new(background: "siding").classname).to eq "pb_card_kit_deselected_background_siding"
    end
  end
end
