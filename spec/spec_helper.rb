require './bill_app.rb'
require 'rspec'
require 'capybara/rspec'
require 'pry'

Capybara.app = BillApp

if ENV['IN_BROWSER']=="true"

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end

  Capybara.default_driver = :selenium
end


RSpec.configure do |config|
  config.include Capybara::DSL
end
