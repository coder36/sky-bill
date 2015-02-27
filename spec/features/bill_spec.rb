require 'spec_helper'
require 'pry'


describe 'Your Sky Bill web portal' do

  before do
    # use locally stored endpoint for testing
    visit '/bill?json_end_point=public/bill.json'
  end

  it "is a valid web page" do
    expect(page.status_code).to be 200
    expect(page).to have_content( "Your Sky Bill" )
  end

  it "loads data from a json endpoint" do
    expect(page).to have_content( "136.03" )
  end

  it "displays the bill period dates, in a nice format" do
    expect(page).to have_content( "26 Jan - 25 Feb" )
  end


  describe "My Suscriptions Section" do

    it "can be expanded to display more detail" do
      page.find_by_id("subscriptions").click
      expect( page.find_by_id("subscriptions_total").text).to eq ( "£71.40" )
    end

    it "concatenates the name and type of the subscription together" do
      page.find_by_id("subscriptions").click
      expect(page).to have_content( "Variety with Movies HD (tv)" )
      expect(page).to have_content( "£50.00" )
    end

  end


  describe "Sky Store Section" do

    it "can be expanded to display more detail" do
      page.find_by_id("sky_store").click
      expect( page.find_by_id("sky_store_total").text).to eq ( "£24.97" )
    end

    it "concatenates the name and type of the purchase together" do
      page.find_by_id("sky_store").click
      expect(page).to have_content( "50 Shades of Grey (Rental)" )
      expect(page).to have_content( "£4.99" )
      expect(page).to have_content( "That's what she said (Buy And Keep)" )
      expect(page).to have_content( "£9.99" )
    end

  end


  describe "Call Charges Section" do

    it "can be expanded to display more detail" do
      expect(page).to have_content( "Call Charges" )
      page.find_by_id("call_charges").click
      expect( page.find_by_id("call_charges_total").text).to eq ( "£59.64" )
    end

    it "concatenates the called number and duration together" do
      page.find_by_id("call_charges").click
      expect(page).to have_content( "07716393769 (00:23:03)" )
      expect(page).to have_content( "£2.13" )
    end

  end

  describe "Total due section" do

    it "shows, your total bill amountm when it is due by" do
      expect(page).to have_content( "Total due 25 Jan" )
      expect(page).to have_content( "£136.03" )
    end

  end


end

describe "testing hooks" do

  it "allows any endpoint to be used" do
    visit '/bill.json'
    expect(page.status_code).to be 200
    visit '/bill?json_end_point=http://safe-plains-5453.herokuapp.com/bill.json'
    expect(page).to have_content( "Your Sky Bill" )
  end

end


describe "Formatting helpers" do
  include FormattingHelpers

  it "formats dates from yyyy-mm-dd to dd MMM" do
    expect( nice_date "2015-01-25" ).to eq("25 Jan")
  end

  it "adds formats amounts to include trailing 0's" do
    expect( nice_amount 71.4 ).to eq("71.40")
  end

end

