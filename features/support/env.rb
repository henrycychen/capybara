#features/support/env.rb

require 'capybara/cucumber'
require 'selenium/webdriver'
require 'capybara'
require 'cucumber'
require 'capybara/dsl'
require 'parallel_tests'

capabilities = Selenium::WebDriver::Remote::Capabilities.new
capabilities['browserName'] = "chrome"
capabilities['version'] = ""
#capabilities['platform'] = “Linux”
capabilities['video'] = "True"

Capybara.register_driver :selenium do |app|
  client = Selenium::WebDriver::Remote::Http::Default.new
#  client.timeout = 1200 #seconds

  Capybara::Selenium::Driver.new(app, http_client: client,
                                 :browser => :remote,
                                 :url => "http://localhost:4446/wd/hub",
                                 :desired_capabilities => capabilities)
end

Capybara.default_driver = :selenium
Capybara.run_server = false

#Maximize window. 
Capybara.current_session.driver.browser.manage.window.maximize