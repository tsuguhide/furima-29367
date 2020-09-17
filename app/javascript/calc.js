window.addEventListener('load', function(){

  // 要素を取得
  const inputElement = document.getElementById( "item-price" ) ;

  // イベントを設定(数値の変動時に動く)
  inputElement.oninput = function calc() {
    // inputElementを数値に変換
    const value = inputElement.value
    const fee = value * 0.1
    const profit = value - fee
    // 処理内容
    document.getElementById('add-tax-price').textContent = fee;
    document.getElementById('profit').textContent = profit;
  }

})


