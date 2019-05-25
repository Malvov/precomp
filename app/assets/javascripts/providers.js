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