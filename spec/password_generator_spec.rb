require 'password_generator'

describe '#generate_password' do
  it 'returns a string' do
    password = generate_password(11, lowercase: true, uppercase: true, number: true, special: true)
    expect(password).to be_a(String)
  end

  it 'returns a password of the specified length' do
    (8..11).each do |length|
      password = generate_password(length, lowercase: true, uppercase: true, number: false, special: false)
      expect(password.length).to eq(length)
    end
  end

  it 'should not follow an alternating character set pattern' do
    password = generate_password(40, lowercase: true, uppercase: true, number: true, special: true)
    expect(password).to_not match(/([A-Z][a-z][0-9][!$%£*@^]){3,}/)
    expect(password).to_not match(/([A-Z][a-z][!$%£*@^][0-9]){3,}/)
    expect(password).to_not match(/([A-Z][0-9][a-z][!$%£*@^]){3,}/)
    expect(password).to_not match(/([A-Z][0-9][!$%£*@^][a-z]){3,}/)
    expect(password).to_not match(/([A-Z][!$%£*@^][a-z][0-9]){3,}/)
    expect(password).to_not match(/([A-Z][!$%£*@^][0-9][a-z]){3,}/)

    expect(password).to_not match(/([a-z][0-9][!$%£*@^][A-Z]){3,}/)
    expect(password).to_not match(/([a-z][0-9][A-Z][!$%£*@^]){3,}/)
    expect(password).to_not match(/([a-z][!$%£*@^][0-9][A-Z]){3,}/)
    expect(password).to_not match(/([a-z][!$%£*@^][A-Z][0-9]){3,}/)
    expect(password).to_not match(/([a-z][A-Z][0-9][!$%£*@^]){3,}/)
    expect(password).to_not match(/([a-z][A-Z][!$%£*@^][0-9]){3,}/)

    expect(password).to_not match(/([0-9][!$%£*@^][A-Z][a-z]){3,}/)
    expect(password).to_not match(/([0-9][!$%£*@^][a-z][A-Z]){3,}/)
    expect(password).to_not match(/([0-9][A-Z][a-z][!$%£*@^]){3,}/)
    expect(password).to_not match(/([0-9][A-Z][!$%£*@^][a-z]){3,}/)
    expect(password).to_not match(/([0-9][a-z][!$%£*@^][A-Z]){3,}/)
    expect(password).to_not match(/([0-9][a-z][A-Z][!$%£*@^]){3,}/)

    expect(password).to_not match(/([!$%£*@^][A-Z][a-z][0-9]){3,}/)
    expect(password).to_not match(/([!$%£*@^][A-Z][0-9][a-z]){3,}/)
    expect(password).to_not match(/([!$%£*@^][a-z][0-9][A-Z]){3,}/)
    expect(password).to_not match(/([!$%£*@^][a-z][A-Z][0-9]){3,}/)
    expect(password).to_not match(/([!$%£*@^][0-9][A-Z][a-z]){3,}/)
    expect(password).to_not match(/([!$%£*@^][0-9][a-z][A-Z]){3,}/)
  end

  context 'when \'uppercase\' is true' do
    it 'returns a password of only uppercase characters' do
      password = generate_password(15, lowercase: false, uppercase: true, number: false, special: false)
      expect(password).to match(/^[A-Z]+$/)
    end

    it 'should not repeat a character more than 3 times in a row' do
      password = generate_password(100, lowercase: false, uppercase: true, number: false, special: false)
      expect(password).to_not match(/(.)\1{3,}/)
    end

    it 'should generate a unique password on each call' do
      password_a = generate_password(20, lowercase: false, uppercase: true, number: false, special: false)
      password_b = generate_password(20, lowercase: false, uppercase: true, number: false, special: false)
      password_c = generate_password(20, lowercase: false, uppercase: true, number: false, special: false)
      password_d = generate_password(20, lowercase: false, uppercase: true, number: false, special: false)
      expect(password_a).to_not eq(password_b)
      expect(password_a).to_not eq(password_c)
      expect(password_a).to_not eq(password_d)
      expect(password_b).to_not eq(password_c)
      expect(password_b).to_not eq(password_d)
      expect(password_c).to_not eq(password_d)
    end
  end

  context 'when \'lowercase\' is true' do
    it 'returns a password of only lowercase characters' do
      password = generate_password(15, uppercase: false, lowercase: true, number: false, special: false)
      expect(password).to match(/^[a-z]+$/)
    end

    it 'should not repeat a character more than 3 times in a row' do
      password = generate_password(100, uppercase: false, lowercase: true, number: false, special: false)
      expect(password).to_not match(/(.)\1{3,}/)
    end

    it 'should generate a unique password on each call' do
      password_a = generate_password(20, uppercase: false, lowercase: true, number: false, special: false)
      password_b = generate_password(20, uppercase: false, lowercase: true, number: false, special: false)
      password_c = generate_password(20, uppercase: false, lowercase: true, number: false, special: false)
      password_d = generate_password(20, uppercase: false, lowercase: true, number: false, special: false)
      expect(password_a).to_not eq(password_b)
      expect(password_a).to_not eq(password_c)
      expect(password_a).to_not eq(password_d)
      expect(password_b).to_not eq(password_c)
      expect(password_b).to_not eq(password_d)
      expect(password_c).to_not eq(password_d)
    end
  end

  context 'when \'number\' is true' do
    it 'returns a password of only numeric characters' do
      password = generate_password(15, uppercase: false, lowercase: false, number: true, special: false)
      expect(password).to match(/^[0-9]+$/)
    end

    it 'should not repeat a character more than 3 times in a row' do
      password = generate_password(100, uppercase: false, lowercase: false, number: true, special: false)
      expect(password).to_not match(/(.)\1{3,}/)
    end

    it 'should generate a unique password on each call' do
      password_a = generate_password(20, uppercase: false, lowercase: false, number: true, special: false)
      password_b = generate_password(20, uppercase: false, lowercase: false, number: true, special: false)
      password_c = generate_password(20, uppercase: false, lowercase: false, number: true, special: false)
      password_d = generate_password(20, uppercase: false, lowercase: false, number: true, special: false)
      expect(password_a).to_not eq(password_b)
      expect(password_a).to_not eq(password_c)
      expect(password_a).to_not eq(password_d)
      expect(password_b).to_not eq(password_c)
      expect(password_b).to_not eq(password_d)
      expect(password_c).to_not eq(password_d)
    end
  end

  context 'when \'special\' is true' do
    it 'returns a password containing only special characters' do
      password = generate_password(15, uppercase: false, lowercase: false, number: false, special: true)
      expect(password).to match(/^[!$%&*@^]+$/)
    end

    it 'should not repeat a character more than 3 times in a row' do
      password = generate_password(100, uppercase: false, lowercase: false, number: false, special: true)
      expect(password).to_not match(/(.)\1{3,}/)
    end

    it 'should generate a unique password on each call' do
      password_a = generate_password(20, uppercase: false, lowercase: false, number: false, special: true)
      password_b = generate_password(20, uppercase: false, lowercase: false, number: false, special: true)
      password_c = generate_password(20, uppercase: false, lowercase: false, number: false, special: true)
      password_d = generate_password(20, uppercase: false, lowercase: false, number: false, special: true)
      expect(password_a).to_not eq(password_b)
      expect(password_a).to_not eq(password_c)
      expect(password_a).to_not eq(password_d)
      expect(password_b).to_not eq(password_c)
      expect(password_b).to_not eq(password_d)
      expect(password_c).to_not eq(password_d)
    end
  end

  context 'when \'uppercase\' and \'lowercase\' are true' do
    it 'returns a password containing only uppercase and lowercase characters' do
      password = generate_password(15, uppercase: true, lowercase: true, number: false, special: false)
      expect(password).to match(/^[a-zA-z]+$/)
    end
  end

  context 'when \'number\' and \'special\' are true' do
    it 'returns a password containing only numeric and special characters' do
      password = generate_password(15, uppercase: false, lowercase: false, number: true, special: true)
      expect(password).to match(/^[!$%&*@^0-9]+$/)
    end
  end
end
