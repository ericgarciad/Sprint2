var MongoClient = require('mongodb').MongoClient;  
var url = "mongodb://localhost:27017/opticas";  
MongoClient.connect(url, {useUnifiedTopology: true}, function(err, db) {  
if (err) throw err;  
console.log("Database created!");  
db.close();  
});  

var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/";

MongoClient.connect(url, {useUnifiedTopology: true}, function(err, db) {
  if (err) throw err;
  var dbo = db.db("opticas");
  dbo.createCollection("optica", function(err, res) {
    if (err) throw err;
    console.log("Collection created!");
    db.close();
  });
});