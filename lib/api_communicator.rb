require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_hash = parse_star_wars
  films_array = response_hash["results"].select {|hash| hash["name"] == character_name}[0]["films"]

  films_array.map do |film|

    info = RestClient.get(film)
    info_hash = JSON.parse(info)
  end
end

def print_movies(films)
  films.each do |film_hash|
    #binding.pry
    puts film_hash["title"]
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

#binding.pry

def parse_star_wars
  response_string = RestClient.get('http://swapi.dev/api/people')
  JSON.parse(response_string)
end
