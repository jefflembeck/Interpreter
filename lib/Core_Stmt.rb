require 'lib/Core_Assign'
require 'lib/Core_If'
require 'lib/Core_Loop'
require 'lib/Core_In'
require 'lib/Core_Out'
require 'error/InvalidCoreProgram'

class Core_Stmt
  def initialize
    @i
    @loop
    @in
    @out
    @a
    @s = Tokenizer.instance.lookahead
    self.parse_stmt
  end
  
  def parse_stmt
    case @s
    when "if"
      @i = Core_If.new
    when "while"
      @loop = Core_Loop.new
    when "read"
      @in = Core_In.new
    when "write"
      @out = Core_Out.new
    else
      if @s.identifier?   
        @a = Core_Assign.new
      else
        raise InvalidCoreProgram.new("Broken Stmt - #{@s}")
      end
    end
  end
  
  def print_stmt t
    Core_Prog.print_tab(t)
    if !@i.nil?
      @i.print_if(t)
    elsif !@loop.nil?
      @loop.print_loop(t)
    elsif !@in.nil?
      @in.print_in(t)
    elsif !@out.nil?
      @out.print_out(t)
    else
      @a.print_assign(t)
    end
  end
  
  def exec_stmt
  end
end