


# Development

## init
    make up

## run teste
    ruby test/all_test.rb

## User keys open
```ruby
    ## For encoding
    
    RSA::OPEN::Public.n=keys[:key_n] = <number>
    RSA::OPEN::Public.e=keys[:key_e] = <number>
    RSA.encode('oi')

    ## For decoding    
    RSA::OPEN::Private.n=keys[:key_n] = <number>
    RSA::OPEN::Private.d=keys[:key_d] = <number>
    RSA.decode(RSA.encode('oi'))
```
