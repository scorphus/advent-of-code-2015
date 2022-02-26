# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Year2015::Day05) do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2015/05/input.txt")) }
  let(:example_part_one) do
    <<~EXAMPLE
      ugknbfddgicrmopn
      aaa
      jchzalrnumimnmhp
      haegwjzuvuyypxyu
      dvszwmarrgswjxmb
    EXAMPLE
  end
  let(:example_part_two) do
    <<~EXAMPLE
      qjhvhtzxzqqjkmpb
      xxyxx
      uurcxstgmygtbstg
      ieodomkazucvgmuy
    EXAMPLE
  end

  describe "part one" do
    it "finds 2 nice strings in example input" do
      expect(described_class.part_one(example_part_one)).to(eq(2))
    end

    it "finds 236 nice strings in input" do
      expect(described_class.part_one(input)).to(eq(236))
    end
  end

  describe "part two" do
    it "finds 2 nice strings in example input" do
      expect(described_class.part_two(example_part_two)).to(eq(2))
    end

    it "finds 51 nice strings in input" do
      expect(described_class.part_two(input)).to(eq(51))
    end
  end
end
