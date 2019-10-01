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




