require "yaml"
require "pry"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  new_dictionary = {}
  emoticons.each do |name,arrays|
      new_dictionary[name] ||= {}
      new_dictionary[name][:english] = arrays[0]
      new_dictionary[name][:japanese] = arrays[1]
  end
new_dictionary
end

def get_japanese_emoticon(file_path, english_emoji)
  library = load_library('./lib/emoticons.yml')
  library.each do |meaning, value|
      return value[:japanese] if value[:english] == english_emoji
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, japanese_emoji)
  library = load_library('./lib/emoticons.yml')
  library.each do |meaning, value|
    return meaning if value[:japanese] == japanese_emoji
  end
    "Sorry, that emoticon was not found"
end 
