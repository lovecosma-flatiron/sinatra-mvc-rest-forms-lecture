class ArtistsController < ApplicationController

    get '/artists' do 
        @artists = Artist.all
        erb :'artists/index'
    end 

    get '/artist/new' do 
        erb :'artists/new'
    end 

    post '/artists' do 
        artist = Artist.new(name: params[:name], hometown: params[:hometown])
        if artist.save
            redirect '/artists'
        else
            redirect '/artist/new'
        end 
    end 

end 