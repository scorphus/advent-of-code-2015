# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2015::Day06 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2015/06/input.txt')) }
  let(:example_part_one) do
    <<~EXAMPLE
      turn on 0,0 through 999,999
      toggle 0,0 through 999,0
      turn off 499,499 through 500,500
    EXAMPLE
  end
  let(:example_part_two) do
    <<~EXAMPLE
      turn on 0,0 through 0,0
      toggle 0,0 through 999,999
    EXAMPLE
  end

  describe 'part one' do
    it 'lits 998_996 lights with example input' do
      expect(described_class.part_one(example_part_one)).to eq(998_996)
    end

    it 'lits 543_903 lights with input' do
      expect(described_class.part_one(input)).to eq(543_903)
    end
  end

  describe 'part two' do
    it 'lits 2_000_001 lights with example input' do
      expect(described_class.part_two(example_part_two)).to eq(2_000_001)
    end

    it 'lits 14_687_245 lights with input' do
      expect(described_class.part_two(input)).to eq(14_687_245)
    end
  end
end
