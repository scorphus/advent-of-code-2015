# frozen_string_literal: true

require "tsort"

class Hash
  include TSort
  alias_method :tsort_each_node, :each_key
  def tsort_each_child(node, &block)
    fetch(node).each(&block)
  end
end

module Year2015
  class Day07 < Solution
    def part_one
      get_wire("a")
    end

    def part_two
      a_signal = get_wire("a")
      @instructions["b"] = a_signal.to_s
      @wires = {}
      get_wire("a")
    end

    private

    def initialize(input)
      super
      @wires = {}
      @graph = {}
      @instructions = {}
      @input =
        input
          .gsub("AND", "&")
          .gsub("OR", "|")
          .gsub("NOT", "~")
          .gsub("LSHIFT", "<<")
          .gsub("RSHIFT", ">>")
          .gsub("do", "do_")
          .gsub("if", "if_")
          .gsub("in", "in_")
    end

    def process_dataset(set)
      set.each do |line|
        expression, wire = line.split(" -> ")
        operands = expression.scan(/[a-z_]+/)
        @graph[wire] = operands
        @instructions[wire] = expression
      end
    end

    def get_wire(target_wire)
      data
      @graph.tsort.each do |wire|
        evaluate_instruction(wire)
        return @wires[wire] if wire == target_wire
      end
    end

    def evaluate_instruction(wire)
      operands = @graph[wire].map do |operand|
        "#{operand}=#{@wires[operand]};"
      end.join
      # rubocop:disable Security/Eval
      @wires[wire] = eval("#{operands}#{@instructions[wire]}")
      # rubocop:enable Security/Eval
    end
  end
end
