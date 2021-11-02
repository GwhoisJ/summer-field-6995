require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'relationships' do
    it {should have_many :actor_movies}
    it {should have_many(:movies).through(:actor_movies)}
  end

  describe 'class methods' do
    before :each do
      @studio = Studio.create!(name: 'Some Studio', location: 'Atlanta')
      @movie = @studio.movies.create!(title: 'Dune', creation_year: 2021, genre: 'Sci-Fi')
      @actor_1 = @movie.actors.create!(name: 'Bob', age: 50)
      @actor_2 = @movie.actors.create!(name: 'Greg', age: 30)
      @actor_3 = Actor.create!(name: 'Sally', age: 15)
    end

    describe '#name' do
      it 'finds the frist actor with a matching name' do
        expect(Actor.find_by_name("Bob")).to eq(@actor_1)
      end
    end
  end

  describe 'instance methods' do
    before :each do
      @studio = Studio.create!(name: 'Some Studio', location: 'Atlanta')
      @movie = @studio.movies.create!(title: 'Dune', creation_year: 2021, genre: 'Sci-Fi')
      @actor_1 = @movie.actors.create!(name: 'Bob', age: 50)
      @actor_2 = @movie.actors.create!(name: 'Greg', age: 30)
      @actor_3 = Actor.create!(name: 'Sally', age: 15)
    end

    describe 'find_coworkers' do
      it 'finds the coworkers' do
        expect(@actor_1.find_coworkers).to eq([@actor_2])
      end
    end
  end
end
