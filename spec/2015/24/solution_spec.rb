# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Year2015::Day24) do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2015/24/input.txt")) }
  let(:example_input) do
    <<~EOF
      1
      2
      3
      4
      5
      7
      8
      9
      10
      11
    EOF
  end

  describe "part one" do
    it "finds 99 as quantum entanglement of the first group with example input" do
      expect(described_class.part_one(example_input)).to(eq(99))
    end

    it "finds 11846773891 as quantum entanglement of the first group with input" do
      expect(described_class.part_one(input)).to(eq(11846773891))
    end
  end

  describe "part two" do
    it "returns nil for the example input" do
      expect(described_class.part_two(example_input)).to(eq(nil))
    end

    it "returns nil for my input" do
      expect(described_class.part_two(input)).to(eq(nil))
    end
  end
end
