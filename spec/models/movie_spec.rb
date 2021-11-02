require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it {should have_many :actor_movies}
    it {should have_many(:actors).through(:actor_movies)}
  end

  describe 'instance methods' do
    before :each do
      @studio = Studio.create!(name: 'Some Studio', location: 'Atlanta')
      @movie = @studio.movies.create!(title: 'Dune', creation_year: 2021, genre: 'Sci-Fi')
      @actor_1 = @movie.actors.create!(name: 'Bob', age: 50)
      @actor_2 = @movie.actors.create!(name: 'Greg', age: 30)
    end

    describe 'order actors by age' do
      it 'should order any actors associated with the movie by age' do
        expect(@movie.order_by_age).to eq([@actor_2, @actor_1])
      end
    end

    describe 'average age' do
      it 'should return the average age of the actors associated with the movie' do
        expect(@movie.average_age).to eq 40
      end
    end
  end
end
