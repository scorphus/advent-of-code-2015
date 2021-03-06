# frozen_string_literal: true

module Year2015
  class Day19 < Solution
    def part_one
      @molecule.each_with_index.each_with_object(Set.new) do |(atom, i), molecules|
        next unless @replacements.key?(atom)

        @replacements[atom].each do |replacement|
          molecules << (@molecule[...i] + [replacement] + @molecule[i + 1..]).join
        end
        molecules
      end.size
    end

    def part_two
      @molecule.reduce(0) do |steps, atom|
        steps += 1 if atom != atom.downcase
        steps -= 1 if atom == "Rn" || atom == "Ar"
        steps -= 2 if atom == "Y"
        steps
      end - (@molecule.include?("Y") ? 1 : 0)
    end

    private

    def initialize(input)
      super
      @replacements = {}
      input.split("\n")[..-3].each do |line|
        from, to = line.split(" => ")
        @replacements[from] ||= []
        @replacements[from] << to
      end
      @molecule = input.split("\n")[-1].scan(/[A-Z][a-z]*/)
    end
  end
end
