Company.all.each do |company|
  folder "sitemaps/#{company.name}"
  host "https://#{company.name}.pro"

  sitemap_for company.positions.where("updated_at > ?", DateTime.now - 1.week), name: :positions do |position|
    url position, last_mod: position.updated_at, priority: 1.0
  end
end