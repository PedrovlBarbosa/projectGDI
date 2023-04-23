//[find]
db.catalogo.find({
  "preco" : {
      $lte: "100.00"
  }
})

//[findOne]
db.catalogo.find({
  
})
