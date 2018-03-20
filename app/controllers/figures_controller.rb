class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @landmark = Landmark.new(params[:landmark])
    @landmark.save
    @figure.update(name: params[:figure][:name])
    @figure.save
    @landmark.figure_id = @figure.id
     @landmark.save
    #binding.pry
    redirect "/figures/#{@figure.id}"
  end


  post '/figures' do
    @figure = Figure.new(params[:figure])
    @figure.save
    @landmark = Landmark.new(params[:landmark])
    @landmark.figure_id = @figure.id
    @landmark.save
    @title = Title.new(params[:title])
    @title.save
    #binding.pry
    @ft = FigureTitle.new(figure_id: @figure.id, title_id: @title.id)
    @ft.save
  end
end
