require './bill_app.rb'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'

Capybara.app  = BillApp

