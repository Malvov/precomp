$(document).on('turbolinks:load', function() {
    var elementProductImage = $('#product-image');
    $('td').each(function () {
        let productData = $(this);
        productData.click(async () => {
            
            let productId = $(this).closest('tr').find('.product-id').html();
            
            let product = await getProduct(productId);

            let productImages = await getProductImages(product.id);

            if (productImages.length > 0) {
                elementProductImage.attr('src', productImages[0].url);
            } else {
                elementProductImage.attr('src', noImgUrl);
            }
            

            console.log(productImages);

        });
    });
});
