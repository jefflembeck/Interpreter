require 'lib/Core_Id'

class Core_Id_List
  
  attr_accessor :first, :rest
  
  def initialize
    @id
    @idl
    @first
    @rest
    self.parse_id_list
  end
  
  def parse_id_list
    @id = Core_Id.new
    t = Tokenizer.instance.lookahead
    if t == ','
      Tokenizer.instance.get_next_token #burn comma
      @idl = Core_Id_List.new
    end  
  end
  
  def print_id_list t
    @id.print_id(t)
    unless @idl.nil?
      print ", "
      @idl.print_id_list(t)
    end
  end
  
  def exec_id_list
    @id.exec_id
    unless @idl.nil?
      @idl.exec_id_list
    end
  end
  
  def first
    @id.key
  end
  
  def rest
    @idl
  end
  
end