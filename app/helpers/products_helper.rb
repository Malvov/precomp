module ProductsHelper
    def formatted_price product
        return "#{ number_to_currency product.price, locale: 'es-NI' }" if product.currency == 'Córdoba'
        "#{ number_to_currency product.price }"
    end

    def product_image product
        if product.images.count == 0
            image_tag 'no-img.jpg', class: 'img-fluid'
        else
            image_tag product.images.first, class: 'img-fluid'
        end
    end
end
