const express = require("express");
const productRouter = express.Router();
const auth = require("../middlewares/auth");
const { getAllProducts, getAllProductsByCategory, rateProduct, getTopRated } = require("../controllers/productController");


productRouter.get("/api/get-all-products",auth, getAllProducts);

productRouter.get("/api/products/", auth, getAllProductsByCategory);

productRouter.post("/api/rate-product", auth, rateProduct);

productRouter.get("/api/top-rated", auth, getTopRated);

//productRouter.get("/api/products/search/:name", auth, getProductsBySearch);
module.exports = productRouter;
