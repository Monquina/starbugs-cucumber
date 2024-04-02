
#camada de implementação
Quando('eu acesso a página principal da Starbugs') do
    @home.open
sleep 10
end

Então('eu devo ver uma lista de cafés disponíveis') do
    expect(@home.coffee_list.size).to be > 0
end

Dado('que estou na página principal da Starbugs') do
    @home.open
end

Dado('que desejo comprar o seguinte produto:') do |table|
    @product = table.rows_hash
end

Quando('inicio a compra desse item') do
    @home.buy(@product[:name])
end

Então('devo ver a página de Checkout com os detalhes do produto') do
    @checkout.assert_product_details(@product)
end

Então('o valor total da compre deve ser de {string}') do |total_price|
    @checkout.assert_total_price(total_price)
end

 Então('devo ver um popup informando que o produto está indisponível') do
    @popup.have_text('Produto indisponível')
end

Dado('que iniciei a compra do item {string}') do |item|
    @home.buy(item)
  end

  Quando('faço a busca pelo seguinte CEP {string}') do |cep|
    @checkout.insert_cep(cep)

  end

  Quando('informo os demais itens do endereço:') do |table|
   address = table.rows_hash
   @checkout.fill_address(address[:number], address[:details])
  end

  Quando('escolho a forma de pagamento {string}') do |type|
    @checkout.click_tipopagamento(type)
  end

  Quando('por fim finalizo a compra') do
    @checkout.submit

  end

  Então('sou redirecionado para a página de confirmação de Pedidos') do
    @order.assert_order
  end

  Então('deve ser informado um prazo de entrega {string}') do |delivery_time|
    @order.assert_delivery_time(delivery_time)
  end
