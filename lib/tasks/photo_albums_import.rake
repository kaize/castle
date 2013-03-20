task photo_albums_import: :environment do
  photo_albums = PhotoAlbumsImporter.new
  photo_albums.import_photo_albums
end
