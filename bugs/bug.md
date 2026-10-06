# BUG-frete – Erro ao calcular frete 

## Descrição
Ao selecionar produtos onde o subtotal é igual a R$ 200,00 não é aplicado o frete grátis.

## Passos para reproduzir
1. entrar na página de produtos da Verzel Store
2. selecionar produtos onde o subtotal é igual a R$ 200,00
3. observamos que o frete está R$ 19,90 e retorna a mensagem 'Faltam R$ 0,00 para o frete grátis.'.

## Resultado esperado

Deve ser retornado frete grátis.

## Resultado obtido

Faltam R$ 0,00 para o frete grátis.

## Evidências
- `evidencias/BUG-frete.png`

## Observações
Sempre, impacto crítico ao cliente, verifica se o valor total é > R$ 200,00 e não >= R$ 200,00.
