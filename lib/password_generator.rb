def generate_password(length, uppercase:, lowercase:, number:, special:)
  charSet = initialise_character_sets(uppercase, lowercase, number, special)

  password = ''

  while password.length < length
    index = rand(charSet.length)
    char = charSet[index]
    password += char
  end

  password
end

def initialise_character_sets(uppercase, lowercase, number, special)
  charSet = ''

  charSet << '0123456789' if number
  charSet << 'abcdefghijklmnopqrstuvwxyz' if lowercase
  charSet << 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' if uppercase
  charSet << '!$%&*@^' if special

  charSet
end
