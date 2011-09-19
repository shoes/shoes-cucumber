name_to_method_mapping = { "button" => "button",
                           "paragraph" => "para" }


Given /^a Shoes application$/ do
  @app = Shoes.app
end

When /^I append a (.+) to the main window$/ do |element_name|
  @app.append do
    send(name_to_method_mapping[element_name], "hello")
  end
end

Then /^I should see a (.+)$/ do |element_name|
  class_name = Shoes.const_get(element_name.capitalize)
  @app.elements.find{|e| e.kind_of? class_name}.should_not be_nil
end

