require 'rest-client'
require 'nokogiri'
require 'open-uri'

require 'pry'


def links
  headers = {"user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36"}
  links = []

  200.times do |page|
    result = RestClient::Request.execute(method: :get, url: "http://doska.zol.ru/Selkhozkultury/selkhozkultury.html?page=#{page+1}", headers: headers);
    doc = Nokogiri::HTML(result);
    links += doc.css(".offer_row a.smd-content").map {|t| t.attributes["href"].value};
    ap page + 1
    sleep 1
  end

  File.open("db/scrapping/doska.zol.ru.json", 'w') { |file| file.write(links.to_json) }
end


def emails
  emails = []
  headers = {"user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36"}
  links = JSON.parse(open("#{Rails.root}/db/scrapping/doska.zol.ru.json").read)
  links.each_with_index do |link, index|
    if index > 7736
      result = RestClient::Request.execute(method: :get, url: link, headers: headers) rescue "";
      doc = Nokogiri::HTML(result);
      img = doc.css('img[src*="/?module=hidetext"]').first
      if img
        email = RestClient::Request.execute(method: :get, url: img.attributes["src"].value.gsub("hidetext", "hidemail"), headers: headers).match(/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i)[0]
        emails << email
        ap email
      end

      ap "#{index}/#{links.length}"
    end
  end

  File.open("db/emails/doska.zol.ru-3.json", 'w') do |file|
    file.write(emails.uniq.to_json);
  end

  # File.open("db/emails/doska.zol.ru.json", 'w') { |file| file.write(emails.to_json) }
end

emails()