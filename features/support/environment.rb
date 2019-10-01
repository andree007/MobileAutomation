require "appium_lib"

def caps
  {
      caps: {
              deviceName: "Andree_Android_S9_Plus",
              platformName: "Android",
              app: (File.join(File.dirname(__FILE__), "ebay.apk")),
              appPackage: "com.ebay.mobile",
              appActivity: "com.ebay.mobile.activities.MainActivity",
              newCommandTimeout: "3600"
            }
  }
end

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object


def find_in_list(value)

  current_screen = get_source
  previous_screen = ""

  until ( exists { text(value) } || (current_screen == previous_screen) ) do
    puts("A PUNTO DE HACER SCROLL DOWN...")
    Appium::TouchAction.new.swipe(start_x: 0.4, start_y: 0.8, end_x: 0.4, end_y: 0.2, duration: 3000).perform
    previous_screen = current_screen
    current_screen = get_source
  end

  if exists { text(value) }
    text(value).click
  else
    fail("--- FAIL: Can not find element with text #{value}")
  end

end


def find_five_products

  Appium::TouchAction.new.swipe(start_x: 0.50, start_y: 0.50, end_x: 0.50, end_y: 0.40, duration: 2000).perform
  parent_element = find_element(id: "recycler")
  array_of_items_01 = parent_element.find_elements(id: "cell_collection_item")

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