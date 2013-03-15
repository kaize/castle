task ucoz_import: :environment do
  ucoz_exporter = UcozExporter.new
  ucoz_exporter.import_news
  ucoz_exporter.import_photo_albums
end
