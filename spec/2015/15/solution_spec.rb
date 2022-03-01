# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Year2015::Day15) do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2015/15/input.txt")) }
  let(:example_input) do
    <<~EXAMPLE
      Butterscotch: capacity -1, durability -2, flavor 6, texture 3, calories 8
      Cinnamon: capacity 2, durability 3, flavor -2, texture -1, calories 3
    EXAMPLE
  end

  describe "part one" do
    it "finds 62_842_880 as total score of the highest-scoring cookie made with example input" do
      expect(described_class.part_one(example_input)).to(eq(62_842_880))
    end

    it "finds 21_367_368 as total score of the highest-scoring cookie made with input" do
      expect(described_class.part_one(input)).to(eq(21_367_368))
    end
  end

  describe "part two" do
    it "finds 57_600_000 as total score of the highest-scoring cookie made with example input with 500 cal" do
      expect(described_class.part_two(example_input)).to(eq(57_600_000))
    end

    it "finds 1_766_400 as total score of the highest-scoring cookie made with input with 500 cal" do
      expect(described_class.part_two(input)).to(eq(1_766_400))
    end
  end
end
