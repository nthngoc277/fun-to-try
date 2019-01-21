# loops through each file in source directory and reads it as a grayscale
require 'pathname'
require 'open3'
require 'mini_magick'

SRC_DIR = 'extracting-text-fom-images-using-ruby/source_images'.freeze
TMP_DIR = 'extracting-text-fom-images-using-ruby/tmp'.freeze

Dir.mkdir TMP_DIR unless File.exists?(TMP_DIR)

Pathname.new(SRC_DIR).children.each do |f|
  src_path = f.realpath
  tmp_path = "#{TMP_DIR}/#{f.basename}"

  img = MiniMagick::Image.open(src_path)
  img.colorspace('Gray')
  img.write(tmp_path)
end
