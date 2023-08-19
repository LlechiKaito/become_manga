function handleResizeOrLoad(){
  const image = document.getElementById("comic-image");
  const imageAspectRatio = image.naturalWidth / image.naturalHeight;

  const windowWidth = window.innerWidth;
  const containerHeight = 0.9 * window.innerHeight; // 90vhの高さ

  // 画像の高さを計算し設定
  const imageHeight = containerHeight;
  const imageWidth = imageHeight * imageAspectRatio;
  if((imageWidth * 2 + 5) > windowWidth){
    const images = document.querySelectorAll('.image'); // .image クラスを持つ要素を選択
    // 各要素に対してクラスを追加
    images.forEach(function(img) {
      // クラスを追加
      img.classList.add('changeImage');

      // クラスを削除
      img.classList.remove('image');
    });
    
    
  }else{
    const images = document.querySelectorAll('.changeImage'); // .image クラスを持つ要素を選択
    // 各要素に対してクラスを追加
    images.forEach(function(img) {
      // クラスを追加
      img.classList.add('image');

      // クラスを削除
      img.classList.remove('changeImage');
    });

  }

  if(imageWidth > windowWidth){
    const images = document.querySelectorAll('.mobile-image'); // .image クラスを持つ要素を選択
    // 各要素に対してクラスを追加
    images.forEach(function(img) {
      // クラスを追加
      img.classList.add('mobile-change-image');

      // クラスを削除
      img.classList.remove('mobile-image');
    });
  }else{
    const images = document.querySelectorAll('mobile-change-image'); // .image クラスを持つ要素を選択
    // 各要素に対してクラスを追加
    images.forEach(function(img) {
      // クラスを追加
      img.classList.add('mobile-image');

      // クラスを削除
      img.classList.remove('mobile-change-image');
    });
  }
}

window.addEventListener('resize', handleResizeOrLoad);
window.addEventListener('load', handleResizeOrLoad);