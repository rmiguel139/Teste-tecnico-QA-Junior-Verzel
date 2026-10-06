import { test, expect } from '@playwright/test';
import { calcular, P001 } from './helpers';

/** Retorna true se o número tem no máximo 2 casas decimais. */
const temNoMaximoDuasCasas = (n: number) => Math.abs(n * 100 - Math.round(n * 100)) < 1e-9 && String(n).replace(/^-?\d+\.?/, '').length <= 2;

test.describe('Arredondamento em 2 casas decimais – CA11', () => {
  test('CT14 | P001 x3 com BEMVINDO10 não gera erro de ponto flutuante', async ({ request }) => {
    // 59,90 x 3 = 179,70 (em ponto flutuante: 179.70000000000002)
    const res = await calcular(request, [{ produtoId: P001, quantidade: 3 }], 'BEMVINDO10');
    expect(res.status()).toBe(200);
    const body = await res.json();

    expect(body.subtotal).toBe(179.7);
    expect(body.desconto).toBe(17.97);
    expect(body.frete).toBe(19.9);
    expect(body.total).toBe(181.63);

    for (const campo of ['subtotal', 'desconto', 'frete', 'total', 'valorFaltanteFreteGratis']) {
      expect(temNoMaximoDuasCasas(body[campo]), `${campo} = ${body[campo]}`).toBe(true);
    }
    expect(temNoMaximoDuasCasas(body.itens[0].total), `itens[0].total = ${body.itens[0].total}`).toBe(true);
  });
});
