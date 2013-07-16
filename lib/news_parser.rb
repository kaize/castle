class NewsParser
  include HappyMapper
  
  tag "methodResponse"
  
  element :title, String, tag: 'string', xpath: "params/param/value/struct/member[name[contains(text(), 'TITLE')]]/value"
  element :body, String, tag: 'string', xpath: "params/param/value/struct/member[name[contains(text(), 'MESSAGE')]]/value"
  element :published_at, Time, tag: 'i4', xpath: "params/param/value/struct/member[name[contains(text(), 'TIMESTAMP')]]/value"

end
