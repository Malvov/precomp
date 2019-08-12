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

