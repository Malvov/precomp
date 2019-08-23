module ProductsHelper
    def formatted_price product
        return "#{ number_to_currency product.price, locale: 'es-NI' }" if product.currency == 'Córdoba'
        "#{ number_to_currency product.price }"
    end
end
