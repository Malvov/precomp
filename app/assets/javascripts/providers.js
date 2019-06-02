$(document).on('turbolinks:load', function() {
    $('#provider_logo').change(function(event) {
        if (event.target.files && event.target.files[0]) {
            var fileReader = new FileReader();

            fileReader.onload = function (e) {
                $('#img-prev').attr('src', e.target.result).width(180).height(180);
            };

            fileReader.readAsDataURL(event.target.files[0]);
        }
    });
});

function initShowMap(addresses) {
    addresses.forEach(function(address) {
        var myCoords = new google.maps.LatLng(address.latitude, address.longitude);
        var mapOptions = {
            center: myCoords,
            zoom: 14
        };

        var map = new google.maps.Map(document.getElementById('show-map-' + address.id), mapOptions);
        
        var marker = new google.maps.Marker({
            position: myCoords,
            map: map
        });
    });
};