require "yaml"

path = './lib/emoticons.yml'

def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_lib = {}
  arr_of_hash = []
  #emoticon_lib = {'get_meaning'  => {} }
  emoticons.reject do |meaning, value| 
    emoticon_lib = { meaning => {} }
    english = value[0]
    japanese = value[1]
    emoticon_lib[meaning]['english'] = english   
    emoticon_lib[meaning]['japanese'] = japanese
    arr_of_hash.push(emoticon_lib)
  end
  puts arr_of_hash
end

load_library(path)

def get_japanese_emoticon(emoticon, load_library)
  translation = ""
  YAML.load_file(path).each do |key, value|
    if emoticon == YAML.load_file(path)[key][0]
      translation = YAML.load_file(path)[key][1]
    end
  end   
  translation
end

#get_japanese_emoticon(":$", emoji)

def get_english_meaning(item, emoji)
  translation = ""
  emoji.each do |key, value|
    if item == emoji[key][1]
      translation = emoji[key][0]
    end
  end   
  translation
end

#get_english_meaning("(#^.^#)", emoji)