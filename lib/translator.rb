require 'yaml'
require 'pry'

def load_library(path)
  hoa = YAML.load_file(path)
  output = hoa.each_with_object({}) do |(key, array), final|
    if !final[key]
      final[key] = {}
    end
    array.each_with_index do |emo, index|
      if !final[key][:english] && index == 0
        final[key][:english] = emo
      end
      if !final[key][:japanese] && index == 1
        final[key][:japanese] = emo
      end
    end
  end
  output
end


def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  output = "Sorry, that emoticon was not found" 
  emoji = emoticons.each do |key, values|
      if values[:english] == emoticon
        output = values[:japanese]
      end
  end
  output
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  output = "Sorry, that emoticon was not found"
  emoji = emoticons.each do |emotions, values|
    if values[:japanese] == emoticon
       output = emotions
    end
  end
  p output
end