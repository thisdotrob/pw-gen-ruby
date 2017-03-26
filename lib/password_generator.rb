def generate_password(length, uppercase:, lowercase:)
  char = if uppercase
           'A'
         else
           'a'
         end
  char * length
end
