require_relative './lib/RSA'

def start
  RSA.generated
  puts "Digite sua menssage:"
  menssage = gets

  encode = RSA.encode(menssage.chomp)
  decode = RSA.decode(encode)

  p "menssage_encode => #{encode}"
  p "decoded => #{decode}"
end

start