# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Year2015::Day04) do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2015/04/input.txt")) }

  describe "part one" do
    [
      ["abcdef", 609_043],
      ["pqrstuv", 1_048_970],
    ].each do |secret_key, number|
      it "finds #{number} that mines an AdventCoin with #{secret_key}" do
        expect(described_class.part_one(secret_key)).to(eq(number))
      end
    end

    it "finds 254_575 that mines an AdventCoin with input secret key" do
      expect(described_class.part_one(input)).to(eq(254_575))
    end
  end

  describe "part two" do
    [
      ["abcdef", 6_742_839],
      ["pqrstuv", 5_714_438],
    ].each do |secret_key, number|
      it "finds #{number} that mines an AdventCoin with #{secret_key}" do
        expect(described_class.part_two(secret_key)).to(eq(number))
      end
    end

    it "finds 1_038_736 that mines an AdventCoin with input secret key" do
      expect(described_class.part_two(input)).to(eq(1_038_736))
    end
  end
end
