
class UcozExporter
  include HappyMapper
  
  tag 'urlset'
  
  namespace 'xmlns'
  
  has_many :news, String, tag: 'loc', namespace: 'xmlns', xpath: "xmlns:url/xmlns:loc[contains(text(), 'http://oddt.ucoz.ru/news/')]"
  has_many :photo_albums, String, :tag => 'loc', namespace: 'xmlns', xpath: "xmlns:url/xmlns:loc[contains(text(), 'http://oddt.ucoz.ru/photo/')]"
  
end
