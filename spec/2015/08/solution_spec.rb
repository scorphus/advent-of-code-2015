# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Year2015::Day08) do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2015/08/input.txt")) }
  let(:example_input) do
    <<~EXAMPLE
      ""
      "abc"
      "aaa\\"aaa"
      "\\x27"
    EXAMPLE
  end

  describe "part one" do
    it "gives 12 as answer with example input" do
      expect(described_class.part_one(example_input)).to(eq(12))
    end

    it "gives 1342 as answer with input" do
      expect(described_class.part_one(input)).to(eq(1342))
    end
  end

  describe "part two" do
    it "gives 19 as answer with example input" do
      expect(described_class.part_two(example_input)).to(eq(19))
    end

    it "gives 2074 as answer with input" do
      expect(described_class.part_two(input)).to(eq(2074))
    end
  end
end
