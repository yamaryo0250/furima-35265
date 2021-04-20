function sellingPrice() {

  const priceInput = document.getElementById('item-price');

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const priceCharge = document.getElementById('add-tax-price');
    const priceProfit = document.getElementById('profit');
    priceCharge.innerHTML = Math.floor(inputValue * 0.1);
    priceProfit.innerHTML = Math.floor(inputValue - priceCharge.innerHTML);
  })

}

window.addEventListener('load', sellingPrice)
