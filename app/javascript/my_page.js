function my_create (){
  const my_profile = document.getElementById("my-profile");

  my_profile.addEventListener("click", function(e){
    e.preventDefault(); 
    document.getElementById('my-element').innerHTML = 'New content';
  });
};

window.addEventListener('load', my_create);