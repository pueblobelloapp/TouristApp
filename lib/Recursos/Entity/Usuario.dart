class Usuario {

  String id;
  String email;
  String password;
  String name;
  String birthDate;
  String image;

  Usuario({
    this.id = '',
    this.email = '',
    this.password = '',
    this.name = '',
    this.birthDate = '',
    this.image = '',
  });

  Map<String, Object> toFirebaseMap() {
    return <String, Object> {
      "email": email,
      "password": password,
      "name": name,
      "birthDate": birthDate,
      "image": image
    };
  }

}