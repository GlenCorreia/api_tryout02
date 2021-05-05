class UpdateSkuJob < ApplicationJob
  queue_as :default

  def perform(book_name)
    # Do something later
    uri = URI('http://www.asterank.com/api/mpc')
    req = Net::HTTP::Get.new(uri)
    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
      
    end

    output_json = JSON.parse(res.body)

    #  File.open("response.txt", "w") { |f| f.write output_json }
  end
end
