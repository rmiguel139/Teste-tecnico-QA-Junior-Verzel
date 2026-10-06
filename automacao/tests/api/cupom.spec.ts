import { test, expect } from '@playwright/test';
import { calcular, P001, P002, P004, P005 } from './helpers';

test.describe('Cupom de desconto – CA01, CA02, CA08, CA09', () => {
  test('CT01 | BEMVINDO10 aplica 10% sobre o subtotal (exemplo da documentação)', async ({ request }) => {
    const res = await calcular(
      request,
      [
        { produtoId: P002, quantidade: 1 },
        { produtoId: P004, quantidade: 2 },
      ],
      'BEMVINDO10',
    );
    expect(res.status()).toBe(200);
    const body = await res.json();

    expect(body.subtotal).toBe(239.7);
    expect(body.desconto).toBe(23.97);
    expect(body.frete).toBe(0);
    expect(body.freteGratis).toBe(true);
    expect(body.total).toBe(215.73);
    expect(body.cupom.codigo).toBe('BEMVINDO10');
    expect(body.cupom.aplicado).toBe(true);
  });

  for (const codigo of ['bemvindo10', 'BemVindo10', '  BEMVINDO10  ']) {
    test(`CT02 | cupom "${codigo}" é aceito (sem diferenciar maiúsculas, ignorando espaços)`, async ({ request }) => {
      const res = await calcular(request, [{ produtoId: P005, quantidade: 1 }], codigo);
      expect(res.status()).toBe(200);
      const body = await res.json();

      expect(body.cupom.aplicado).toBe(true);
      expect(body.desconto).toBe(10);
      expect(body.total).toBe(109.9);
    });
  }

  test('CT08 | frete grátis usa o subtotal ANTES do desconto (CA08)', async ({ request }) => {
    // Subtotal 200,00 -> com cupom o valor dos produtos cai para 180,00,
    // mas o frete deve continuar grátis.
    const res = await calcular(request, [{ produtoId: P005, quantidade: 2 }], 'BEMVINDO10');
    const body = await res.json();

    expect(body.subtotal).toBe(200);
    expect(body.desconto).toBe(20);
    expect(body.frete).toBe(0);
    expect(body.freteGratis).toBe(true);
    expect(body.total).toBe(180);
  });

  test('CT09 | desconto do cupom não incide sobre o frete (CA09)', async ({ request }) => {
    const res = await calcular(request, [{ produtoId: P005, quantidade: 1 }], 'BEMVINDO10');
    const body = await res.json();

    expect(body.subtotal).toBe(100);
    expect(body.desconto).toBe(10); // 10% do subtotal, não de subtotal + frete
    expect(body.frete).toBe(19.9);
    expect(body.total).toBe(109.9);
  });

  test('CT26 | cupom expirado no /calcular responde 200, sem desconto e com mensagem', async ({ request }) => {
    const res = await calcular(request, [{ produtoId: P001, quantidade: 1 }], 'VERAO2026');
    expect(res.status()).toBe(200);
    const body = await res.json();

    expect(body.desconto).toBe(0);
    expect(body.cupom.aplicado).toBe(false);
    expect(body.cupom.mensagem).toBeTruthy();
  });
});
