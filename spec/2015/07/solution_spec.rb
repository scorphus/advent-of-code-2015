# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2015::Day07 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2015/07/input.txt')) }
  let(:example_part_one) do
    <<~EXAMPLE
      g -> a
      123 -> x
      456 -> y
      x AND y -> d
      x OR y -> e
      x LSHIFT 2 -> f
      y RSHIFT 2 -> g
      NOT x -> h
      NOT y -> i
    EXAMPLE
  end
  let(:example_part_two) do
    <<~EXAMPLE
      b OR g -> a
      7 -> b
      123 -> x
      456 -> y
      x AND y -> d
      x OR y -> e
      x LSHIFT 2 -> f
      y RSHIFT 2 -> g
      NOT x -> h
      NOT y -> i
    EXAMPLE
  end

  describe 'part one' do
    it 'provides 114 in wire a with example input' do
      expect(described_class.part_one(example_part_one)).to eq(114)
    end

    it 'provides 3176 in wire a with input' do
      expect(described_class.part_one(input)).to eq(3176)
    end
  end

  describe 'part two' do
    it 'provides 119 in wire a with example input' do
      expect(described_class.part_two(example_part_two)).to eq(119)
    end

    it 'provides 14_710 in wire a with input' do
      expect(described_class.part_two(input)).to eq(14_710)
    end
  end
end
