function itemprice() {
  const priceInput = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
    priceInput.addEventListener('input', () => {
      const value = document.getElementById("item-price").value;
      addTaxPrice.innerHTML = value * 0.1;
      profit.innerHTML = value * 0.9;
  })
};
window.addEventListener("load", itemprice);