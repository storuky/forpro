set :output, File.join(File.dirname(__FILE__), "../log/whenever.log").to_s

every 1.hours do
  runner "Currency.update_usd_rate"
end

every 6.hour, at: "6am" do
  rake "sitemap:generate"
end