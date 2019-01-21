# loops through each file in source directory and reads it as a grayscale
require 'bundler/inline'
require 'pathname'
require 'open3'

gemfile do
  source 'https://rubygems.org'
  gem 'mini_magick', '~> 4.5', '>= 4.5.1'
  gem 'byebug', '~> 9.0', '>= 9.0.5'
end

SRC_DIR = 'extracting-text-fom-images-using-ruby/source_images'.freeze
TMP_DIR = 'extracting-text-fom-images-using-ruby/tmp'.freeze

Dir.mkdir TMP_DIR unless File.exists?(TMP_DIR)

Pathname.new(SRC_DIR).children.each do |f|
  # convert image to grayscale
  src_path = f.realpath
  tmp_path = "#{TMP_DIR}/#{f.basename}"

  img = MiniMagick::Image.open(src_path)
  img.colorspace('Gray')
  img.write(tmp_path)

  # cleaning the image
  # MiniMagick::Tool::Magick.new do |magick|
  #   magick << tmp_path
  #   magick.negate
  #   magick.threshold("007%")
  #   magick.negate
  #   magick << tmp_path
  # end
  # Still dont know why MiniMagick::Tool::Magick does not work on ImageMagick 7 
  
  MiniMagick::Tool::Convert.new do |convert|
    convert << tmp_path
    convert.negate
    convert.threshold("012%")
    convert.negate
    convert << tmp_path
    convert.call
  end

  # Regconizing the text
  puts "********* #{f.basename}  ******************"
  text, _, _ = Open3.capture3("tesseract #{tmp_path} stdout")
  puts text.strip
end
