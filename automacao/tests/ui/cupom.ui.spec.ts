import { test, expect } from '@playwright/test';

/**
 * ESQUELETO de teste de UI (CT01).
 *
 * Os seletores abaixo são hipóteses (getByRole / getByLabel / getByText).
 * Abro a loja, inspeciono os elementos reais (ou use `npx playwright codegen <URL>`)
 * e ajusto antes de remover o `test.fixme`.
 */
test.fixme('CT01 | aplicar BEMVINDO10 no carrinho exibe desconto e total', async ({ page }) => {
  await page.goto('/');

  // 1. Adicionar a Mochila Urbana 20L (P005 – R$ 100,00) ao carrinho
  // TODO: ajustar seletores
  await page
    .getByRole('article')
    .filter({ hasText: 'Mochila Urbana 20L' })
    .getByRole('button', { name: /adicionar/i })
    .click();

  // 2. Abrir o carrinho
  // TODO: ajustar seletor
  await page.getByRole('button', { name: /carrinho/i }).click();

  // 3. Aplicar o cupom
  // TODO: ajustar seletores
  await page.getByLabel(/cupom/i).fill('BEMVINDO10');
  await page.getByRole('button', { name: /aplicar/i }).click();

  // 4. Conferir valores (a interface apenas exibe o resultado da API)
  await expect(page.getByText(/R\$\s?10,00/)).toBeVisible();   // desconto
  await expect(page.getByText(/R\$\s?109,90/)).toBeVisible();  // total
});
