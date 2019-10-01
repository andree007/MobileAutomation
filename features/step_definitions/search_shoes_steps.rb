
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





And(/^I order and print the products by name in ascendant mode$/) do




end