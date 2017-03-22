require 'password_generator'

describe '#generate_password' do
  it 'returns a string' do
    password = generate_password(11)
    expect(password).to be_a(String)
  end

  it 'returns a password of the specified length' do
    test_length = 33
    password = generate_password(test_length)
    expect(password.length).to eq(test_length)
  end
end
