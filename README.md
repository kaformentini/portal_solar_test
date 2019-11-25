# Portal Solar - Dev Test

## Teste para vagas de Desenvolvimento

### Deploy

https://mysterious-cliffs-69913.herokuapp.com
https://mighty-harbor-04580.herokuapp.com/

#### Gems adicionadas

- RSpec
- Factory_bot_rails

#### O que foi feito
  - Busca simpes, que busca nos atributos name e description
  - Busca por recomendacão, podendo ser filtrado por um ou mais atributos, e ordenado por uma     ordem pré definida, sendo a principal por preco. 
    Caso seja filtrado por um único parametro, será exibido todos os produtos, ordenado pelo respectivo atributo, ou em casos como da "Palavra Chave" ou do "Tipo de Estrutura" por preco.
    A escolha dos produtos se dá por um intervalo pré-estabelecido quando se trata de valores, que poderia ser calculados ao em vez de pré-estabelecidos.
    Existem ainda mais campos que poderiam ser adicionados como preco mínimo e máximo.

    Minha intencão era não simpismente promover um filtro nos produtos, mas poder indicar qual seria a melhor opcão para o cliente, filtrando e ordenando os produtos.


##### Mudanças
  - "header" mudado para application.htlm.erb
  - Adicionado novos atributos no objeto PowerGenerators


#### Coisas que não consegui fazer
  - Na busca simples, só fazer a busca digitando o nome do produto se ele estiver em uppercase/
  - No teste "User sees your recommended products", não está verificando se está em ordem de menor preco para maior;
