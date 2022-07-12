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
    
    RSA::OPEN::Public.n=keys[:key_n] = <number>
    RSA::OPEN::Public.e=keys[:key_e] = <number>
    RSA.encode('oi')

    ## For decoding    
    RSA::OPEN::Private.n=keys[:key_n] = <number>
    RSA::OPEN::Private.d=keys[:key_d] = <number>
    RSA.decode(RSA.encode('oi'))
```


## Examples of implementation
Example folder. Intended for example using this gem

* Simple  
    Simplest way would be through ```RSA.generated```. That way you will have the keys created in the ```keys``` folder and you can use

* Open keys 

    You can use open keys, for those not generated through ```RSA.generated``` that way you can set externally.

# Development

## init
    make up

## run teste
    ruby test/all_test.rb

***

# To learn more about:  
* [🔒 RSA implementation algorithm [PT-BR🇧🇷]](https://github.com/Dayanfreitas/RSA/blob/master/doc/rsa_algorithm_pt_br.md) 
