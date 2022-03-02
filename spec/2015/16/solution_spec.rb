# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Year2015::Day16) do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2015/16/input.txt")) }

  describe "part one" do
    it "finds out that it was Aunt Sue #373 who gave me the gift" do
      expect(described_class.part_one(input)).to(eq(373))
    end
  end

  describe "part two" do
    it "finds out that it was actually Aunt Sue #260 who gave me the gift" do
      expect(described_class.part_two(input)).to(eq(260))
    end
  end
end
