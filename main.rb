require 'lib/Tokenizer'

@tokenizer = Tokenizer.new
filename = ARGV[0]

begin
  @tokenizer.tokenize(filename) 
  if @tokenizer.tokens.length == 0 
    puts "Empty file? Are you trying to trick me?"
  else
    @tokenizer.tokens.each do |tok|
      if tok.value != 0
        print "#{tok.value} "
      else
        puts "\"#{tok.name}\" is an invalid token"
      end
    end
    @tokenizer.tokens.last.value == 3 ?  puts("33") : print("")
  end
rescue Errno::ENOENT
  print "Can't find that filename, sorry.  Try again: "
  filename = STDIN.gets.chomp
  retry
rescue TypeError
  print "Needs a filename, please enter one for testing: "
  filename = STDIN.gets.chomp
  retry
end

