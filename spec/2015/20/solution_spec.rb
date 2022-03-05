# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Year2015::Day20) do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2015/20/input.txt")) }

  describe "part one" do
    it "finds house 4 getting at least 60 presents" do
      expect(described_class.part_one("60\n")).to(eq(4))
    end

    it "finds house 6 getting at least 70 presents" do
      expect(described_class.part_one("70\n")).to(eq(6))
    end

    it "finds house 8 getting at least 120 presents" do
      expect(described_class.part_one("120\n")).to(eq(8))
    end

    it "finds house 776160 getting at least 33100000 presents" do
      expect(described_class.part_one("33100000\n")).to(eq(776160))
    end

    it "finds house 831600 getting at least as many presents as number in input" do
      expect(described_class.part_one(input)).to(eq(831600))
    end
  end

  describe "part two" do
    it "finds house 4 getting at least 60 presents" do
      expect(described_class.part_two("60\n")).to(eq(4))
    end

    it "finds house 6 getting at least 70 presents" do
      expect(described_class.part_two("70\n")).to(eq(4))
    end

    it "finds house 8 getting at least 120 presents" do
      expect(described_class.part_two("120\n")).to(eq(6))
    end

    it "finds house 786240 getting at least 33100000 presents" do
      expect(described_class.part_two("33100000\n")).to(eq(786240))
    end

    it "finds house 884520 getting at least as many presents as number in input" do
      expect(described_class.part_two(input)).to(eq(884520))
    end
  end
end
