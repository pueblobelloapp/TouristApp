import 'package:equatable/equatable.dart';

class UserLogin extends Equatable {

  late String email;
  late String password;
  late String name;
  late String birthDate;

  @override
  List<Object?> get props => [email, password, name, birthDate];

  Map<String, Object> toFirebaseMap() {
    return <String, Object> {
    "email": email,
    "password": password,
    "name": name,
    "birthDate": birthDate
    };
  }

}