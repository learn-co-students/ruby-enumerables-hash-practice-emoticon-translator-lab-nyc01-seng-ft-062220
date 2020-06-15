require "yaml"
require'pry'

def load_library(file)
  emoticons = {}
  library = YAML.load_file(file)
    library.each do |meaning, emoji|

      if !emoticons[meaning]
        emoticons[meaning] = {}
      end

      emoticons[meaning][:english] = emoji[0]
      emoticons[meaning][:japanese] = emoji[1]
      
  end
  emoticons
end

def get_japanese_emoticon(file, eng_emoji)
  library = load_library(file)
  library.each do |meaning, list|
    list.each do |language, emoji|

      if list[:english] == eng_emoji
        return list[:japanese]
      end

    end
  end
  "Sorry, that emoticon was not found"
end



def get_english_meaning(file, jap_emoji)
  library = load_library(file)
  library.each do |meaning, list|
    list.each do |language, emoji|

      if jap_emoji == emoji
        return meaning
      end

    end
  end
  "Sorry, that emoticon was not found"
end
