# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Year2015::Day12) do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2015/12/input.txt")) }

  describe "part one" do
    [
      ["[1,2,3]", 6],
      ['{"a":2,"b":4}', 6],
      ["[[[3]]]", 3],
      ['{"a":{"b":4},"c":-1}', 3],
      ['{"a":[-1,1]}', 0],
      ['[-1,{"a":1}]', 0],
      ["[]", 0],
      ["{}", 0],
    ].each do |document, sum|
      it "finds #{sum} for #{document}" do
        expect(described_class.part_one(document)).to(eq(sum))
      end
    end

    it "finds 191_164 for input document" do
      expect(described_class.part_one(input)).to(eq(191_164))
    end
  end

  describe "part two" do
    [
      ["[1,2,3]", 6],
      ['[1,{"c":"red","b":2},3]', 4],
      ['{"d":"red","e":[1,2,3,4],"f":5}', 0],
      ['{"a":{"b":4},"c":-1}', 3],
      ['{"a":{"b":4,"foo":"red"},"c":-1}', -1],
      ['[1,"red",5]', 6],
      ["[]", 0],
      ["{}", 0],
    ].each do |document, sum|
      it "finds #{sum} for #{document}" do
        expect(described_class.part_two(document)).to(eq(sum))
      end
    end

    it "finds 87_842 for input document" do
      expect(described_class.part_two(input)).to(eq(87_842))
    end
  end
end
