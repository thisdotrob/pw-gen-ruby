def generate_password(length, uppercase:, lowercase:, number:, special:)
  queue = initialise_character_sets(uppercase, lowercase, number, special)

  password = ''

  while password.length < length
    char = queue.shift
    password += char
    queue << char
  end

  password
end

def initialise_character_sets(uppercase, lowercase, number, special)
  queue = []

  queue << 'A' if uppercase
  queue << 'a' if lowercase
  queue << '0' if number
  queue << '!' if special\

  queue
end
