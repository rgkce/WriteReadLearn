const express = require('express')
const mongoose = require('mongoose')
var bodyParser = require("body-parser");
const userRoutes = require('./routes/userRoutes')
const app = express()

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

const databaseURL = 'mongodb+srv://mongodb+srv://rumeysa:rumeysa@writereadlearn.ztyqstl.mongodb.net/'
mongoose.connect(databaseURL) //hata verirse -> dbURL, {useNewUrlParser: true , useUnifiedTopology: true}
    .then((result) => console.log('MongoDB veritabanı bağlantısı kuruldu.'))
    .catch((err) => console.log(err))

app.listen(3000)

app.get("/", (req,res) => {
    res.send("API | Active")
})

app.use('/api', userRoutes)