require_relative '../helper/helper.rb'

Given /^a Shoes application$/ do
  @app = Shoes.app
end

Given /^a Shoes application in "([^"]+)"$/ do |file_path|
  # load as I want a fresh file every time
  load './' + file_path
  @app = Shoes.application
end

When /^I append an? ([^"]+) with text "([^"]+)" to the main window$/ do
  |element_name, text|
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
  class_name = class_for_element(element_name)
  @app.elements.find{|e| e.kind_of? class_name}.should_not be_nil
end

Then /^I should see an? ([^"]+) with text "([^"]+)"$/ do |element_name, text|
  class_name = class_for_element(element_name)
  @app.elements.find do |e|
    e.kind_of?(class_name) && e.text == text
  end.should_not be_nil
end

Then /^I should see (\d+) ([^"]+)$/ do |number, element_name|
  class_name = class_for_element(element_name)
  @app.elements.find_all{|e| e.kind_of? class_name}.size.should be number.to_i
end

