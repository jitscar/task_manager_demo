# encoding: utf-8

class AttachmentUploader < CarrierWave::Uploader::Base
  # include CarrierWave::RMagick
  include CarrierWave::MimeTypes
  include ActionView::Helpers::NumberHelper

  storage :file



  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png tiff pdf txt doc docx rtf xls xlsx)
  end
end
