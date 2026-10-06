# Execução dos testes

**Ambiente:** https://verzel-store.qa-test-verzel-store.workers.dev/ (versão 2.3.0)
**Executor:** Miguel Menezes Evangelista
**Data/navegador:**  06/10/2026, Chrome 130

Legenda de status: ✅ Passou · ❌ Falhou · ⚠️ Passou com ressalva · ⏭️ Não executado · ⬜ Pendente

Índice:
| ID | Cenário | Critério | Tipo | Resultado esperado (resumo) | Resultado obtido | Status | Evidência / Bug |

| CT01 | Aplicar BEMVINDO10 | CA01 | UI + API | desconto 10,00; total 109,90 | | ✅ | |
| CT02 | Cupom sem diferenciar maiúsculas e com espaços | CA02 | UI + API | desconto 10,00 em todas as variações | | ✅ | |
| CT03 | Cupom inexistente | CA03 | UI | "Cupom inválido." e sem desconto | | ✅ | |
| CT04 | Cupom expirado (VERAO2026) | CA04 | UI | "Cupom expirado." e sem desconto | | ✅ | |
| CT05 | Apenas um cupom por vez | CA05 | UI | segundo cupom não aplica | | ✅ | |
| CT06 | Trocar cupom removendo o atual | CA05 | UI | remove, total volta a 119,90, aplica outro | | ✅ | |
| CT07 | Limite do frete grátis (100 / 199,80 / 200 / 229,90) | CA06, CA07 | UI + API | frete 19,90 até 199,80; 0 a partir de 200 | | ❌ | se o valor subtotal é 200 o frete continua 19,90|
| CT08 | Frete grátis usa subtotal antes do desconto | CA08 | UI + API | P005 x2 + cupom: frete 0; total 180,00 | | ❌ |o valor do frete fica 19,90; total R$ 199,90|
| CT09 | Desconto não incide sobre o frete | CA09 | UI + API | P005 x1 + cupom: total 109,90 | | ✅ | |
| CT10 | Mensagem de faltante para frete grátis | CA07 | UI | "faltam R$ 100,00" | | ✅ | |
| CT10b | Cupom não altera o faltante | CA07, CA08 | UI + API | faltante continua 100,00 | | ✅ | |
| CT11 | Limite de 5 unidades na interface | CA10 | UI | não passa de 5 | | ✅ | |
| CT12 | Limites de quantidade na API (1, 5, 6, 0, -1, 1.5, "2") | CA10 | API | 6 → QUANTIDADE_MAXIMA_EXCEDIDA; demais inválidos → QUANTIDADE_INVALIDA | | ✅ | |
| CT14 | Arredondamento (P001 x3 + cupom) | CA11 | UI + API | subtotal 179,70; desconto 17,97; total 181,63 | | ✅ | |
| CT15 | Nome e sobrenome | regra existente | UI + API | "Miguel" é rejeitado | | ✅ | |
| CT16 | Formato do e-mail | regra existente | UI + API | formatos inválidos rejeitados | | ✅ | |
| CT17 | CEP com 8 dígitos (com/sem hífen) | regra existente | UI + API | 7 ou 9 dígitos rejeitados | | ✅ | |
| CT18 | Pedido válido: número VZ-000000 e CEP sem hífen | — | API | 201 | | ✅ | |
| CT19 | GET /api/produtos | — | API | 200 com 8 produtos e preços corretos | | ✅ | |
| CT20 | GET /api/produtos/{id} (existente e inexistente) | — | API | 200 / 404 PRODUTO_NAO_ENCONTRADO | | ✅ | |
| CT21 | Rota inexistente | — | API | 404 ROTA_NAO_ENCONTRADA | | ✅ | |
| CT22 | Método não permitido | — | API | 405 METODO_NAO_PERMITIDO | | ✅ | |
| CT23 | JSON inválido | — | API | 400 JSON_INVALIDO | | ✅ | |
| CT24 | Itens ausentes ou vazios | — | API | 422 ITENS_OBRIGATORIOS | | ✅ | |
| CT25 | Produto inexistente no item | — | API | 422 PRODUTO_NAO_ENCONTRADO | | ✅ | |
| CT26 | /calcular com cupom expirado/inválido | CA03, CA04 | API | 200, sem desconto, mensagem em cupom.mensagem | | ✅ | |
| CT27 | /pedidos com cupom inexistente | CA03 | API | 422 CUPOM_INVALIDO | | ✅ | |
| CT28 | /pedidos com cupom expirado | CA04 | API | 422 CUPOM_EXPIRADO | | ✅ | |
| CT29 | Item inválido (não é objeto) | — | API | 422 ITEM_INVALIDO | | ✅ | |
| CT30 | Consistência entre /calcular e /pedidos | CA11 | API | mesmos valores | | ✅ | |

## Resumo da execução (preencher no final)

- Total de cenários: 31
- Passou: _
- Falhou: _
- Bugs reportados: _
- Observações gerais: _

## Cenários automatizados

Os cenários CT01, CT02, CT07, CT08, CT09, CT12, CT14, CT27 e CT28 têm cobertura automatizada em `automacao/tests/api/`.(`npm test`).
