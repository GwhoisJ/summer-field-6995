require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'relationships' do
    it {should have_many :actor_movies}
    it {should have_many(:movies).through(:actor_movies)}
  end

  describe 'class methods' do
    before :each do
      @actor_1 = Actor.create!(name: 'Bob', age: 50)
      @actor_2 = Actor.create!(name: 'Greg', age: 30)
      @actor_3 = Actor.create!(name: 'Sally', age: 15)
    end

    describe '#name' do
      it 'finds the frist actor with a matching name' do
        expect(Actor.find_by_name("Bob")).to eq(@actor_1)
      end
    end
  end
end
