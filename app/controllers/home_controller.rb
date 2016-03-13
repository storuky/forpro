class HomeController < ApplicationController
  def index
  end

  def sitemap
    path = Rails.root.join("public", "sitemaps", Company.current_company.name, "sitemap.xml")
    if File.exists?(path)
      render xml: open(path).read
    else
      render text: "Sitemap not found.", status: :not_found
    end
  end

  def robots
    render template: "home/robots", layout: false
  end
end
