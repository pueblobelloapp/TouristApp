
class Sitio {
  String id;
  String titulo;
  String descripcion;
  String direccion;
  String twitter;
  String facebook;
  String messenger;
  String instagram;
  String whatsapp;
  List fotos;
  List puntuacion;
  String longitud;
  String latitud;

  Sitio({
    this.id = '',
    this.titulo = '',
    this.descripcion = '',
    this.direccion = '',
    this.twitter = '',
    this.facebook = '',
    this.messenger = '',
    this.instagram = '',
    this.whatsapp = '',
    this.fotos = const [],
    this.puntuacion = const [],
    this.longitud = '',
    this.latitud = '',
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'titulo': titulo});
    result.addAll({'descripcion': descripcion});
    result.addAll({'direccion': direccion});
    result.addAll({'twitter': twitter});
    result.addAll({'facebook': facebook});
    result.addAll({'messenger': messenger});
    result.addAll({'instagram': instagram});
    result.addAll({'whatsapp': whatsapp});
    result.addAll({'fotos': fotos});
    result.addAll({'puntuacion': puntuacion});
    result.addAll({'longitud': longitud});
    result.addAll({'latitud': latitud});
  
    return result;
  }

  factory Sitio.fromMap(Map<String, dynamic> map, id) {
    return Sitio(
      id: id,
      titulo: map['nombre'] ?? '',
      descripcion: map['descripcion'] ?? '',
      direccion: map['direccion'] ?? '',
      twitter: map['twitter'] ?? '',
      facebook: map['facebook'] ?? '',
      messenger: map['messenger'] ?? '',
      instagram: map['instagram'] ?? '',
      whatsapp: map['whatsapp'] ?? '',
      fotos: List.from(map['foto']),
      puntuacion: List.from(map['puntuacion']),
      longitud: map['longitud'] ?? '',
      latitud: map['latitud'] ?? '',
    );
  }

  get calificacion{
    int suma = 0;
    for (var element in puntuacion) {
      suma += int.parse('${element['calificacion'] ?? '0' }');
    }

    return (suma / puntuacion.length).round();
  }
  
}
