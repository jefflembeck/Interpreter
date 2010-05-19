require 'lib/Core_Id'

class Core_Id_List
  
  def initialize
    @id
    @idl
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
  
  def print_id_list
    @id.print_id
    unless @idl.nil?
      print ", "
      @idl.print_id_list
    end
  end
  
  def exec_id_list
  end
  
end