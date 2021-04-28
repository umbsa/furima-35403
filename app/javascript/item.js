function item (){
  const ItemPrice = document.getElementById('item-price');
  ItemPrice.addEventListener('input', () => {
    const pricevalue = ItemPrice.value;
    const addTaxPrice = document.getElementById('add-tax-price')
    addTaxPrice.innerHTML = Math.floor(pricevalue / 10)
    const Profit = document.getElementById('profit')
    const TaxPrice =Math.floor(pricevalue / 10)
    Profit.innerHTML = Math.floor(pricevalue - TaxPrice)
  })
}

window.addEventListener('load', item)