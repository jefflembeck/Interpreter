require 'lib/Core_Cond'
require 'lib/Core_Stmt_Seq'

class Core_If
  
  def initialize
    @if
    @c
    @then
    @ss
    @endelse
    @semi
    @ss2
    @end
    @semi2
    self.parse_if
  end
  
  def parse_if
    @if      = Tokenizer.instance.get_next_token #grab if
    @c       = Core_Cond.new
    @then    = Tokenizer.instance.get_next_token #grab then
    @ss      = Core_Stmt_Seq.new
    @endelse = Tokenizer.instance.get_next_token #end or else
    case @endelse
    when "end"
      @semi = Tokenizer.instance.get_next_token #grab ;
    when "else"
      @ss2   = Core_Stmt_Seq.new
      @end   = Tokenizer.instance.get_next_token #grab end
      @semi2 = Tokenizer.instance.get_next_token #grab ;
    else
      raise InvalidCoreProgram.new("Broken If, no end or else - #{token}")
    end
  end
  
  def print_if
    print "#{@if }"
    @c.print_cond
    print "#{@then} \n"
    @ss.print_stmt_seq
    print "#{@endelse}"
    if @ss2.nil?
      puts "#{@semi}"
    else
      @ss2.print_stmt_seq
      print "#{@end}"
      puts "#{@semi2}"
    end
    
  end
  
  def exec_if
  end
  
end