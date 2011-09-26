require_relative '../helper/helper.rb'

Given /^a Shoes application$/ do
  @app = Shoes.app
end

Given /^the Shoes application in "([^"]+)"$/ do |file_path|
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

When /^I click the ([^"]+) labeled "([^"]+)"$/ do |element_name, text|
  class_name = class_for(element_name)
  button = @app.elements.find do |element|
    element.kind_of?(class_name) && element.text == text
  end
  button.click
end

Then /^I should see an? ([^"]+)$/ do |element_name|
  class_name = class_for(element_name)
  @app.elements.find{ |element| element.kind_of?(class_name) }.should_not be_nil
end

Then /^I should see an? ([^"]+) with text "([^"]+)"$/ do |element_name, text|
  class_name = class_for(element_name)
  @app.elements.find do |element|
    element.kind_of?(class_name) && element.text == text
  end.should_not be_nil
end

Then /^I should see (\d+) ([^"]+)$/ do |number, element_name|
  class_name = class_for(element_name)
  @app.elements.find_all do |element|
    element.kind_of? class_name
  end.size.should be number.to_i
end

Then /^a popup should appear$/ do
  @app.events.find { |element| element.kind_of?(Shoes::Alert) }.should_not be_nil
end

Then /^a popup with text "([^"]+)" should appear$/ do |text|
  @app.events.find do |element|
    element.kind_of?(Shoes::Alert) && element.text == text
  end.should_not be_nil
end

