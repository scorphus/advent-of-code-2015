# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Year2015::Day18) do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2015/18/input.txt")) }
  let(:example_input) do
    <<~EXAMPLE
      .#.#.#
      ...##.
      #....#
      ..#...
      #.#..#
      ####..
    EXAMPLE
  end

  describe "part one" do
    it "leaves 4 lights on after 4 steps with grid from example input" do
      stub_const("Year2015::Day18::GRID_SIZE", 6)
      stub_const("Year2015::Day18::STEPS", 4)
      expect(described_class.part_one(example_input)).to(eq(4))
    end

    it "leaves 814 lights on after 100 steps with grid from input" do
      expect(described_class.part_one(input)).to(eq(814))
    end
  end

  describe "part two" do
    it "leaves 17 lights on after 4 steps with defective grid from example input" do
      stub_const("Year2015::Day18::GRID_SIZE", 6)
      stub_const("Year2015::Day18::STEPS", 5)
      expect(described_class.part_two(example_input)).to(eq(17))
    end

    it "leaves 1384 lights on after 100 steps with defective grid from input" do
      expect(described_class.part_two(input)).to(eq(924))
    end
  end
end
