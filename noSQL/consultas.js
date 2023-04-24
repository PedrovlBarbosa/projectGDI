//[find] 
db.catalogo.findOne({
  "preco" : {
      $lte: "100.00"
  }
})

//[ALL] 
db.catalogo.find({
  "tamanho" : {
      $all: [
        "P",
        "M"
      ]
  }
})

/
