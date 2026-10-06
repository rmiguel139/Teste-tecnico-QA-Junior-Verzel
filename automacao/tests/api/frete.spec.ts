import { test, expect } from '@playwright/test';
import { calcular, P001, P002, P005, P007 } from './helpers';

test.describe('Frete grátis – CA06, CA07', () => {
  const casos = [
    { nome: 'P005 x1 (R$ 100,00)', itens: [{ produtoId: P005, quantidade: 1 }], subtotal: 100, frete: 19.9, faltante: 100, total: 119.9 },
    { nome: 'P001 + P002 (R$ 199,80), logo abaixo do limite', itens: [{ produtoId: P001, quantidade: 1 }, { produtoId: P002, quantidade: 1 }], subtotal: 199.8, frete: 19.9, faltante: 0.2, total: 219.7 },
    { nome: 'P005 x2 (R$ 200,00), exatamente no limite', itens: [{ produtoId: P005, quantidade: 2 }], subtotal: 200, frete: 0, faltante: 0, total: 200 },
    { nome: 'P007 x1 (R$ 229,90), acima do limite', itens: [{ produtoId: P007, quantidade: 1 }], subtotal: 229.9, frete: 0, faltante: 0, total: 229.9 },
  ];

  for (const c of casos) {
    test(`CT07 | ${c.nome}`, async ({ request }) => {
      const res = await calcular(request, c.itens);
      expect(res.status()).toBe(200);
      const body = await res.json();

      expect(body.subtotal).toBe(c.subtotal);
      expect(body.desconto).toBe(0);
      expect(body.frete).toBe(c.frete);
      expect(body.freteGratis).toBe(c.frete === 0);
      expect(body.valorFaltanteFreteGratis).toBe(c.faltante);
      expect(body.total).toBe(c.total);
    });
  }
});
