# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2015::Day01 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2015/01/input.txt')) }

  describe 'part one' do
    [
      ['(())', 0],
      ['()()', 0],
      ['(((', 3],
      ['(()(()(', 3],
      ['())', -1],
      ['))(', -1],
      [')))', -3],
      [')())())', -3],
      ['))(((((', 3]
    ].each do |directions, floor|
      it "takes santa to floor #{floor} with directions #{directions}" do
        expect(described_class.part_one(directions)).to eq(floor)
      end
    end

    it 'takes santa to floor 74 with directions from input' do
      expect(described_class.part_one(input)).to eq(74)
    end
  end

  describe 'part two' do
    [
      [')', 1],
      ['()())', 5]
    ].each do |directions, position|
      it "enters basement at position #{position} with directions #{directions}" do
        expect(described_class.part_two(directions)).to eq(position)
      end
    end

    it 'enters basement at position 1795 with directions from input' do
      expect(described_class.part_two(input)).to eq(1795)
    end
  end
end
