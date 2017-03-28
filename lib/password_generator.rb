def generate_password(length, uppercase:, lowercase:, number:, special:)
  queue = initialise_character_sets(uppercase, lowercase, number, special)

  password = ''

  while password.length < length
    charSet = queue.shift
    index = rand(charSet.length)
    char = charSet[index]
    password += char
    queue << charSet
  end

  password
end

def initialise_character_sets(uppercase, lowercase, number, special)
  queue = []

  queue << 'abcdefghijklmnopqrstuvwxyz' if lowercase
  queue << 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' if uppercase
  queue << '0123456789' if number
  queue << '!$%&*@^' if special

  queue
end
