NAME_METHOD_MAPPING = { "button" => "button",
                        "paragraph" => "para",
                        "link" => "link" }

def singularize(string)
  # for now it's easy enough, get rid of the s
  if string[-1] == "s"
    string.chop
  else
    string
  end
end

def class_for(element_name)
  Shoes.const_get(singularize(element_name).capitalize)
end

