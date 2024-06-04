function tax (){
  const itemPrice = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");


  itemPrice.addEventListener("keyup", () => {
    let price = itemPrice.value;
    let taxRate = 0.10;
    let taxedPrice = Math.floor(price * taxRate);
    let profitValue = Math.floor(price - taxedPrice);

    taxPrice.textContent = taxedPrice;
    profit.textContent = profitValue;
  });
};

window.addEventListener('load', tax);
