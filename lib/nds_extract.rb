$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  row_index = 0
  list = []
  while row_index < source.length do
    list << source[row_index][:name]
    row_index += 1
  end
  list
end

def total_gross(source)
  director_name_list = list_of_directors(source)
  subgross_list = directors_totals(source)
  index = 0 
  gross_sum = 0
  
  while index < director_name_list.length do
    lookup_name = director_name_list[index]
    gross_sum += subgross_list[lookup_name]
    
    index += 1
  end
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
  gross_sum
end


