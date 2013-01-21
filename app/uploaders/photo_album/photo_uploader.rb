# encoding: utf-8

class PhotoAlbum::PhotoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  storage :file

  def store_dir
    "system/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  #process :scale => [200, 300]

  version :carousel do
    process :resize_to_fill => [800, 600]
  end

  #version :main_carousel2 do
  #  process :resize_to_fill => [1170, 390]
  #end

  #version :main_carousel do
  #  process :resize_to_fit => [560, 420]
  #end

  #version :galary do
  #  process :resize_to_fit => [360, 270]
  #end

  version :thumb do
    process :resize_to_fit => [120, 90]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end