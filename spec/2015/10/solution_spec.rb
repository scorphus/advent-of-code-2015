# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Year2015::Day10) do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2015/10/input.txt")) }

  describe "part one" do
    [
      ["1", 82_350],
      ["11", 107_312],
      ["21", 139_984],
      ["1211", 182_376],
      ["111221", 237_746],
    ].each do |digits, length|
      it "generates a result of length #{length} with #{digits}" do
        expect(described_class.part_one(digits)).to(eq(length))
      end
    end

    it "generates a result of length 252_594 with input digits" do
      expect(described_class.part_one(input)).to(eq(252_594))
    end
  end

  describe "part two" do
    [
      ["1", 116_6642],
      ["11", 152_0986],
      ["21", 198_2710],
      ["1211", 258_4304],
      ["111221", 336_9156],
    ].each do |digits, length|
      it "generates a result of length #{length} with #{digits}" do
        expect(described_class.part_two(digits)).to(eq(length))
      end
    end

    it "generates a result of length 3_579_328 with input digits" do
      expect(described_class.part_two(input)).to(eq(3_579_328))
    end
  end
end
