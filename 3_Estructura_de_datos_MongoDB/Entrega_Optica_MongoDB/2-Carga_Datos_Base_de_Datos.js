var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/";

MongoClient.connect(url, {useUnifiedTopology: true}, function(err, db) {
  if (err) throw err;
  var dbo = db.db("opticas");
  var myobj = [
    {
	"product_order" : {
						"glasses" : {
										"brand" : {
													"name" : "Ray Ban Police",
													"provider" : {
																	"name" : "Ray Ban",
																	"street" : "Avenida Madrid",
																	"number" : "10-15",
																	"floor" : "entresuelo",
																	"door" : "1a",
																	"city" : "Barcelona",
																	"postal_code" : "08032",
																	"country" : "España",
																	"phone" : "933554179",
																	"fax" : "933665878",
																	"nif" : "45846542"
																}
													},
										"graduation_left" : 2.4,
										"graduation_right" : 2.1,
										"frame" : {
													"frame_type" : "pasta",
													"color_frame" : {
																		"color_frame" : "negro"
																	}
													},
										"color_crystal" : {
															"color_cryistal" : "verde"
															},								
										"price" : 99.5
									},
						"orders" : {
										"customer" : {
														"name" : "Jonh",
														"postar_address" : "calle loreto, 5, 1º 1a",
														"phone" : "632632632",
														"email" : "jonh@gmail.com",
														"register_date" : new Date("2021-01-18T16:00:00Z"),
														"customer_recommended" : "Null"
													},
										"employee" : {
														"name" : "Eric"
													},
										"order_date" : new Date("2021-01-19T16:00:00Z"),
										"total_price" : "99.5"
									},
						"quantity" : 1,
						"price" : 99.5
						}
},

{
	"product_order" : {
						"glasses" : {
										"brand" : {
													"name" : "Dolce & Gabbana",
													"provider" : {
																	"name" : "Dolce & Gabbana",
																	"street" : "Plaça catalunya",
																	"number" : "225",
																	"floor" : "planta 4",
																	"door" : "3a",
																	"city" : "Barcelona",
																	"postal_code" : "08028",
																	"country" : "España",
																	"phone" : "938745123",
																	"fax" : "932145876",
																	"nif" : "47142445"
																}
													},
										"graduation_left" : 0.4,
										"graduation_right" : 0.5,
										"frame" : {
													"frame_type" : "metalica",
													"color_frame" : {
																		"color_frame" : "blanco"
																	}
													},
										"color_crystal" : {
															"color_cryistal" : "oscuro"
															},								
										"price" : 110.5
									},
						"orders" : {
										"customer" : {
														"name" : "Pepe",
														"postar_address" : "calle santa eulalia, 4, 1º 1a",
														"phone" : "654654654",
														"email" : "pepe@gmail.com",
														"register_date" : new Date("2021-01-23T16:00:00Z"),
														"customer_recommended" : "jonh@gmail.com"
													},
										"employee" : {
														"name" : "Jorge"
													},
										"order_date" : new Date("2021-01-23T16:00:00Z"),
										"total_price" : "210"
									},
						"quantity" : 2,
						"price" : [99.5, 110.5]
						}
},

{
	"product_order" : {
						"glasses" : {
										"brand" : {
													"name" : "Dior",
													"provider" : {
																	"name" : "Dior",
																	"street" : "Gran Via de les Corts Catalanes",
																	"number" : "465",
																	"floor" : "entresuelo",
																	"door" : "2a",
																	"city" : "Barcelona",
																	"postal_code" : "08014",
																	"country" : "España",
																	"phone" : "933225478",
																	"fax" : "932668741",
																	"nif" : "47945631"
																}
													},
										"graduation_left" : 1.4,
										"graduation_right" : 1.1,
										"frame" : {
													"frame_type" : "flotant",
													"color_frame" : {
																		"color_frame" : "metal"
																	}
													},
										"color_crystal" : {
															"color_cryistal" : "transparente"
															},								
										"price" : 209.5
									},
						"orders" : {
										"customer" : {
														"name" : "Marta",
														"postar_address" : "Avenida Madrid, 25, 4º 2a",
														"phone" : "636975874",
														"email" : "Maria@gmail.com",
														"register_date" : new Date("2021-01-26T16:00:00Z"),
														"customer_recommended" : "pepe@gmail.com"
													},
										"employee" : {
														"name" : "Maria"
													},
										"order_date" : new Date("2021-01-27T16:00:00Z"),
										"total_price" : "419.5"
									},
						"quantity" : 3,
						"price" : [99.5, 110.5, 209.5]
						}
}
  ];
  dbo.collection("optica").insertMany(myobj, function(err, res) {
    if (err) throw err;
    console.log("Number of documents inserted: " + res.insertedCount);
    db.close();
  });
});