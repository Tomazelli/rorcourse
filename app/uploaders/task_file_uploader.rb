class TaskFileUploader < CarrierWave::Uploader::Base
  # include RMagick or mini_magick supporpt:
  # include carrierWave::RMagick
  include CarrierWave::MiniMagick

  # Include the sprockets-rails helper for rails 4+ asset pipelie compatibilities
  include Sprockets::Rails::Helper

  # choose what kind of storage to use for this uploader:
  # storage:file
  storage :fog


  # override the directory where uploaded files will be stored
  # this is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # add white list of extensions which are allowed to be uploaded
  # for images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png pdf mp4 wmv xls xlsx doc docx ppt pptx mov)
  end

end
