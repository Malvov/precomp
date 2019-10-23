$(document).on('turbolinks:load', function() {
    var elementProductImage = $('#product-image');
    
    $('td').each(function () {
        var productData = $(this);
        productData.click(async function() {
            
            var productId = $(this).closest('tr').find('.product-id').html();
            
            var product = await getProduct(productId);

            setProductInfo(product);

            var productImages = await getProductImages(product.id);

            if (productImages.length > 0) {
                elementProductImage.attr('src', productImages[0].url);
            } else {
                elementProductImage.attr('src', noImgUrl); // see assets.js.erb
            }

        });
    });
});

const setProductInfo = (product) => {
    var productName = document.getElementById('product-name');
    var productCategory =  document.getElementById('product-category');
    var productDescription = document.getElementById('product-description');
    var productPrice = document.getElementById('product-price');
    var productEstimatedDeliveryTime = document.getElementById('product-estimated-delivery-time');
    var productMeasurementUnit = document.getElementById('product-measurement-unit');
    var productTrademark = document.getElementById('product-trademark');
    var editProductPath = document.getElementById('edit-product-path');

    productName.innerText = product.name;
    productCategory.innerText = product.category_description;
    productDescription.innerHTML = product.description;
    productPrice.innerHTML = `${ product.formatted_price } |`;
    productEstimatedDeliveryTime.innerHTML = `${ product.estimated_delivery_time === null ? '' : product.estimated_delivery_time  } |`;
    productMeasurementUnit.innerHTML = `${ product.measurement_unit } |`;
    productTrademark.innerHTML = product.trademark;
    editProductPath.setAttribute('href', `/products/${ product.id }/edit`);

}
