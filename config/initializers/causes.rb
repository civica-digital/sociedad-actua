require 'picky'


data = Picky::Index.new :causes do
  indexing removes_characters: /[^\p{Alpha}\p{Blank}]/i
  category :description, partial: Picky::Partial::None.new
  category :tags
end

CAUSE_E = Struct.new :id, :description, :tags

causes_classification = [{
     cause: "Accesibilidad, movilidad y vialidad",
     description: "Busca facilitar la movilidad de la población y promover que las condiciones para desplazarse de peatones, personas con movilidad restringida (adultos mayores, señoras embarazadas,personas con discapacidad ), niños, ciclistas y adultos sean más seguras y agradables.
Buscan que todas las personas puedan desplazarse por la ciudad o acceder a servicios, independientemente de sus capacidades técnicas, cognitivas o físicas.
Se preocupa por las condiciones de las vías de circulación (calles, banquetas, etc)",
     tags: "bicicleta, peaton, transporte publico, discapacidad, vehiculo, capacidades diferentes, banquetas, autos, rampas, invidente, silla de ruedas, "
 },
 {
     cause: "Adicciones",
     description: "Se dedica a la atención de cualquier tipo de adicciones mediante la promoción de la salud, la prevención, la asesoría, el tratamiento, el control de las mismas y/o apoyo a familiares.",
     tags: "rehabilitacion, drogas, bebidas alcoholicas, tabaco, alcohol, alcoholismo, ludopatia, juego, violencia, enfermo, platicas, prevención,drogadicto, alcoholico"
 },
 {
     cause: "Alimentación y nutrición",
     description: "Fomenta la sana alimentación.Combate a problemas de salud y trastornos alimenticios, mediante  tratamientos especializados y/o la promoción de una alimentación saludable.
Educación alimentaria",
     tags: "desnutricion, obesidad, mala alimentacion, anorexia, bulimia, comida chatarra,salud"
 },
 {
     cause:"Horticultura y agricultura",
     description:"Se dedica al aprovechamiento de espacios incentivando el hábito y la práctica de cultivo de productos básicos necesarios para una alimentación sana.",
     tags:"hortalizas, alimentacion, cultivo, nutricion, huertos"
 },
 {
     cause:"Protección de Animales",
     description:"Se enfoca a promover la cultura de responsabilidad y respeto hacia la vida animal, así como la defensa de los derechos de los animales.",
     tags:"esterilizacion, veterinario, adopcion, mascota, maltrato, albergues, abandono, derechos, animales, perros, gatos"
 },
 {
     cause:"Arte, historia y cultura",
     description:"Se dedica al fomento, promoción, investigación, y realce de las manifestaciones artísticas, culturales e históricas (danza, teatro, música, pintura, escultura, diseño, fotografía, cinema) Busca la promoción y defensa de la cultura tradicional, y del patrimonio cultural. Trabaja para la conservación de la historia y tradiciones",
     tags:"fotografia, cine, musica, teatro, escultura, danza, expresion, pintura, patrimonio, tradiciones, historia, pasado, artistico, cultural, historico, conservacion"
 },
 {
     cause:"Asuntos internacionales",
     description:"Busca el fortalecimiento de vínculos con organismos, instancias internacionales y otros países para generar acuerdos que contribuyan al desarrollo.",
     tags:"relaciones internacionales, organismos multilaterales"
 },
 {
     cause:"Atención a víctimas de violencia",
     description:"Trabaja para la asistencia social, atención psicológica, asesoría legal, seguimiento jurídico en materia penal, y atención médica de emergencia a víctimas de violencia.",
     tags:"mujeres, maltrato, abuso, tratamiento, violencia familiar, violencia de genero, golpes, ,niños, hombres, victimas, violentado, apoyo legal"
 },
 {
     cause:"Ciencias naturales",
     description:"Se dedica a la atención a la naturaleza, a su estudio, conservación, preservación y la difusión de las ciencias naturales",
     tags:"biologia, quimica, fisica, geologia, experimento, naturaleza, vida, animales, plantas, celulas, seres vivos,preservación,conservación."
 },
 {
     cause:"Tecnología",
     description:"Promueve y/o habilita el uso de la tecnología como herramienta de desarrollo. Fomenta el desarrolla de nuevas tecnologias. Pone la tecnología al servicio de la sociedad",
     tags:"computadora, programacion, datos abiertos, hackaton, hacker, sistema, internet, redes sociales, programadores,innovacion"
 },
 {
     cause:"Ciencias sociales",
     description:"Se enfoca en la atención a temas relacionados con el rol y actuación de las personas en la sociedad.",
     tags:"psicologia, sociologia, antropologia, derecho, economia, ciencia politica, historia, arqueologia, relaciones humanas, politica"
 },
 {
     cause:"Comunicación",
     description:"Se enfoca al desarrollo de políticas y estrategias de comunicación. Atiende temas relacionados con los medios de comunicación, calidad y contenidos difundidos en los mismos, y asuntos relacionados con nuevos medios de información",
     tags:"noticias, publicacion, medios, comunicacion, relaciones publicas, redes sociales, internet, periodicos, prensa, radio, television, revistas,mensaje,contenidos"
 },
 {
     cause:"Cultura de la legalidad",
     description:"Buscan la promoción de la autorregulación individual y regulación social, que exige por parte de los ciudadanos una cierta armonía entre el respeto a la ley, las convicciones morales y las tradiciones y convenciones culturales. ",
     tags:"leyes, legalidad, corrupcion, moches, corrupto, comportamiento, moral, valores, presion social, juicio, transparencia"
 },
 {
     cause:"Cultura de paz",
     description:"Busca el rechazo a la violencia y la prevención de conflictos tratando de atacar sus causas para solucionar los problemas mediante el diálogo y la negociación.",
     tags:"convivencia, tolerancia, dialogo, conflicto, paz, seguridad, mediacion, pacifico, guerra, prevencion"
 },
 {
     cause:"Asuntos vecinales",
     description:"Se enfoca en el fortalecimiento y fomento a las actividades vecinales, su organización, cohesión y defensa de intereses comunes",
     tags:"convivencia, vecino, colono, colonia, entorno, barrio, comunidad, junta, municipio"
 },
 {
     cause:"Deporte y recreación",
     description:"Busca promover el deporte, las actividades recreativas, estilos de vida saludables. Fomenta la existencia de espacios favorables a actividades recreativas y deportivas",
     tags:"actividad fisica, ejercicio, sedentarismo, parques, plazas, espacios deportivos, torneos, jovenes, adulto mayor, niños, juegos,salud"
 },
 {
     cause:"Derechos humanos y civiles",
     description:"Promueve el goce de los derechos fundamentales reconocidos en la Constitución Mexicana y Tratados Internacionales",
     tags:"derechos humanos, garantias individuales, mujer, hombre, niño, acceso, defensa, equidad, igualdad, leyes,legal,defensa"
 },
 {
     cause:"Desarrollo comunitario",
     description:"Promueve el desarrollo económico, político y social de una comunidad para elevar su calidad de vida mediante acciones de empoderamiento, capacitando y proporcionando herramientas a la comunidad para ser autogestores de las soluciones a las problemáticas que viven.",
     tags:"calidad de vida, comunidad, convivencia, desarrollo, derechos, vecinos,capacitacion,"
 },
 {
     cause:"Desarrollo económico",
     description:"Promueve la generación de fuentes de ingreso, incremento del nivel de productividad y competitividad, así como el adecuado aprovechamiento de los recursos.",
     tags:"empleo, trabajo, actividad economica, desempleo, educacion, ninis, comercio, informalidad, justo, equidad, formalidad, capacitacion,empleabilidad"
 },
 {
     cause:"Discapacidad",
     description:"Promueve la inclusión de personas con discapacidad en diferentes áreas como educación, trabajo, movilidad, recreación entre otras. Así como realiza actividades de rehabilitacón, terapias, aseoría a familiares, etc.",
     tags:"igualdad, inclusion, accesibilidad, acceso, rampas, empleo, educacion, centros, atencion, ciego, sordo, mudo, silla de rueda, capacidades especiales"
 },
 {
     cause:"Educación",
     description:"Busca implementar mejores prácticas que contribuyan al desarrollo integral del ser humano por medio de la creación, mejora e implementación de modelos educativos prácticos, autosustentables y replicables que ofrezcan excelencia y calidad a nivel mundial.",
     tags:"escuelas, maestro, alumno, capacitacion, trabajo, examen, docente, niños, adulto mayor, lectura, matematicas, escritura, aprendizaje, analfabetismo, acceso"
 },
 {
     cause:"Empleo",
     description:"Promueve la generación de empleos dignos y el respeto a los derechos de los trabajadores",
     tags:"trabajo, capacitacion, fomento, creacion, actividad, desarrollo, subsidios, empleabilidad"
 },
 {
     cause:"Espacios públicos, planeación y desarrollo urbano",
     description:"Promueve modelos de desarrollo urbano, de creación de espacios públicos, de crecimiento sustentable, que mejoren la calidad de vida de las comunidades, y los niveles de sostenibilidad ambiental",
     tags:"urbanismo, area verde, parque, desarrollo sustentable, sustentabilidad, vivienda, estrategia, urbano, rural, campo"
 },
 {
     cause:"Espiritualidad y religión",
     description:"Fomenta el vínculo entre el ser humano y Dios o una divinidad, o la conexión con un Ser Superior. ",
     tags:"Dios, iglesia, espiritu, catolicismo, cristianismo, valores, apostolado, misiones, evangelizacion"
 },
 {
     cause:"Filantropía",
     description:"Enfocadas a actividades y proyectos altruistas y que promuevan el bienestar general.",
     tags:"donativos, fomento, apoyo, ayuda, colaboracion, altruismo"
 },
 {
     cause:"Voluntariado",
     description:"Facilita y fomenta la participación sin fines de lucro de individuos en las organizaciones de la sociedad civil, agilizando los procesos de búsqueda y selección de ofertas.",
     tags:"servicio social, voluntario, apoyo, participacion, honorifico, altruismo"
 },
 {
     cause:"Fortalecimiento a OSCs",
     description:"Fomenta estrategias de promoción, fortalecimiento de capacidades y articulación entre Organizaciones de la Sociedad Civil, y colectivos, con el fin de garantizar su permanencia y aumentar su impacto",
     tags:"fortalecimiento institucional, capacitacion, acompanamiento, fomento, aprendizaje, ONG, OSC, A.C., colectivo"
 },
 {
     cause:"Género y sexualidad",
     description:"Se enfoca en la educación sexual, la defensa de los derechos sexuales, de las diferencias sexuales, y la igualdad de todos ante la Ley. Promueve la igualdad de derechos de los géneros",
     tags:"derechos sexuales, homosexualidad, mujeres, hombres, transexuales, gays, lesbianas, transgenero, igualdad, desigualdad, acceso, matrimonio"
 },
 {
     cause:"Gobierno, administración pública y servicios públicos",
     description:"Se enfoca a la vigilancia, seguimiento y fomento a la administración pública, la labor de los diferentes gobiernos, y la gestión de todo aquello que implique responsabilidades públicas. ",
     tags:"Estado, municipios, politica publica, politica, elecciones, desempeño, rendicion de cuentas, transparencia, gubernamental, cuentas publicas, corrupcion, gestion"
 },
 {
     cause:"Investigación",
     description:"Se dedica a labores de diseño, implementación, fomento o difusión de trabajos de investigación. ",
     tags:"investigar, investigador, patentes, estudios, analisis, think tank, evidencia"
 },
 {
     cause:"Jóvenes",
     description:"Se enfoca al desarrollo de la juventud, su acceso a oportunidades, sus problemas particulares, y su participación en la comunidad.
Trabaja para fomentar actividades destinadas para este grupo de edad en respuesta a necesidades específicas identificadas, con el fin de su superación y armoniosa integración social. ",
     tags:"jovenes, adolescentes, ninis, participacion, integracion, juventud, niñez, capacitacion, educacion, empleo, desempleo, adicciones, exclusion"
 },
 {
     cause:"Jurídicos",
     description:"Se enfoca en la promoción del Derecho y de la Justicia",
     tags:"leyes, principios, normas, justicia, regulacion, tribunales, jueces, congreso, legisladores"
 },
 {
     cause:"Medio ambiente",
     description:"Promueve el aprovechamiento de los recursos naturales, la protección del ambiente, la flora y la fauna, la preservación y restauración del equilibrio ecológico, así como la promoción del desarrollo sustentable a nivel regional y comunitario, de las zonas urbanas y rurales.",
     tags:"desarrollo sustentable, flora, fauna, contaminacion, agua, aire, residuos, particulas, desechos, reciclaje, "
 },
 {
     cause:"Migrantes",
     description:"Dedicada al trabajo en favor de los migrantes nacionales y extranjeros para reducir su condición de vulnerabilidad a través de asistencia humanitaria, asesoría jurídica, asesoría psicosocial, y/o acompañamiento pastoral.",
     tags:"migracion, albergue, vulnerable, transito, derechos, proteccion, atencion, ayuda, "
 },
 {
     cause:"Niños(as)",
     description:"Fomenta el adecuado desarrollo integral de los niños, así como el respeto a sus derechos ",
     tags:"niñez, proteccion, vulnerable, atencion, educacion, violencia, abandono, huerfano, orfanato, adopcion, trata"
 },
 {
     cause:"Participación ciudadana",
     description:"Promueve el involucramiento de ciudadanos en asuntos de interés público, así como comportamientos responsables y respetuosos de las leyes.",
     tags:"rendicion de cuentas, leyes, derechos, acceso, elecciones, independiente, voluntariado"
 },
 {
     cause:"Prevención de la violencia y del delito",
     description:"Promueve y desarrolla estrategias y acciones para eliminar la violencia moral y física, así como la prevención de delitos.",
     tags:"violencia familiar, genero, proteccion, niños, mujeres, robo, ataques, lesiones, seguridad, justicia, impunidad, policia, unidad, atencion, victimas, vulnerable"
 },
 {
     cause:"Salud y emergencias médicas",
     description:"Realiza acciones para proteger las condiciones físicas y sanitarias de la población, y responder oportunamente a emergencias médicas.",
     tags:"ambulancia, cruz roja, cruz verde, paramedicos, hospital, clinica, centro medico, medicos, enfermeras, sano, sanar, atencion, emergencias, enfermos"
 },
 {
     cause:"Seguridad",
     description:"Busca disminuir los delitos, la inseguridad, y fomentar instituciones sólidas y confiables que atiendan a la necesidad de protección física y patrimonial de la población",
     tags:"policia, observatorio, delito, crimen, criminales, delincuentes, reinsercion, carceles, homicidios, violaciones, investigacion"
 },
 {
     cause:"Tercera edad",
     description:"Trabaja para dignificar la vida de los adultos mayores con severo deterioro cognitivo a través de un servicio gerontológico de acuerdo a sus necesidades ísicas, mentales, familiares/sociales y espirituales.",
     tags:"asilo, geriatria, viejo, viejito, adulto mayor, demencia, alzheimer, parkinson, degenerativo, discapacidad, accesibilidad, apoyo, ayuda, familia"
 },
 {
     cause:"Vivienda y albergues",
     description:"Promueve el derecho a una vivienda digna con acceso a los servicios públicos.
Administra albergues para personas que temporalmente no tienen una vivienda digna o se encuentran en peligro.",
     tags:"casa, refugio, emergencia, catastrofe, migrante, hogar, construccion, diseño, arquitecto"
 },
 {
     cause:"Otro",
     description:"",
     tags: ""
 }
]

CAUSES = causes_classification.map { |cause|
  cause[:cause]
}

causes_classification.each do |cause|
  data.add CAUSE_E.new(cause[:cause], cause[:description], cause[:tags])
end

CAUSE = Picky::Search.new data