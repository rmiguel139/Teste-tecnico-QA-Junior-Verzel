# Ambiguidades e interpretações adotadas

Pontos em que a documentação não é totalmente clara, a interpretação adotada nos testes e o resultado observado.

| # | Ponto ambíguo | Interpretação adotada | Resultado observado |
|---|---|---|---|
| 1 | Cupom vazio ou só com espaços: é "sem cupom" ou "cupom inválido"? | Tratado como "sem cupom" (nenhum desconto, sem erro) | _ |
| 2 | Cupom enviado na API como `null`, número ou lista | Esperado ser tratado como sem cupom ou como cupom inválido, sem erro 500 | _ |
| 3 | "Apenas um cupom por vez" (CA05): como a interface impede dois cupons? | Esperado bloquear a aplicação de um segundo cupom até remover o atual | _ |
| 4 | Valor faltante para frete grátis quando há cupom | Interpretado pelo CA08: usa o subtotal antes do desconto | _ |
