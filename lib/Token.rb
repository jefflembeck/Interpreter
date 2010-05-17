require 'lib/Extend_String'

# For explanation on methods and class variables, please see the README
class Token
  
  KEYWORDS = {"program" => 1, "begin" => 2, "end" => 3, "int" => 4, "if" => 5,
    "then" => 6, "else" => 7, "while" => 8, "loop" => 9, "read" => 10, "write" => 11}
    SYMBOLS = {";" => 12, "," => 13, "=" => 14, "!" => 15, "[" =>16, "]" => 17, "&&" => 18, "||" => 19,
      "(" => 20, ")" => 21, "+" => 22, "-" => 23, "*" => 24, "!=" => 25, "==" => 26, "<" => 27, ">" => 28, "<=" => 29, ">=" => 30}
  
  def initialize(name)
    @token = name
    @value = toknum(name)
  end
  
  def name
    @token
  end
  
  def value
    @value
  end
  
  def toknum (s)
    if s.length > 10
      0
    elsif s.integer?
      31
    elsif s.identifier?
      32
    elsif KEYWORDS.include?(s)
      KEYWORDS[s]
    elsif SYMBOLS.include?(s)
      SYMBOLS[s]
    else
      0
    end
  end
    
  def self.couldbe(s)
    if s.whitespace?
      "whitespace"
    elsif s.downcase?
      "keyword"
    elsif s.identifier?
      "identifier"
    elsif s.integer?
      "integer"
    elsif s.symbol?
      "symbol"
    else
      "error"
    end
  end
  
  def type
    if self.token.identifier?
      "identifier"
    elsif self.token.symbol?
      "symbol"
    elsif self.token.keyword?
      "keyword"
    elsif self.token.integer?
      "integer"
    else
      "error"
    end
  end
  
  def self.symbolsplit(s)
    tokens = s.split(//).inject([""]) do |symbarr, chr|
      SYMBOLS.include?(symbarr[0] << chr) ? symbarr : symbarr << symbarr[0].slice!(0..-2)
    end
    tokens << tokens.shift
    if tokens.include?("")
      tokens.delete("")
    end
    tokens
  end
end