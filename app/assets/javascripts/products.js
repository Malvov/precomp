// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

// :')
const getProduct = async (productId) => {

    try {
        let product = await $.getJSON(`/products/${ productId }.json`);
    
        if (product.length === 0) {
            throw new Error(`No existe producto con id ${ productId }`);
        }
    
        return product;
    } catch (error) {
        throw new Error(error);
    }    
}

const getProductImages = async (productId) => {
    try {
        let productImages= await $.getJSON('/product_images', { product_id: productId });

        return productImages;
        
    } catch (error) {
        throw new Error(error);
    }
}

const unmarkAsFavorite = (productSlug) => {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: `/favorite_products/${productSlug}`,
            type: 'DELETE',
            success: response => resolve(response),
            error: error => reject(error)
        });
    });
}

const markAsFavorite = (productSlug) => {

    return new Promise((resolve, reject) => {
        $.ajax({
            url: '/favorite_products',
            type: 'POST',
            data: { product_id: productSlug },
            success: response => resolve(response),
            error: error => reject(error)
        });
    });

}

$(document).on('turbolinks:load', function() {
    var icon = $('.icon-svg');

    icon.click(async () => {
        let productSlug = icon.attr('id');
        let isFavorited = icon.hasClass('favorited');

        if (isFavorited) {
            icon.removeClass('favorited');
            icon.addClass('unfavorited');
            return await unmarkAsFavorite(productSlug);
            
        } else {
            icon.addClass('favorited');
            return await markAsFavorite(productSlug);
        }
        
    });
});

