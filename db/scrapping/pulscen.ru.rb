require 'rest-client'
require 'nokogiri'
require 'awesome_print'
require 'pry'

require 'capybara'
require 'capybara/poltergeist'

include Capybara::DSL
Capybara.default_driver = :poltergeist

emails = [
  "info@ch-specstroi.ru",
  "info@metallregion-yug.ru",
  "vsa@afalina74.ru",
  "soyuz.zakaz@gmail.com",
  "ural@uss66.ru",
  "info@psbaza.ru",
  "tdricos@yandex.ru",
  "mail@westoil.ru",
  "dob.d@mail.ru",
  "kamaz@aaanet.ru",
  "2367777@mail.ru",
  "utek.rnd@gmail.com",
  "it-rostov@e4u.ru",
  "liderk2012@yandex.ru",
  "uzrs-kr@mail.ru",
  "89183920940@bk.ru",
  "angelina7799@mail.ru",
  "info@meh93.ru",
  "info@utkmir.ru",
  "avios.kr@mail.ru",
  "tech@penetron-krr.ru",
  "tpk-pentan@mail.ru",
  "rnd@prom23.ru",
  "td.shi@yandex.ru",
  "oleinik_60@mail.ru",
  "rs_krd1@mail.ru",
  "ug1@eurotools.su",
  "novostroykin23@mail.ru",
  "stroy-tranzit@mail.ru",
  "status-oil2013@yandex.ru",
  "t17100@yandex.ru",
  "utek.rnd@gmail.com",
  "alexandr123rus@yandex.ru",
  "utek.rnd@gmail.com",
  "status-oil2013@yandex.ru",
  "info@vitto.ru",
  "vopros645111@mail.ru",
  "melakstroy@mail.ru",
  "info@kubaninstrument.ru",
  "Cat-oill@yandex.ru",
  "rms1303@mail.ru",
  "oooskplast@mail.ru",
  "rosthim@yandex.ru",
  "y7035005@yandex.ru",
  "td.shi@yandex.ru",
  "promrea@yandex.ru",
  "3174997@mail.ru",
  "butenko0912@gmail.com",
  "sale@instrum.com.ru",
  "info@nivaperm.ru",
  "svarochnik@43i.ru",
  "spb_azimut7@mail.ru",
  "337015@mail.ru",
  "2050654@mail.ru",
  "megapolis81@mail.ru",
  "Lanaopt2012@bk.ru",
  "okcholod@mail.ru",
  "vs.auto22@mail.ru",
  "2294437@mail.ru",
  "607457@mail.ru",
  "9130040646@mail.ru",
  "surgut_klimat@mail.ru",
  "s-agro@inbox.ru",
  "order@ati.nnov.ru",
  "nuralimansurov@mail.ru",
  "info@himalyans.ru",
  "uralhimlab@mail.ru",
  "uas-perm@mail.ru",
  "3710100@krepika.ru",
  "enki-stroy@yandex.ru",
  "9335799@mail.ru",
  "akvatoriya-tepla@mail.ru",
  "tdhimlider@gmail.com",
  "482454@mail.ru",
]

(6..34).each do |i|
  ap "======== Страница #{i} =========="
  5.times do
    begin
      visit "http://www.pulscen.ru/price/0401-nefteprodukty-toplivo-gsm?page=#{i}"
      links = all(".js-bp-title").map{|link| link["href"]}

      links.each do |link|
        5.times do
          begin
            visit link

            email = find('[itemprop="email"]').text rescue nil
            if email
              emails << email
              ap email
            end
            break
          rescue
            ap "Ошибка #{link}"
          end
        end
      end
      break
    rescue
      ap "Страница #{i} не доступна"
    end
  end
end

File.open("db/emails/fuelfor.json", 'w') { |file| file.write(emails.to_json) }

# headers = {"User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36", "Upgrade-Insecure-Requests" => "1", "Cookie" => "_ym_uid=1453591982723442514; _ym_isad=1; WTPC=1ae792fcaf67b73c1f7fb54beee26fd6; __utma=63882493.1112418719.1453591982.1457897056.1457897056.1; __utmb=63882493.0.10.1457897056; __utmc=63882493; __utmz=63882493.1457897056.1.1.utmcsr=pulscen.ru|utmccn=(referral)|utmcmd=referral|utmcct=/price/0401-nefteprodukty-toplivo-gsm; _ym_visorc_31246953=w; region_id=3; _seealso=144004%2C136544%2C136538%2C10008%2C125172%2C190320%2C239973%2C83519%2C188272%2C10125; __utmt=1; __utma=34381856.1112418719.1453591982.1457897533.1457897533.1; __utmb=34381856.1.10.1457897533; __utmc=34381856; __utmz=34381856.1457897533.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _dc_gtm_UA-204628-7=1; _ym_visorc_200476=b; _pulscen_session=BAh7CUkiD3Nlc3Npb25faWQGOgZFRkkiJTZlMjE3MGEyYjY3MTYwNGVmMDY0NTc0ZWI4YjljZTBmBjsAVEkiFmlucHV0X2RldmljZV90eXBlBjsARkkiCk1PVVNFBjsARkkiFGhvdmVyX3N1cHBvcnRlZAY7AEZUSSIQX2NzcmZfdG9rZW4GOwBGSSIxeWlCbU9yL0tLYTZYVWtha3hSS0Z0eXFxWW15enMwbnlTS2pMMm9uVWdFbz0GOwBG--a716c04afbc799b47baf9f1b6d8673bbc3be7505; _gat_UA-204628-7=1; _ga=GA1.3.1112418719.1453591982; _ga=GA1.2.1112418719.1453591982", "Host" => "chel.pulscen.ru"}

# def extract_emails_to_array(txt)
#   reg = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
#   txt.scan(reg).uniq
# end
# # RestClient.proxy = "https://195.16.122.103:3128"

# (2..20).each do |index|
#   result = RestClient::Request.execute(method: :get, url: "http://www.pulscen.ru/price/0401-nefteprodukty-toplivo-gsm?page=#{index}", headers: headers);

#   doc = Nokogiri::HTML(result);
#   hrefs = doc.css(".js-bp-title").map {|a| a.attributes["href"].value}

#   hrefs.each do |h|
#     _result = RestClient::Request.execute(method: :get, url: h, headers: headers)
#     ap _result
#     if _result
#       email = extract_emails_to_array(_result)
#       ap email
#       if email
#         emails << email
#       end
#     end
#   end
#   puts "Страница #{index}"
#   File.open("db/emails/fuelfor#{index}.pro", 'w') { |file| file.write(emails.to_json) }
# end
