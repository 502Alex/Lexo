const bcrypt = require('bcryptjs');
const helpers ={};
helpers.encryptPasword= async(Usuario_contraseña)=>{
try{

    const salt = await bcrypt.genSalt(10);
    const hash = await bcrypt.hash(Usuario_contraseña,salt);
    return hash;

}catch(e){
 console.log(e);

}};
helpers.matchPassword = async(Usuario_contraseña, contraseñaguar)=>{
try{

    return await bcrypt.compare(Usuario_contraseña,contraseñaguar);
}
catch(e){
    console.log(e);
}

};
module.exports = helpers;