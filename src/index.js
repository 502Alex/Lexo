const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const path = require('path');
const flash = require('connect-flash');
const session = require('express-session');
const MySQLStore = require('express-mysql-session');
const passport = require('passport');
const {database} = require('./keys'); 

const app = express();
require('./lib/passport');
//configuracion de puerto
app.set('port',process.PORT || 4000);
//se toma direccion actual para jalar carpeta de vistas
app.set('views',path.join(__dirname,'views'));
//motor de visitas handle
app.engine('.hbs',exphbs({

    derfaultLayout:'main',
    layoutsDir: path.join(app.get('views'),'layouts'),
    partialsDir: path.join(app.get('views'),'partials'),
    extname: '.hbs',
    helpers: require('./lib/handlebars')

}));
//funcionamiento
app.set('view engine','.hbs');
//armar milddlewares
app.use(session({//guada toda las sessiones
secret: 'session',
resave: false,
saveUninitialized: false,
store: new MySQLStore(database)

}));
app.use(flash());//mensajes de eeror 
app.use(morgan('dev'));//resivir en consola 
app.use(express.urlencoded({extended:false}));//utiliza expres
app.use(expres.json());//paquetees .js
app.use(passport.initialize());//inicia paspotr
app.use(passpot.session());

//variables globales
app.use((req,res, next)=>{
   app.locals.success = req.flash('success');
   app.locals.message = req.flash('message');
   app.locals.user = req.user;
   next();

});
//rutas 

app.use(require('./routes'));
app.use(require('./routes/authentication'));
app.use('principal', require('./routes/principal'));
//archivos publicos
app.use(express.static(path.join(__dirname, 'public')));
//iniciar el server
app.listen(app.get('port'), ()=>{
    console.log('servidor corriendo :) en: ', app.get('port'));

});