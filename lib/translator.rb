require 'pry'
require 'yaml'
def load_library(file_path)
  emoticon_hash = YAML.load_file(file_path)
  emoticon = {}
  emoticon_hash.each do |key, value|
    emoticon[key] = {
      :english => value[0],
      :japanese => value[1]
    }
  end
  emoticon
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  emoticon = library.keys.find do |key|
  library[key][:english] == emoticon
  end
  emoticon ? library[emoticon][:japanese] : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  emoticon = library.keys.find do |key|
    library[key][:japanese] == emoticon
  end
  emoticon ? emoticon : "Sorry, that emoticon was not found"
end
