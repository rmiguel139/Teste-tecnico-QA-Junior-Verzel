# language: pt
Funcionalidade: Frete grátis e frete fixo (VZS-142)
  Como cliente da Verzel Store
  Quero ganhar frete grátis em compras maiores
  Para pagar menos nas minhas compras

  @CT07 @CA06 @CA07
  Esquema do Cenário: Limite do frete grátis (a partir de R$ 200,00, inclusive)
    Dado que o subtotal dos produtos é de R$ <subtotal>
    Quando o carrinho é calculado sem cupom
    Então o frete é de R$ <frete>
    E o valor faltante para o frete grátis é de R$ <faltante>

    Exemplos:
      | subtotal | frete | faltante | observacao                         |
      | 100,00   | 19,90 | 100,00   | P005 x1                            |
      | 199,80   | 19,90 | 0,20     | P001 + P002, logo abaixo do limite |
      | 200,00   | 0,00  | 0,00     | P005 x2, exatamente no limite      |
      | 229,90   | 0,00  | 0,00     | P007 x1, acima do limite           |

  @CT08 @CA08
  Cenário: Frete grátis considera o subtotal antes do desconto
    Dado que o carrinho tem 2 unidades do produto "P005" (subtotal R$ 200,00)
    Quando o cliente aplica o cupom "BEMVINDO10"
    Então o desconto é de R$ 20,00
    E o frete é de R$ 0,00
    E o total é de R$ 180,00

  @CT09 @CA09
  Cenário: Desconto do cupom não incide sobre o frete
    Dado que o carrinho tem 1 unidade do produto "P005" (subtotal R$ 100,00)
    Quando o cliente aplica o cupom "BEMVINDO10"
    Então o desconto é de R$ 10,00
    E o frete é de R$ 19,90
    E o total é de R$ 109,90

  @CT10 @CA07
  Cenário: Carrinho informa quanto falta para o frete grátis
    Dado que o carrinho tem 1 unidade do produto "P005" (subtotal R$ 100,00)
    Então o carrinho informa que faltam R$ 100,00 para o frete grátis

  @CT10b @CA07 @CA08
  Cenário: Cupom não altera o valor faltante para o frete grátis
    Dado que o carrinho tem 1 unidade do produto "P005" (subtotal R$ 100,00)
    Quando o cliente aplica o cupom "BEMVINDO10"
    Então o carrinho continua informando que faltam R$ 100,00 para o frete grátis
