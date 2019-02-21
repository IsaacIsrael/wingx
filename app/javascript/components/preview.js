function readURL(input) {

  if (input.files && input.files[0]) {
    const reader = new FileReader();

    reader.onload = function(e) {
      $('#image').attr('src', e.target.result);
    }

    reader.readAsDataURL(input.files[0]);
  }
}

$("#flight_photo").change(function() {
  readURL(this);
});

export { readURL };
