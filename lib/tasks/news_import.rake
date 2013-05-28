task news_import: :environment do
  news = NewsImporter.new
  news.import_news
end
