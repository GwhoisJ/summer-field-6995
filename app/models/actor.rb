class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.find_by_name(input)
    where(name: input).first
  end

  def find_coworkers
    movies.map do |movie|
      movie.actors.where.not(id: self.id)
    end.uniq
  end
end
