# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Year2015::Day21) do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2015/21/input.txt")) }

  describe "part one" do
    it "finds 121 as least amount of gold I can spend and still win the fight" do
      expect(described_class.part_one(input)).to(eq(121))
    end
  end

  describe "part two" do
    it "finds 201 as most amount of gold I can spend and still lose the fight" do
      expect(described_class.part_two(input)).to(eq(201))
    end
  end
end
