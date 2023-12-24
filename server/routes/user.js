const express = require("express");
const userRouter = express.Router();
const auth = require("../middlewares/auth");

const { addToCart, removeFromCart, postUserAddress, postOrder, getOrders } = require("../controllers/userController");

userRouter.post("/api/add-to-cart", auth, addToCart);

userRouter.delete("/api/remove-from-cart/:id", auth, removeFromCart);
// save user address
userRouter.post("/api/save-user-address", auth, postUserAddress);

userRouter.post("/api/order", auth, postOrder);

userRouter.get("/api/orders/me", auth, getOrders);

module.exports = userRouter;
