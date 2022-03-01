# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Year2015::Day14) do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2015/14/input.txt")) }
  let(:example_input) do
    <<~EXAMPLE
      Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
      Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.
    EXAMPLE
  end

  describe "part one" do
    it "finds 1120 as the distance traveled by the winning reindeer with example input" do
      stub_const("Year2015::Day14::SECONDS", 1000)
      expect(described_class.part_one(example_input)).to(eq(1120))
    end

    it "finds 2660 as the distance traveled by the winning reindeer with input" do
      expect(described_class.part_one(input)).to(eq(2660))
    end
  end

  describe "part two" do
    it "finds 1120 as the distance traveled by the winning reindeer with example input" do
      stub_const("Year2015::Day14::SECONDS", 1000)
      expect(described_class.part_two(example_input)).to(eq(689))
    end

    it "finds 1256 as the distance traveled by the winning reindeer with input" do
      expect(described_class.part_two(input)).to(eq(1256))
    end
  end
end
