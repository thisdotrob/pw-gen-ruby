def generate_password(length, uppercase:, lowercase:, number:, special:)
  char_set = initialise_character_sets(uppercase, lowercase, number, special)

  password = ''

  password = append_random_char(password, char_set) until password.length == length

  password
end

def append_random_char(password, char_set)
  char = nil

  until char
    candidate = get_random_char(char_set)
    char = candidate unless would_be_3_chars_repeated(candidate, password)
  end

  password + char
end

def initialise_character_sets(uppercase, lowercase, number, special)
  char_set = ''

  char_set << '0123456789' if number
  char_set << 'abcdefghijklmnopqrstuvwxyz' if lowercase
  char_set << 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' if uppercase
  char_set << '!$%&*@^' if special

  char_set
end

def get_random_char(char_set)
  char_set[rand(char_set.length)]
end

def would_be_3_chars_repeated(candidate, password)
  password.length >= 2 && same_as_last_two_chars(candidate, password)
end

def same_as_last_two_chars(candidate, password)
  password.chars[-2..-1].all? { |char| char == candidate }
end
