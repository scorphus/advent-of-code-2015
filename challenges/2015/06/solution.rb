# frozen_string_literal: true

module Year2015
  class Day06 < Solution
    def part_one
      data.each do |action, from, to|
        case action
        when "on"
          set_brightness(from, to, 1)
        when "off"
          set_brightness(from, to, 0)
        when "toggle"
          toggle_brightness(from, to)
        end
      end
      @lights.sum { |_, v| v }
    end

    def part_two
      data.each do |action, from, to|
        case action
        when "on"
          adjust_brightness(from, to, 1)
        when "off"
          adjust_brightness(from, to, -1)
        when "toggle"
          adjust_brightness(from, to, 2)
        end
      end
      @lights.sum { |_, v| v }
    end

    private

    def initialize(input)
      super
      @lights = {}
    end

    def process_input(line)
      action, from, _, to = line.gsub("turn ", "").split
      [action, from.split(",").map(&:to_i), to.split(",").map(&:to_i)]
    end

    def set_brightness((x1, y1), (x2, y2), value)
      (x1..x2).each do |x|
        (y1..y2).each do |y|
          @lights[[x, y]] = value
        end
      end
    end

    def toggle_brightness((x1, y1), (x2, y2))
      (x1..x2).each do |x|
        (y1..y2).each do |y|
          @lights[[x, y]] = @lights.fetch([x, y], 0) ^ 1
        end
      end
    end

    def adjust_brightness((x1, y1), (x2, y2), amount)
      (x1..x2).each do |x|
        (y1..y2).each do |y|
          brightness = @lights.fetch([x, y], 0)
          @lights[[x, y]] = brightness + amount if brightness > 0 || amount > 0
        end
      end
    end
  end
end
