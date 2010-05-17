require 'lib/Tokenizer'

filename = ARGV[0]
@tokenizer = Tokenizer.new(filename)

begin
  
  token = @tokenizer.get_next_token
  until token.whitespace?
    puts token
    token = @tokenizer.get_next_token
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

