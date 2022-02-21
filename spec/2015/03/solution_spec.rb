# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2015::Day03 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2015/03/input.txt')) }

  describe 'part one' do
    [
      ['>', 2],
      ['^>v<', 4],
      ['^v^v^v^v^v', 2]
    ].each do |directions, houses|
      it "#{houses} houses receive at least one present with directions #{directions}" do
        expect(described_class.part_one(directions)).to eq(houses)
      end
    end

    it '2592 houses receive at least one present with directions from input' do
      expect(described_class.part_one(input)).to eq(2592)
    end
  end

  describe 'part two' do
    [
      ['^v', 3],
      ['^>v<', 3],
      ['^v^v^v^v^v', 11]
    ].each do |directions, houses|
      it "#{houses} houses receive at least one present with directions #{directions}" do
        expect(described_class.part_two(directions)).to eq(houses)
      end
    end

    it '2360 houses receive at least one present with directions from input' do
      expect(described_class.part_two(input)).to eq(2360)
    end
  end
end
