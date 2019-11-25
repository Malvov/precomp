function initInputMap() {
    var lat = document.getElementById('address_latitude').value;
    var lng = document.getElementById('address_longitude').value;

    // if not defined create default position
    if (!lat || !lng){
        lat = 12.128047;
        lng = -86.264752;
        document.getElementById('address_latitude').value = lat;
        document.getElementById('address_longitude').value = lng;
    }

    var myCoords = new google.maps.LatLng(lat, lng);
    var mapOptions = {
        center: myCoords,
        zoom: 14
    };

    var map = new google.maps.Map(document.getElementById('input-map'), mapOptions);
    
    var marker = new google.maps.Marker({
        position: myCoords,
        animation: google.maps.Animation.DROP,
        map: map,
        draggable: true
    });

    function refreshMarker(){
        var lat = document.getElementById('address_latitude').value;
        var lng = document.getElementById('address_longitude').value;
        var myCoords = new google.maps.LatLng(lat, lng);
        marker.setPosition(myCoords);
        map.setCenter(marker.getPosition());   
    }
    
    // when input values change call refreshMarker
    document.getElementById('address_latitude').onchange = refreshMarker;
    document.getElementById('address_longitude').onchange = refreshMarker;

    // when marker is dragged update input values
    marker.addListener('drag', function() {
        latlng = marker.getPosition();
        newlat=(Math.round(latlng.lat()*1000000))/1000000;
        newlng=(Math.round(latlng.lng()*1000000))/1000000;
        document.getElementById('address_latitude').value = newlat;
        document.getElementById('address_longitude').value = newlng;
    });

    // When drag ends, center (pan) the map on the marker position
    marker.addListener('dragend', function() {
        map.panTo(marker.getPosition());   
    });
};

var initAddressIndexShowMaps = function initAddressIndexShowMaps(addresses) {
    return initShowMap(addresses);
}