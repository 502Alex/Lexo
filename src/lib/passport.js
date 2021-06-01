const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const pool = require('../database');
const helpers = require('../lib/helpers');

passport.use('local.signin', new LocalStrategy({
usernameField: 'Nombre_Usuario',
passwordField: 'Usuario_contraseña',
passReqToCallback: true  
}, async(req,Nombre_Usuario,Usuario_contraseña,done)=>{
    const rows = await pool.query('SELECT * FROM users(vendedores) WHERE Usuario_cont =?',[Nombre_Usuario]);
    if(rows.length > 0){
      const user = rows[0];
      const validPassword = await helpers.matchPassword(Usuario_contraseña,user.Usuario_contraseña);
      if(validPassword){
          done(null,user,req.flash('success','Bienvenido Usuario: ', +user.Nombre_Usuario));
      }
      else{
          done(null,user,req.flash('message','Error contraseña no valida'));

      }
    }
      else{
          return done(null,false,req.flash('message', 'Error usuario no existente'));
      }

    

}));
passport.use('local.singup', new LocalStrategy({
    sernameField: 'Nombre_Usuario',
    passwordField: 'Usuario_contraseña',
    passReqToCallback: true 
}, async(req,Nombre_Usuario,Usuario_contraseña)=>{
   const {ID}= req.body; 
   const {Nombre_y_Apellido}= req.body;
   const {Residencia}= req.body;
   const {Telefono}= req.body; 
   const {Correo_electronico}= req.body;
   const newUser={
    ID,
    Nombre_Usuario,
    Nombre_y_Apellido,
    Usuario_contraseña,
    Residencia,
    Telefono,
    Correo_electronico
   };
   try{
       newUser.Usuario_contraseña = await helpers.eencryptPasword(newUse.Usuario_contraseña);
        const result = await pool.query('INSERT INTO users(vendedores)  SET ?',[newUser]); 
        newUser.ID = result.insertid;// 
        return done(null,newUser);
    }
   catch(e){
   console.log(e);
}
}));
passport.serializeUser((user,done)=>{
    done(null,user.id);
});
passport.deserializeUser(async(id,done)=>{
const rows= await pool.query('SELECT * FROM users(vendedores) WHERE ID  = ?',[id]);
done(null,rows[0]);

});