# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Year2015::Day02) do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2015/02/input.txt")) }

  describe "part one" do
    [
      ["2x3x4\n1x1x10", 101],
      ["3x4x2\n10x1x1", 101],
      ["10x1x1\n3x4x2", 101],
    ].each do |dimensions, paper|
      it "it takes #{paper} sqft of paper to wrap a present with dimensions #{dimensions}" do
        expect(described_class.part_one(dimensions)).to(eq(paper))
      end
    end

    it "it takes a total of 1_588_178 sqft of paper to wrap all the presents" do
      expect(described_class.part_one(input)).to(eq(1_588_178))
    end
  end

  describe "part two" do
    [
      ["2x3x4\n1x1x10", 48],
      ["3x4x2\n10x1x1", 48],
      ["10x1x1\n3x4x2", 48],
    ].each do |dimensions, ribbon|
      it "it takes #{ribbon} feet of ribbon to wrap a present with dimensions #{dimensions}" do
        expect(described_class.part_two(dimensions)).to(eq(ribbon))
      end
    end

    it "it takes a total of 3_783_758 feet of ribbon to wrap all the presents" do
      expect(described_class.part_two(input)).to(eq(3_783_758))
    end
  end
end
