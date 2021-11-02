require 'rails_helper'

RSpec.describe 'Studio index page' do
  before(:each) do
    @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @ark = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @shrek = @universal.movies.create!(title: 'Shrek', creation_year: 2000, genre: 'Comedy')

    @studio_2 = Studio.create!(name: 'Studio 2', location: 'Atlanta')
    @dune = @studio_2.movies.create!(title: 'Dune', creation_year: 2021, genre: 'Sci-Fi')
  end

  it 'lists each studio with its movies' do
    visit studios_path

    within('#studio-0') do
      expect(page).to have_content(@universal.name)
      expect(page).to have_content(@ark.title)
      expect(page).to have_content(@shrek.title)

      expect(page).to_not have_content(@dune.title)
      expect(page).to_not have_content(@studio_2.name)
    end

    within('#studio-1') do
      expect(page).to have_content(@dune.title)
      expect(page).to have_content(@studio_2.name)

      expect(page).to_not have_content(@universal.name)
      expect(page).to_not have_content(@ark.title)
      expect(page).to_not have_content(@shrek.title)
    end
  end
end