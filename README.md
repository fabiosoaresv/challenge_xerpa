### Desafio Explorando Marte ([@xerpa](http://github.com/xerpa))

#### Escopo (resumo)
Criar um script que interprete uma sonda em um planalto em Marte, e que o mesmo receba dados ou um arquivo, e a partir destes dados a sonda irá se locomover nas posições norte, sul, leste, oeste, virar para esquerda ou direita e andar para frente.

#### Requisitos
`ruby 2.6.3`
`git`

#### Setup
```
git clone https://github.com/fabiosoaresv/challenge_xerpa
```

- Observação: antes de rodar o script verifique sua versão do ruby (`ruby -v`).
- Caso necessário instale diretamente a versão pelo gerenciador de pacotes em seu S.O ou via [rbenv](http://github.com/rbenv/rbenv) / [rvm](http://github.com/rvm/rvm)

#### Specs
Caso queira rodar os specs é necessário rodar `bundle install` antes.

- Rodando os specs:
`bundle exec rspec spec/change_coordinates_spec.rb`

- Exemplo:
```console
[ 8:18AM ]  [ fsoares@pyhooma:~/Documents/challenge_xerpa(main✗) ]
 $ bundle exec rspec spec/change_coordinates_spec.rb
Finished in 0.01137 seconds (files took 0.0893 seconds to load)
3 examples, 0 failures
```

#### Utilizando o script
##### Informando o arquivo (csv/txt)
Para utilizá-lo é necessário rodar o comando dentro da raiz do projeto:
`ruby lib/change_coordinates.rb lib/file_example.csv`

- Exemplo:
```console
[ 8:21AM ]  [ fsoares@pyhooma:~/Documents/projects/challenge_xerpa(main✔) ]
 $ ruby lib/change_coordinates.rb lib/file_example.csv

Result:
1 3 N
5 1 E
```

##### Informando diretamente os dados
Para utilizá-lo é necessário rodar o comando dentro da raiz do projeto e informar os dados dentro de aspas (simples/duplas):
`ruby lib/change_coordinates.rb '5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
'`

- Exemplo com aspas simples:
```console
[  8:25AM ]  [ fsoares@pyhooma:~/Documents/projects/challenge_xerpa(main✔) ]
 $ ruby lib/change_coordinates.rb '5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM'

Result:
1 3 N
5 1 E
```

- Exemplo com aspas duplas:
```console
[  8:25AM ]  [ fsoares@pyhooma:~/Documents/projects/challenge_xerpa(main✔) ]
 $ ruby lib/change_coordinates.rb "5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM"

Result:
1 3 N
5 1 E
```
