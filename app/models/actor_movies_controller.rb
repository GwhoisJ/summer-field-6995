class ActorMoviesController < ApplicationController
  def create
    ActorMovie.create!(actor: Actor.find_by_name(params[:name]), movie: Movie.find(params[:movie_id]))

    redirect_to movie_path(params[:movie_id])
  end
end