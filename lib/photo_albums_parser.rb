class PhotoAlbumsParser
  include HappyMapper
  
  ue = UcozExporter.new
  links_photo = ue.api_links 'photo_albums'
  photo_album = {}
  
  links_photo.each do |link|
    
    response = Net::HTTP.get_response(link)
    proxy = ["175.136.226.87", "49.212.129.130", "110.77.193.184", "213.155.31.168", "187.23.40.64", "46.50.175.146", "187.6.254.22" ]
    port = "3128"
    puts response.code
    if response.code != '200'
      response = Net::HTTP::Proxy(proxy.pop, port, nil, nil).get_response link
    end
    xml_photo = Nokogiri::XML response.body
    
    
    url_photo_album = xml_photo.xpath "/methodResponse/params/param/value/struct/member[name[contains(text(), 'CATEGORY_URL')]]/value/string/text()"
    name_photo_album = xml_photo.xpath "/methodResponse/params/param/value/struct/member[name[contains(text(), 'CATEGORY_NAME')]]/value/string/text()"
    
    url_photos = "http://oddt.ucoz.ru/api" << url_photo_album.text
    
    photo_album[url_photos]= name_photo_album.text
  
  end
   File.open("#{Rails.root}/lib/exports/photo_album.xml", 'w') do |f|
     f.write photo_album.to_xml
   end
  
end
