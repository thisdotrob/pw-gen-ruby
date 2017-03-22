require 'password_generator'

RSpec.describe generate_password do
  describe '#generate_password' do
    it 'returns a string' do
      password = generate_password
      expect(password).to be_a(String)
    end
  end
end
