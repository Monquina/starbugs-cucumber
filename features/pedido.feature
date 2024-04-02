#language: pt

#camada de especificação utilizando Gherkyn
Funcionalidade: Pedidos

Cenário: Acessar o catálogo de cafés na página principal

    Quando eu acesso a página principal da Starbugs
    Então eu devo ver uma lista de cafés disponíveis
@smoke
Cenário: Iniciar a compre de um café

    Dado que estou na página principal da Starbugs
        E que iniciei a compra do item "Expresso Tradicional"
    Quando faço a busca pelo seguinte CEP "30130090"
        E informo os demais itens do endereço:
        | number       | 100             |
        | details      | Apto 20         |
        E escolho a forma de pagamento "Cartão de Débito"
        E por fim finalizo a compra
    Então sou redirecionado para a página de confirmação de Pedidos
        E deve ser informado um prazo de entrega "20 min - 30 min"