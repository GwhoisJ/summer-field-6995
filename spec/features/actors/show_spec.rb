require 'rails_helper'

RSpec.describe 'actor show page' do
  before :each do
    @studio = Studio.create!(name: 'Some Studio', location: 'Atlanta')
    @movie = @studio.movies.create!(title: 'Dune', creation_year: 2021, genre: 'Sci-Fi')
    @actor_1 = @movie.actors.create!(name: 'Bob', age: 50)
    @actor_2 = @movie.actors.create!(name: 'Greg', age: 30)
    @actor_4 = @movie.actors.create!(name: 'bill', age: 30)
    @actor_3 = Actor.create!(name: 'Sally', age: 15)
  end

  it 'has the actor information' do
    visit actor_path(@actor_1)

    expect(page).to have_content(@actor_1.name)
    expect(page).to have_content("Age: #{@actor_1.age}")
  end

  it 'lists the coworkers' do
    visit actor_path(@actor_1)

    expect(page).to have_content("Co-Actors:")
    expect(page).to have_content(@actor_2.name)
    expect(page).to_not have_content(@actor_3.name)
  end
end