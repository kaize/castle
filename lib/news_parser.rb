class NewsParser
  include HappyMapper
  
  ue = UcozExporter.new
  links_news = ue.api_links 'news'
  links_news.each do |link|
    xml_news = Nokogiri::XML open(link)
    title = xml_news.xpath "/methodResponse/params/param/value/struct/member[name[contains(text(), 'TITLE')]]/value/string/text()"
    body = xml_news.xpath "/methodResponse/params/param/value/struct/member[name[contains(text(), 'MESSAGE')]]/value/string/text()"
    date = xml_news.xpath "/methodResponse/params/param/value/struct/member[name[contains(text(), 'DATE')]]/value/string/text()"
    time = xml_news.xpath "/methodResponse/params/param/value/struct/member[name[contains(text(), 'TIME')]]/value/string/text()"
    date = date.to_s.split('.')
    time = time.to_s.split(':')
    
    published_at = Time.new(date[2], date[1], date[0], time[0], time[1], 0)
    news = News.new body: body.text, title: title.text, published_at: published_at
    news.publish
    news.save
  end
end
