class PhotoParser
  include HappyMapper
  
  tag "methodResponse"
  
  has_many :urls, String, tag: 'string', xpath: "params/param/value/array/data/value/struct/member[name[contains(text(), 'PHOTO_URL')]]/value"

end
