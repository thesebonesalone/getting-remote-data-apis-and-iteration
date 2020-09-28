require 'pry'
def welcome
  puts "Howdy Space Cowboy"
end

def get_character_from_user
  puts "please enter a character name"
  response = gets.chomp
  new_response = ''
  response_array = response.split
  response_array.each {|value| new_response += value.capitalize;
    if value != response_array[-1]
      new_response += " "
    end
  }
  new_response
end
