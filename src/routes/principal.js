const express = require('express');
const router = express.Router();

const pool = require('../database');
const {isLoggedIn} = require('../lib/auth');

router.get('/Compra_de_Producto',(req,res)=>{

    res.render('links/Compra');
    
    
    });


router.get('/nuvo_producto',(req,res)=>{

res.render('links/nevoprod');


});


router.get('/vista_producto',(req,res)=>{

res.render('links/vistaprod');
    
    });


router.post('/nuvo_producto',async(req,res)=>{
const{nombre} = req.body;
const{Existencia} = req.body;
const{tipo} = req.body;
const{Precio_costo} = req.body;
const{Precio} = req.body;
const nuevo={
nombre,
Existencia,
tipo,
Precio_costo,
Precio
}

})

router.post('/añadir_producto',async(req,res)=>{
    const{codigo_prod} = req.body;
    const{cantidad_prod} = req.body;
    const nuevo={


        
    }
   
})
    
router.post('/añadir_compra',async(req,res)=>{
        const{nombre_cliente} = req.body;
        const{nit} = req.body;
       
})
        

module.exports = router;



