window.addEventListener('turbo:load', () => {
  // 金額を入力した数値をpriceInputという変数に格納する
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitFee = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

    const charge = addTaxDom.innerHTML;
    profitFee.innerHTML = Math.floor(inputValue - charge);
 })
});