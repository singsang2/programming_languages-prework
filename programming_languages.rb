def reformat_languages(languages)
  # your code here
  reformat = {}
  get_names(languages).each do |language|
    reformat[language] = {:type => get_type(languages, language)[0], :style => get_style(languages, language)}
  end
  reformat
end

def get_names(languages)
  (languages.collect {|style, data| data.keys}).flatten.uniq
end

def get_type(languages, language)
  type = nil
  languages.each {|style, data| type = data.fetch(language, nil).fetch(:type) if data.fetch(language, nil) != nil}
  type
end

def get_style(languages, language)
  style_list = []
  languages.each {|style, data| style_list.push(style) if data.keys.include?(language)}
  style_list.uniq
end
