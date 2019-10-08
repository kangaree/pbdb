# frozen_string_literal: true

require_relative "../../../../app/pb_kits/playbook/pb_checkbox/checkbox"

RSpec.describe Playbook::PbCheckbox::Checkbox do
  subject { Playbook::PbCheckbox::Checkbox }

  it { is_expected.to define_partial }

  it { is_expected.to define_boolean_prop(:dark).with_default(false) }
  it { is_expected.to define_prop(:text) }
  it { is_expected.to define_prop(:value) }
  it { is_expected.to define_prop(:name) }
  it { is_expected.to define_boolean_prop(:checked).with_default(false) }
  it { is_expected.to define_boolean_prop(:icon).with_default(false) }

  describe "#classname" do
    it "returns namespaced class name", :aggregate_failures do
      expect(subject.new({}).classname).to eq "pb_checkbox_kit_off"
      expect(subject.new(dark: true).classname).to eq "pb_checkbox_kit_dark_off"
      expect(subject.new(checked: true).classname).to eq "pb_checkbox_kit_on"
      expect(subject.new(dark: true, checked: true).classname).to eq "pb_checkbox_kit_dark_on"
      expect(subject.new(classname: "additional_class").classname).to eq "pb_checkbox_kit_off additional_class"
    end
  end
end
