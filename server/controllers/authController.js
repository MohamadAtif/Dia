const  User  = require("../models/user");
const bcryptJs=require('bcryptjs');
const jwt=require('jsonwebtoken');

module.exports={
      
    sighUp : async (req,res)=>{
        try {
       const{name,email,password,phone}=req.body;
       const exitingUser = await User.findOne({email}); 
     if(exitingUser){
      return res.status(400).json({msg:'User Already Exists!'})
     }
     const hashedPassword= await bcryptJs.hash(password,8)
     let user=new User({
        email ,
        password:hashedPassword,
        name,
        phone
     })
     user=await user.save();
     res.json({user});
    } catch (e) {
       res.status(500).json({
          error:e.message
       })
    }
  },

  signIn: async (req,res)=>{
    try {
       const{email,password}=req.body;
       const user = await User.findOne({email}); 
     if(!user){
      return res.status(400).json({msg:'User with this Email does not Exist!'})
     }
     const isMatch= await bcryptJs.compare(password,user.password)
     if(!isMatch){
       return res.status(400).json({msg:'Incorrect Password!'})
     }
    const token= jwt.sign({id:user._id},"passwordKey");
   res.json({token,...user._doc});
 
    } catch (e) {
       res.status(500).json({
          error:e.message
       })
    }
  },

   tokenIsValid: async (req,res)=>{
    try {
       const token =req.header('x-auth-token');
            if(!token)res.json(false);
      const verified = jwt.verify(token,'passwordKey')
      if(!verified) res.json(false);
      const user=await User.findById(verified.id);
      if(!user)res.json(false);
      res.json(true);
 
    } catch (e) {
       res.status(500).json({
          error:e.message
       })
    }
  }, 

  getUserByID:  async(req,res)=>{
    const user =await User.findById(req.user);
    res.json({...user._doc , token:req.token})
    }






}