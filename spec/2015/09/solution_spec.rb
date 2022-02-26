# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Year2015::Day09) do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2015/09/input.txt")) }
  let(:example_input) do
    <<~EXAMPLE
      London to Dublin = 464
      London to Belfast = 518
      Dublin to Belfast = 141
    EXAMPLE
  end

  describe "part one" do
    it "finds 605 as shortest distance with example input" do
      expect(described_class.part_one(example_input)).to(eq(605))
    end

    it "finds 141 as shortest distance with input" do
      expect(described_class.part_one(input)).to(eq(141))
    end
  end

  describe "part two" do
    it "finds 982 as longest distance with example input" do
      expect(described_class.part_two(example_input)).to(eq(982))
    end

    it "finds 736 as longest distance with input" do
      expect(described_class.part_two(input)).to(eq(736))
    end
  end
end
