import { APIRequestContext } from '@playwright/test';

export type Item = { produtoId: string; quantidade: unknown };

/** Produtos usados nos testes (preços da documentação). */
export const P001 = 'P001'; // Camiseta Essencial     59,90
export const P002 = 'P002'; // Calça Jeans Slim      139,90
export const P004 = 'P004'; // Boné Aba Curva         49,90
export const P005 = 'P005'; // Mochila Urbana 20L    100,00
export const P007 = 'P007'; // Jaqueta Corta-Vento   229,90

export async function calcular(
  request: APIRequestContext,
  itens: Item[],
  cupom?: string,
) {
  const data: Record<string, unknown> = { itens };
  if (cupom !== undefined) data.cupom = cupom;
  return request.post('/api/carrinho/calcular', { data });
}

export const clienteValido = {
  nome: 'Maria Silva',
  email: 'maria@exemplo.com',
  cep: '01310-100',
};

export async function criarPedido(
  request: APIRequestContext,
  itens: Item[],
  cupom?: string,
  cliente: Record<string, unknown> = clienteValido,
) {
  const data: Record<string, unknown> = { cliente, itens };
  if (cupom !== undefined) data.cupom = cupom;
  return request.post('/api/pedidos', { data });
}
