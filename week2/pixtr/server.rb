require "sinatra"
require "active_record"

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "pixtr"
)

class Image < ActiveRecord::Base # 
end

class Gallery < ActiveRecord::Base #automatically talks to galleries table in database, lowercase and pluralizes the classname Gallery to galleries
  has_many :images  #adds method called images that does SELECT * FROM images WHERE gallery_id = "?" must have column in images named gallery_id
end

get "/" do
  @galleries = Gallery.order("name ASC")
  erb :galleries
end

get "/galleries/new" do
  erb :new_gallery
end

get "/:id" do
  @gallery = Gallery.find(params[:id])
  @images = @gallery.images
  erb :gallery
end

get "/galleries/:id" do
  @gallery = Gallery.find(params[:id])
  @images = @gallery.images
  erb :gallery
end

post "/galleries" do
  gallery = Gallery.create(params[:gallery]) # :gallery will point to the hash passed from new_gallery form
  redirect to("/galleries/#{gallery.id}")
end

get "/galleries/:gallery_id/images/new" do  # key is gallery_id and value is the number
  @gallery = Gallery.find(params[:gallery_id])
  erb :new_image
end

post "/galleries/:gallery_id/images" do
  image = Image.create(params[:image])
  redirect to("/galleries/#{image.gallery_id}")  
 end

get "galleries/:id/edit" do
  @gallery = Gallery.find(params[:id])
  @gallery_id = params[:id]
  erb :edit_gallery
end

put "galleries/:id" do
  @gallery = Gallery.find(params[:id])
  @gallery.update(params[:gallery])   # :gallery contains the hash of values passed from the form on edit_gallery
  redirect to("/galleries/#{params[:id]}")
end