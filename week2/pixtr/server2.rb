require "sinatra"
require "active_record"

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  databse: "pixtr"
)

class Gallery < ActiveRecord::Base #automatically talks to galleries table in database, lowercase and pluralizes the classname Gallery to galleries
end

get "/" do
  @galleries = Gallery.order("name ASC") # ["cats", "dogs"]
  erb :galleries
end

get "/:name" do
  @name = params[:name]
  @filenames = Gallery.find_by(name: @name) # creates array filenames ["colonel_meow.jpg", "grumpy_cat.png"] or ["shibe.png"]
    if @filenames == nil
      erb :error, layout: :layout2
    else
      erb :index, layout: :layout2
    end
end