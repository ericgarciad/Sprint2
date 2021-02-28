var MongoClient = require('mongodb').MongoClient;  
var url = "mongodb://localhost:27017/pizzerias";  
MongoClient.connect(url, {useUnifiedTopology: true}, function(err, db) {  
if (err) throw err;  
console.log("Database created!");  
db.close();  
});  

var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/";

MongoClient.connect(url, {useUnifiedTopology: true}, function(err, db) {
  if (err) throw err;
  var dbo = db.db("pizzerias");
  dbo.createCollection("pizzeria", function(err, res) {
    if (err) throw err;
    console.log("Collection created!");
    db.close();
  });
});