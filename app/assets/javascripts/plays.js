// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener('DOMContentLoaded', function(){

var image = document.querySelectorAll('.bg-link');

image.forEach(function(image){
  image.addEventListener('click', function(e){
    e.preventDefault();
    var img = document.createElement('img'); //created empty image element
    img.src = image.querySelector("a").href
    console.log(img); //selecting the src attribute and setting equal to the href
    image.appendChild(img); // append image to the same div as the link

    $.ajax({
      url: '/plays/image', //end point of your api call, which will then route you to the controller and its corresponding method
      method: 'POST', //post request to server
      data: {image_url: img.src}, // data you are getting back from the server, this will be put into the params hash under the image_url key
      dataType: 'html' //the data type that you want for the response

      
    })

    var image_size = document.querySelectorAll('img');


    image_size.forEach(function(img){
      img.width = "500"
      img.height = "600"

    })

})


})

})
