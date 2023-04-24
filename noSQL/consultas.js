//[findOne] 
db.catalogo.findOne({
  "preco" : {
      $lte: 100.00
  }
})

//[all] [find]
db.catalogo.find({
  "tamanho" : {
      $all: [
        "P",
        "M"
      ]
  }
})

//[Gte]
db.categoria.find({
  "ano": {
    $gte: "2020"
  }
})

//[aggregate]
db.catalogo.aggregate([{
  $group: {
      _id:null, 
      mediaDosPrecos: {
          $avg:"$preco"
      }
  } 
}])