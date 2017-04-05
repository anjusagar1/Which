require 'rubygems'
require 'selenium-webdriver'

When(/^I go to Which Television section$/) do
  @browser.get "http://www.which.co.uk/reviews/televisions"
end

Then(/^Which Television section page should be displayed$/) do
  pageTitle = @browser.title
  puts "Page Title : #{pageTitle}"
end


When(/^I select Samsung$/) do
  @browser.get "http://www.which.co.uk/reviews/televisions"

  Samsung_cb = @wait.until {
    @element = @browser.find_elements(:class,"NhXrC")
  }

  for i in 0..@element.size-1
    toselect = @element[i].text
    #puts "#{toselect}"
    if toselect.include? "Samsung"
      @element[i].click
    end
  end
  end

Then(/^Samsung TV listings should be displayed$/) do
  @samsungelements = @browser.find_elements(:class,"_391IQ")
  for i in 0..@samsungelements.size-1
    if
    @samsungelements[i].text == "Samsung"
    else
      puts "This element is not a Samsung listing #{@samsungelements[i].text}"
    end
    end
end


When(/^I select min and max price$/) do

  @browser.get "http://www.which.co.uk/reviews/televisions"


end

Then(/^TV listings should be within that price range$/) do

  minvalue = @wait.until {
    element = @browser.find_element(:id, "from").find_element(:css,"option[value='10000-10000']")
    element if element.displayed?
  }
  minvalue.click

 # @browser.find_element(:id, "from").find_element(:css,"option[value='10000-10000']").click
  maxvalue = @wait.until {
    element = @browser.find_element(:id, "to").find_element(:css,"option[value='20000-20000']")
    element if element.displayed?
  }
  maxvalue.click

 # @browser.find_element(:id, "to").find_element(:css,"option[value='20000-20000']").click

  @elementswithinrange = @wait.until { @browser.find_elements(:class,"_3iJwn")}
  for i in 0..@elementswithinrange.size
    price = @elementswithinrange[i].text
    price[0] =''
    puts "#{price}"
    if price.to_i >= 100 and price.to_i <= 200

    else
      puts "This elements price is not within range"
    end
  end
end


When(/^I select (\d+)\-(\d+)"$/) do |arg1, arg2|
  @browser.get "http://www.which.co.uk/reviews/televisions"

  @wait.until { @element = @browser.find_elements(:class,"NhXrC") }

  for i in 0..@element.size-1
    toselect = @element[i].text
    #puts "#{toselect}"
    if toselect.include? "17-22"
      @element[i].click
    end
  end
end


Then(/^(\d+)\-(\d+)" TV listings should be displayed$/) do |arg1, arg2|
  @sizeelements = @browser.find_elements(:class,"_1ULbH")
  for i in 0..@sizeelements.size-1
  @sizeelementsint =  @sizeelements[i].text
    if @sizeelementsint.to_f >= 17 and @sizeelementsint.to_f <= 22
    else
      puts "This TV listing is not within size range #{@samsungelements[i].text}"
    end
  end
end


When(/^I select Price \(low to high\)$/) do
  @browser.get "http://www.which.co.uk/reviews/televisions"

  sortorderby = @wait.until {
    element = @browser.find_element(:id, "product_listing_sorter").find_element(:css,"option[value='price_asc']")
    element if element.displayed?
  }
  sortorderby.click

end

Then(/^TV listings should be displayed in that Price \(low to high\)$/) do
  @elementsonpage = @wait.until { @browser.find_elements(:class,"_3iJwn")}
  for i in 0..@elementsonpage.size-1
    price = @elementsonpage[i].text
    price[0] =''
    #puts "#{price}"

    for j in 1..@elementsonpage.size-2

      price2 = @elementsonpage[i].text
      price2[0] =''

      if price < price2
      else
        "price is not in order"
      end

    end
  end
end
