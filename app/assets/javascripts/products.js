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

const markAsFavorite = (productSlug, favorited) => {

    return new Promise((resolve, reject) => {
        if (favorited) {
            $.ajax({
                url: `/favorite_products/${productSlug}`,
                type: 'DELETE',
                success: response => resolve(response),
                error: error => reject(error)
            });
        } else {
            $.ajax({
                url: '/favorite_products',
                type: 'POST',
                data: { product_id: productSlug },
                success: response => resolve(response),
                error: error => reject(error)
            });
        }
    });

}

$(document).on('turbolinks:load', function() {
    var icon = $('.icon-svg');

    icon.click(() => {
        let productSlug = icon.attr('id');
        let isFavorited = icon.children().first().hasClass('favorited');
        console.log(isFavorited);
        let favorited = markAsFavorite(productSlug, isFavorited);

        favorited.then((response) => {
            console.log(response.marked);
            // if (response.marked) {
            //     icon.addClass('favorited');
            // } else {
            //     icon.removeClass('favorited');
            // }

        }).catch(error => console.log(error));
        
    });
});

