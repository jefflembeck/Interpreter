require 'lib/Token'
require 'lib/Extend_String'
require 'singleton'

# For explanation on methods and class variables, please see the README
class Tokenizer
include Singleton
  #constructor
  def initialize
    @tokens = []
  end

  #Accessor
  def tokens
    @tokens
  end

  def tokenize filename
    file = open(filename, "r")        
    until file.eof
      token = getNextToken(file)
      # If the first character is a symbol
      if token[0,1].symbol?
        symbols = Token.symbolsplit(token)
        symbols.each do |s|
          unless s.empty?
            self.tokens << Token.new(s)
          end
        end
      elsif !token.whitespace? && !token.empty?
        self.tokens << Token.new(token)
      end 
    end
    file.close
  end


  def getNextToken file
    token = ""
    ch = file.getc.chr unless file.eof?
    #eat whitespace
    while ch.whitespace?
      ch = file.getc.chr
    end
    lookahead = file.getc.chr unless file.eof?
    if lookahead == nil
      return token << ch
    end
    while tokenIncomplete?(lookahead, ch) && !file.eof?
      token << ch
      ch = lookahead
      lookahead = file.getc.chr
    end
    file.ungetc(lookahead[0]) unless file.eof?
    file.eof? ? token << ch << lookahead : token << ch  #inline conditional, if file is at end, return token
    #with ch and lookahead appended on it, otherwise, append token with ch and return
  end

  def tokenIncomplete? lookahead, ch
    (ch.upcase? && lookahead.integer?) || (Token.couldbe(lookahead) == Token.couldbe(ch))
  end
end