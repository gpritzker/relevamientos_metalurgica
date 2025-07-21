# puts "Sembrando datos para Relevamientos Metalúrgica..."

# Crear usuario administrador
admin = Usuario.find_or_create_by!(email: "admin@metalurgica.com.ar") do |u|
  u.password = "password123"
  u.password_confirmation = "password123"
end
puts "✔ Usuario admin creado: #{admin.email}"

# Crear empresa
empresa = Empresa.find_or_create_by!(nombre: "OBEON")
puts "✔ Empresa creada: #{empresa.nombre}"

# Crear tipos de tiempo muerto
puts "Creando tipos de tiempo muerto..."

tipos = [
  "Tiempo Muerto Por Faltante De Materiales",
  "T. M. Por Averia De Maquina O Inconveniente Tecnico",
  "Tiempo Muerto Por Preparación De Trabajo",
  "Tiempo Muerto Por Falta De Definición Tecnica",
  "Tiempo Muerto Por Recepcion De Mercaderia",
  "Mantenimiento Equipo",
  "Mejora De Equipo Infraestructura Etc",
  "Limpieza Y Orden Del Area (Herramientas, Desperdicios Insumos, Etc)",
  "Relevamiento Y Reposicion De Insumos Y Materiales",
  "Rotura de máquina",
  "Falta de insumos",
  "Corte de energía",
  "Falta de personal",
  "Mantenimiento no programado",
  "Retraso por logística",
  "Paro técnico",
  "Reunión interna",
  "Limpieza de equipo",
  "Inspección de calidad"
]

tipos.each do |nombre|
  TipoTiempoMuerto.find_or_create_by!(nombre: nombre)
end

puts "✔ Tipos de tiempo muerto creados correctamente."

# Crear sectores
puts "Creando sectores..."

sectores = [
  "Corte y Plegado",
  "Inyección",
  "Carpintería",
  "Conformado",
  "Montaje",
  "Pañol",
  "Oficina Técnica"
]

sectores.each do |nombre|
  Sector.find_or_create_by!(nombre: nombre)
end

puts "Sectores creados correctamente."

# Crear categorías
puts "Creando categorías..."

categorias = [
  "Oficial Multiple",
  "Oficial",
  "Operario Calificado",
  "Operario Especializado",
  "Operario Especializado M",
  "Técnico",
  "Supervisor",
  "1/2 Oficial",
  "Encargado",
  "Ingresante"
]

categorias.each do |nombre|
  Categorium.find_or_create_by!(nombre: nombre)
end

puts "✔ Categorías creadas: #{Categorium.pluck(:nombre).join(', ')}"

# Crear operarios
operarios_obeon = [
  { nombre: "Calfupan , Lucas M.", fecha_nacimiento: "1994-10-15", fecha_ingreso: "2013-09-02", legajo: 2, obra_social: "603100", cuil: "23-38535125-9", domicilio: "b 2 de Abril esc. 4 Dpto E Edf. 24", telefono: "2804672525", ciudad: "Rawson", sindicalizado: true, residente: false, activo: true },
  { nombre: "Pintueque, E. Fabian", fecha_nacimiento: "1972-01-10", fecha_ingreso: "2013-08-04", legajo: 3, obra_social: "3207", cuil: "20-22453884-8", domicilio: "Edwin Roberts c/35", telefono: "2804378318", ciudad: "Trelew", sindicalizado: true, residente: false, activo: true },
  { nombre: "Areco , Gabriel Eduardo", fecha_nacimiento: "1985-06-26", fecha_ingreso: "2012-09-04", legajo: 4, obra_social: "603100", cuil: "20-31732576-3", domicilio: "Alberdi 522", telefono: "2804870841", ciudad: "Trelew", sindicalizado: true, residente: false, activo: true },
  { nombre: "Casalnuovo Leandro D.", fecha_nacimiento: "1985-10-11", fecha_ingreso: "2012-06-18", legajo: 5, obra_social: "603100", cuil: "23-32246321-9", domicilio: "Carlos Pellegrini 780", telefono: "2804868100", ciudad: "Rawson", sindicalizado: true, residente: false, activo: true },
  { nombre: "Castelli Axel", fecha_nacimiento: "1996-03-18", fecha_ingreso: "2024-07-10", legajo: 39, obra_social: "603100", cuil: "20-39163089-6", domicilio: "Pecoraro 392", telefono: "2804702034", ciudad: "Trelew", sindicalizado: false, residente: true, activo: true },
  { nombre: "Villegas A. Walter", fecha_nacimiento: "1972-10-04", fecha_ingreso: "2010-11-01", legajo: 7, obra_social: "603100", cuil: "20-22941601-5", domicilio: "Liborio Garcia nº115", telefono: "2804220182", ciudad: "Rawson", sindicalizado: false, residente: true, activo: true },
  { nombre: "Liempe Héctor Rubén", fecha_nacimiento: "1968-05-14", fecha_ingreso: "1983-02-28", legajo: 8, obra_social: "111803", cuil: "20-20339520-6", domicilio: "Juan Jose Valle nº 224", telefono: "2804967351", ciudad: "Rawson", sindicalizado: true, residente: false, activo: true },
  { nombre: "Figueroa Fernando A.", fecha_nacimiento: "1975-09-24", fecha_ingreso: "1998-01-16", legajo: 11, obra_social: "126205", cuil: "20-24794286-7", domicilio: "Los Maitenes c/31", telefono: "2804636497", ciudad: "Rawson", sindicalizado: true, residente: false, activo: true },
  { nombre: "Lozano Nestor Fabian", fecha_nacimiento: "1980-07-11", fecha_ingreso: "2009-12-30", legajo: 12, obra_social: "603100", cuil: "20-28214351-9", domicilio: "V.Ocampo 759 area 25", telefono: "2804625483", ciudad: "Rawson", sindicalizado: true, residente: false, activo: true },
  { nombre: "Marzulli Bruno G.", fecha_nacimiento: "1972-04-06", fecha_ingreso: "2012-10-01", legajo: 13, obra_social: "603100", cuil: "20-22509663-6", domicilio: "Rio Iguazu 2054 Playa Union", telefono: "2804710015", ciudad: "Rawson", sindicalizado: false, residente: true, activo: true },
  { nombre: "Veron Elias Agustin", fecha_nacimiento: "2003-04-08", fecha_ingreso: "2022-10-03", legajo: 21, obra_social: "603100", cuil: "20-44934222-5", domicilio: "S. del Estero 164", telefono: "2804617397", ciudad: "Rawson", sindicalizado: false, residente: true, activo: true },
  { nombre: "Castillo Matias J.", fecha_nacimiento: "1992-07-18", fecha_ingreso: "2022-08-16", legajo: 20, obra_social: "603100", cuil: "23-36757246-9", domicilio: "los arrayanes 36", telefono: "2804390309", ciudad: "Rawson", sindicalizado: false, residente: true, activo: true },
  { nombre: "Baeza Daniel H.", fecha_nacimiento: "1983-05-18", fecha_ingreso: "2022-12-07", legajo: 24, obra_social: "603100", cuil: "20-30192072-6", domicilio: "Mendoza 600 b° Gregorio Mayo", telefono: "2804589329", ciudad: "Rawson", sindicalizado: false, residente: true, activo: true },
  { nombre: "Meliñanco M. Nicolas", fecha_nacimiento: "2003-07-06", fecha_ingreso: "2023-05-04", legajo: 25, obra_social: "603100", cuil: "20-45108034-3", domicilio: "Lamarque 1579", telefono: "2804611898", ciudad: "Rawson", sindicalizado: false, residente: true, activo: true },
  { nombre: "Calfupan Facundo", fecha_nacimiento: "1996-11-09", fecha_ingreso: "2024-07-10", legajo: 40, obra_social: "603100", cuil: "23-41041024-9", domicilio: "Ch. Peñaloza", telefono: "2805060828", ciudad: "Rawson", sindicalizado: false, residente: true, activo: true },
  { nombre: "Briceño Luis ALBERTO", fecha_nacimiento: "1985-01-01", fecha_ingreso: "2024-08-01", legajo: 41, obra_social: "603100", cuil: "20-31148524-6", domicilio: "Las Heras 1894", telefono: "2804628276", ciudad: "Trelew", sindicalizado: false, residente: true, activo: true },
  { nombre: "Carranza Juan Carlos", fecha_nacimiento: "2006-01-08", fecha_ingreso: "2025-02-24", legajo: 42, obra_social: "603100", cuil: "20-46858555-4", domicilio: "Magallanes 680", telefono: "2804309806", ciudad: "Rawson", sindicalizado: false, residente: true, activo: true }
]

operarios_obeon.each do |attrs|
  attrs[:fecha_nacimiento] = Date.parse(attrs[:fecha_nacimiento]) rescue nil
  attrs[:fecha_ingreso] = Date.parse(attrs[:fecha_ingreso]) rescue nil
  attrs[:empresa] = empresa

  operario = Operario.new(attrs)
  if operario.save
    puts "✔ Operario #{operario.nombre} creado"
  else
    puts "⚠ Error creando operario #{operario.nombre}: #{operario.errors.full_messages.join(', ')}"
  end
end


patagonia = Empresa.find_or_create_by!(nombre: "Patagonia")

operarios_patagonia = [
  {
    nombre: "PIRES GUSTAVO ALFREDO",
    legajo: 8,
    fecha_nacimiento: Date.parse("1981-12-11"),
    fecha_ingreso: Date.parse("2023-07-24"),
    telefono: "2804971877",
    domicilio: "Vachina 444",
    ciudad: "Trelew",
    categoria_id: Categorium.find_or_create_by!(nombre: "Oficial", descripcion: "").id,
    sindicalizado: false,
    residente: true
  },
  {
    nombre: "TAMARGO ALFREDO E",
    legajo: 22,
    fecha_nacimiento: Date.parse("1966-05-11"),
    fecha_ingreso: Date.parse("2023-10-27"),
    telefono: "2804688341",
    domicilio: "Malaspina 354",
    ciudad: "Trelew",
    categoria_id: Categorium.find_or_create_by!(nombre: "Oficial", descripcion: "").id,
    sindicalizado: false,
    residente: true
  },
  {
    nombre: "CARDERON CLAUDIO IVAN",
    legajo: 31,
    fecha_nacimiento: Date.parse("1984-07-04"),
    fecha_ingreso: Date.parse("2025-03-17"),
    telefono: "2804711250",
    domicilio: "Gales 762",
    ciudad: "Trelew",
    categoria_id: Categorium.find_or_create_by!(nombre: "Oficial", descripcion: "").id,
    sindicalizado: false,
    residente: true
  },
  {
    nombre: "ARANDA BRAIAN",
    legajo: 32,
    fecha_nacimiento: Date.parse("1996-03-25"),
    fecha_ingreso: Date.parse("2025-03-19"),
    telefono: "2944141226",
    domicilio: "Almirante Brown C 1",
    ciudad: "Rawson",
    categoria_id: Categorium.find_or_create_by!(nombre: "Oficial", descripcion: "").id,
    sindicalizado: false,
    residente: true
  },
  {
    nombre: "ALBIAL DAMIAN",
    legajo: 33,
    fecha_nacimiento: Date.parse("1985-09-14"),
    fecha_ingreso: Date.parse("2025-03-19"),
    telefono: "2804358006",
    domicilio: "Gan Gan y Mamel B° las Banderitas",
    ciudad: "Trelew",
    categoria_id: Categorium.find_or_create_by!(nombre: "Oficial", descripcion: "").id,
    sindicalizado: false,
    residente: true
  },
  {
    nombre: "AGUILAR V. Victor H.",
    legajo: 34,
    fecha_nacimiento: Date.parse("1991-09-27"),
    fecha_ingreso: Date.parse("2025-03-22"),
    telefono: "2804011711",
    domicilio: "Luis Gonzalez 93 B°490 Norte",
    ciudad: "Rawson",
    categoria_id: Categorium.find_or_create_by!(nombre: "Oficial", descripcion: "").id,
    sindicalizado: false,
    residente: true
  }
]

operarios_patagonia.each do |attrs|
  Operario.find_or_create_by!(legajo: attrs[:legajo]) do |operario|
    operario.assign_attributes(attrs.merge(empresa_id: patagonia.id, activo: true))
  end
end

puts "✔ Operarios de Patagonia creados: #{operarios_patagonia.size}"

sectores = %w[
  CORTE PLEGADO INYECTADO CARPINTERIA PINTURA CONFORMADO MONTAJE
]

puts "Creando sectores únicos..."

sectores.each do |nombre|
  Sector.find_or_create_by!(nombre: nombre.titleize)
end

puts "Seed completado con #{sectores.size} sectores"

# db/seeds/subproductos_seed.rb
producto = Producto.find_or_create_by!(nombre: "Producto genérico")
sector = Sector.find_or_create_by!(nombre: "Sin asignar")

subproductos = %w[
  AIRE
  CHASIS
  CIERRE\ EXTERIOR
  CIERRE\ INTERIOR
  COLUMNA\ modificado
  DUCHA
  ESQUINEROS
  ESQUINEROS\ modificado
  MARCO
  MUEBLE
  PANEL\ DE\ DUCHA
  PANELES
  PANELES\ "Z"\ INTERIORES
  PANELES\ INTERIORES
  PANELES\ Modificada
  PERFIL\ INFERIOR
  PERFILES
  PISO
  PREMARCO
  PUERTA
  RECEPTACULO
  SERVICIOS
  TECHO
  U\ CIERRE
  U\ CIERRE\ Modificada
  U\ COMUN\ Modificada
  VENTANA
]

puts "Creando subproductos únicos con producto_id: #{producto.id} y sector_id: #{sector.id}..."

subproductos.each do |nombre|
  Subproducto.find_or_create_by!(
    nombre: nombre,
    producto_id: producto.id,
    sector_id: sector.id
  )
end

puts "✔️ Seed completado con #{subproductos.size} subproductos"

puts "🌱 Seeding completo."