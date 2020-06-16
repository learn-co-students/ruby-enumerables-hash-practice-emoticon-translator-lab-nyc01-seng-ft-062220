# require modules here

def load_library(file_path)
  my_hash = {}
  require "yaml"
  emoticons = YAML.load_file(file_path)
  emoticons 
  emoticons.each do |key, value|
    my_hash[key] = {:english => value[0], :japanese => value[1]}
  end
  my_hash
end

def get_japanese_emoticon(file_path, emoticon)
   my_hash = load_library(file_path)
    my_hash.each do |key, value|
      if my_hash[key][:english] == emoticon
      return  my_hash[key][:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  my_hash = load_library(file_path)
  my_hash.each do |key, value|
    if my_hash[key][:japanese] == emoticon
      return key
 end
 end
 return "Sorry, that emoticon was not found"
end