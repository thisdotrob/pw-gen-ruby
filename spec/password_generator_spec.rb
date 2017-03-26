require 'password_generator'

describe '#generate_password' do
  it 'returns a string' do
    password = generate_password(11, lowercase: true, uppercase: true, number: true, special: true)
    expect(password).to be_a(String)
  end

  it 'returns a password of the specified length' do
    for length in 8..11 do
      password = generate_password(length, lowercase: true, uppercase: true, number: false, special: false)
      expect(password.length).to eq(length)
    end
  end

  context 'when \'uppercase\' is true' do
    it 'returns a password of only uppercase characters' do
      password = generate_password(15, lowercase: false, uppercase: true, number: false, special: false)
      expect(password).to match(/^[A-Z]+$/)
    end
  end

  context 'when \'lowercase\' is true' do
    it 'returns a password of only lowercase characters' do
      password = generate_password(15, uppercase: false, lowercase: true, number: false, special: false)
      expect(password).to match(/^[a-z]+$/)
    end
  end

  context 'when \'number\' is true' do
    it 'returns a password of only numeric characters' do
      password = generate_password(15, uppercase: false, lowercase: false, number: true, special: false)
      expect(password).to match(/^[0-9]+$/)
    end
  end

  context 'when \'special\' is true' do
    it 'returns a password containing only special characters' do
      password = generate_password(15, uppercase: false, lowercase: false, number: false, special: true)
      expect(password).to match(/^[!$%&*@^]+$/)
    end
  end
end
