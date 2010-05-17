class Core_Decl
  idl = Core_Id_List.new
  
  def parse_decl
    @tokenizer.get_next_token
    idl.parse_id_list
    @tokenizer.get_next_token
  end
  
  def print_decl
  end
  
  def exec_decl
  end
end