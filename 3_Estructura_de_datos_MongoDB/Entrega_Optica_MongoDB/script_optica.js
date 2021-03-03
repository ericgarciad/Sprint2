db = db.getSiblingDB("optica");
db.dropDatabase();

db.customers.insertMany([

{
	"customer_id" : 1,
	"name" : "Jonh",
	"phone" : "632632632",
	"email" : "jonh@gmail.com",
	"register_date" : new Date("2021-01-18T16:00:00Z"),
	"customer_recommended" : "Null",
	"address" : {
		"street" : "calle loreto",
		"number" : 5,
		"door" : 1,
		"city" : "Barcelona",
		"postal_code" : "08014"
	},
	"orders": [
		{
			"provider_id" : 1,
			"brand" : "Ray Ban",
			"product_order" : {
								"graduation_left" : 2.4,
								"graduation_right" : 2.1,
								"frame_type" : "pasta",
								"color_frame" : "negro",
								"color_crystal" : "verde",
								"price" : 99.5
			},
			"employee" : {
							"employee_id" : 1,
							"name" : "Eric"
			}
		
		}
	
	
	]

},
{
	"customer_id" : 2,
	"name" : "Pepe",
	"phone" : "654654654",
	"email" : "pepe@gmail.com",
	"register_date" : new Date("2021-01-23T16:00:00Z"),
	"customer_recommended" : "jonh@gmail.com",
	"address" : {
		"street" : "calle santa eulalia",
		"number" : 4,
		"door" : 1,
		"city" : "Barcelona",
		"postal_code" : "08028"
	},
	"orders": [
		{
			"provider_id" : 1,
			"brand" : "Ray Ban",
			"product_order" : {
								"graduation_left" : 2.4,
								"graduation_right" : 2.1,
								"frame_type" : "pasta",
								"color_frame" : "negro",
								"color_crystal" : "verde",
								"price" : 99.5
			},
			"employee" : {
							"employee_id" : 1,
							"name" : "Eric"
			}
		
		},	
		{
			"provider_id" : 2,
			"brand" : "Dolce & Gabbana",
			"product_order" : {
								"graduation_left" : 0.4,
								"graduation_right" : 0.5,
								"frame_type" : "metalica",
								"color_frame" : "blanco",
								"color_crystal" : "oscuro",
								"price" : 110.5
							},
			"employee" : {
							"employee_id" : 2,
							"name" : "Jorge"
						}
		
		}		
	
	
	]

},
{
	"customer_id" : 3,
	"name" : "Marta",
	"phone" : "636975874",
	"email" : "Maria@gmail.com",
	"register_date" : new Date("2021-01-27T16:00:00Z"),
	"customer_recommended" : "pepe@gmail.com",
	"address" : {
		"street" : "Avenida Madrid",
		"number" : 25,
		"door" : 4,
		"city" : "Barcelona",
		"postal_code" : "08028"
	},
	"orders": [
		{
			"provider_id" : 1,
			"brand" : "Ray Ban",
			"product_order" : {
								"graduation_left" : 2.4,
								"graduation_right" : 2.1,
								"frame_type" : "pasta",
								"color_frame" : "negro",
								"color_crystal" : "verde",
								"price" : 99.5
			},
			"employee" : {
							"employee_id" : 1,
							"name" : "Eric"
			}
		
		},	
		{
			"provider_id" : 2,
			"brand" : "Dolce & Gabbana",
			"product_order" : {
								"graduation_left" : 0.4,
								"graduation_right" : 0.5,
								"frame_type" : "metalica",
								"color_frame" : "blanco",
								"color_crystal" : "oscuro",
								"price" : 110.5
							},
			"employee" : {
							"employee_id" : 2,
							"name" : "Jorge"
						}
		
		},
		{
			"provider_id" : 3,
			"brand" : "Dior",
			"product_order" : {
								"graduation_left" : 1.4,
								"graduation_right" : 1.1,
								"frame_type" : "flotant",
								"color_frame" : "metal",
								"color_crystal" : "transparente",
								"price" : 209.5
							},
			"employee" : {
							"employee_id" : 3,
							"name" : "Maria"
						}
		
		}		
		
	
	
	]

}
]);


db.provider.insertMany([
{
    "provider_id" : 1,
	"nif" : "45846542",
    "brand": ["Ray Ban"],
    "name": "Ray Ban",   
    "address": {
        "street": "Avenida Madrid",
        "number": "10-15",
        "floor": "entresuelo",
        "door": 1,
        "zip": "08032",
        "city": "Barcelona",
        "country": "España"
    },
    "phone": "933554179",
    "fax": "933665878"
},
{
    "provider_id" : 2,
	"nif" : "47142445",
    "brand": ["Dolce & Gabbana"],
    "name": "Dolce & Gabbana",   
    "address": {
        "street": "Plaça catalunya",
        "number": "225",
        "floor": "planta 4",
        "door": 3,
        "zip": "08028",
        "city": "Barcelona",
        "country": "España"
    },
    "phone": "938745123",
    "fax": "932145876"
},
{
    "provider_id" : 3,
	"nif" : "47945631",
    "brand": ["Dior"],
    "name": "Dior",   
    "address": {
        "street": "Gran Via de les Corts Catalanes",
        "number": "465",
        "floor": "planta 4",
        "door": 3,
        "zip": "08024",
        "city": "Barcelona",
        "country": "España"
    },
    "phone": "933225478",
    "fax": "932668741"
}



]);
