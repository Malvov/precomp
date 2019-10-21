$(document).on('turbolinks:load', () => {
    var elementProductImage = $('#product-image');
    
    $('td').each(function () {
        let productData = $(this);
        productData.click(async () => {
            
            let productId = $(this).closest('tr').find('.product-id').html();
            
            let product = await getProduct(productId);

            setProductInfo(product);

            let productImages = await getProductImages(product.id);

            if (productImages.length > 0) {
                elementProductImage.attr('src', productImages[0].url);
            } else {
                elementProductImage.attr('src', noImgUrl); // see assets.js.erb
            }

        });
    });
});

const setProductInfo = (product) => {
    let productName = document.getElementById('product-name');
    let productCategory =  document.getElementById('product-category');
    let productDescription = document.getElementById('product-description');
    let productPrice = document.getElementById('product-price');
    let productEstimatedDeliveryTime = document.getElementById('product-estimated-delivery-time');
    let productMeasurementUnit = document.getElementById('product-measurement-unit');
    let productTrademark = document.getElementById('product-trademark');
    let editProductPath = document.getElementById('edit-product-path');

    productName.innerText = product.name;
    productCategory.innerText = product.category_description;
    productDescription.innerHTML = product.description;
    productPrice.innerHTML = `${ product.formatted_price } |`;
    productEstimatedDeliveryTime.innerHTML = `${ product.estimated_delivery_time === null ? '' : product.estimated_delivery_time  } |`;
    productMeasurementUnit.innerHTML = `${ product.measurement_unit } |`;
    productTrademark.innerHTML = product.trademark;
    editProductPath.setAttribute('href', `/products/${ product.id }/edit`);

}
