Capybara.register_driver :chrome do |app|
  chrome_args = %w[window-size=2048,1080]
  #chrome_args += %w[headless disable-gpu] unless ENV['TEST_CARTOON']
  chrome_args += %w[no-sandbox disable-web-security --blink-settings=imagesEnabled=false]
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(chromeOptions: { args: chrome_args })
  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
end

Capybara.javascript_driver = :chrome
Capybara.default_driver=:chrome


Capybara.default_max_wait_time = 10
#Capybara.javascript_driver = :webkit
Capybara.ignore_hidden_elements = true


#
