// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

// :')
var getProduct = async function(productId) {

    try {
        var product = await $.getJSON(`/products/${ productId }.json`);
    
        if (product.length === 0) {
            throw new Error(`No existe producto con id ${ productId }`);
        }
    
        return product;
    } catch (error) {
        throw new Error(error);
    }    
}

var getProductImages = async function(productId) {
    try {
        var productImages= await $.getJSON('/product_images', { product_id: productId });

        return productImages;
        
    } catch (error) {
        throw new Error(error);
    }
}

var unmarkAsFavorite = function (productSlug) {
    return new Promise( function(resolve, reject){
        $.ajax({
            url: `/favorite_products/${productSlug}`,
            type: 'DELETE',
            success: function(response) { resolve(response); },
            error: function(error) { reject(error); }
        });
    });
}

var markAsFavorite =  function(productSlug) {

    return new Promise(function(resolve, reject) {
        $.ajax({
            url: '/favorite_products',
            type: 'POST',
            data: { product_id: productSlug },
            success: function (response) { resolve(response); },
            error: function (error) { reject(error); } 
        });
    });

}

$(document).on('turbolinks:load', function() {
    var icon = $('.icon-svg');

    icon.click(async () => {
        var productSlug = icon.attr('id');
        var isFavorited = icon.hasClass('favorited');

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

