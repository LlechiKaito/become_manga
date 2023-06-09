function main_create (){
  const main_text = document.getElementById("main-text");
  const main_area = document.getElementById("main-area");

  main_text.addEventListener("keyup", function(){
    const title_count = document.getElementById("title-count");
    var count = main_text.value.length;
    title_count.innerHTML = "タイトル文字数 : " + count + "字";
  });

  main_area.addEventListener("keyup", function(){
    const explanation_count = document.getElementById("explanation-count");
    var count = main_area.value.length;
    explanation_count.innerHTML = "説明文文字数 : " + count + "字";
  });

};

window.addEventListener('load', main_create);