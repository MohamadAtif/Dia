const express = require("express");
const searchRouter = express.Router();
const auth = require("../middlewares/auth");

const { getProductsBySearch, getProductsHighRatedBySearch } = require("../controllers/searchController");

searchRouter.get("/api/products/search/:name", auth, getProductsBySearch);


searchRouter.get("/api/products/search/highest-rated/:name", auth, getProductsHighRatedBySearch);



module.exports = searchRouter;