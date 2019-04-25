class ArtistsController < ApplicationController

  get "/artists" do
    @artists = Artist.all
    erb :'artists/index'
  end

  get "/artists/new" do
    @artist = Artist.new
    erb :'artists/new'
  end

  get "/artists/:id" do
    find_artist
    @instruments = Instrument.all
    erb :'artists/show'
  end

  get "/artists/:id/edit" do
    find_artist
    erb :'artists/edit'
  end

  patch "/artists/:id" do
    find_artist
    @artist.update(params[:artist])
    redirect to "/artists/#{@artist.id}"
  end

  post "/artists" do
    @artist = Artist.create(params[:artist])
    redirect to "/artists"
  end

  delete "/artists/:id" do
    find_artist
    @artist.destroy
    redirect to "/artists"
  end

  def find_artist
    @artist = Artist.find(params[:id])
  end

end
