require "cucumber"
# require 'capybara'
# require 'capybara/rails'
# require 'capybara/dsl'
# require 'capybara/session'
require "capybara/cucumber"
require "rspec/expectations"
require "selenium-webdriver"
#require 'capybara/selenium/driver'
#require 'minitest'
#require 'minitest/autorun'
require 'ffaker'
require 'capybara/rspec'
require 'capybara-screenshot/cucumber'
require 'capybara-screenshot/rspec'
require 'base64'
require 'rails'
require 'capybara-webkit'
require 'capybara/json'


# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(app, browser: :chrome)
# end

Capybara::Screenshot.autosave_on_failure = false
Capybara::Screenshot.prune_strategy = :keep_last_run

