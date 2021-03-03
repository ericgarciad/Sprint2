db = db.getSiblingDB("pizzeria");
db.dropDatabase();

db.customers.insertMany([

{
	"customer_id" : 1,
    "name" : 'Eric',
    "surname1" : "Garcia",
	"surname2" : "Domingo",
    "address" : {
        "street" : 'Calle palacions',
        "number" : 5,
        "floor" : 1,
        "door" : 2,
        "province" : {
					"name" : "Barcelona",
					"locality" : ["Barcelona"]
		},
        "city" : 'Barcelona',
        "zip" : 08014
    },
	"phone" : "659669587",
    orders: [
	{
			"order_date_hour" : new Date("2021-01-19T15:00:00Z"),
			"type_order" : "domicilio",
			"delivery_date_hour" : new Date("2021-01-19T16:00:00Z"),
			"employees_id" : 1,
			"shop_id" : 1,
			"product_order" : [
			{
			"pizza_id" : 1,
			"quantity_pizza" : 1
			},
			{
			"pizza_id" : 2,
			"quantity_pizza" : 1
			},			
			{
			"butrger_id" : "Null",
			"quantity_burger" : 0
			},
			{
			"drink_id" : 6,
			"quantity_drink" : 1
			},
			{
			"drink_id" : 7,
			"quantity_drink" : 1
			}			
			],
			"total_price" : 25
		
	}]
},
{
	"customer_id" : 2,
    "name" : 'Jorge',
    "surname1" : "Lopez",
	"surname2" : "Cuñez",
    "address" : {
        "street" : "Calle san francisco",
        "number" : 45,
        "floor" : 2,
        "door" : 1,
        "province" : {
					"name" : "Girona",
					"locality" : ["Girona"]
		},
        "city" : 'Girona',
        "zip" : 08023
    },
	"phone" : "614258746",
    orders: [
	{
			"order_date_hour" : new Date("2021-01-20T15:00:00Z"),
			"type_order" : "domicilio",
			"delivery_date_hour" : new Date("2021-01-20T15:30:00Z"),
			"employees_id" : 3,
			"shop_id" : 2,
			"product_order" : [
			{
			"pizza_id" : 1,
			"quantity_pizza" : 1
			},			
			{
			"butrger_id" : 5,
			"quantity_burger" : 1
			},
			{
			"drink_id" : 6,
			"quantity_drink" : 1
			},
			{
			"drink_id" : 7,
			"quantity_drink" : 1
			}			
			],
			"total_price" : 20
		
	}]
},
{
	"customer_id" : 3,
    "name" : 'Maria',
    "surname1" : "Gomez",
	"surname2" : "Cifuentes",
    "address" : {
        "street" : "Calle los santos 234",
        "number" : 3,
        "floor" : 5,
        "door" : 1,
        "province" : {
					"name" : "Tarragona",
					"locality" : ["Calafell"]
		},
        "city" : 'Calafell',
        "zip" : 08054
    },
	"phone" : "631247958",
    orders: [
	{
			"order_date_hour" : new Date("2021-01-21T18:00:00Z"),
			"type_order" : "domicilio",
			"delivery_date_hour" : new Date("2021-01-21T18:30:00Z"),
			"employees_id" : 5,
			"shop_id" : 3,
			"product_order" : [
			{
			"pizza_id" : 1,
			"quantity_pizza" : 1
			},			
			{
			"butrger_id" : "Null",
			"quantity_burger" : 0
			},
			{
			"drink_id" : "Null",
			"quantity_drink" : 0
			}			
			],
			"total_price" : 10
		
	}]
}	
]);


db.product.insertMany([
				{
					"product_id" : 1,
	                "name" : "pizza",
					"description" : "margarita",
					"image" : "margarita.jpg",
					"price" : 10,
					"category" : {
									"name" : "basica"
								}
				},
				{
					"product_id" : 2,
	                "name" : "pizza",
					"description" : "hawaiana",
					"image" : "hawaiana.jpg",
					"price" : 10,
					"category" : {
									"name" : "elaborada"
								}
				},
				{
					"product_id" : 3,
	                "name" : "pizza",
					"description" : "barbacoa",
					"image" : "barbacoa.jpg",
					"price" : 10,
					"category" : {
									"name" : "elaborada"
								}
				},
				{
					"product_id" : 4,
	                "name" : "pizza",
					"description" : "romana",
					"image" : "romana.jpg",
					"price" : 10,
					"category" : {
									"name" : "elaborada"
								}
				},
				{
					"product_id" : 5,
	                "name" : "burger",
					"description" : "cuatro_quesos",
					"image" : "cuatro_quesos.jpg",
					"price" : 5,
					"category" : {
									"name" : "NULL"
								}
				},				
				{
					"product_id" : 6,
	                "name" : "drink",
					"description" : "cerveza",
					"image" : "cerveza.jpg",
					"price" : 2.5,
					"category" : {
									"name" : "NULL"
								}
				},
				{
					"product_id" : 7,
	                "name" : "drink",
					"description" : "fanta",
					"image" : "fanta.jpg",
					"price" : 2.5,
					"category" : {
									"name" : "NULL"
								}
				}				

]);

db.shop.insertMany([
{
    "shop_id" : 1,
    "address" : {
        "street" : "Plaça espanya",
        "number" : 23,
		"door" : "baixos",
        "province" : {
					"name" : "Barcelona",
					"locality" : ["Barcelona"]
		},
        "postal_code" : "08028"
    },
    "employees" : [
        {
		"employee_id" : 1,
		"name" : "Joan",
		"surname1" : "Carrasco",
		"surname2" : "Lopez",
		"nif" : "47845214F",
		"phone" : "659557468",
		"type_employee" : "repartidor"
        }
    ]
},
{
    "shop_id" : 2,
    "address" : {
        "street" : "Avinguda Hospitalet de Llobregat",
        "number" : 43,
		"door" : "baixos",
        "province" : {
					"name" : "Girona",
					"locality" : ["Girona"]
		},
        "postal_code" : "08023"
    },
    "employees" : [
        {
		"employee_id" : 2,
		"name" : "Carla",
		"surname1" : "Pérez",
		"surname2" : "Liper",
		"nif" : "47846514J",
		"phone" : "656457445",
		"type_employee" : "cuiner"
        },
		{
		"employee_id" : 3,
		"name" : "Laia",
		"surname1" : "Garcia",
		"surname2" : "Pérez",
		"nif" : "47845124P",
		"phone" : "632587469",
		"type_employee" : "repartidor"
        }
    ]
},
{
    "shop_id" : 3,
    "address" : {
        "street" : "Gran via de Calafell",
        "number" : 123,
		"door" : "baixos",
        "province" : {
					"name" : "Tarragona",
					"locality" : ["Calafell"]
		},
        "postal_code" : "43700"
    },
    "employees" : [
        {
		"employee_id" : 4,
		"name" : "Florent",
		"surname1" : "Liz",
		"surname2" : "Camilo",
		"nif" : "47852145B",
		"phone" : "632587452",
		"type_employee" : "cuiner"
        },
		{
		"employee_id" : 5,
		"name" : "Pepe",
		"surname1" : "Garcia",
		"surname2" : "Lorca",
		"nif" : "47845567L",
		"phone" : "634327469",
		"type_employee" : "repartidor"
        }
    ]
}
]);
