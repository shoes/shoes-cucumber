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

Then /^I should see a button$/ do
  @app.elements.find{|e| e.class == Shoes::Button}.should_not be_nil
end

Then /^I should see a paragraph$/ do
  @app.elements.find{|e| e.class == Shoes::Paragraph}.should_not be_nil
end

