class Image < ApplicationRecord
  
  #default size 800x600
  #small   size 320x240 (2,5)
  #medium  size 384x288 (2,08)
  #large   size 640x480 (1,25)

  DIRECTORY_PATH = Rails.root.join("documents")
  SMALL_PATH = Rails.root.join(DIRECTORY_PATH, "small")
  MEDIUM_PATH = Rails.root.join(DIRECTORY_PATH, "medium")
  LARGE_PATH = Rails.root.join(DIRECTORY_PATH, "large")
  
  def self.create_image(img_name, img_url)
    create_directories
    
    image = MiniMagick::Image.open( img_url )
    image.resize "640x480"
    image.write( Rails.root.join(LARGE_PATH, img_name) )

    image.resize "384x288"
    image.write( Rails.root.join(MEDIUM_PATH, img_name) )

    image.resize "320x240"
    image.write( Rails.root.join(SMALL_PATH, img_name) )


    Image.create(nome: img_name)
  end

  def get_url_smal
    "/images/#{self.id}/small"
  end

  def get_url_medium
    "/images/#{self.id}/medium"
  end

  def get_url_large
    "/images/#{self.id}/large"
  end

  private

  def self.create_directories
    FileUtils.mkdir_p(DIRECTORY_PATH) unless File.exists?(DIRECTORY_PATH)
    FileUtils.mkdir_p(SMALL_PATH) unless File.exists?(SMALL_PATH)
    FileUtils.mkdir_p(MEDIUM_PATH) unless File.exists?(MEDIUM_PATH)
    FileUtils.mkdir_p(LARGE_PATH) unless File.exists?(LARGE_PATH)
  end

end
