class ImagesController < ApplicationController
  require 'httparty'

  before_action :set_request_url

  # GET /images/1
  def show
    image = Image.find(params[:id])
    image_json = {id: image.id, url_smal: @request_url+image.get_url_smal, url_medium: @request_url+image.get_url_medium, url_large: @request_url+image.get_url_large}
    render json: image_json
  end

  # POST /images
  def create
    images = get_images_from_api

    images_objects = []
    images.each do |image|
      img_name = image["url"].split("/").last
      img_stream = HTTParty.get(image["url"])
      images_objects << Image.create_image(img_name, img_stream)
    end

    unless images_objects.any?{|image| image.id.nil?}
      images_objects_json = images_objects.map{|image| {id: image.id, url_smal: @request_url+image.get_url_smal, url_medium: @request_url+image.get_url_medium, url_large: @request_url+image.get_url_large} }
      render json: images_objects_json, status: :created
    else
      message = "Fail in save this images: "
      fail_images_name = images_objects.select{|image| image.id.nil?}.map{|image| image.nome}.join(", ")
      message += fail_images_name
      render json: {message: message}, status: :unprocessable_entity
    end
  end

  private

  def get_images_from_api
    url_to_access = "http://54.152.221.29/images.json"
    images = []

    response = HTTParty.get(url_to_access)
    images = response["images"] if response

    images
  end

  def set_request_url
    @request_url = request.host+":"+request.port.to_s
  end

end
