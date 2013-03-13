class UcozExporter
  include HappyMapper
  
  def api_links(name)
    links = SitemapParser.parse(File.read("#{Rails.root}/lib/exports/sitemap.xml"), single: true)
    links_with_api = []
    if name == 'news'
      links.news.each do |l|
        uri = URI.parse(l)
        link = uri.path
        uri.path = "/api#{link}"
        links_with_api << uri
      end
    elsif name == 'photo_albums'
      links.photo_albums.each do |l|
        uri = URI.parse(l)
        link = uri.path
        uri.path = "/api#{link}"
        links_with_api << uri
      end
    end
    links_with_api
  end
  
end
