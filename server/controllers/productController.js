const { Product } = require("../models/product");

const mongoose=require('mongoose');

module.exports={
   
     //recentlyAdded 25 Product
    getAllProducts :  async (req, res) => {
        try {
           var limit= parseInt(25)
          // var limit = parseInt(req.body.limit);
          // var skip = (parseInt(req.body.page)-1) * parseInt(limit);
          const products = await Product.find({}).sort({dateCreated: -1}).limit(limit);
          res.json(products);
       
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      },

      getAllProductsByCategory : async (req, res) => {
        try {
          var page= parseInt(req.body.page) ;
           var limit = parseInt(req.body.limit);
          var skip = (parseInt(page)-1) * parseInt(limit);
          const products = await Product.find({ category: req.query.category }).skip(skip).limit(limit);
          res.json(products);
          // console.log(products);
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      },
      // create a get request to search products and get them
    
    
    rateProduct : async (req, res) => {
        try {
          const { id, rating } = req.body;
          let product = await Product.findById(id);
      // i = number of rating in list 
          for (let i = 0; i < product.ratings.length; i++) {
           
            if (product.ratings[i].userId == req.user) {
             
             
              product.ratings.splice(i, 1);
          
              break;
            }
          }
      
          const ratingSchema = {
            userId: req.user,
            rating,
          };
      
          product.ratings.push(ratingSchema);
          product = await product.save();
          res.json(product);
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      },

      getTopRated:async (req, res) => {
        try {
          var limit= parseInt(5)
          let products = await Product.find({}).limit(limit);
      
          products = products.sort((a, b) => {
            let aSum = 0;
            let bSum = 0;
      
            for (let i = 0; i < a.ratings.length; i++) {
              // aSum =aSum + a.ratings[i].rating;
              aSum += a.ratings[i].rating;
          
            }
      
            for (let i = 0; i < b.ratings.length; i++) {
              bSum += b.ratings[i].rating;
             
            }
            return aSum < bSum ? 1 : -1;
          });
      
          res.json(products[0]);
          

        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      }
    }
    
//upload file 
// const FILE_TYPE_MAP={
//     'image/png':'png',
//     'image/jpg':'jpg',
//     'image/jpeg':'jpeg',

// }
// const storage = multer.diskStorage({
//     destination: function (req, file, cb) {
//         // const isValid=FILE_TYPE_MAP[file.mimetype];
//         // let uploadError= new Error('invalid image type');
//         // if (isValid){
//         //     uploadError=null
//         // }
    
//       cb(uploadError, '/uploads/images')
//     },
//     filename: function (req, file, cb) {
//     //   const fileName=file.originalname.spilit(' ').join('-');
//     //   const extension=FILE_TYPE_MAP[file.mimetype]
//       cb(null, file.fieldname + '-' + Date.now()  +'.png')
//     }
//   })
  
//   const uploadOptions = multer({ storage: storage })


//simple upload file

// const storage = multer.diskStorage({
//     destination: function (req, file, cb) {

//       cb(uploadError, 'uploads/images')
//     },
//     filename: function (req, file, cb) {

//       cb(null, file.fieldname + '-' + Date.now()  + '.png')
//     }
//   })
  
//   const uploadOptions = multer({ storage: storage }).single('image')