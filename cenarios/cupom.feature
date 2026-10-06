# language: pt
Funcionalidade: Aplicação de cupom de desconto (VZS-142)
  Como cliente da Verzel Store
  Quero aplicar um cupom de desconto no carrinho
  Para pagar menos nas minhas compras

  Contexto:
    Dado que o carrinho tem 1 unidade do produto "P005 - Mochila Urbana 20L" (R$ 100,00)

  @CT01 @CA01
  Cenário: Aplicar o cupom BEMVINDO10
    Quando o cliente aplica o cupom "BEMVINDO10"
    Então o desconto exibido é de R$ 10,00
    E o total é de R$ 109,90

  @CT02 @CA02
  Esquema do Cenário: Código do cupom não diferencia maiúsculas e ignora espaços nas pontas
    Quando o cliente aplica o cupom "BEMVINDO10"
    Então o cupom é aplicado com desconto de R$ 10,00

    Exemplos:
      | BEMVINDO10     |
      | bemvindo10     |
      | BemVindo10     |
      |   BEMVINDO10   |

  @CT03 @CA03
  Cenário: Cupom inexistente
    Quando o cliente aplica o cupom "NAOEXISTE"
    Então a mensagem "Cupom inválido." é exibida
    E nenhum desconto é aplicado

  @CT04 @CA04
  Cenário: Cupom expirado
    Quando o cliente aplica o cupom "VERAO2026"
    Então a mensagem "Cupom expirado." é exibida
    E nenhum desconto é aplicado

  @CT05 @CA05
  Cenário: Apenas um cupom por vez
    Dado que o cupom "BEMVINDO10" está aplicado
    Quando o cliente tenta aplicar outro cupom sem remover o atual
    Então o segundo cupom não é aplicado
    E o desconto continua sendo o do cupom "BEMVINDO10"

  @CT06 @CA05
  Cenário: Trocar de cupom removendo o atual
    Dado que o cupom "BEMVINDO10" está aplicado
    Quando o cliente remove o cupom atual
    Então o desconto some e o total volta a R$ 119,90
    E o cliente consegue aplicar outro cupom
