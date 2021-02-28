var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/";

MongoClient.connect(url, {useUnifiedTopology: true}, function(err, db) {
  if (err) throw err;
  var dbo = db.db("pizzerias");
  var myobj = [
{	
	"province" : {
					"name" : "Barcelona",
					"locality" : {
									"name" : "Barcelona"
								}
				},
	"customer" : {
					"name" : "Eric",
					"surname1" : "Garcia",
					"surname2" : "Domingo",
					"adress" : "Calle palacions 5 1º 2a",
					"postal_code" : "08014",
					"phone" : "659669587"
                },
	"orders" : {	
					"date_hour" : new Date("2021-01-19T16:00:00Z"),
					"type_order" : "domicilio",
					"quantity_pizza" : 2,
					"quantity_burger" : 0,
					"quantity_drink" : 2,
					"total_price" : 25
				},		
    "delivery" :  {
					"date_hour" : new Date("2021-01-19T16:00:00Z")
				},						
    "employee" : {
					"name" : "Joan",
					"surname1" : "Carrasco",
					"surname2" : "Lopez",
					"nif" : "47845214F",
					"phone" : "659557468",
					"type_employee" : "repartidor"
				},					
	"shop" : {
				"adress" : "Plaça espanya, 234 baixos",
				"postal_code" : "08028"
			 },
	"product" : [
				{
	                "name" : "pizza",
					"description" : "margarita",
					"image" : "margarita.jpg",
					"price" : 10,
					"category" : {
									"name" : "basica"
								}
				},
				{
	                "name" : "pizza",
					"description" : "hawaiana",
					"image" : "hawaiana.jpg",
					"price" : 10,
					"category" : {
									"name" : "elaborada"
								}
				}
				]
			
},
{	
	"province" : {
					"name" : "Girona",
					"locality" : {
									"name" : "Girona"
								}
				},
	"customer" : {
					"name" : "Jorge",
					"surname1" : "Lopez",
					"surname2" : "Cuñez",
					"adress" : "Calle san francisco 45 2º 1a",
					"postal_code" : "08023",
					"phone" : "614258746"
                },
	"orders" : {	
					"date_hour" : new Date("2021-01-20T16:00:00Z"),
					"type_order" : "domicilio",
					"quantity_pizza" : 1,
					"quantity_burger" : 1,
					"quantity_drink" : 2,
					"total_price" : 20
				},		
    "delivery" :  {
					"date_hour" : new Date("2021-01-20T16:00:00Z")
				},						
    "employee" : {
					"name" : "Laia",
					"surname1" : "Garcia",
					"surname2" : "Pérez",
					"nif" : "47845124P",
					"phone" : "632587469",
					"type_employee" : "repartidor"
				},					
	"shop" : {
				"adress" : "Avinguda Hospitalet de Llobregat 43 baixos",
				"postal_code" : "08032"
			 },
	"product" : [
				{
	                "name" : "pizza",
					"description" : "barbacoa",
					"image" : "barbacoa.jpg",
					"price" : 10,
					"category" : {
									"name" : "elaborada"
								}
				},
				{
	                "name" : "burger",
					"description" : "cuatro_quesos",
					"image" : "cuatro_quesos.jpg",
					"price" : 5,
					"category" : {
									"name" : "NULL"
								}
				},
								{
	                "name" : "drink",
					"description" : "cerveza",
					"image" : "cerveza.jpg",
					"price" : 2.5,
					"category" : {
									"name" : "NULL"
								}
				},
								{
	                "name" : "drink",
					"description" : "fanta",
					"image" : "fanta.jpg",
					"price" : 2.5,
					"category" : {
									"name" : "NULL"
								}
				}
				]
			
},
{	
	"province" : {
					"name" : "Tarragona",
					"locality" : {
									"name" : "Calafell"
								}
				},
	"customer" : {
					"name" : "Maria",
					"surname1" : "Gomez",
					"surname2" : "Cifuentes",
					"adress" : "Calle los santos 234 3º 2a",
					"postal_code" : "08054",
					"phone" : "631247958"
                },
	"orders" : {	
					"date_hour" : new Date("2021-01-21T16:00:00Z"),
					"type_order" : "recollir",
					"quantity_pizza" : 1,
					"quantity_burger" : 0,
					"quantity_drink" : 0,
					"total_price" : 10
				},		
    "delivery" :  {
					"date_hour" : new Date("2021-01-21T16:00:00Z")
				},						
    "employee" : {
					"name" : "Florent",
					"surname1" : "Liz",
					"surname2" : "Camilo",
					"nif" : "47852145B",
					"phone" : "632587452",
					"type_employee" : "cuiner"
				},					
	"shop" : {
				"adress" : "Gran via de Calafell 123 baixos",
				"postal_code" : "43700"
			 },
	"product" : [
				{
	                "name" : "pizza",
					"description" : "romana",
					"image" : "romana.jpg",
					"price" : 10,
					"category" : {
									"name" : "elaborada"
								}
				}
				]
			
}
  ];
  dbo.collection("pizzeria").insertMany(myobj, function(err, res) {
    if (err) throw err;
    console.log("Number of documents inserted: " + res.insertedCount);
    db.close();
  });
});