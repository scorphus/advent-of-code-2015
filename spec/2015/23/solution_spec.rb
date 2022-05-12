# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Year2015::Day23) do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2015/23/input.txt")) }
  let(:example_input) do
    <<~EOF
      inc a
      jio a, +2
      tpl a
      inc a
    EOF
  end

  describe "part one" do
    it "gives 2 as the value in register a for example input" do
      stub_const("Year2015::Day23::DESIRED_REGISTER", "a")
      expect(described_class.part_one(example_input)).to(eq(2))
    end

    it "gives 255 as the value in register b for input" do
      expect(described_class.part_one(input)).to(eq(255))
    end
  end

  describe "part two" do
    it "gives 7 as the value in register a for example input" do
      stub_const("Year2015::Day23::DESIRED_REGISTER", "a")
      expect(described_class.part_two(example_input)).to(eq(7))
    end

    it "gives 334 as the value in register b for input" do
      expect(described_class.part_two(input)).to(eq(334))
    end
  end
end
