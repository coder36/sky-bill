require './bill_app.rb'
require 'rspec'
require 'capybara/rspec'

Capybara.app = BillApp

RSpec.configure do |config|
  config.include Capybara::DSL
end
