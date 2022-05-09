# frozen_string_literal: true

module Year2015
  CODEPOINT_A = 97
  DEFAULT_BASE = 26
  DEFAULT_LENGTH = 8

  class Day11 < Solution
    def part_one
      shift_notation(find_next_password(unshift_notation(data)))
    end

    def part_two
      shift_notation(find_next_password(
        increment_password(find_next_password(unshift_notation(data)))
      ))
    end

    private

    def initialize(input)
      super
      @increasing_straights = ("a".."z").map { |c| unshift_notation(c) }.each_cons(3).to_set
      @offending_characters = ["i", "o", "l"].map { |c| unshift_notation(c) }.to_set
    end

    def unshift_notation(digits)
      digits.codepoints.map do |codepoint|
        (codepoint - CODEPOINT_A).to_s(DEFAULT_BASE)
      end.join
    end

    def find_next_password(password)
      password = increment_password(password) until valid_password?(password)
      password
    end

    def increment_password(password)
      password.to_i(DEFAULT_BASE).succ.to_s(DEFAULT_BASE).rjust(DEFAULT_LENGTH, "0")
    end

    def valid_password?(password)
      return false if @offending_characters.include?(password[0])
      return false if @offending_characters.include?(password[1])

      has_inc_straight = false
      pairs = Set.new
      password.chars.each_cons(3) do |a, b, c|
        return false if @offending_characters.include?(c)

        has_inc_straight = true if @increasing_straights.include?([a, b, c])
        pairs.add([a, b]) if a == b
        pairs.add([b, c]) if b == c
        return true if has_inc_straight && pairs.size == 2
      end
      false
    end

    def shift_notation(digits)
      digits.chars.map do |char|
        (char.to_i(DEFAULT_BASE) + CODEPOINT_A).chr
      end.join
    end
  end
end
