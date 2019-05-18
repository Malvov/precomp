function initMap(lat, lng) {
    var myCoords = new google.maps.LatLng(lat, lng);
    var mapOptions = {
        center: myCoords,
        zoom: 14
    };

    console.log(document.getElementsByClassName('map'));
    var map = new google.maps.Map(document.getElementsByClassName('map'), mapOptions);

    var marker = new google.maps.Marker({
        position: myCoords,
        map: map
    });
};