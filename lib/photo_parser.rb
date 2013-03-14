class PhotoParser
  include HappyMapper
  
  photo_a = open("#{Rails.root}/lib/exports/photo_album.xml").read
  
  photo_a.split("\n").each do |x| 
    name = x.split("<")[1].split(">")[1]
    url = x.split("<")[1].split(">")[0] << "/"
    uri = URI.parse url
    
    xml_photos = Nokogiri::XML open(uri).read
    
    photo_urls = xml_photos.xpath "/methodResponse/params/param/value/array/data/value/struct/member[name[contains(text(), 'PHOTO_URL')]]/value/string/text()"
         
    photo_album = PhotoAlbum.new name: name
    photo_album.publish
    
    photo_urls.each do |photo_url|
      photo = PhotoAlbum::Photo.new photo_album_id: photo_album.id
      photo.remote_image_url = photo_url.text
      photo.save
    end
    
    photo_album.save
  end

end
