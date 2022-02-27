# frozen_string_literal: true

module Year2015
  class Day13 < Solution
    def part_one
      data
      all_arrangements.max
    end

    def part_two
      data
      @guests.map { |guest| @happiness[[guest, "me"]] = @happiness[["me", guest]] = 0 }
      @guests << "me"
      all_arrangements.max
    end

    private

    def initialize(input)
      super
      @guests = Set.new
      @happiness = {}
    end

    def process_input(line)
      line = line.gsub("happiness units by sitting next to ", "").gsub(".", "")
      line = line.gsub("would gain ", "").gsub("would lose ", "-")
      guest_a, units, guest_b = line.split
      @guests << guest_a << guest_b
      @happiness[[guest_a, guest_b]] = units.to_i
    end

    def all_arrangements
      @guests.to_a.permutation.map do |perm|
        perm.each_cons(2).reduce(0) do |sum, (guest_a, guest_b)|
          sum + @happiness[[guest_a, guest_b]] + @happiness[[guest_b, guest_a]]
        end + @happiness[[perm.first, perm.last]] + @happiness[[perm.last, perm.first]]
      end
    end
  end
end
