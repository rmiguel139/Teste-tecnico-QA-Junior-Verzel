# Evidências da execução

- Evidência de cenário máximo de produtos: `limite-5-produtos.png`.
Retorna mensagem 'Limite de 5 unidades atingido'.

- Evidência de cenário com campo nome, e-mail e cep de forma correta:`verifica-campos.mp4`.
Ao adicionar valores válidos para os campos de nome, e-mail e cep, e confirmando o pedido prosseguimos para a aba de pedidos confirmados e recebemos o código do pedido.

Evidência de cenário com campo nome, e-mail e cep de forma incorreta:`campos-inválidos.png`.
Retorna a mensagem 'Informe o nome completo.' para o campo nome, caso não tenha nenhum e-mail selecionado será retornado a mensagem 'Informe o e-mail.', caso o e-mail seja inválido retornará a mensagem 'Informe um e-mail válido.', caso não esteja preenchido o campo cep retornará uma mensagem 'Informe o CEP.', caso seja um cep inválido irá retornar a mensagem 'Informe um CEP com 8 dígitos.'.

- Evidência de bug ao adicionar itens totalizando 200,00: `BUG-frete.png`.
O retorno será 'Faltam R$ 0,00 para o frete grátis.', mas o esperado era que retornasse frete grátis.

- Respostas da API ao adicionar o produto P002 e P004 com cupom BEMVINDO10: `retornos-api.json`.
Retorna todos os campos do objeto, inclusive a mensagem ao adicionar um cupom válido.
