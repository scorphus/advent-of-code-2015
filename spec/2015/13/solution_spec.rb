# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Year2015::Day13) do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2015/13/input.txt")) }
  let(:example_input) do
    <<~EXAMPLE
      Alice would gain 54 happiness units by sitting next to Bob.
      Alice would lose 79 happiness units by sitting next to Carol.
      Alice would lose 2 happiness units by sitting next to David.
      Bob would gain 83 happiness units by sitting next to Alice.
      Bob would lose 7 happiness units by sitting next to Carol.
      Bob would lose 63 happiness units by sitting next to David.
      Carol would lose 62 happiness units by sitting next to Alice.
      Carol would gain 60 happiness units by sitting next to Bob.
      Carol would gain 55 happiness units by sitting next to David.
      David would gain 46 happiness units by sitting next to Alice.
      David would lose 7 happiness units by sitting next to Bob.
      David would gain 41 happiness units by sitting next to Carol.
    EXAMPLE
  end

  describe "part one" do
    it "finds best arrangement with 330 happiness units for example input" do
      expect(described_class.part_one(example_input)).to(eq(330))
    end

    it "finds best arrangement with 664 happiness units for example input" do
      expect(described_class.part_one(input)).to(eq(664))
    end
  end

  describe "part two" do
    it "finds best arrangement with 286 happiness units for example input" do
      expect(described_class.part_two(example_input)).to(eq(286))
    end

    it "finds best arrangement with 640 happiness units for example input" do
      expect(described_class.part_two(input)).to(eq(640))
    end
  end
end
