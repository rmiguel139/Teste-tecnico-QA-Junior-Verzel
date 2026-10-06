# language: pt
Funcionalidade: Dados do cliente no pedido (regras que já existiam)

  Contexto:
    Dado que o carrinho tem 1 unidade do produto "P005"

  @CT15
  Esquema do Cenário: Nome precisa ter nome e sobrenome
    Quando o pedido é confirmado com o nome "<nome>"
    Então o resultado é "<resultado>"

    Exemplos:
      | nome          | resultado                 |
      | Miguel Menezes   | pedido aceito             |
      | Miguel         | erro no campo nome        |
      |               | erro no campo nome        |
      | Miguel   Menezes | (registrar comportamento) |

  @CT16
  Esquema do Cenário: Formato do e-mail
    Quando o pedido é confirmado com o e-mail "<email>"
    Então o resultado é "<resultado>"

    Exemplos:
      | email             | resultado           |
      | Miguel@exemplo.com | pedido aceito       |
      | Miguel@exemplo     | erro no campo email |
      | Miguelexemplo.com  | erro no campo email |
      | @exemplo.com      | erro no campo email |

  @CT17
  Esquema do Cenário: CEP com 8 dígitos, com ou sem hífen
    Quando o pedido é confirmado com o CEP "<cep>"
    Então o resultado é "<resultado>"

    Exemplos:
      | cep       | resultado         |
      | 01310-100 | pedido aceito     |
      | 01310100  | pedido aceito     |
      | 0131010   | erro no campo cep |
      | 013101000 | erro no campo cep |
      | 0131A-100 | erro no campo cep |

  @CT18
  Cenário: Pedido válido gera número no formato VZ-000000
    Quando o pedido é confirmado com dados válidos
    Então o status é 201
    E o número do pedido segue o formato "VZ-" seguido de 6 dígitos
    E o CEP é devolvido sem hífen
