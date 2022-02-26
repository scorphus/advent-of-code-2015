# frozen_string_literal: true

require "digest"

module Year2015
  class Day04 < Solution
    def part_one
      find_number("00000")
    end

    def part_two
      find_number("000000")
    end

    private

    def find_number(digest_preffix)
      n = 1
      loop do
        break if Digest::MD5.hexdigest("#{data}#{n}").start_with?(digest_preffix)

        n += 1
      end
      n
    end
  end
end
