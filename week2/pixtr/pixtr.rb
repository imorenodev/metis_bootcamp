require "sinatra"
require "active_record"

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "pixtr"
)

class Image < ActiveRecord::Base
end

class Gallery < ActiveRecord::Base
  has_many :images
end

get "/" do # step 1
  @galleries = Gallery.order("name ASC")
  erb :index
end

get "/galleries/new" do # step 3
  erb :new_gallery
end

get "/galleries/:id" do # step 2
  @gallery = Gallery.find(params[:id])
  @images = @gallery.images
  erb :gallery
end

post "/galleries" do # step 4
  gallery = Gallery.create(params[:gallery])
  redirect to("galleries/#{gallery.id}")
end

delete "/galleries/:id/delete" do
  gallery = Gallery.find(params[:id])
  gallery.destroy
  redirect to("/")
end

get "/galleries/:id/edit" do
  @gallery = Gallery.find(params[:id])
  erb :edit_gallery
end

put "/galleries/:id" do
  gallery = Gallery.find(params[:id])
  gallery.update(params[:gallery])
  redirect to("/galleries/#{@params[:id]}")
end