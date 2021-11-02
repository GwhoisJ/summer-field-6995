require 'rails_helper'

RSpec.describe 'Movie show page' do
  before(:each) do
    @studio = Studio.create!(name: 'Some Studio', location: 'Atlanta')
    @movie = @studio.movies.create!(title: 'Dune', creation_year: 2021, genre: 'Sci-Fi')
    @actor_1 = @movie.actors.create!(name: 'Bob', age: 50)
    @actor_2 = @movie.actors.create!(name: 'Greg', age: 30)
  end

  it 'should have the movies info' do
    visit movie_path(@movie)

    expect(page).to have_content(@movie.title)
    expect(page).to have_content(@movie.creation_year)
    expect(page).to have_content(@movie.genre)
  end

  it 'should list all actors in order of age' do
    visit movie_path(@movie)

    expect(page).to have_content(@actor_1.name)
    expect(page).to have_content(@actor_2.name)

    expect(@actor_2.name).to appear_before(@actor_1.name)
  end

  it 'should list the average age of the actors' do
    visit movie_path(@movie)

    expect(page).to have_content("Average Age: 40")
  end
end