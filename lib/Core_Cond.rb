require 'lib/Core_Comp.rb'

class Core_Cond
  
  def initialize
    @cmp
    @ex
    @negcnd
    @lb
    @cnd
    @andor
    @cnd2
    @rb
    @tok = Tokenizer.instance.lookahead
    self.parse_cond
  end
  
  def parse_cond
    case @tok
    when '('
      @cmp    = Core_Comp.new
    when '!'
      @ex     = Tokenizer.instance.get_next_token #get !
      @negcnd = Core_Cond.new
    when '['
      @lb     = Tokenizer.instance.get_next_token #get [
      @cnd    = Core_Cond.new
      @andor  = Tokenizer.instance.get_next_token # get && or ||
      @cnd2   = Core_Cond.new
      @rb     = Tokenizer.instance.get_next_token #get ]
    else
      raise InvalidCoreProgram.new("Broken Cond - #{@tok}")
    end
  end
  
  def print_cond t
    case @tok
    when '('
      @cmp.print_comp(t)
    when '!'
      print "#{@ex}"
      @negcnd.print_cond(t)
    else
      print "#{@lb}"
      @cnd.print_cond(t)
      print " #{@andor} "
      @cnd2.print_cond(t)
      print "#{@rb}"
    end
  end
  
  def exec_cond
  end
end