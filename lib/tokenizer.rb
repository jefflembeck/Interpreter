require 'lib/Extend_String.rb'

class Tokenizer
  
  KEYWORDS = {"program" => 1, "begin" => 2, "end" => 3, 
              "int" => 4, "if" => 5, "then" => 6, "else" => 7, 
              "while" => 8, "loop" => 9, "read" => 10, "write" => 11}
                                
  SYMBOLS = {";" => 12, "," => 13, "=" => 14, "!" => 15, "[" => 16, "]" => 17, "&&" => 18,
             "||" => 19, "(" => 20, ")" => 21, "+" => 22, '-' => 23, "*" => 24, "!=" => 25,
             "==" => 26, "<" => 27, ">" => 28, "<=" => 29, ">=" => 30 }
             
  def initialize(filename = '')
    @source = IO.readlines(filename, '') unless filename.empty?
    @chunks = self.source.to_s.split(' ') unless filename.empty?
  end
  
  def source
    @source
  end
  
  def chunks
    @chunks
  end
  
  def get_next_token
    if valid_token?(self.chunks.first)
      self.chunks.shift
    elsif self.chunks.first =~ /end/
      self.chunks.first.slice!(0..2)
    else
      get_token_from_chunk
    end
  end
  
  def get_token_from_chunk
    tokens = split_em(self.chunks.shift).reverse.each do |token|
      self.chunks.unshift(token) 
    end
    self.chunks.shift
  end
  
  def valid_token?(chunk)
    chunk.whitespace? || chunk.integer? || chunk.identifier? || self.symbol?(chunk) || chunk.keyword?
  end
  
  def split_em(chunk)
    count = 0
    foo = chunk.split(//).inject([""]) do |arr,e|
      if self.valid_token?(arr[count] + e)
        arr[count] = arr[count] + e
        arr
      else
        count+=1
        arr << e
      end
    end
  end

  

  # checks to see if the token is a CORE symbol
  def symbol?(token)
    SYMBOLS.has_key?(token) 
  end

  
end
