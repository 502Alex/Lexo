const mysql = require('mysql');
const{promisify}=require('util');
const {database}=require('./keys');
const pool = mysql.createPool(database);

pool.getConnection((err,connection)=>{
    if(err){
if(err.code === 'PROTOCOL_CONNECTION_LOST')
{
console.error('la coneccion se cerro');

}
if(err.code === 'ER_CON_COUNT_ERROR'){
 console.error('la base  de datos no conecta');
}
if(err.code === 'ECONNREFUSED'){
  console.error('Algun parametro de conexion esta mal');
}

    }
    if(connection) connection.release();
    console.log('la conexion con la base de datos fue un exito');
    return;
});
//habilitar promesas
pool.query = promisify(pool.query);
module.exports = pool;
