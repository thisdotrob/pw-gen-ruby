def generate_password(length, uppercase:, lowercase:, number:, special:)
  charSet = initialise_character_sets(uppercase, lowercase, number, special)

  password = ''

  while password.length < length
    char = nil

    until char do
      candidate = charSet[rand(charSet.length)]
      if password.length <= 2
        char = candidate
      else
        char = candidate unless password.chars[-2..-1].all? { |char| char === candidate }
      end
    end

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
