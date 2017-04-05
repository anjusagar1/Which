

Before do


  @browser = Selenium::WebDriver.for :chrome
  @wait = Selenium::WebDriver::Wait.new(:timeout => 15)

end


After do
  @browser.quit
end



