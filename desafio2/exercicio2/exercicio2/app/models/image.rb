class Image < ApplicationRecord
  
  #default size 800x600
  #small   size 320x240 (2,5)
  #medium  size 384x288 (2,08)
  #large   size 640x480 (1,25)

  DIRECTORY_PATH = Rails.root.join("public/documents")
  ORIGINAL_PATH = Rails.root.join(DIRECTORY_PATH, "original")
  SMALL_PATH = Rails.root.join(DIRECTORY_PATH, "small")
  MEDIUM_PATH = Rails.root.join(DIRECTORY_PATH, "medium")
  LARGE_PATH = Rails.root.join(DIRECTORY_PATH, "large")
  
  def self.create_image(img_name, img_stream)
    create_directories
    
    original_file = create_image_file(ORIGINAL_PATH, img_name, img_stream)
    #create_image_file(SMALL_PATH, img_name, img_stream)
    #create_image_file(MEDIUM_PATH, img_name, img_stream)
    #create_image_file(LARGE_PATH, img_name, img_stream)

    image = MiniMagick::Image.open( original_file )
    image.resize "640x480"
    image.write( Rails.root.join(LARGE_PATH, img_name) )

    image.resize "384x288"
    image.write( Rails.root.join(MEDIUM_PATH, img_name) )

    image.resize "320x240"
    image.write( Rails.root.join(SMALL_PATH, img_name) )


    Image.create(nome: img_name)
  end

  def get_url_smal
    "/documents/small/"+self.nome
  end

  def get_url_medium
    "/documents/medium/"+self.nome
  end

  def get_url_large
    "/documents/large/"+self.nome
  end

  private

  def self.create_directories
    FileUtils.mkdir_p(DIRECTORY_PATH) unless File.exists?(DIRECTORY_PATH)
    FileUtils.mkdir_p(ORIGINAL_PATH) unless File.exists?(ORIGINAL_PATH)
    FileUtils.mkdir_p(SMALL_PATH) unless File.exists?(SMALL_PATH)
    FileUtils.mkdir_p(MEDIUM_PATH) unless File.exists?(MEDIUM_PATH)
    FileUtils.mkdir_p(LARGE_PATH) unless File.exists?(LARGE_PATH)
  end

  def self.create_image_file(directory, name, stream)
    file = Rails.root.join(directory, name)
    File.open(file, "wb") { |f| f.write(stream) } if file
    file
  end

end
