![example workflow](https://github.com/Dayanfreitas/RSA/actions/workflows/main.yml/badge.svg)

<hr/>

# RSA
Simple implementation gem of the RSA algorithm. Just academic reasons.

## Key generation private and public
```bash
# key generation
RSA.generated 
```
## Encode
```bash
# encode
RSA.encode('oi') 
```
## Decode
```bash
# decode
RSA.decode(RSA.encode('oi')) 
```

## User keys open
```ruby
    ## For encoding
    
    RSA::OPEN::Public.n= <number>
    RSA::OPEN::Public.e= <number>
    RSA.encode('oi')

    ## For decoding    
    RSA::OPEN::Private.n = <number>
    RSA::OPEN::Private.d = <number>
    RSA.decode(RSA.encode('oi'))
```
# Development

## init
    make up

## run teste
    ruby test/all_test.rb

<hr/>

# To learn more about:  
* [🔒 RSA implementation algorithm [PT-BR🇧🇷]](https://github.com/Dayanfreitas/RSA/blob/master/doc/rsa_algorithm_pt_br.md) 
