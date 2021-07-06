# require modules here
require 'yaml'
require 'pry'


def load_library(file_path)
  emoticons = YAML.load_file('lib/emoticons.yml')
    translated_emo = {}
    emoticons.each do |name, arrays|
      translated_emo[name] ||= {}
      translated_emo[name][:english] = arrays[0]
      translated_emo[name][:japanese] = arrays[1]

    end
    translated_emo
end


def get_japanese_emoticon(file_path, eng_emo)
  library = load_library('./lib/emoticons.yml')
    library.each do |meaning, idioms|
      return idioms[:japanese] if idioms[:english] == eng_emo
    end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, jap_emo)
  library = load_library('./lib/emoticons.yml')
    library.each do |meaning, idioms|
      return meaning if idioms[:japanese] == jap_emo
    end
  "Sorry, that emoticon was not found"
end
