$(document).on('turbolinks:load', function() {
    $('td').each(function () {
        let data = $(this);
        data.click(async () => {
            
            let productId = $(this).closest('tr').find('.product-id').html();
            
            let product = await getProduct(productId);

            alert(product.name);

        });
    });
});
