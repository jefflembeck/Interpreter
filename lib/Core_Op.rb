require 'lib/Core_No'
require 'lib/Core_Id'
require 'lib/Core_Exp'

class Core_Op
  def initialize
    @t
    @no
    @id
    @lp
    @exp
    @rp
    self.parse_op
  end
  
  def parse_op
    @t = Tokenizer.instance.lookahead
    if @t.integer?
      @no = Core_No.new
    elsif @t.identifier?
      @id = Core_Id.new
    elsif @t == '('
      @lp  = Tokenizer.instance.get_next_token #burn (
      @exp = Core_Exp.new
      @rp  = Tokenizer.instance.get_next_token #burn )
    else
      raise InvalidCoreProgram.new("Broken Op - #{@t}")
    end
  end
  
  def print_op t
    if !@no.nil?
      @no.print_no(t)
    elsif !@id.nil?
      @id.print_id(t)
    else
      print "#{@lp}"
      @exp.print_exp(t)
      print "#{@rp} "
    end
  end
  
  def exec_op
  end
end