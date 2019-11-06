

def shout_out_to(name)
  name = name.chars.each { |c| c.upcase! }

  puts 'HEY ' + name.join
end

shout_out_to('you') # expected: 'HEY YOU'


# refactor

def shout_out_to(name)
  puts 'HEY ' + name.upcase
end

shout_out_to('you') # expected: 'HEY YOU'