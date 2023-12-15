require 'rails helper'

Rspec.describe User, type: :model do
  subject do
    User.new(
      name: 'Peter Emi',
      photo: 'https://example.com/test.jpg',
      bio: 'Football player and Robotic engineer',
      post_counter: 0
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is invalid without a name' do
      subject.name = ''
      expect(subject).not_to be_valid
    end

    it 'is invalid when post_counter is less than 0' do
      subject.post_counter = -1
      expect(subject).not_to be_valid
    end
  end
end
