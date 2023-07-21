import 'package:equatable/equatable.dart';

class UserLogin extends Equatable {

  late String email;
  late String password;
  late String name;
  late String birthDate;
  late String image;

  @override
  List<Object?> get props => [email, password, name, birthDate, image];

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