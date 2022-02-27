# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Year2015::Day11) do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2015/11/input.txt")) }

  describe "part one" do
    [
      ["abcdefgh", "abcdffaa"],
      ["ghijklmn", "ghjaabcc"],
    ].each do |password, next_password|
      it "finds #{next_password} for #{password}" do
        expect(described_class.part_one(password)).to(eq(next_password))
      end
    end

    it "finds cqjxxyzz for input password" do
      expect(described_class.part_one(input)).to(eq("cqjxxyzz"))
    end
  end

  describe "part two" do
    [
      ["abcdefgh", "abcdffbb"],
      ["ghijklmn", "ghjbbcdd"],
    ].each do |password, next_password|
      it "finds #{next_password} for #{password}" do
        expect(described_class.part_two(password)).to(eq(next_password))
      end
    end

    it "finds cqkaabcc for input password" do
      expect(described_class.part_two(input)).to(eq("cqkaabcc"))
    end
  end
end
