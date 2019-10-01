
Given(/^I land on the home screen$/) do
  # validations in home screen
  sleep(4)
  find_element(id: "logo")
  find_element(id: "search_box")
  sleep(5)
  btn_01_text = find_elements(id: "home_pill")[0].text
  btn_02_text = find_elements(id: "home_pill")[1].text
  btn_03_text = find_elements(id: "home_pill")[2].text
  btn_04_text = find_elements(id: "home_pill")[3].text
  puts("All the buttons exists: " + btn_01_text + " " + btn_02_text + " " + btn_03_text + " " + btn_04_text)
  puts("*** Landed on Ebay home screen ***")
end

When(/^I press on search bar$/) do
  find_element(id: "search_box").click
end

Then(/^I type "([^"]*)" in search field$/) do |search_value|
  find_element(id: "search_src_text").send_keys(search_value)
  Appium::TouchAction.new.tap(x: 0.99, y:0.99, count: 1).perform
  sleep(5)
  find_element(id: "text_slot_1").click
end

Then(/^I select the filter option$/) do
  find_element(id: "button_filter").click
end

And(/^I select the Brand option$/) do
  find_elements(id: "textview_filter_displayname")[3].click
  #text("Brand").click
end

And(/^I select PUMA brand$/) do
  find_elements(id: "button_filter_subelement")[7].click
  find_element(id: "button_done").click
end

Then(/^I select the size 10$/) do
  find_element(id: "button_filter").click
  find_elements(id: "textview_filter_displayname")[2].click
  find_element(id: "search_refine_list").find_elements(id: "button_filter_subelement")[5].click
  find_element(id: "button_done").click
end


And(/^I print the number of results$/) do
  find_element(id: "popup_container").click
  count_result = find_element(id: "textview_item_count").text
  puts("El número de productos actual es: " + count_result)
end

#text("Save this search to get alerts when new items arrive").click

Then(/^I order by price ascendant$/) do
  find_element(id: "button_filter").click
  find_elements(id: "textview_filter_displayname")[0].click
  find_element(id: "search_refine_list").find_elements(xpath: "//android.widget.LinearLayout")[1].click
  find_element(id: "button_done").click
  sleep(5)

end

And(/^I print the first result$/) do
  producto = find_element(id: "cell_collection_item").find_elements(id: "textview_item_title")[0].text
  puts(producto)
end


And(/^I take the first 5 products with their prices and print them in console$/) do

  Appium::TouchAction.new.swipe(start_x: 0.50, start_y: 0.50, end_x: 0.50, end_y: 0.40, duration: 2000).perform
  parent_element = find_element(id: "recycler")
  array_of_items_01 = parent_element.find_elements(id: "cell_collection_item")

  puts("==================================== TOP 5 PRODUCTS ====================================")

  for i in array_of_items_01 do
    product = i.find_element(id: "textview_item_title").text
    price = i.find_element(id: "textview_item_price").text
    puts(product + " " + price)

  end

  Appium::TouchAction.new.swipe(start_x: 0.50, start_y: 0.50, end_x: 0.50, end_y: 0.32, duration: 2000).perform
  array_of_items_02 = parent_element.find_elements(id: "cell_collection_item")
  second_view_last_pro = array_of_items_02[array_of_items_02.length - 1].find_element(id: "textview_item_title").text
  second_view_last_price = array_of_items_02[array_of_items_02.length - 1].find_element(id: "textview_item_price").text

  puts(second_view_last_pro + " " + second_view_last_price)


end






And(/^I save in array five elements of the list$/) do


  parent_element = find_element(id: "recycler")

  array_of_items_01 = parent_element.find_elements(id: "cell_collection_item")
  Appium::TouchAction.new.swipe(start_x: 0.50, start_y: 0.50, end_x: 0.50, end_y: 0.30, duration: 2000).perform
  array_of_items_02 = parent_element.find_elements(id: "cell_collection_item")

  first_view_last_pro = array_of_items_01[array_of_items_01.length - 1].find_element(id: "textview_item_title").text
  second_view_last_pro = array_of_items_02[array_of_items_02.length - 1].find_element(id: "textview_item_title").text

  first_view_last_price = array_of_items_01[array_of_items_01.length - 1].find_element(id: "textview_item_price").text
  second_view_last_price = array_of_items_02[array_of_items_02.length - 1].find_element(id: "textview_item_price").text

  puts(first_view_last_pro)
  puts(second_view_last_pro)

  puts(first_view_last_price)
  puts(second_view_last_price)

  #for i in array_of_items_01 do
  #  product = i.find_element(id: "textview_item_title").text
  #  price = i.find_element(id: "textview_item_price").text
  #  puts(product + " " + price)
  #end

end


#And(/^I scroll up para encontrar el ultimo elemento$/) do
#  3.times {Appium::TouchAction.new.swipe(start_x: 0.50, start_y: 0.50, end_x: 0.50, end_y: 0.45, duration: 2000).perform}
#  parent_element = find_element(id: "recycler")
#  array_of_items = parent_element.find_elements(id: "cell_collection_item")

#end


#And(/^I create example$/) do
#  parent_element = find_element(id: "recycler")
#
#  array_of_items = parent_element.find_elements(id: "cell_collection_item")
#
#  puts(array_of_items.length)
#
#  current_screen = get_source
#  previous_screen = ""
#
#  until ( array_of_items == 5  || (current_screen == previous_screen) ) do
#    Appium::TouchAction.new.swipe(start_x: 0.50, start_y: 0.50, end_x: 0.50, end_y: 0.45, duration: 2000).perform
#    previous_screen = current_screen
#    current_screen = get_source
#  end
#
#
#end


And(/^example01$/) do


  #parent_element = find_element(id: "recycler")

  #product_01 = parent_element.find_elements(id: "cell_collection_item")[0].find_element(id: "textview_item_title").text
  #product_02 = parent_element.find_elements(id: "cell_collection_item")[1].find_element(id: "textview_item_title").text
  #product_03 = parent_element.find_elements(id: "cell_collection_item")[2].find_element(id: "textview_item_title").text


  #price_01 = parent_element.find_elements(id: "cell_collection_item")[0].find_element(id: "textview_item_price").text
  #price_02 = parent_element.find_elements(id: "cell_collection_item")[1].find_element(id: "textview_item_price").text
  #price_03 = parent_element.find_elements(id: "cell_collection_item")[2].find_element(id: "textview_item_price").text

  #array_products = [product_01, product_02, product_03]
  #array_prices = [price_01, price_02, price_03]

  #puts(array_products.sort)
  #puts(array_prices.sort)
  #puts(get_source)


end


And(/^I scroll down$/) do

  #current_screen = get_source
  #previous_screen = ""
  #Appium::TouchAction.new.swipe(start_x: 0.50, start_y: 0.50, end_x: 0.50, end_y: 0.35, duration: 2000).perform

  #until  (current_screen == previous_screen) do
  #  puts("scroll down")
  #  Appium::TouchAction.new.swipe(start_x: 0.50, start_y: 0.50, end_x: 0.50, end_y: 0.45, duration: 2000).perform
  #  previous_screen = current_screen
  #  current_screen = get_source
  #end


end

And(/^I order and print the products by name in ascendant mode$/) do







end