class MinilangError < StandardError; end
class InvalidTokenError < MinilangError; end
class EmptyStackError < MinilangError; end


class Minilang
  attr_accessor :stack, :register, :program

  ACTIONS = %w(ADD DIV MULT MOD SUB PUSH POP PRINT)

  def initialize(program)
    @program = program
  end

  def eval
    @stack = Array.new
    @register = 0

    program.split.each {|token| eval_token(token)}

  rescue MinilangError => error
    puts error.message
  end

  def eval_token(token)
    if ACTIONS.include?(token)
      send(token.downcase)
    elsif /\A[-+]?\d+\z/.match(token)
      self.register = token.to_i
    else
      raise InvalidTokenError, "Invalid token: #{token}"
    end
  end

  def pop
    raise EmptyStackError, "Empty Stack!" if stack.empty?
    self.register = stack.pop
  end

  def add
    self.register += pop
  end

  def div
    self.register /= pop
  end

  def mult
    self.register *= pop
  end

  def mod
    self.register %= pop
  end

  def sub
    self.register -= pop
  end

  def push
    stack.push(register)
  end

  def print
    puts register
  end

end

Minilang.new('PRINT').eval
Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT').eval
Minilang.new('5 PUSH POP POP PRINT').eval
Minilang.new('-3 PUSH 5 XSUB PRINT').eval
Minilang.new('6 PUSH').eval
