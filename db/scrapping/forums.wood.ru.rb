require 'rest-client'
require 'nokogiri'

headers = {"user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36"}

emails = []

RestClient.proxy = "https://195.16.122.103:3128"

(3..20).each do |index|
  result = RestClient::Request.execute(method: :get, url: "http://forums.wood.ru/forumdisplay.php?forumid=13&pagenumber=#{index}", headers: headers);

  doc = Nokogiri::HTML(result);

  doc.css("a[href*='showthread.php?threadid=']").each_with_index do |a, index|
    href = "http://forums.wood.ru/#{a.attributes["href"].value}"
    if href.exclude?("#plast")
      _result = RestClient::Request.execute(method: :get, url: href, headers: headers);
      _doc = Nokogiri::HTML(_result);
      _doc.css('a[href*="mailto:"]').each do |mailto|
        email = mailto.attributes["href"].value.gsub("mailto:", "")
        emails << mailto.attributes["href"].value.gsub("mailto:", "")
        puts email
      end
      puts "=========="
      sleep 1
    end
  end
  puts "Страница #{index}"
  File.open("db/emails/woodfor#{index}.pro", 'w') { |file| file.write(emails.to_json) }
end