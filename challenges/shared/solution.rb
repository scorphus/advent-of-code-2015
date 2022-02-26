# frozen_string_literal: true

# frozen_string_literal: true %>

class Solution
  def self.part_one(input)
    new(input).part_one
  end

  def self.part_two(input)
    new(input).part_two
  end

  def initialize(input)
    @input = input
  end

  def data
    @data ||= begin
      processed = @input.lines(chomp: true).map do |line|
        process_input(line)
      end

      processed.length == 1 ? processed.first : process_dataset(processed)
    end
  end

  private

  def process_input(line)
    line
  end

  def process_dataset(set)
    set
  end
end
