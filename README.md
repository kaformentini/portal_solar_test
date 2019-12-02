# Portal Solar - Dev Test

## Teste para vagas de Desenvolvimento

### Deploy

https://mighty-harbor-04580.herokuapp.com/

#### Gems adicionadas

- RSpec
- Factory_bot_rails
- Gem Correios-cep v.0.7.1

#### O que foi feito
  - Testes feitos com RSpec e Factory_bot

  - Busca simples, que busca nos atributos "name" e "description";
  
  - Busca por recomendação, podendo ser filtrado por um ou mais atributos, e ordenado por uma ordem pré definida, sendo a principal por preço. 
    
    Caso seja filtrado por um único parametro, será exibido todos os produtos, ordenado pelo respectivo atributo, ou em casos como da "Palavra Chave" ou do "Tipo de Estrutura" por preço.
    
    A escolha dos produtos indicados se dá por um intervalo pré-estabelecido quando se trata de atributos com valores, que poderia realizado por uma função matemática ao em vez de pré-estabelecidos por uma pessoa.
    Existem ainda mais campos que poderiam ser adicionados como preco mínimo e máximo.

    Minha intencão era não simpismente promover um filtro nos produtos, mas poder indicar qual seria a melhor opcão para o cliente, filtrando e ordenando principalmente para conseguir os melhores resultados.

    apesar de estar funcionando, estou trabalhando para melhorar as recomendações, pois acho que não foi feita do melhor jeito possível.

  - Páginas dos produtos funcionando;

  - Calculo de frete já funcionando; Retorno do cep inserido, da cidade/estado do frete e valor;
    Em caso de CEP inválido, retorna mensagem de "CEP não encontrado"

  - Paginação na página principal funcionando;

  - Fiz muito pouco do front-end, ainda pretendo mexer nisso mais depois que terminar a parte do frete.

##### Mudanças
  - "header" mudado para application.htlm.erb afim de ser exibido todas as páginas;
  - Adicionado novos atributos no objeto PowerGenerators. Atibutos que poderiam ser bons para a filtragem. Não necessariamente precisariam existir.


#### Coisas que não consegui fazer
  - Na busca simples, só fazer a busca digitando o nome do produto se ele estiver em uppercase;

  - No teste "User sees your recommended products", não está verificando se está em ordem de menor preco para maior;

  - Por algum motivo, ao clicar em "pesquisa avançada" no deploy, não está funcionando.

  - Nos testes, ainda não consegui usar o método within do capybara, por isso o botão do "Recomendamos apra você" se encontra no lugar errado, apesar de também poder ser acessado através do "Pesquisa Avançada";

  - HTML está quebrado, e gostaria de rever isso;

#### WIP
  - Melhora das recomendações. branch: new_recommended_search
  - Paginação nos resultados de pesquisas;