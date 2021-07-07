require "pry"
require "yaml"
YAML.load_file('./lib/emoticons.yml')

def load_library (yml)
  yml = {
    "angel" => {
      :english => "O:)",
      :japanese => "☜(⌒▽⌒)☞"
    },
    "angry" => {
      :english => ">:(",
      :japanese => "ヽ(ｏ`皿′ｏ)ﾉ"
    },
    "bored" => {
      :english => ":O",
      :japanese => "(ΘεΘ;)"
    },
    "confused" => {
      :english => "%)",
      :japanese => "(゜.゜)"
    },
    "embarrassed" => {
      :english => ":$",
      :japanese => "(#^.^#)"
    },
    "fish" => {
      :english => "><>",
      :japanese => ">゜))))彡"
    },
    "glasses" => {
      :english => "8D",
      :japanese => "(^0_0^)"
    },
    "grinning" => {
      :english => "=D",
      :japanese => "(￣ー￣)"
    },
    "happy" => {
      :english => ":)",
      :japanese => "(＾ｖ＾)"
    },
    "kiss" => {
      :english => ":*",
      :japanese => "(*^3^)/~☆"
    },
    "sad" => {
      :english => ":'(",
      :japanese => "(Ｔ▽Ｔ)"
    },
    "surprised" => {
      :english => ":o",
      :japanese => "o_O"
    },
    "wink" => {
      :english => ";)",
      :japanese => "(^_-)"
    }
  }
  
  return yml
end



def get_japanese_emoticon (yml, eng)
  yml = load_library(yml)
  
  answer = ""
  yml.each do |key, value|
    value.each do |inner_key, inner_value |
      if inner_value == eng
        return value[:japanese]
        #binding.pry
      elsif inner_value != eng  
        answer = "Sorry, that emoticon was not found"
      end  
    end
  end 
  answer
end

def get_english_meaning (yml, jap)
  yml = load_library(yml)
  
  answer = ""
  yml.each do |key, value|
    value.each do |inner_key, inner_value|
      if inner_value == jap
        return key
      elsif inner_value != jap
        answer = "Sorry, that emoticon was not found"
      end  
    end
  end
  answer
end
