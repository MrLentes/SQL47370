create schema WrestlingCO;

use WrestlingCo;

create table Empleados(
	id_empleado int primary key not null unique auto_increment,
    nombre varchar(45) not null,
    tipo_de_empleo varchar(15) not null,
    empleo varchar(30) not null,
    fecha_de_incorporacion date not null,
    sueldo float not null,
    bono_antiguedad float
);

create table Disponibilidad(
	id_disponibilidad int primary key not null unique auto_increment,
    tipo_disponible varchar(20)
);

create table Luchadores(
	id_luchador int primary key not null unique auto_increment,
    nombre varchar(45) not null,
    nacionalidad varchar(30) not null,
    id_disponibilidad int not null,
    foreign key (id_disponibilidad) references Disponibilidad(id_disponibilidad)
);

create table Equipo_de_Luchadores(
	id_luchador int not null unique,
    fecha_inicio_contrato date not null,
    fin_de_contrato date not null,
    precio_de_contrato float not null,
    estado_fisico varchar(15) not null,
    vencimiento_visa date,
    id_entrenador int not null,
    id_road_agent int not null,
    foreign key (id_luchador) references Luchadores(id_luchador),
    foreign key (id_entrenador) references Empleados(id_empleado),
    foreign key (id_road_agent) references Empleados(id_empleado)
);

create table Locales(
	id_local int primary key not null unique auto_increment,
    precio_alquiler float not null,
    tipo_de_local varchar(20) not null,
    capacidad int not null,
    asegurado bool not null default false,
    permiso_incluido bool not null default false
);

create table Eventos(
	id_evento int primary key not null unique auto_increment,
    id_local int not null,
    fecha_de_evento date not null,
    precio_seguro float not null default 0.00,
    precio_permiso float not null default 0.00,
    foreign key (id_local) references Locales(id_local)
);

create table Luchas(
	id_lucha int primary key not null unique auto_increment,
    id_luchador1 int not null,
    id_luchador2 int not null,
    id_luchador3 int,
    id_luchador4 int,
    id_evento int not null,
    id_productor int not null,
    id_medico int not null,
    foreign key (id_luchador1) references Luchadores(id_luchador),
    foreign key (id_luchador2) references Luchadores(id_luchador),
    foreign key (id_luchador3) references Luchadores(id_luchador),
    foreign key (id_luchador4) references Luchadores(id_luchador),
    foreign key (id_evento) references Eventos(id_evento),
    foreign key (id_productor) references Empleados(id_empleado),
    foreign key (id_medico) references Empleados(id_empleado)
);

/* Nuevo codigo insercion de datos y cambios a las tablas */

/* Cambios en las tablas */

use WrestlingCo;

alter table luchadores
add email varchar(40) not null;

alter table empleados
change column tipo_de_empleo
tipo_de_empleo varchar(25) not null;

alter table luchas
add id_referee int not null;
alter table luchas
add foreign key (id_referee) references Empleados(id_empleado);

/* Insercion de datos */

use WrestlingCo;

insert into empleados values
(null, "Bruce Miller", "Administrativo", "Presidente", '2021-06-01', 5000, null),
(null, "Caroline Jones", "Administrativo", "Vice-Presidente", '2021-06-01', 3500, null),
(null, "Jacob Murray", "Administrativo", "Director de Operaciones", '2021-06-01', 3000, null),
(null, "Haley Rogers", "Administrativo", "Directora de Comunicaciones", '2021-06-01', 3000, null),
(null, "Belinda Gray", "Produccion", "Medica Jefe", '2021-06-01', 2500, null),
(null, "Spike Kelly", "Staff de Luchadores", "Entrenador Jefe", '2021-06-01', 3000, null),
(null, "Daniel Holmes", "Administrativo", "Jefe de Relaciones", '2021-06-01', 3000, null),
(null, "Eleanor Williams", "Administrativo", "Jefa de Escritores", '2021-06-01', 3000, null),
(null, "Sam Elliot", "Staff de Luchadores", "Road Agent", '2021-06-01', 2500, null),
(null, "Edward Harrison", "Administrativo", "Recursos Humanos", '2021-06-01', 3000, null),
(null, "Mike Bennet", "Staff de Luchadores", "Entrenador", '2021-06-01', 2500, null),
(null, "Leonardo Ryan", "Produccion", "Productor General", '2021-06-01', 3500, null),
(null, "Heather Payne", "Administrativo", "Productora", '2021-06-01', 3000, null),
(null, "Martin Hunt", "Staff de Luchadores", "Road Agent", '2021-06-01', 2500, null),
(null, "Ted Grant", "Administrativo", "Contador", '2021-06-01', 4000, null),
(null, "Nick Hunt", "Produccion", "Referee", '2021-09-15', 1500, 175),
(null, "Matt Rogers", "Administrativo", "Reclutador", '2021-10-05', 2000, 155),
(null, "Ignacio Cortez", "Staff de Luchadores", "Road Agent", '2021-10-25', 1750, 150),
(null, "Dwayne Ryan", "Produccion", "Productor", '2021-11-15', 2500, 175),
(null, "Miley Harrison", "Administrativo", "Secretaria", '2021-11-15', 2000, 150),
(null, "Jacob Park", "Produccion", "Referee", '2022-01-10', 1500, 150),
(null, "Kelly Park", "Administrativo", "Escritora", '2022-01-10', 2000, 175),
(null, "Steve Wilson", "Staff de Luchadores", "Entrenador", '2022-01-10', 2000, 175),
(null, "Felix Pearson", "Produccion", "Jefe de Staff", '2022-03-01', 2500, 225),
(null, "Karl Smith", "Produccion", "Staff", '2022-03-01', 1500, 125),
(null, "Robert Storm", "Produccion", "Staff", '2022-03-01', 1500, 125),
(null, "Blake Young", "Produccion", "Medico", '2022-03-01', 1500, 125),
(null, "Finn White", "Staff de Luchadores", "Entrenador", '2022-09-05', 2000, 175),
(null, "Tyler Black", "Administrativo", "Escritor", '2022-09-05', 2000, 175),
(null, "Karen Diaz", "Produccion", "Referee", '2023-03-10', 1500, 150);

select * from empleados;

insert into Disponibilidad values
(null, "Agente Libre"),
(null, "CCW"),
(null, "RTWCW"),
(null, "Blaster Wrestling"),
(null, "WCPW"),
(null, "KLGW"),
(null, "OTR"),
(null, "MLLC"),
(null, "WBTT"),
(null, "Extrema Lucha"),
(null, "ZWYH"),
(null, "PWND"),
(null, "Myth Wrestling"),
(null, "1PW UK"),
(null, "1PW US"),
(null, "NATO"),
(null, "IWGP"),
(null, "ALM"),
(null, "WWWF"),
(null, "ADAM");

select * from disponibilidad;

insert into equipo_de_luchadores values
(274, '2021-06-01', '2024-06-01', 150000, "Perfecto", '2024-11-25', 71, 74),
(2, '2021-06-01', '2024-06-01', 150000, "Perfecto", '2025-03-15', 71, 69),
(181, '2021-06-01', '2024-06-01', 150000, "Perfecto", null, 66, 69),
(166, '2021-06-01', '2025-06-01', 200000, "Lesionado", null, 66, 74),
(242, '2021-06-01', '2024-06-01', 150000, "Perfecto", null, 66, 69),
(195, '2021-06-01', '2024-06-01', 150000, "Perfecto", null, 66, 69),
(47, '2021-06-01', '2024-06-01', 150000, "Lesionado", null, 71, 74),
(196, '2021-06-01', '2025-06-01', 200000, "Perfecto", null, 66, 74),
(79, '2021-10-25', '2024-10-25', 150000, "Perfecto", '2025-06-15', 71, 78),
(53, '2021-10-25', '2025-10-25', 200000, "Perfecto", '2024-01-30', 66, 69),
(67, '2021-10-25', '2024-10-25', 150000, "Lesionado", null, 71, 78),
(127, '2021-10-25', '2026-10-25', 250000, "Perfecto", null, 66, 74),
(135, '2021-10-25', '2024-10-25', 150000, "Perfecto", '2026-01-01', 66, 78),
(151, '2021-10-25', '2024-10-25', 150000, "Perfecto", null, 66, 78),
(201, '2021-10-25', '2025-10-25', 200000, "Lesionado", null, 71, 78),
(215, '2021-10-25', '2024-10-25', 150000, "Perfecto", '2024-06-10', 66, 78),
(220, '2022-01-10', '2025-01-10', 135000, "Perfecto", '2026-03-15', 83, 69),
(231, '2022-01-10', '2025-01-10', 135000, "Perfecto", null, 83, 74),
(234, '2022-01-10', '2026-01-10', 180000, "Perfecto", '2025-03-15', 83, 74),
(238, '2022-01-10', '2024-01-10', 90000, "Lesionado", null, 83, 69),
(253, '2022-09-05', '2025-09-05', 150000, "Perfecto", '2025-10-08', 88, 74),
(256, '2022-09-05', '2026-09-05', 200000, "Perfecto", '2026-07-12', 88, 69),
(287, '2022-09-05', '2024-09-05', 100000, "Perfecto", null, 88, 74),
(31, '2022-09-05', '2022-09-05', 150000, "Lesionado", '2023-12-20', 88, 69),
(298, '2023-01-15', '2025-01-15', 120000, "Perfecto", null, 88, 78),
(10, '2023-01-15', '2026-01-15', 180000, "Perfecto", null, 71, 74),
(161, '2023-01-15', '2027-01-15', 240000, "Perfecto", null, 88, 78),
(164, '2023-01-15', '2026-01-15', 180000, "Perfecto", '2025-10-10', 66, 69);

select * from equipo_de_luchadores;

insert into locales values
(null, 510, "Gimnasio", 120, true, false),
(null, 620, "Gimnasio", 165, false, true),
(null, 1074, "Estudio", 130, true, false),
(null, 1192, "Gimnasio de Colegio", 240, true, false),
(null, 1620, "Teatro", 380, false, true),
(null, 1130, "Estudio", 150, false, true),
(null, 2730, "Salon de Bingo", 600, true, true),
(null, 652, "Gimnasio", 112, false, true),
(null, 1685, "Gimnasio de Colegio", 300, true, false),
(null, 3526, "Ballroom", 720, true, true),
(null, 970, "Estudio", 160, true, false),
(null, 1332, "Estudio", 240, true, true),
(null, 720, "Gimnasio", 150, true, false),
(null, 530, "Gimnasio", 157, true, true),
(null, 1245, "Gimnasio de Colegio", 285, false, true),
(null, 4436, "Galeria", 1020, true, true),
(null, 980, "Estudio", 180, false, false),
(null, 1925, "Salon de Bingo", 400, true, false),
(null, 2500, "Ballroom", 480, true, false),
(null, 1298, "Gimnasio de Colegio", 195, true, false),
(null, 1685, "Gimnasio de Colegio", 300, true, false),
(null, 3280, "Galeria", 892, true, true),
(null, 7052, "Mini-Arena", 1440, true, true),
(null, 1960, "Teatro", 440, false, true),
(null, 2160, "Teatro", 400, true, false),
(null, 2700, "Salon de Bingo", 500, true, false),
(null, 5500, "Mini-Arena", 1140, false, true),
(null, 3500, "Ballroom", 600, true, false),
(null, 1688, "Teatro", 260, true, false),
(null, 4370, "Galeria", 850, true, false),
(null, 2050, "Salon de Bingo", 525, true, true),
(null, 4020, "Galeria", 935, false, true),
(null, 7000, "Mini-Arena", 1200, true, false),
(null, 2500, "Ballroom", 480, true, false),
(null, 1920, "Salon de Bingo", 400, true, false),
(null, 3877, "Galeria", 637, false, true),
(null, 6500, "Mini-Arena", 1320, false, true),
(null, 5050, "Mini-Arena", 960, true, false),
(null, 1620, "Teatro", 380, false, true),
(null, 3340, "Ballroom", 540, false, false);

select * from locales;

insert into eventos values
(null, 2, '2021-06-08', 100, 0),
(null, 4, '2021-08-06', 0, 65),
(null, 12, '2021-10-11', 0, 0),
(null, 17, '2021-12-15', 100, 70),
(null, 29, '2022-02-02', 0, 65),
(null, 20, '2022-04-05', 0, 55),
(null, 30, '2022-06-18', 0, 60),
(null, 19, '2022-08-21', 0, 65),
(null, 7, '2022-10-01', 0, 0),
(null, 28, '2022-12-19', 0, 85),
(null, 34, '2023-02-22', 0, 60),
(null, 26, '2023-04-03', 0, 55),
(null, 27, '2023-06-14', 1100, 0),
(null, 22, '2023-08-01', 0, 0),
(null, 30, '2023-10-09', 0, 90);

select * from eventos;

insert into luchas values
(null, 242, 181, null, null, 1, 72, 65, 72),
(null, 2, 196, null, null, 1, 72, 65, 72),
(null, 47, 274, null, null, 1, 72, 65, 72),
(null, 195, 166, null, null, 1, 72, 65, 72),
(null, 242, 274, null, null, 2, 72, 65, 72),
(null, 2, 195, null, null, 2, 72, 65, 72),
(null, 196, 166, null, null, 2, 72, 65, 72),
(null, 181, 47, null, null, 2, 72, 65, 72),
(null, 2, 196, null, null, 3, 72, 65, 76),
(null, 47, 181, null, null, 3, 72, 65, 76),
(null, 166, 195, null, null, 3, 72, 65, 76),
(null, 242, 274, null, null, 3, 72, 65, 76),
(null, 2, 79, null, null, 4, 79, 65, 76),
(null, 47, 215, null, null, 4, 79, 65, 72),
(null, 166, 195, null, null, 4, 79, 65, 76),
(null, 151, 53, null, null, 4, 72, 65, 76),
(null, 201, 135, null, null, 4, 79, 65, 76),
(null, 127, 274, null, null, 4, 72, 65, 72),
(null, 274, 127, null, null, 5, 79, 65, 81),
(null, 220, 2, 195, 151, 5, 79, 65, 76),
(null, 238, 201, null, null, 5, 72, 65, 81),
(null, 231, 234, null, null, 5, 79, 65, 76),
(null, 215, 242, null, null, 5, 72, 65, 81),
(null, 135, 166, 53, null, 5, 72, 65, 76),
(null, 53, 201, null, null, 6, 72, 65, 81),
(null, 238, 135, null, null, 6, 79, 87, 76),
(null, 2, 195, null, null, 6, 79, 65, 81),
(null, 76, 47, 196, null, 6, 79, 87, 76),
(null, 220, 151, null, null, 6, 72, 87, 81),
(null, 247, 234, 67, null, 6, 79, 87, 76),
(null, 67, 2, null, null, 7, 72, 65, 81),
(null, 47, 166, null, null, 7, 79, 65, 81),
(null, 196, 195, null, null, 7, 79, 87, 76),
(null, 53, 127, null, null, 7, 79, 87, 76),
(null, 135, 151, null, null, 7, 79, 65, 81),
(null, 238, 234, 201, 79, 7, 72, 65, 76),
(null, 238, 67, null, null, 8, 72, 87, 76),
(null, 274, 53, null, null, 8, 79, 87, 76),
(null, 67, 234, 220, null, 8, 79, 65, 81),
(null, 79, 231, null, null, 8, 72, 87, 81),
(null, 166, 242, 201, null, 8, 79, 65, 81),
(null, 47, 2, null, null, 8, 79, 65, 76),
(null, 274, 127, 79, null, 9, 72, 65, 76),
(null, 195, 253, null, null, 9, 79, 87, 81),
(null, 274, 53, null, null, 9, 72, 87, 81),
(null, 67, 53, 2, 166, 9, 72, 65, 81),
(null, 220, 31, null, null, 9, 72, 65, 76),
(null, 287, 256, null, null, 9, 79, 87, 76),
(null, 79, 201, null, null, 10, 79, 87, 76),
(null, 195, 252, 53, 2, 10, 72, 65, 81),
(null, 231, 256, null, null, 10, 72, 87, 76),
(null, 134, 238, 135, null, 10, 79, 65, 76),
(null, 127, 196, null, null, 10, 79, 65, 81),
(null, 31, 151, null, null, 10, 72, 65, 81),
(null, 195, 181, null, null, 11, 79, 87, 81),
(null, 201, 31, null, null, 11, 79, 87, 76),
(null, 287, 215, null, null, 11, 72, 65, 76),
(null, 47, 67, null, null, 11, 79, 87, 81),
(null, 53, 79, null, null, 11, 79, 65, 81),
(null, 10, 161, 231, 2, 11, 72, 65, 72),
(null, 201, 195, 234, null, 12, 79, 87, 90),
(null, 161, 79, null, null, 12, 79, 65, 76),
(null, 164, 231, null, null, 12, 72, 87, 81),
(null, 135, 196, null, null, 12, 79, 65, 76),
(null, 127, 298, null, null, 12, 72, 87, 90),
(null, 10, 31, 2, null, 12, 72, 87, 81),
(null, 10, 31, null, null, 13, 79, 87, 76),
(null, 2, 127, 215, 201, 13, 72, 87, 76),
(null, 242, 235, null, null, 13, 79, 65, 76),
(null, 53, 79, null, null, 13, 79, 87, 90),
(null, 166, 164, 287, null, 13, 79, 87, 81),
(null, 151, 135, null, null, 13, 72, 65, 81),
(null, 220, 231, 234, 161, 13, 79, 87, 90),
(null, 181, 47, null, null, 13, 72, 65, 72),
(null, 2, 10, null, null, 14, 79, 87, 76),
(null, 79, 53, null, null, 14, 79, 87, 76),
(null, 195, 215, null, null, 14, 79, 65, 90),
(null, 151, 298, 161, 181, 14, 72, 65, 81),
(null, 164, 242, null, null, 14, 79, 87, 81),
(null, 220, 231, null, null, 14, 72, 65, 90),
(null, 151, 161, null, null, 15, 79, 87, 90),
(null, 234, 181, null, null, 15, 72, 87, 81),
(null, 220, 53, 10, null, 15, 79, 65, 76),
(null, 287, 298, 231, null, 15, 79, 87, 90),
(null, 253, 256, null, null, 15, 72, 87, 81),
(null, 2, 79, 196, 231, 15, 79, 65, 76);

select * from luchas;

/* Script de Vistas */

create or replace view luchadores_contratados as
(select l.nombre, e.estado_fisico, e.fecha_inicio_contrato, e.fin_de_contrato
from equipo_de_luchadores e join luchadores l on (l.id_luchador = e.id_luchador));

select * from luchadores_contratados;

create or replace view capacidad_del_evento as
(select e.id_evento, fecha_de_evento, l.precio_alquiler, l.capacidad
from eventos e join locales l on (e.id_local = l.id_local));

select * from capacidad_del_evento;

create or replace view productor_de_lucha as
(select l.id_lucha, ev.fecha_de_evento, e.nombre
from eventos ev join luchas l on (ev.id_evento = l.id_evento)
join empleados e on (l.id_productor = e.id_empleado));

select * from productor_de_lucha;

create or replace view luchadores_asignados as
(select e.fecha_de_evento, l.id_lucha, l1.nombre as nombre_luchador_1, l2.nombre as nombre_luchador_2, l3.nombre as nombre_luchador_3, l4.nombre as nombre_luchador_4
from eventos e join luchas l on (e.id_evento = l.id_evento)
left join luchadores l1 on (l.id_luchador1 = l1.id_luchador)
left join luchadores l2 on (l.id_luchador2 = l2.id_luchador)
left join luchadores l3 on (l.id_luchador3 = l3.id_luchador)
left join luchadores l4 on (l.id_luchador4 = l4.id_luchador));

select * from luchadores_asignados;

create or replace view luchadores_libres as
(select l.nombre, l.email
from luchadores l where l.id_disponibilidad = 1);

select * from luchadores_libres;

/* Script de creacion de funciones */

use wrestlingco;

delimiter //
create function numero_de_luchas(id_luchador int) returns int
reads sql data
begin
    declare contador_de_luchas int;
    
    select count(*) into contador_de_luchas
    from Luchas
    where id_luchador1 = id_luchador
       or id_luchador2 = id_luchador
       or id_luchador3 = id_luchador
       or id_luchador4 = id_luchador;
    
    return contador_de_luchas;
end //

select numero_de_luchas(2);
select numero_de_luchas(53);

select * from luchas where id_luchador1 = 2 or id_luchador2 = 2 or id_luchador3 = 2 or id_luchador4 = 2;
select * from luchas where id_luchador1 = 53 or id_luchador2 = 53 or id_luchador3 = 53 or id_luchador4 = 53;

/* En esta funcion le pasa el id_luchador y cuenta en cuantas luchas estuvo; dejo como ejemplo el luchador con id 2 y el con id 53 */

delimiter //
create function dias_restantes_de_contrato(id_luchador1 int) returns int
reads sql data
begin
    declare fin_contrato date;
    declare dias_restantes int;
    
    select fin_de_contrato into fin_contrato
    from equipo_de_luchadores
    where id_luchador1 = id_luchador;
    
    set dias_restantes = datediff(fin_contrato, curdate());
    
    return dias_restantes;
end //

select dias_restantes_de_contrato(2);
select dias_restantes_de_contrato(53);

select id_luchador, fin_de_contrato from equipo_de_luchadores where id_luchador = 2;
select id_luchador, fin_de_contrato from equipo_de_luchadores where id_luchador = 53;

/* En esta funcion le pasas el id_luchador y te devuelve el numero de dias restantes de contrato de ese luchador*/

/* Fin de las funciones */

/* STORED PROCEDURES */

use wrestlingco;

/*create procedure cambiar_nombre_de_empresa(in id_de_la_empresa int, in nuevo_nombre varchar(20))
begin
	update disponibilidad
    set tipo_disponible = nuevo_nombre where id_disponibilidad = id_de_la_empresa;
end // Le agrego una verificacion para que no metan un id que no existe*/

delimiter //

create procedure cambiar_nombre_de_empresa(in id_de_la_empresa int, in nuevo_nombre varchar(20))
begin
	declare id_existente int;
    select count(*) into id_existente from disponibilidad where id_disponibilidad = id_de_la_empresa;
    if id_existente > 0 then    
		update disponibilidad
		set tipo_disponible = nuevo_nombre where id_disponibilidad = id_de_la_empresa;
        select 'Nombre Actualizado ', nuevo_nombre as cambio_de_nombre;
	else
		select 'El ID de esa empresa no existe' as fallo_el_cambio;
	end if;
end //

drop procedure cambiar_nombre_de_empresa;

call cambiar_nombre_de_empresa(2, "CSW");

call cambiar_nombre_de_empresa(21, "CCW");

select * from disponibilidad;

/* En este procedimiento puedes cambiar el nombre de una empresa dandole un nuevo nombre y su ID en caso que cambien su nombre o siglas */

delimiter //

create procedure vencimiento_de_visas()
begin
    declare id_de_luchador int;
    declare fecha_vencimiento_visa date;
    declare dias_restantes int;    
    declare cursor_1 cursor for select id_luchador, vencimiento_visa from equipo_de_luchadores where vencimiento_visa is not null;    
    set dias_restantes = 0;  
        
    open cursor_1;    
    luchador_loop: LOOP
        fetch cursor_1 into id_de_luchador, fecha_vencimiento_visa;
        if (fecha_vencimiento_visa is null) then
            leave luchador_loop;
        end if;        
        set dias_restantes = datediff(fecha_vencimiento_visa, curdate());        
        select concat('La visa del luchador de ID ', id_de_luchador, ' vence en: ', dias_restantes, ' dias') as Vencimiento;
    end loop;    
    close cursor_1;
end //

call vencimiento_de_visas();

drop procedure vencimiento_de_visas;

select id_luchador, vencimiento_visa from equipo_de_luchadores where vencimiento_visa is not null;

/* En este SP se busca los luchadores contratados con visa y se determina cuantos dias le queda hasta el vencimiento */
/* Pase dos horas aprendiendo loop para hacerlo */

use wrestlingco;

/* Nuevas tablas para usar triggers */

create table ResultadosDeEventos(
	id_RDE int primary key not null unique auto_increment,
    id_evento int not null,
    costo_alquiler float not null,
    capacidad int not null,
    asistencia int not null,
    precio_entrada float not null,
    mercancia_vendida float default 0,
    recaudacion float not null,
    foreign key (id_evento) references Eventos(id_evento)
);

/* Esta tabla es para llevar cuentas de los eventos realizados */

/* TRIGGERS */

delimiter //

create trigger CalcularRecaudacion
before insert on ResultadosDeEventos
for each row
begin
    set new.recaudacion = (new.asistencia * new.precio_entrada) + new.mercancia_vendida;
end;

//

select * from capacidad_del_evento; /* Me ayudo de una view para poner los datos */

insert into ResultadosDeEventos (id_evento, costo_alquiler, capacidad, asistencia, precio_entrada, mercancia_vendida) values(1, 620, 165, 150, 42.5, 2350);

select * from ResultadosDeEventos;

/* Este trigger calcula la recaudacion que realizo el evento */

/* Este siguiente trigger me causo muchos problemas plantearlo si hay una mejor forma porfavor diganmela */

delimiter //

create trigger LlenarDatosDelLocal
before insert on ResultadosDeEventos
for each row
begin
	declare alquiler float;
    declare capacidad_maxima int;
    declare id_l int;
    select id_local into id_l from eventos where id_evento = new.id_evento;
    select precio_alquiler, capacidad into alquiler, capacidad_maxima from Locales where id_local = id_l;
    
    set new.costo_alquiler = alquiler;
    set new.capacidad = capacidad_maxima;
end;

//

select * from capacidad_del_evento;

insert into ResultadosDeEventos (id_evento, asistencia, precio_entrada, mercancia_vendida) values (2, 240, 45, 3000);

select * from ResultadosDeEventos;

/* En este trigger uso el id_evento para obtener datos del id_local para llenar las columnas costo_alquiler y capacidad con los datos del local que uso el evento */

delimiter //

create trigger ActualizarDisponibilidad
after insert on Equipo_De_Luchadores
for each row
begin
	update Luchadores set id_disponibilidad = 2 where id_luchador = new.id_luchador;
end;

//

select * from luchadores where id_disponibilidad = 2;

insert into equipo_de_luchadores values (5, '2023-11-05', '2026-11-05', 150000, "Perfecto", null, 71, 69);

select * from equipo_de_luchadores;

/* En este trigger se cambia el id_disponibilidad de un luchador a 2 , el id de la empresa, cuando se lo contrata a nuestra empresa,  */



