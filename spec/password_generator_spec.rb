require 'password_generator'

describe '#generate_password' do
  it 'returns a string' do
    password = generate_password(11, uppercase: true)
    expect(password).to be_a(String)
  end

  it 'returns a password of the specified length' do
    test_length = 33
    password = generate_password(test_length, uppercase: true)
    expect(password.length).to eq(test_length)
  end

  context 'when \'uppercase\' is true' do
    it 'returns a password of only uppercase characters' do
      password = generate_password(15, uppercase: true)
      expect(password).to match(/^[A-Z]+$/)
    end
  end
end
