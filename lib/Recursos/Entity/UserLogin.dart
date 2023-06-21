import 'package:equatable/equatable.dart';

class UserLogin {

  late String correo;
  late String contrasena;

  @override
  List<Object?> get props => [correo, contrasena];

}