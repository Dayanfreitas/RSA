require_relative '../../lib/rsa'
require_relative './file_key_private'
require_relative './file_key_public'

file_private = FileKeyPrivate.new('./private.txt')
file_public = FileKeyPublic.new('./public.txt')
file_private_read = file_private.read 
file_public_read = file_public.read 

RSA::OPEN::Public.n=file_public_read[:key_n]
RSA::OPEN::Public.e=file_public_read[:key_e]

p RSA.encode("Hello my friend")
# => [3219751504568804899, 1023997966735666385, 191948015089896431]

RSA::OPEN::Private.n=file_private_read[:key_n]
RSA::OPEN::Private.d=file_private_read[:key_d]

p RSA.decode(RSA.encode("Hello my friend"))
# => Hello my friend
