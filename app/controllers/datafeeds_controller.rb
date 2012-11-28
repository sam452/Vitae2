class DatafeedsController < ApplicationController
 
  API_KEY = 'spoda02ca2462de590075258f7b0752d46169c9e0c162762ccd8118ac486c503e8ce'
 
  # Parses Foxycart datafeed v060
  # see http://wiki.foxycart.com/docs/datafeed for details
  def create
 
    require 'rc4'
    require 'nokogiri'
 
    decryptor = RC4.new(API_KEY)
    xml = decryptor.encrypt(CGI::unescape(params['FoxyData']))
 
    feed = Nokogiri::XML(xml)
    order_data = {}
    feed.xpath('.//transaction').each do |transaction|
 
      # PROCESS THE FEED AS YOU LIKE HERE
#File.open(File.join(Rails.root, 'test.xml'), 'w') {|f| f.puts xml }
      order_data[:skills] = transaction.xpath('//customer_first_name').text 
     order_data[:position] = transaction.xpath('//customer_last_name').text
      
      if Opening.create(order_data)
        print 'success'
      else
         print 'failure'
      end
 
    end
 
    render :text => 'foxy'
 
    rescue Exception=>e
      render :text => e.to_s
 
  end
 
end


