//[findOne] item menor que 100 reais do estilo casual e genero unissex
db.catalogo.findOne({
  "preco" : {
      $lte: 100.00
  },
  "estilo" : 
  { 
    $eq: "casual"
  },
  "genero" : {
    $eq: "unissex"
  }
})

//[all] [find] produtos que tem tamanho P e M
db.catalogo.find({
  "tamanho" : {
      $all: [
        "P",
        "M"
      ]
  }
})

//[gte] Roupas acima do ano de 2020
db.categorias.find({
  $and: [
      {
        fabricado: "Brasil"
      },
      {
        ano: {$gte: 2021}
      }
  ]
})

//[aggregate] média de preços das roupas
db.catalogo.aggregate([{
  $group: {
      _id:null, 
      mediaDosPrecos: {
          $avg:"$preco"
      }
  } 
}])

//[Exists] [limit] produtos que possuem cores disponiveis
db.catalogo.find({
   "cores_disponiveis": 
   { 
    $exists: true 
  } }).limit(5)

// [group] [Pretty] Quantidade de tipos produtos em cada loja 
db.lojas.aggregate([
  { 
    $unwind: "$produtos_disponiveis" 
  },
  { 
    $group: 
    { 
      _id: "$nome", num_tipos_produtos: 
      { 
        $sum: 1 
      } 
    } 
  }
]).pretty();

//[Sort] preco dos 3 itens mais caros do catalogo
db.catalogo.find().sort(
  { 
    preco: -1 
  }).limit(3)

//[Match] [Project] campos da categoria vestidos
db.catalogo.aggregate([
  {
    $match: {
      "categoria.$id": db.categorias.findOne(
        {
          name: "vestidos"
        })._id
    }
  },
  {
    $project: {
      _id: 0,
      name: 1,
      descricao: 1,
      preco: 1
    }
  }
])

//[Lookup] categoria de cada produto do catalogo
db.catalogo.aggregate([
  {
    $lookup: {
      from: "categorias",
      localField: "categoria.$id",
      foreignField: "_id",
      as: "categoria"
    }
  }
]);

//[max] produto mais caro de cada categoria
db.catalogo.aggregate([
  {
    $group: {
      _id: "$categoria.$id",
      produto: { $max: { preco: "$preco", name: "$name" } }
    }
  },
  {
    $lookup: {
      from: "categorias",
      localField: "_id",
      foreignField: "_id",
      as: "categoria"
    }
  },
  {
    $unwind: "$categoria"
  },
  {
    $project: {
      _id: 0,
      categoria: "$categoria.name",
      produto: "$produto.name",
      preco: "$produto.preco"
    }
  }
])

//[size] produtos com pelo menos 3 tamanhos diferentes diponíveis
db.catalogo.find(
  { "tamanho": 
  { 
    $size: 3 
  } 
})

// [count] quantidade de itens com o estilo casual
db.catalogo.countDocuments({
  estilo: "casual"
})

//[filter] [cond] aumentar o preco dos itens do genero masculino e estilo casual em 10%
db.catalogo.updateMany(
  {
    $and: [
      { 
        genero: "masculino"
       },
      { 
        estilo: "casual"
       }
    ]
  },
  [
    {
      $set: {
        preco: {
          $cond: {
            if: 
            { 
              $eq: [ "$genero", "masculino" ] 
            },
            then: 
            { 
              $multiply: [ "$preco", 1.1 ] 
            },
            else: "$preco"
          }
        }
      }
    }
  ]
)

// WHERE e Function lista o catalogo que as roupas sao unissex
db.catalogo.find({
    $where: function() {
      return this.genero == 'unissex';
    }
  })

// MAPREDUCE;
// Função de mapeamento
var mapFunction = function() {
    for (var i = 0; i < this.produtos_vendidos.length; i++) {
        var key = this.produtos_vendidos[i].produto.$id;
        var value = this.produtos_vendidos[i].quantidade_vendida;
        emit(key, value);
    }
};

// Função de redução
var reduceFunction = function(key, values) {
    return Array.sum(values);
};

// Executa o operador MAPREDUCE
db.lojas.mapReduce(
    mapFunction,
    reduceFunction,
    {
        out: "total_vendas_por_produto"
    }
);

// Resultado
db.total_vendas_por_produto.find();


// ADDTOSET para adicionar novo catalogo a Loja Riachuelo
db.lojas.updateOne(
    { "nome": "Loja Riachuelo" },
    { $addToSet: { "produtos_disponiveis": 
        { "produto": { 
            $ref: "catalogo", 
            $id: db.catalogo.findOne({name: "Camiseta cropped"})._id 
          },
          "quantidade": 10
        } 
      } 
    }
);

// [SET] modificar o endereco da loja Riachuelo
db.lojas.updateOne(
    { nome: "Loja Riachuelo" },
    { $set: { endereco: { 
        rua: "Rua das Flores", 
        bairro: "Centro", 
        cidade: "Recife", 
        estado: "Pernambuco" 
    } } }
 );


// [TEXT] CRIA UM INDICE DE TEXTO NA COLLECTION LOJAS 
//E REALIZA UMA BUSCA NA COLLECTION PARA SABER SE CONTEM 
//A PALAVRA "LOJA RIACHUELO" NA COLLECTION

db.lojas.createIndex({"nome": "text"})
db.lojas.find({$text: {$search: "Loja Riachuelo"}})


// [UPDATE] Atualizar o campo fabricado da categoria "cuecas" para "Estados Unidos"
db.categorias.updateOne(
    { name: "cuecas" },
    { $set: { fabricado: "Estados Unidos" } }
 );
 

