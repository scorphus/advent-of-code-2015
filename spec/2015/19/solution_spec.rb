# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Year2015::Day19) do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2015/19/input.txt")) }
  let(:example_input) do
    <<~EXAMPLE
      H => HO
      H => OH
      O => HH
    EXAMPLE
  end

  describe "part one" do
    it "finds 4 distinct molecules with example input and HOH molecule" do
      expect(described_class.part_one(example_input + "\nHOH")).to(eq(4))
    end

    it "finds 7 distinct molecules with example input and HOHOHO molecule" do
      expect(described_class.part_one(example_input + "\nHOHOHO")).to(eq(7))
    end

    it "finds 576 distinct molecules" do
      expect(described_class.part_one(input)).to(eq(576))
    end
  end
end
