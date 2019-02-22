function readURL(input) {

  if (input.files && input.files[0]) {
    const reader = new FileReader();

    reader.onload = function(e) {
      $('#image').attr('src', e.target.result);
    }

    reader.readAsDataURL(input.files[0]);
  }
}

function initReadUrl(){
  var element = $("#flight_photo");
  console.log('OI mundo cruel!!!!')
  if (element){
    element.change(function() {
      readURL(this);
    });
  }
}

export { initReadUrl };
