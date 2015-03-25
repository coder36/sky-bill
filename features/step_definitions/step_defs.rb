# encoding: utf-8
require 'pry'

def snake_case s
  s.tr( " ", "_" ).downcase
end

Given( /My data is available in a json format at (.*)$/ ) do |json_end_point|
  @json_end_point = json_end_point
end

When(/^I navigate to the (.*) page$/) do |web_page|
  visit "/#{web_page}?json_end_point=#{@json_end_point}"
end

Then(/^I can see a breakdown of my bill$/) do
  expect(page).to have_content( "£136.03" )  
end

Then(/^the (.*) section should have a total of (.*)$/ ) do |section, amount|
  page.find_by_id(snake_case section).click
  expect( page.find_by_id("#{snake_case section}_total").text).to eq ( amount )
end






