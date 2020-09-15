class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes' do 
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do 
    erb :new
  end 

  post '/recipes' do 
    @new_recipe = Recipe.create(params)
    redirect "/recipes/#{@new_recipe.id}"
  end 

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end 

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find(params[:id])
    erb :edit
  end 

  patch '/recipes/:id' do 
    @edited_recipe = Recipe.find(params[:id])
    @edited_recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{@edited_recipe.id}"
  end 

  # get '/recipes/:id/delete' do
  #   @recipe = Recipe.find(params[:id])
  #   erb :delete
  # end

  delete '/recipes/:id' do
    @doomed_recipe = Recipe.find(params[:id])
    @doomed_recipe.destroy 
    redirect '/recipes'
  end


end
