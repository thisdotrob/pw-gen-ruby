def generate_password(length, uppercase:, lowercase:, number:, special:)
  charSet = initialise_character_sets(uppercase, lowercase, number, special)

  password = ''

  password = append_random_char(password, charSet) until (password.length == length)

  password
end

def append_random_char(password, charSet)
  char = nil

  until char do
    candidate = get_random_char(charSet)
    char = candidate unless would_be_3_chars_repeated(candidate, password)
  end

  password += char
end

def initialise_character_sets(uppercase, lowercase, number, special)
  charSet = ''

  charSet << '0123456789' if number
  charSet << 'abcdefghijklmnopqrstuvwxyz' if lowercase
  charSet << 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' if uppercase
  charSet << '!$%&*@^' if special

  charSet
end

def get_random_char(charSet)
  charSet[rand(charSet.length)]
end

def would_be_3_chars_repeated(candidate, password)
  password.length >= 2 && same_as_last_two_chars(candidate, password)
end

def same_as_last_two_chars(candidate, password)
  password.chars[-2..-1].all? { |char| char === candidate }
end
