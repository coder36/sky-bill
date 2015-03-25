require './bill_app.rb'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'

Capybara.app = BillApp

if ENV['IN_BROWSER']=="true"

  Before do
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, :browser => :chrome)
    end

    Capybara.default_driver = :selenium
  end
end