# language: pt
Funcionalidade: Contrato da API (VZS-142)

  @CT19
  Cenário: Listar produtos
    Quando GET /api/produtos
    Então o status é 200
    E a lista tem os 8 produtos documentados (P001 a P008) com os preços corretos

  @CT20
  Cenário: Consultar produto existente e inexistente
    Quando GET /api/produtos/P001 então o status é 200
    E GET /api/produtos/P999 retorna 404 com o código "PRODUTO_NAO_ENCONTRADO"

  @CT21
  Cenário: Rota inexistente
    Quando GET /api/rota-que-nao-existe
    Então o status é 404 com o código "ROTA_NAO_ENCONTRADA"

  @CT22
  Cenário: Método HTTP não permitido
    Quando GET /api/carrinho/calcular
    Então o status é 405 com o código "METODO_NAO_PERMITIDO"

  @CT23
  Cenário: Corpo que não é JSON válido
    Quando POST /api/carrinho/calcular com corpo " nao é json"
    Então o status é 400 com o código "JSON_INVALIDO"

  @CT24
  Esquema do Cenário: Lista de itens ausente ou vazia
    Quando POST /api/carrinho/calcular com itens "<itens>"
    Então o status é 422 com o código "ITENS_OBRIGATORIOS"

    Exemplos:
      | itens   |
      | ausente |
      | []      |

  @CT25
  Cenário: Item referencia produto inexistente
    Quando POST /api/carrinho/calcular com o produto "P999"
    Então o status é 422 com o código "PRODUTO_NAO_ENCONTRADO"

  @CT26
  Cenário: Cálculo com cupom inválido ou expirado não gera erro
    Quando POST /api/carrinho/calcular com o cupom "VERAO2026"
    Então o status é 200 e o desconto é 0
    E cupom.aplicado é false e cupom.mensagem explica o motivo

  @CT27
  Cenário: Pedido com cupom inexistente
    Quando POST /api/pedidos com o cupom "NAOEXISTE"
    Então o status é 422 com o código "CUPOM_INVALIDO"

  @CT28
  Cenário: Pedido com cupom expirado
    Quando POST /api/pedidos com o cupom "VERAO2026"
    Então o status é 422 com o código "CUPOM_EXPIRADO"

  @CT29
  Cenário: Item que não é objeto com produtoId e quantidade
    Quando POST /api/carrinho/calcular com itens ["P001"]
    Então o status é 422 com o código "ITEM_INVALIDO"

  @CT30
  Cenário: Cálculo e pedido retornam os mesmos valores
    Dado o mesmo carrinho e o mesmo cupom
    Quando POST /api/carrinho/calcular e POST /api/pedidos
    Então subtotal, desconto, frete e total são iguais nas duas respostas
