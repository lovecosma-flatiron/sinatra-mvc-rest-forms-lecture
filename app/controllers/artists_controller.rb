class ArtistsController < ApplicationController


#index of RESTful routes, part of R in CRUD
    get '/artists' do #combination of http verb (get, post) and url '/artists etc' determines which route responds to http request
        @artists = Artist.all
        erb :'artists/index' # 'render' html file in views, erb is embedded ruby in html, allows us to pass in instance variable to view
    end 
#new of RESTful routes, part of C in CRUD
    get '/artists/new' do 
        erb :'artists/new'
    end 
#create of RESTful routes, part of C in CRUD
    post '/artists' do 
        artist = Artist.new(name: params[:name], hometown: params[:hometown])
        if artist.save
            redirect "/artists/#{artist.id}" #get request to another route
        else
            redirect '/artists/new'
        end 
    end 

    get '/artists/:id' do 
       @artist = Artist.find_by_id(params[:id]) 
       erb :"artists/show"
    end 
#edit/ edit part of U in crud, Edit in REST


    get '/artists/:id/edit' do 
        @artist = Artist.find_by_id(params[:id])
        erb :"artists/edit" 
    end 

#patch/ update U in crud, Update in REST

    patch '/artists/:id' do 
        artist = Artist.find_by_id(params[:id])
        artist.update(name: params[:name], hometown: params[:hometown])
        if artist.save
            redirect "/artists/#{artist.id}"
        else
            redirect "/artists/#{artist.id}/edit"
        end 

    end 
#delete/ destroy D in crud, delete in REST
    delete '/artists/:id' do 
        @artist = Artist.find_by_id(params[:id])
        @artist.delete
        redirect "/artists"
    end 



end 