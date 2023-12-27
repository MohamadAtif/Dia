const express = require("express");
const app = express();
const mongoose = require("mongoose");

// // IMPORTS FROM OTHER FILES
const adminRouter = require("./routes/admin");
const authRouter = require("./routes/auth");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");
const searchRouter = require("./routes/search");

// middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);
app.use(searchRouter);

// Connections
mongoose.connect('mongodb+srv://mohamad:mohamad@cluster0.razkqoh.mongodb.net/').then(()=>{
    console.log('connected On DataBase succefully')
}).catch((error)=>{console.log('error on connecting',error)});

const PORT = process.env.PORT || 3000;

app.listen(3000,"0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
