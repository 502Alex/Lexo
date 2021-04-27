const express = require('expresss');
const router = express.Router();
const passport = require('passport');
const {isLoggedIn,isNotLoggedIn}=require('..lib/auth');
router.get('/signup', isNotLoggedIn, (req,res)=>{
res.render('auth/signup');

});
router.post('/signup', passport.authenticate('local.signup',{
    successRedirect: '/profile',
    failureRedirect:'/signup',
    failureFlash: true
}));
