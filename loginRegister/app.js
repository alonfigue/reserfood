//1 invocar a express
const express = require('express');
const app = express();

// setear irleancode para capturar datos del formulario
app.use(express.urlencoded({extended: false }));
app.use(express.json());

// invocar dotenv
const dotenv = require('dotenv');
dotenv.config({path:'./env/.env'});

// directorio public
app.use('/recursos', express.static('public'));
app.use('/recursos', express.static(__dirname + '/public'));

//Motor de plantillas ejs
app.set('view engine', 'ejs');

//hashing
const bcryptjs = require('bcryptjs');

// varible de sesion 
const session = require('express-session');
app.use(session({
    secret:'secret', 
    resave: true,
    saveUninitialized: true
}));


// invocar conexion
const pool = require('./database/db');

app.get('/login', (req, res) => {
    res.render('login');
})
app.get('/register', (req, res) => {
    res.render('register');
})

//registro
app.post('/register', async (req, res) => {
    const user = req.body.user;
    const name = req.body.name;
    const rol = req.body.rol;
    const pass = req.body.pass;

    console.log(user);
    let passwordHash = await bcryptjs.hash(pass, 3);
    const querysentence = ('INSERT INTO users ("user",pass,nombre,rol) VALUES ($1, $2, $3, $4)');
    const value = [user, passwordHash, name, rol];
    try{
        pool.query(querysentence, value);
        res.render('register', {
            alert: true,
            alertTitle: "Registro",
            alertMessage: "Registro Exitoso!",
            alertIcon: 'sucess',
            showConfirmButton:false,
            timer:1500,
            ruta:''
        })
    }
    catch (e) {
        console.log(e);
    }
})

//login
app.post('/auth', async (req,res) => {
    const user = req.body.user;
    const password = req.body.pass;
    let passwordHash = await bcryptjs.hash(password, 3);
    if (user && password){
        pool.query('SELECT * FROM users WHERE "user" = $1', [user], async (error, { rows })=>{
            if(rows.length === 0 || !(await bcryptjs.compare(password, rows[0].pass))){
                res.render('login',{
                    alert:true,
                    alertTitle: "Error",
                    alertMessage: "USUARIO y/o PASSWORD incorrectas",
                    alertIcon:'error',
                    showConfirmButton: true,
                    timer: false,
                    ruta: 'login'    
                });
            } else {          
                req.session.loggedin = true;                
                req.session.name = rows[0].rol;
                res.render('login', {
                    alert: true,
                    alertTitle: "Conexión exitosa",
                    alertMessage: "¡LOGIN CORRECTO!",
                    alertIcon:'success',
                    showConfirmButton: false,
                    timer: 1500,
					ruta: ''
				});        			
			}			
			res.end();
		});
	} else {	
		res.send('Please enter user and Password!');
		res.end();
	}
});

//autenticar pages. Método para controlar que está auth en todas las páginas
app.get('/', (req, res)=> {
	if (req.session.loggedin) {
		res.render('index',{
			login: true,
			name: req.session.name			
		});		
	} else {
		res.render('index',{
			login:false,
			name:'Debe iniciar sesión',			
		});				
	}
	res.end();
});


//función para limpiar la caché luego del logout
app.use(function(req, res, next) {
    if (!req.user)
        res.header('Cache-Control', 'private, no-cache, no-store, must-revalidate');
    next();
});

 //Logout. Destruye la sesión.
app.get('/logout', function (req, res) {
	req.session.destroy(() => {
	  res.redirect('/') // siempre se ejecutará después de que se destruya la sesión
	})
});

app.listen(3000, (req, res) => {
    console.log('servidor corriendo en el puerto 3000');
})