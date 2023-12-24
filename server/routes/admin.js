const express = require("express");
const adminRouter = express.Router();
const admin = require("../middlewares/admin");
const { PromiseProvider } = require("mongoose");
const { addProduct, getAllProductByAdmin, deleteProduct, getOrdersByAdmin, changeOrderStatusByAdmin, fetchAnalitics } = require("../controllers/adminController");

// Add product
adminRouter.post("/admin/add-product", admin, addProduct);

// Get all your products
adminRouter.get("/admin/get-products", admin, getAllProductByAdmin);

// Delete the product
adminRouter.post("/admin/delete-product", admin, deleteProduct);

adminRouter.get("/admin/get-orders", admin, getOrdersByAdmin);

adminRouter.post("/admin/change-order-status", admin, changeOrderStatusByAdmin);

adminRouter.get("/admin/analytics", admin, fetchAnalitics );


module.exports = adminRouter;
