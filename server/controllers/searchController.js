const { Product } = require("../models/product");

const mongoose=require('mongoose');

module.exports={

      // create a get request to search products and get them
       //api/products/search/i
       getProductsBySearch :  async (req, res) => {
        try {
            var limit= parseInt(25)
            // var limit = parseInt(req.body.limit);
            // var skip = (parseInt(req.body.page)-1) * parseInt(limit);
          const products = await Product.find({
            name: { $regex: req.params.name, $options: "i" },
          }).limit(limit);
      
          res.json(products);
         
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      },

      getProductsHighRatedBySearch :  async (req, res) => {
        try {
            var limit= parseInt(25)
          const products = await Product.find({
            name: { $regex: req.params.name, $options: "i" },
          }).sort({ratings :-1}).limit(limit);
      
          res.json(products);
         
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      },
   

      
    }