create schema WrestlingCO;

create table Empleados(
	id_empleado int primary key not null unique,
    nombre varchar(45) not null,
    tipo_de_empleo varchar(15) not null,
    empleo varchar(30) not null,
    fecha_de_incorporacion date not null,
    sueldo float not null,
    bono_antiguedad float
);

create table Disponibilidad(
	id_disponibilidad int primary key not null unique,
    tipo_disponible varchar(20)
);

create table Luchadores(
	id_luchador int primary key not null unique,
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
	id_local int primary key not null unique,
    precio_alquiler float not null,
    tipo_de_local varchar(20) not null,
    capacidad int not null,
    asegurado bool not null default false,
    permiso_incluido bool not null default false
);

create table Eventos(
	id_evento int primary key not null unique,
    id_local int not null,
    fecha_de_evento date not null,
    precio_seguro float not null default 0.00,
    precio_permiso float not null default 0.00,
    foreign key (id_local) references Locales(id_local)
);

create table Luchas(
	id_lucha int primary key not null unique,
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
