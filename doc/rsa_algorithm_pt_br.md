# Criptografia RSA

## Criptografia RSA

Antes de partimos para direto para o que é RSA e algoritmo que ele implementa, é importante entender alguns conceitos matemático que nos auxiliar na resolução.

### Números primos

Número primo é qualquer número que seja divisível somente
por 1 e por ele mesmo. Por exemplo, 17,11,37,41

### Coprimos

Os números coprimos ou com também conhecido como números primos entre sim, são aqueles que o 1 é o único divisor comum entre os dois.

Exemplo:

1) 2 e 6 são primos entre si ?

$$
Divisores(2)=\{1,2\} \\
Divisores(6)=\{1,2,3,6\} \\
Divisorescomuns(2,6)= \{1,2\}
$$

Dois e Seis **não** são primos entre si, pois tem como comuns 2 divisores.

2) 3 e 4 são primos entre si ?

$$
Divisores(3)=\{1,3\} \\
Divisores(4)=\{1,2,4\} \\
Divisorescomuns(3,4)= \{1\}
$$

Já os números três e quatro são primos entre sim. Pois, o tem em comum apenas o divisor 1  

**RSA Conceito e passo a passo de implementação**

RSA é um acrônimo para os três professores, Rivest, Shamir e Adleman, do *Massachusetts Institute of Technology* (**MIT**). O RSA foi o primeiro algoritmo de criptografia assimétrica amplamente disponibilizado ao público. Se tornou popular em transmissão de dados segura devido tamanho da sua chave *e*. De modo geral o RSA envolve um par de chaves, uma chave pública que pode ser conhecida por todos e uma chave privada que deve ser mantida em sigilo. Toda mensagem cifrada usando uma chave pública só pode ser decifrada usando a respectiva chave privada. 

## Passo a passo:

- Definição de *P* e *Q*
    
    Precisamos encontrar dois parâmetros RSA. Chamamos de P e Q.
    
    Esses números precisam ser necessariamente
    primos. Em situações reais, esses números são astronômicos (algo no mínimo da ordem de 10¹⁰⁰)
    
- *N* através do produto de *p* e *q*
    
    Depois de determinamos  os valores para p e q faremos o produto desses dois números, que resultará em N.
    
    $$
    N=pq
    $$
    
- Função totiente de Euler
    
    Agora, vamos determinar a chamada função totiente em n, que
    não é nada mais que:
    
    $$
    \phi(𝑛) = (𝑝 − 1) \cdot (𝑞 − 1)
    $$
    
- Escolha de E
    
    1> 𝑒 > 𝜑(𝑛) e 𝑑(𝑒) 𝑑(𝜑𝑛)
    
    Ou seja:
    
    - Que esteja entre 1 e o valor que encontramos anteriormente
    - sejam coprimos
- Encontrar de D
    
    Depois, precisamos encontrar um número d que satisfaça:
    𝑑 ∗ 𝑒 ≡ 1 mod(𝜑𝑛)
    

## P e Q

- Chaves privadas
- Não podem ser divulgadas

## N

- Chamaremos *N*  de chave publica
- Pode ser divulgada para qualquer pessoa que queria criptografar e lhe enviar
uma mensagem

Depois de gerados esses todos os valores acima, teremos :
Chaves públicas:

- n
- e

Chaves privadas: 

- p
- q
- d

É só depois de ter esses 5 valores que realizamos a codificação e decodificação da nossa mensagem.

# Codificar

Para codificação temos a seguinte formula onde:

C: Deve ser o retorno codificado 

M: Bloco da minha mensagem

e: Número de e que foi calculado 

n: resultado do produto de $n = p\cdot q$

C recebe M elevado a e modulo de N

$$
C= M^e mod(n)
$$

# Decodificar

Para codificação temos a seguinte formula onde:

C: Bloco codificado

d: Chave encontrada

M: Deve ser o retorno decodificado 

*M* recebe *C* elevado a potência de *d* modulo de n

$$
M =C^d mod(n)
$$

**Referências bibliográficas**

**Criptografia - Criptografia RSA**
. Disponível em: <https://www.youtube.com/watch?v=GAR1Ur_2IGk>. Acesso em: 26 jun. 2022.

WIKIPEDIA CONTRIBUTORS. **RSA (cryptosystem)**. Disponível em: <https://en.wikipedia.org/wiki/RSA_(cryptosystem)>.

**Números primos ente si**. Disponível em: <https://www.youtube.com/watch?v=oWJ2E_Opgak>. Acesso em: 26 jun. 2022.

‌