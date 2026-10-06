# Testes exploratórios

Cada sessão segue o formato: **missão → o que foi feito → o que foi observado → bugs/dúvidas**.

## Sessão 1 – Campo de cupom
**Missão:** explorar entradas incomuns no campo de cupom.
Ideias: vazio; só espaços; espaços no meio ("BEM VINDO10"); caracteres especiais e acentos; texto muito longo; emojis; `<script>`; cupom colado com quebra de linha; Enter para aplicar; clicar várias vezes em "Aplicar" rapidamente.
- Feito: _ foi adicionado a entrada "BEM VINDO10" no campo Cupom de desconto.
- Observado: _foi retornado Cupom inválido.
- Bugs/dúvidas: _ 

## Sessão 2 – Fluxo do carrinho
**Missão:** explorar mudanças de estado do carrinho com cupom aplicado.
Ideias: aplicar cupom e depois remover produtos; aumentar/diminuir quantidade com cupom ativo; esvaziar o carrinho com cupom ativo.
- Feito: _aplicado o cupom BEMVINDO10 e depois acrescentado novos produtos.
- Observado: _o cupom se manteve e foi atualizado o valor conforme o Subtotal era atualizado.
- Bugs/dúvidas: _

## Sessão 3 – Valores e arredondamento
**Missão:** procurar divergências de cálculo entre diferentes combinações.
Ideias: combinar produtos com centavos (P001, P004, P006) em várias quantidades, com e sem cupom; conferir se o total exibido na tela é igual ao da API; observar valores perto de R$ 200,00.
- Feito: _foi adicionado produtos ao carrinho com valores terminados em 90 centavos.
- Observado: _os valores são somados de forma correta e o uso do cupom BEMVINDO10 sempre é exibido corratamente pulando duas casas decimais.
- Bugs/dúvidas: _

