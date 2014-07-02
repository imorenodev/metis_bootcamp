class ImagesController < ApplicationController

  def new
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.new
  end

  def create
    gallery = Gallery.find(params[:gallery_id])

    gallery.images.create(image_params) #creating an image through the gallery, automatically creates an image and sets the gallery_id value to that of the gallery the image is created through.

    redirect_to gallery # instead of redirect_to gallery_path(gallery)
  end

  private

  def image_params
    params.require(:image).permit(:name, :description, :url)
  end
end