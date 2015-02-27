require 'sinatra/base'
require 'sinatra/assetpack'
require 'sass'
require 'json'
require 'open-uri'
require 'hashie'


module FormattingHelpers
  def nice_amount a
    '%.2f' % a
  end

  def nice_date s
    Date.strptime( s, '%Y-%m-%d').strftime( "%-d %b")
  end
end



class BillApp < Sinatra::Base

  set :root, File.dirname( __FILE__ )
  register Sinatra::AssetPack
  assets {
    js :application, '/js/application.js', [
      '/js/*.js'
    ]
    css :application, '/css/application.css', [
      '/css/*.css'
    ]
  }

  helpers do
    include FormattingHelpers

    def bill_section params = {}
      params[:subtitle] ||= ""
      erb( :section, :layout => false, :locals => params )
    end
  end

  get '/' do
    redirect '/bill'
  end

  get '/bill' do
    json_end_point = params[:json_end_point]
    json_end_point ||= "http://safe-plains-5453.herokuapp.com/bill.json"
    json = Hashie::Mash.new JSON.parse(open(json_end_point).read)
    erb :index, :locals => { :json => json }
  end
end





