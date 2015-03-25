Sky-Bill Kata
=============


Task
----

To Display a customer's Sky Bill, consuming data from the JSON endpoint:

[http://safe-plains-5453.herokuapp.com/bill.json](http://safe-plains-5453.herokuapp.com/bill.json)

A full description of the kata is available [here](https://github.com/ldabiralai/bill-unattended-test).

My Solution
-----------

###[Live Demo](https://pure-savannah-9942.herokuapp.com/bill)

* Ruby
* Rack application, built on Sinatra. I chose Sinatra as it's very simple, and requires very little setup.
* [Sinatra-assetpack](https://github.com/rstacruz/sinatra-assetpack)
* Deployable to Heroku
* Json parsed and traversed using the excellent [Hashie::Mash](https://github.com/intridea/hashie#mash)
* TDD'ed using Rspec and Capybara
* Cucumber/gherkin acceptance tests
* To save time, I used Sky's own stylesheets - this means that the app is totally 'responsive'. If I had more time, I would have tried to figure out how Sky's css's work and convert them to sass dynamic stylesheets, served up by sinatra-assetpack.
* jquery/javascript to toggle the expandable sections.
* Google Anayltics to track bill section toggling.


Install
-------

    git clone https://github.com/coder36/sky-bill.git
    cd sky-bill
    bundle install
    rspec
    cucumber
    rackup config.ru -o 0.0.0.0        (binds to all adapters)

Navigate to [http://localhost:9292/bill](http://localhost:9292/bill)


Testing
-------

To simplify testing, I created a test harness, which allows a custom json end point to be used:

[https://pure-savannah-9942.herokuapp.com/bill?json_end_point=http://safe-plains-5453.herokuapp.com/bill.json](https://pure-savannah-9942.herokuapp.com/bill?json_end_point=http://safe-plains-5453.herokuapp.com/bill.json)


I've also copied the end point into the application itself.  It's available at:

[https://pure-savannah-9942.herokuapp.com/bill.json](https://pure-savannah-9942.herokuapp.com/bill.json)

* I've only tested it on Chrome.


Testing with Chrome
-------------------

To test in a chrome browser on windows:
 
* Install [chrome driver](https://sites.google.com/a/chromium.org/chromedriver/downloads) to C:/Windows.  

        set IN_BROWSER=true   
        cucumber
        rspec
    

Notes
-----

* Whilst testing with the selenium chrome driver, I discovered that the chrome driver does not support `page.status_code`



