class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/figures/new' do
    @titles = Title.all
    erb :'figures/new'
  end

  # post '/figures' do
  #   #sbinding.pry
  # end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  post '/landmarks' do
    @landmark = Landmark.new(params[:landmark])
    @landmark.save
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    #binding.pry
    redirect "/landmarks/#{@landmark.id}"
  end



end
