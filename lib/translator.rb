# require modules here
require "yaml"

def load_library(file)
  # code goes here
  test = YAML.load_file(file)
  formatted_file = {}
  
  test.each{|x,y|
    formatted_file[x] = {
      english: test[x][0],
      japanese: test[x][1]
    }
  }
  formatted_file
end

def get_japanese_emoticon(file, emoticon)
  # code goes here
  library = load_library(file)
  library.each{|x,y|
    if y[:english] == emoticon
      return y[:japanese]
    end
  }
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  load_library(file).each {|x,y|
    if y[:japanese] == emoticon
      return x
    end
  }
  return "Sorry, that emoticon was not found"
end