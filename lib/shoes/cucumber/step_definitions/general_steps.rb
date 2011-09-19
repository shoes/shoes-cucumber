Given /^a Shoes application$/ do
  @app = Shoes.app
end

When /^I append a button to the main window$/ do
  @app.append do
    button "hello"
  end
end

When /^I append a paragraph to the main window$/ do
  @app.append do
    para "hello"
  end
end

Then /^I should see a (.+)$/ do |element_name|
  class_name = Shoes.const_get(element_name.capitalize)
  @app.elements.find{|e| e.kind_of? class_name}.should_not be_nil
end

