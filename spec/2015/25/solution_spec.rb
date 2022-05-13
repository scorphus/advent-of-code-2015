# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Year2015::Day25) do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2015/25/input.txt")) }
  let(:example_input_1) do
    <<~EOF
      To continue, please consult the code grid in the manual.  Enter the code at row 3, column 3.
    EOF
  end
  let(:example_input_2) do
    <<~EOF
      To continue, please consult the code grid in the manual.  Enter the code at row 6, column 6.
    EOF
  end
  let(:example_input_3) do
    <<~EOF
      To continue, please consult the code grid in the manual.  Enter the code at row 3, column 5.
    EOF
  end
  let(:example_input_4) do
    <<~EOF
      To continue, please consult the code grid in the manual.  Enter the code at row 5, column 3.
    EOF
  end

  describe "part one" do
    it "tells me to give 1601130 to the machine with example input 1" do
      expect(described_class.part_one(example_input_1)).to(eq(1601130))
    end

    it "tells me to give 27995004 to the machine with example input 2" do
      expect(described_class.part_one(example_input_2)).to(eq(27995004))
    end

    it "tells me to give 11661866 to the machine with example input 3" do
      expect(described_class.part_one(example_input_3)).to(eq(11661866))
    end

    it "tells me to give 28094349 to the machine with example input 4" do
      expect(described_class.part_one(example_input_4)).to(eq(28094349))
    end

    it "tells me to give 19980801 to the machine with input" do
      expect(described_class.part_one(input)).to(eq(19980801))
    end
  end

  describe "part two" do
    it "starts the weather machine" do
      expect(described_class.part_two(input))
        .to(include("It comes to life!").and(include("Snow begins to fall.")))
    end
  end
end
