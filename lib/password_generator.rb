def generate_password(length, uppercase:, lowercase:, number:)
  char = if uppercase
           'A'
         elsif lowercase
           'a'
         else
           '0'
         end
  char * length
end
