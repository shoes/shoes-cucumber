NAME_METHOD_MAPPING = { "button" => "button",
                           "paragraph" => "para" }

Given /^a Shoes application$/ do
  @app = Shoes.app
end

When /^I append an? ([^"]+) with text "([^"]+)" to the main window$/ do |element_name, text|
  @app.append do
    send(NAME_METHOD_MAPPING[element_name], text)
  end
end

When /^I append an? ([^"]+) to the main window$/ do |element_name|
  @app.append do
    send(NAME_METHOD_MAPPING[element_name], "hello")
  end
end

Then /^I should see an? ([^"]+)$/ do |element_name|
  class_name = Shoes.const_get(element_name.capitalize)
  @app.elements.find{|e| e.kind_of? class_name}.should_not be_nil
end

Then /^I should see an? ([^"]+) with text "([^"]+)"$/ do |element_name, text|
  class_name = Shoes.const_get(element_name.capitalize)
  @app.elements.find do |e|
    e.kind_of?(class_name) && e.text == text
  end.should_not be_nil
end

