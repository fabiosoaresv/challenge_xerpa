### Desafio Explorando Marte ([@xerpa](http://github.com/xerpa))

#### Escopo (resumo)
Criar um script que interprete uma sonda em um planalto em Marte, e que o mesmo receba dados ou um arquivo, e a partir destes dados a sonda irá se locomover nas posições norte, sul, leste, oeste, virar para esquerda ou direita e andar para frente.

#### Solução aplicada
Optei em focar no escopo do desafio em interpretar uma entrada, processar e devolver a saída, preferi deixar tudo em uma única classe já que haveria apenas esses processamentos de dados, e deixar os métodos o mais claro possível para ter uma compreensão fácil do processamento e cada ação para chegar ao resultado. 

Deixando então uma leitura de código centralizada e simples para o problema, sem segmentar em outras classes, etc.

Então resumidamente o funcionamento é:
- Um método principal (`run`), que processa a entrada de dados ou um aquivo (txt/csv), e caso esteja de acordo dispara a ação de execução do arquivo/dados (`execute_file_or_data`).
- Os métodos privados, onde processa cada etapa e teremos:
```
0. Inicialização da classe com a devida validação dos parâmetros.
1. A leitura dos dados e a devida estruturação dos mesmos. (read_data)
2. A inicialização do tamanho planalto. (set_upland)
3. O agrupamento de todas as naves. (group_space_probes)
4. A atualização da posição de cada nave com as coordenadas/direção/movimentação do input. (update_coordinate, turn_left, turn_right, go_ahead)
5. A validação da posição final  da nave considerando o tamanho do planalto. (final_position_is_invalid)
6. Um helper simples.
7. E no final do script, a inicialização da classe com os parâmetros e a exibição do resultado final da posição da nave.
```
Fiz também os specs para validar se tudo o que está sendo dito acima estava funcional. :) 

#### Requisitos
`ruby 2.6.3`<br>
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
[  1:28PM ]  [ fsoares@pyhooma:~/Documents/projects/xerpa_teste(master✗) ]
 $ bundle exec rspec spec/change_coordinates_spec.rb

Result:
1 3 N
5 1 E
.1 3 N
5 1 E
..Invalid params (data or file)
.Invalid params (data or file)
.

Finished in 0.00753 seconds (files took 0.07235 seconds to load)
5 examples, 0 failures

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

- Exemplo de como utilizar o helper
```console
[  1:28PM ]  [ fsoares@pyhooma:~/Documents/projects/xerpa_teste(master✗) ]
 $ ruby lib/change_coordinates.rb --help

      ===================== CHANGE COORDINATES SPACE PROBES =========================
      | To run script you need to set a data of upland, actual position and commands |
      | Example:                                                                     |
      | ruby change_coordinate.rb "                                                  |
      | 5 5                                                                          |
      | 1 2 N                                                                        |
      | LMLMLMLMM                                                                    |
      | 3 3 E                                                                        |
      | MMRMMRMRRM"                                                                  |
      |                                                                              |
      | Note 1: You can use a file with extension csv or txt to run. Example:        |
      | ruby change_coordinate.rb file.csv                                           |
      | Or...                                                                        |
      | ruby change_coordinate.rb file.txt                                           |
      |                                                                              |
      | Note 2: The file net to be exactly like first example.                       |
      |                                                                              |
      | @author: fabiosoaresv                                                        |
      | @email: fabiosoares@outlook.com.br                                           |
      ================================================================================
```
