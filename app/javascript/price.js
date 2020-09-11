function itemCalculation() {
  const price = document.getElementById("item-price")
  const itemPrice = document.getElementById("add-tax-price")
  const itemProfit = document.getElementById("profit")
  price.addEventListener("input", () =>{
    const number = document.getElementById("item-price").value
    itemPrice.innerHTML = Math.floor(number * 0.1);
    itemProfit.innerHTML = Math.floor(number * 0.9);
  });
}
window.addEventListener("load", itemCalculation)