# Teste técnico QA Júnior – Verzel Store (VZS-142)

Validação da entrega **VZS-142 – Cupom de desconto e frete grátis** (versão 2.3.0) da Verzel Store.

**Autor:** Miguel Menezes Evangelista

- Loja: https://verzel-store.qa-test-verzel-store.workers.dev/
- Documentação da entrega: https://verzel-store.qa-test-verzel-store.workers.dev/documentacao
- API: https://verzel-store.qa-test-verzel-store.workers.dev/api

## Onde encontrar cada entrega

| Entrega pedida | Onde está |
|---|---|
| Cenários de teste (Gherkin) | [`cenarios/`](./cenarios) – um arquivo `.feature` por tema, cada cenário com tag `@CTxx` |
| Execução dos testes (manuais e exploratórios) com resultado | [`execucao/execucao-testes.md`](./execucao/execucao-testes.md) e [`execucao/testes-exploratorios.md`](./execucao/testes-exploratorios.md) |
| Report de bugs | [`bugs/`](./bugs) – um arquivo por bug (`BUG-001.md`...) e o índice em [`bugs/README.md`](./bugs/README.md) |
| Documento de evidências | [`evidencias/README.md`](./evidencias/README.md) (índice) e os arquivos da pasta, nomeados por cenário/bug |
| Automação com Playwright (3 cenários) | [`automacao/`](./automacao) |
| Interpretações de ambiguidades | [`docs/ambiguidades.md`](./docs/ambiguidades.md) |
| Uso de IA | [`docs/uso-de-ia.md`](./docs/uso-de-ia.md) |

## Estrutura

```
cenarios/     cenários em Gherkin (pt)
execucao/     resultado de cada cenário + sessões exploratórias
bugs/         reports de bugs
evidencias/   prints, vídeos e respostas da API
docs/         ambiguidades e uso de IA
automacao/    projeto Playwright (API + UI)
```

## Como rodar a automação

Pré-requisito: Node.js 18 ou superior.

```bash
cd automacao
npm install
npx playwright install chromium
npm test                # roda tudo
npm run test:api        # só os testes de API
npm run report          # abre o relatório HTML
```

Para apontar para outro ambiente: `BASE_URL=https://... npm test`.

### Cenários automatizados

| Teste | Cenário | Critério |
|---|---|---|
| `tests/api/cupom.spec.ts` | CT01, CT02, CT08, CT09 – cupom e cálculo | CA01, CA02, CA08, CA09 |
| `tests/api/frete.spec.ts` | CT07 – limite de R$ 200,00 | CA06, CA07 |
| `tests/api/arredondamento.spec.ts` | CT14 – arredondamento | CA11 |
| `tests/ui/cupom.ui.spec.ts` | Esqueleto de UI (seletores a ajustar) | CA01 |

