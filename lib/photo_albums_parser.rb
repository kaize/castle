class PhotoAlbumsParser
  include HappyMapper
  
  tag "methodResponse"
  
  element :url, String, tag: 'string', xpath: "params/param/value/struct/member[name[contains(text(), 'CATEGORY_URL')]]/value"
  element :name, String, tag: 'string', xpath: "params/param/value/struct/member[name[contains(text(), 'CATEGORY_NAME')]]/value"
 
end
