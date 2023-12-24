const express=require('express');
const authRouter=express.Router();
const auth = require('../middlewares/auth');
const { sighUp, signIn, tokenIsValid, getUserByID } = require('../controllers/authController');


 authRouter.post('/api/signup',sighUp)

authRouter.post('/api/signin',signIn)

authRouter.post('/tokenIsValid',tokenIsValid)

authRouter.get('/',auth,getUserByID )

module.exports=authRouter;

