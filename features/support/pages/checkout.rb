#camada de organização dos objetos das páginas
require 'rspec'

class CheckoutPage
  include Capybara::DSL
  include RSpec::Matchers

  def assert_product_details(product)
    product_title = find('.item-details h1')
    expect(product_title.text).to eql product[:name]

    sub_price = find('.subtotal .sub-price')
    expect(sub_price.text).to eql product[:price]

    delivery_price = find('.delivery-price')
    expect(delivery_price.text).to eql product[:delivery]

  end

  def assert_total_price(total_price)
    price = find('.total .total-price ')
    expect(price.text).to eql total_price

  end

  def insert_cep(cep)
    find('input[placeholder= CEP]').set(cep)
    click_on 'Buscar CEP'

  end

  def fill_address(number, details)
    find('input[name = number]').set(number)
    find('input[name = complement]').set(details)
  end

  def click_tipopagamento(type)
    find('label div', text: type.upcase).click
  end

  def submit()
    click_on 'Confirmar pedido'
  end

  def set_discount(coupon_code)
    find("input[placeholder = 'Código do cupom']").set(coupon_code)
      click_on 'Aplicar'

  end

  def assert_notice(texto)
    notice = find('.notice').text
    expect(notice).to eql texto
  end
end
