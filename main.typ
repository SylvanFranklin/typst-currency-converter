

#let rates = (
  "USD": (value: 1.00, symbol: "$"),
  "INR": (value: 83.12, symbol: "₹"),
  "CAD": (value: 1.3585, symbol: "$"),
  "AUD": (value: 1.4911, symbol: "$"),
  "EUR": (value: 0.8544, symbol: "€"),
  "GBP": (value: 0.7380, symbol: "£"),
  // "JPY": (value: 149.8, symbol: "¥"),
  "CHF": (value: 0.8481, symbol: "₣"),
)


#let amounts = csv("amounts.csv")

#for row in amounts.slice(1,) {
  let amount = float(row.at(1))
  let tab = table(
    columns: rates.len(),
    stroke: (thickness: 1pt, paint: white),
    rows: 2,
    gutter: 4pt,
    ..rates.keys(),
    ..rates.values().map(((value, symbol)) => str(calc.floor(value * amount)) + symbol)
  )
  context {
    let ments = measure(tab)
    let mx = 100pt
    let my = 20pt
    set text(white, size: 15pt)
    set page(width: ments.width + mx, height: ments.height + my, fill: black, margin: 0em)
    place(center + horizon, tab)
  }
}




