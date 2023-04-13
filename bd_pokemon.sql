drop database if exists bd_pokemon;
create database bd_pokemon;
use bd_pokemon;

create table ligas (
ganador varchar (50) not null,
lideres varchar (50) not null,
idliga int not null,
primary key (idliga)
);

create table entrenadores (
nombre varchar (50) not null,
apellidos varchar (50) not null,
edad int not null,
identrenador int not null,
idliga int not null,
primary key (identrenador)
);

create table pokemon (
nombre varchar (50) not null,
idpokemon int not null,
nombre_entrenador varchar (50),
descripcion varchar (50),
identrenador int not null,
primary key (idpokemon)
);

create table tipo (
idtipo int not null,
nombre varchar (50) not null,
fuerte_contra varchar (50) not null,
debil_contra varchar (50) not null,
idpokemon int not null,
primary key (idtipo)
);
create table asistencia (
idcentropokemon int not null,
nombre_centro varchar (50) not null,
areadeintercambio varchar (50)  not null,
primary key (idcentropokemon)
);

create table puedentener (
idpokemon int not null,
idcentropokemon int not null,
primary key (idpokemon, idcentropokemon)
);

create table gimnasios (
idgimnasio int not null,
tipo varchar (50) not null,
lider varchar (50) not null,
nombre varchar (50) not null,
primary key (idgimnasio)
);

create table combaten (
idgimnasio int not null,
identrenador int not null,
primary key (idgimnasio, identrenador)
);

create table ciudades (
idciudad int not null,
nombre varchar (50) not null,
descripcion varchar (150),
primary key (idciudad)
);

create table van_a (
idciudad int not null,
identrenador int not null,
primary key (idciudad, identrenador)
);

create table tiendas (
idtienda int not null,
nombre_tienda varchar (50) not null,
objetos_de_curaciones boolean,
objetos_de_ayuda boolean,
idciudad int not null,
primary key (idtienda)
);

alter table entrenadores
add constraint fk_idliga  foreign key (idliga) references ligas (idliga);

alter table pokemon
add constraint fk_identrenador foreign key (identrenador) references entrenadores (identrenador);

alter table tipo
add constraint fk_idpokemon foreign key (idpokemon) references pokemon (idpokemon);

alter table puedentener
add constraint fk_idpokemon1 foreign key (idpokemon) references pokemon (idpokemon),
add constraint fk_idcentropokemon foreign key (idcentropokemon) references asistencia (idcentropokemon);

alter table combaten
add constraint fk_idgimnasio foreign key (idgimnasio) references gimnasios (idgimnasio),
add constraint fk_identrenador1 foreign key (identrenador) references entrenadores (identrenador);

alter table van_a
add constraint fk_idciudad foreign key (idciudad) references ciudades (idciudad),
add constraint fk_identrenador2 foreign key (identrenador) references entrenadores (identrenador);

alter table tiendas
add constraint fk_idciudad2 foreign key (idciudad) references ciudades (idciudad);

-- Datos de la base de datos 

-- Tabla Ligas
 
insert into ligas VALUES ('2','Pablo Alboran','1');
insert into ligas VALUES ('6','Pedro Sanchez','2');
insert into ligas VALUES ('7','Irene Montero','3');
insert into ligas VALUES ('4','Aitana','4');
insert into ligas VALUES ('8','Estopa','5');
insert into ligas VALUES ('1','Andy Lucas','6');
insert into ligas VALUES ('9','Knekro','7');
insert into ligas VALUES ('5','Rihanna','8');
insert into ligas VALUES ('10','Pepe Viyuela','9');
insert into ligas VALUES ('3','Pablo Iglesias','10');

-- Tabla entrenadores

insert into entrenadores VALUES ('Pedro', 'Picasso', '34', '1','6');
insert into entrenadores VALUES ('Ash', 'Ketchum', '22', '2','1');
insert into entrenadores VALUES ('Sergio', 'Canelita', '63', '3','10');
insert into entrenadores VALUES ('Mariano', 'Rajoy', '52', '4','4');
insert into entrenadores VALUES ('Pipi', 'Strada', '46', '5','8');
insert into entrenadores VALUES ('Hilary', 'Clinton', '51', '6','2');
insert into entrenadores VALUES ('El', 'Sevilla', '42', '7','3');
insert into entrenadores VALUES ('Santiago', 'Abascal', '44', '8','5');
insert into entrenadores VALUES ('Pablo ', 'Coelo', '78', '9','7');
insert into entrenadores VALUES ('Dayana', 'Jonhson', '22', '10','9');

-- Tabla Pokemon

insert into pokemon VALUES ('Pikachu','1','Pedro Picasso','Tipo Electrico','1');
insert into pokemon VALUES ('Pidgey','2','Pedro Picasso','Tipo Volador','1');
insert into pokemon VALUES ('Onix','3','Ash Ketchum','Tipo Roca','2');
insert into pokemon VALUES ('Pichu','4','Ash Ketchum','Tipo Electrico','2');
insert into pokemon VALUES ('Charmander','5','Sergio Canelita','Tipo Fuego','3');
insert into pokemon VALUES ('Articuno','6','Sergio Canelita','Tipo Hielo Volador','3');
insert into pokemon VALUES ('Bulbasaur','7','Mariano Rajoy','Tipo Planta','4');
insert into pokemon VALUES ('Raichu','8','Mariano Rajoy','Tipo Electrico','4');
insert into pokemon VALUES ('Zapdos','9','Pipi Strada','Tipo Electrico Volador','5');
insert into pokemon VALUES ('Hitmonchan','10','Pipi Strada','Tipo Lucha','5');
insert into pokemon VALUES ('Moltres','11','Hilary Clinton','Tipo Fuego Volador','6');
insert into pokemon VALUES ('Charizard','12','Hilary Clinton','Tipo Fuego','6');
insert into pokemon VALUES ('Snorlax','13','El Sevilla','Tipo Normal','7');
insert into pokemon VALUES ('Abra','14','El Sevilla','Tipo Psiquico','7');
insert into pokemon VALUES ('Kadabra','15','Santiago Abascal','Tipo Psiquico','8');
insert into pokemon VALUES ('Ekans','16','Santiago Abascal','Tipo Veneno','8');
insert into pokemon VALUES ('Arbok','17','Pablo Coelo','Tipo Veneno','9');
insert into pokemon VALUES ('Gengar','18','Pablo Coelo','Tipo Fantasma y Veneno','9');
insert into pokemon VALUES ('Pidgeot','19','Dayana Jonshon','Tipo Volador','10');
insert into pokemon VALUES ('Cubone','20','Dayana Jonshon','Tipo Tierra','10');

-- Tabla Tipos

insert into tipo VALUES ('1','Electrico', 'Agua','Tierra','1');
insert into tipo VALUES ('2','Volador', 'Electrico, Hielo, Roca','Bicho','2');
insert into tipo VALUES ('3','Roca', 'Agua, ','Tierra','3');
insert into tipo VALUES ('4','Electrico', 'Agua','Tierra','4');
insert into tipo VALUES ('5','Fuego', 'Planta','Agua','5');
insert into tipo VALUES ('6','Hielo Volador', 'Dragon','Fuego','6');
insert into tipo VALUES ('7','Planta', 'Agua','Fuego','7');
insert into tipo VALUES ('8','Electrico', 'Agua','Tierra','8');
insert into tipo VALUES ('9','Electrico', 'Agua','Tierra','9');
insert into tipo VALUES ('10','Luchador', 'Siniestro','Volador','10');
insert into tipo VALUES ('11','Fuego Voldor', 'Planta','Agua','11');
insert into tipo VALUES ('12','Fuego', 'Agua','Tierra','12');
insert into tipo VALUES ('13','Normal', 'Agua','Planta','13');
insert into tipo VALUES ('14','Psiquico', 'Lucha','Siniestro','14');
insert into tipo VALUES ('15','Psiquico', 'Lucha','Siniestro','15');
insert into tipo VALUES ('16','Veneno', 'Planta','Tierra','16');
insert into tipo VALUES ('17','Veneno', 'Planta','Tierra','17');
insert into tipo VALUES ('18','Fantasma y Veneno', 'Planta','Tierra','18');
insert into tipo VALUES ('19','Volador', 'Lucha','Electrico','19');
insert into tipo VALUES ('20','Tierra', 'Fuego','Agua','20');

-- Tabla Asistencia

insert into asistencia VALUES ('1','Centro Pokemon Doctoral','Si');
insert into asistencia VALUES ('2','Centro Pokemon San Roque','Si');
insert into asistencia VALUES ('3','Centro Pokemon Insular','No');
insert into asistencia VALUES ('4','Centro Pokemon de Hacienda','No');
insert into asistencia VALUES ('5','Centro Pokemon Doctor Negrin','Si');

-- Tabla Gimnasios

insert into gimnasios VALUES ('1','Electrico','Pedro Sanchez','Gimnasio Socialista');
insert into gimnasios VALUES ('2','Volador','Pablo Iglesias','Gimnasio Coletas');
insert into gimnasios VALUES ('3','Planta','Mariano Rajoy','Gimnasio Recortes');
insert into gimnasios VALUES ('4','Veneno','Juan Antonio','Gimnasio de los Chichos');
insert into gimnasios VALUES ('5','Hielo','Carles Puigdemont','Gimnasio Independiente');

-- Tabla Ciudades

insert into ciudades VALUES ('1','Ciudad Murcia','Se dice que tiene la mayor parte de pokemons siniestros ya que esta ciudad se dice que no existe');
insert into ciudades VALUES ('2','Ciudad Telde','Ciudad donde los entrenadores pokemon pagan mas impuestos');
insert into ciudades VALUES ('3','Ciudad Playa Ingles','Donde van los entrenadores  pokemon de vacaciones suelen venir de ciudad guiri');
insert into ciudades VALUES ('4','Ciudad Guiri','Donde hay entrenadores pokemons que se jubilan con muchos pokedolares y van a ciudad playa ingles a gastarlo :)');
insert into ciudades VALUES ('5','Ciudad Arinaga','Donde hay un mayor pokemons voladores y de agua ya que es una ciudad costera y con grandes rachas de vientos los entrenadores van con trajes aereos');

-- Tabla Tiendas

insert into tiendas VALUES ('1','Artilugios Pako',FALSE,TRUE,'2');
insert into tiendas VALUES ('2','Seguridad Sozial',True,True,'5');
insert into tiendas VALUES ('3','Pokeballs a 1$',False,True,'1');
insert into tiendas VALUES ('4','BMW Pokeball',True,True,'4');
insert into tiendas VALUES ('5','Pokemon Marietas',False,True,'3');