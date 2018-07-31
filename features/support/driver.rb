Capybara.register_driver :chrome do |app|
  chrome_args = %w[window-size=2048,1080]
  chrome_args += %w[headless disable-gpu] unless ENV['TEST_CARTOON']
  chrome_args += %w[no-sandbox disable-web-security --blink-settings=imagesEnabled=false]
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(chromeOptions: { args: chrome_args })
  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
end

Capybara.javascript_driver = :chrome
Capybara.default_driver=:chrome



Capybara.default_max_wait_time = 10
#Capybara.javascript_driver = :webkit
Capybara.ignore_hidden_elements = true

#Capybara.save_path = "./tmp"


Capybara::Screenshot.register_driver(:chrome) do |driver, path|
  driver.browser.save_screenshot(path)
end

def picture
  file_path = './tmp/screenshot.png'
  page.driver.browser.save_screenshot(file_path)
  image = open(file_path, 'rb', &:read)
  encoded_image = Base64.encode64(image)
  embed(encoded_image, 'image/png;base64', 'SCREENSHOT')
end

After do |scenario|
  if scenario.failed?
    picture
  end
end