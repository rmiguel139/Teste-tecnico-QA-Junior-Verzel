# language: pt
Funcionalidade: Limite de quantidade e arredondamento (VZS-142)

  @CT11 @CA10
  Cenário: Interface não permite mais de 5 unidades do mesmo produto
    Dado que o carrinho tem 5 unidades do produto "P001"
    Quando o cliente tenta aumentar a quantidade
    Então a quantidade continua sendo 5

  @CT12 @CA10
  Esquema do Cenário: Limites de quantidade na API
    Quando a quantidade <qtd> do produto "P001" é enviada para a API
    Então o resultado é "<resultado>"

    Exemplos:
      | qtd | resultado                      |
      | 1   | aceito (200)                   |
      | 5   | aceito (200)                   |
      | 6   | 422 QUANTIDADE_MAXIMA_EXCEDIDA |
      | 0   | 422 QUANTIDADE_INVALIDA        |

  @CT14 @CA11
  Cenário: Valores arredondados em 2 casas decimais
    Dado que o carrinho tem 3 unidades do produto "P001" (R$ 59,90 cada)
    Quando o cliente aplica o cupom "BEMVINDO10"
    Então o subtotal é de R$ 179,70
    E o desconto é de R$ 17,97
    E o total é de R$ 181,63
    E nenhum valor tem mais de 2 casas decimais
