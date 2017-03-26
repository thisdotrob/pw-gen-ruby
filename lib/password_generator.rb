def generate_password(length, uppercase:, lowercase:, number:, special:)
  char = if uppercase
           'A'
         elsif lowercase
           'a'
         elsif number
           '0'
         else
           '!'
         end
  char * length
end
