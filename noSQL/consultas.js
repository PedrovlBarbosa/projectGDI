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
    $gte: 2020
  }
})

//[aggregate]
db.courses.aggregate([{
  $unwind: {
      path: '$assistantList',
  }
}, {
  $unwind: {
      path: '$assistantList.availabilityList',
  }
}, {
  $group: {
      _id: '$assistantList.name',
      hours: {
          $sum: '$assistantList.availabilityList.durationInMinutes'
      }
  }
}, {
  $sort: {
      hours: -1
  }
}, {
  $limit: 3
}])