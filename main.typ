#set page(width: 5in, height: 1in, fill: black)
#set text(white, size: 15pt)

#let amount = 1375

#let rates = (
  "USD": (value: 1.00, symbol: "$"),
  "CAD": (value: 1.3585, symbol: "$"),
  "AUD": (value: 1.4911, symbol: "$"),
  "EUR": (value: 0.8544, symbol: "€"),
  "GBP": (value: 0.7380, symbol: "£"),
  "JPY": (value: 149.8, symbol: "¥"),
  "CHF": (value: 0.8481, symbol: "₣"),
)

#place(center + horizon, table(
  columns: rates.len(),
  stroke: (thickness: 1pt, paint: white),
  rows: 2,
  gutter: 4pt,
  ..rates.keys(),
  ..rates.values().map(((value, symbol)) => str(calc.floor(value * amount)) + symbol)
))
