# frozen_string_literal: true

module Year2015
  class TurinLock
    def initialize(instructions)
      @instructions = instructions
      @registers = Hash.new(0)
      @pointer = 0
    end

    def hlf(register)
      @registers[register] /= 2
      1
    end

    def tpl(register)
      @registers[register] *= 3
      1
    end

    def inc(register)
      @registers[register] += 1
      1
    end

    def jmp(offset)
      offset.to_i
    end

    def jie(register, offset)
      @registers[register].even? ? offset.to_i : 1
    end

    def jio(register, offset)
      @registers[register] == 1 ? offset.to_i : 1
    end

    def run
      loop do
        instruction, *args = @instructions[@pointer]
        @pointer += send(instruction, *args)
        break if @pointer >= @instructions.size
      end
      @registers
    end

    def set(register, value)
      @registers[register] = value
    end
  end

  class Day23 < Solution
    DESIRED_REGISTER = "b"

    def part_one
      TurinLock.new(data).run[DESIRED_REGISTER].to_i
    end

    def part_two
      turin_lock = TurinLock.new(data)
      turin_lock.set("a", 1)
      turin_lock.run[DESIRED_REGISTER].to_i
    end

    private

    def process_input(line)
      line.split(/[ ,]+/)
    end
  end
end
