# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Year2015::Day17) do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2015/17/input.txt")) }
  let(:example_input) do
    <<~EXAMPLE
      20
      15
      10
      5
      5
    EXAMPLE
  end

  describe "part one" do
    it "finds 4 different combinations that fit 25 liters of eggnog with example input" do
      stub_const("Year2015::Day17::TOTAL_EGGNOG", 25)
      expect(described_class.part_one(example_input)).to(eq(4))
    end

    it "finds 654 different combinations that fit 150 liters of eggnog with input" do
      expect(described_class.part_one(input)).to(eq(654))
    end
  end

  describe "part two" do
    it "finds 3 different ways to fit 25 liters of eggnog in the least number of containers with example input" do
      stub_const("Year2015::Day17::TOTAL_EGGNOG", 25)
      expect(described_class.part_two(example_input)).to(eq(3))
    end

    it "finds 57 different ways to fit 150 liters of eggnog in the least number of containers with input" do
      expect(described_class.part_two(input)).to(eq(57))
    end
  end
end
