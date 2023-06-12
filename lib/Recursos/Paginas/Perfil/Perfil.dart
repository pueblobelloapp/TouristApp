import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../Widget/Constans.dart';
import '../../theme/app_theme.dart';
import 'PerfilController.dart';

class PerfilPage extends GetView<PerfilController> {
  //String _generoValue = "";
  //final lista = ['Masculino', 'Femenino'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        /* decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage('Assets/Img/background-login.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.srcOver)),
        ),*/
        //padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 62.0,
                  ),
                  _containerPhoto(),
                  const SizedBox(
                    height: 49.0,
                  ),
                  _formProfile()
                ],
              ),
            )
          ],
        ) /*SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 90.0,
                  child: FaIcon(
                    FontAwesomeIcons.addressCard,
                    size: 90,
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Column(
                children: [
                  Form(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.transparent, width: 1.0),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0))),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: const [
                              Text(
                                'Nombre',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          //textFormfield nombre
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                // border:Border.all(color: Colors.green, width: 2),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0))),
                            child: TextFormField(
                              //controller: _nombreF,
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.sentences,
                              cursorColor: Colors.green.shade300,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(16.0),
                                fillColor: Colors.white,
                                hintText: 'Nombre',
                                hintStyle: TextStyle(color: Colors.black26),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: FaIcon(
                                    FontAwesomeIcons.user,
                                    color: Colors.lightGreen,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          //correo
                          Row(
                            children: const [
                              Text('Correo',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),

                          //textFormfield correo
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                //border: Border.all(color: Colors.green, width: 2),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0))),
                            child: TextFormField(
                              //controller: _nombreF,
                              keyboardType: TextInputType.emailAddress,
                              textCapitalization: TextCapitalization.sentences,
                              cursorColor: Colors.green.shade300,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(16.0),
                                fillColor: Colors.white,
                                hintText: 'Correo',
                                hintStyle: TextStyle(color: Colors.black26),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: FaIcon(
                                    FontAwesomeIcons.envelope,
                                    color: Colors.lightGreen,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 10.0,
                          ),
                          //contraseña
                          Row(
                            children: const [
                              Text('Contraseña',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          //textFormfield contraseña
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                /* border:
                                      Border.all(color: Colors.green, width: 2),*/
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0))),
                            child: TextFormField(
                              //controller: _nombreF,
                              obscureText: true,
                              //keyboardType: TextInputType.,
                              textCapitalization: TextCapitalization.sentences,
                              cursorColor: Colors.green.shade300,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(16.0),
                                fillColor: Colors.white,
                                hintText: 'Contraseña',
                                hintStyle: TextStyle(color: Colors.black26),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: FaIcon(
                                    FontAwesomeIcons.lock,
                                    color: Colors.lightGreen,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          //sexo y edad
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const <Widget>[
                              Text('Sexo',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold)),
                              Text('Edad',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Row(
                            children: <Widget>[
                              // textFormfield sexo
                              Expanded(
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0))),
                                    child: DropdownButtonFormField(
                                      decoration: const InputDecoration(
                                          focusedBorder: InputBorder.none,
                                          //disabledBorder: InputBorder.none,
                                          border: InputBorder.none,
                                          //contentPadding: EdgeInsets.all(16.0),
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.all(12),
                                            child: FaIcon(
                                              FontAwesomeIcons.venusMars,
                                              color: Colors.lightGreen,
                                            ),
                                          )),
                                      isExpanded: true,
                                      items: lista.map((lista) {
                                        return DropdownMenuItem(
                                            value: lista,
                                            child: Text('$lista'));
                                      }).toList(),
                                      onChanged: ((value) => (() {
                                            _generoValue = "Sexo";
                                            // _generoValue += value!;
                                            print(_generoValue);
                                          })),
                                      hint: const Text(
                                        'Género',
                                        style: TextStyle(color: Colors.black26),
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              //textFormfield Edad
                              Expanded(
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: TextFormField(
                                      //controller: _edadR,
                                      keyboardType: TextInputType.number,
                                      cursorColor: Colors.green.shade300,
                                      decoration: const InputDecoration(
                                          focusedBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.all(16.0),
                                          fillColor: Colors.white,
                                          hintText: 'Edad',
                                          hintStyle:
                                              TextStyle(color: Colors.black26),
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.all(12),
                                            child: FaIcon(
                                              FontAwesomeIcons.calendarPlus,
                                              color: Colors.lightGreen,
                                            ),
                                          )),
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          //Telefono
                          Row(
                            children: const [
                              Text(
                                'Telefono',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          //textFormfield Telefono
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                /*  border:
                                      Border.all(color: Colors.green, width: 2),*/
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0))),
                            child: TextFormField(
                              //controller: _nombreF,
                              keyboardType: TextInputType.number,
                              textCapitalization: TextCapitalization.sentences,
                              cursorColor: Colors.green.shade300,
                              decoration: const InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(16.0),
                                  fillColor: Colors.white,
                                  hintText: 'Telefono',
                                  hintStyle: TextStyle(color: Colors.black26),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: FaIcon(
                                      FontAwesomeIcons.whatsapp,
                                      color: Colors.lightGreen,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 4.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: Constants.buttonPrimary,
                      onPressed: () {},
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 12.0),
                          child: const Text(
                            'Actualizar',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.bold),
                          )))
                ],
              )
            ],
          ),
        )*/
        ,
      ),
    );
  }
}

Widget _containerPhoto() {
  return Center(
      child: Container(
          width: 148.0,
          height: 151.0,
          color: AppBasicColors.rgb,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FaIcon(
                FontAwesomeIcons.user,
                color: AppBasicColors.white,
                size: 50.0,
              ),
            ],
          )));
}

Widget _formProfile() {
  final controller = Get.put<PerfilController>(PerfilController());
  return Container(
    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: Form(
        child: Column(
      children: <Widget>[
        //TextFormField Email
        _textFormFielWidget(
            controller.emailP,
            const FaIcon(
              FontAwesomeIcons.user,
              color: AppBasicColors.rgb,
            ),
            'Correo',
            false,
            'Error, el campo no puede estar vacio',
            TextInputType.emailAddress),
        const SizedBox(
          height: 13,
        ),
        //TextFormField nombre completo
        _textFormFielWidget(
            controller.nameP,
            const FaIcon(
              FontAwesomeIcons.user,
              color: AppBasicColors.rgb,
            ),
            'Nombre Completo',
            false,
            'Error, el campo no puede estar vacio',
            TextInputType.text),
        const SizedBox(
          height: 13,
        ),
        //TextFormField fecha de nacimiento
        _textFormFielWidget(
            controller.dateOfBirthP,
            const FaIcon(
              FontAwesomeIcons.calendar,
              color: AppBasicColors.rgb,
            ),
            'Fecha de nacimiento',
            false,
            'Error, el campo no puede estar vacio',
            TextInputType.datetime),
        const SizedBox(
          height: 26.0,
        ),
        _btonSaveChanges()
      ],
    )),
  );
}

Widget _textFormFielWidget(
    TextEditingController controlador,
    FaIcon icono,
    String textGuide,
    bool estate,
    String msgError,
    TextInputType textInputType) {
  return TextFormField(
    controller: controlador,
    keyboardType: textInputType,
    obscureText: estate,
    decoration: InputDecoration(
      prefixIcon: Padding(
        padding: const EdgeInsets.all(12.0),
        child: icono,
      ),
      fillColor: const Color(0xFFDFE6E9),
      filled: true,
      enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: InputBorder.none,
      border: InputBorder.none,
      hintText: textGuide,
      disabledBorder: InputBorder.none,
      contentPadding: const EdgeInsets.all(16.0),
      hintStyle: const TextStyle(color: Colors.black26),
      labelStyle: const TextStyle(color: Colors.green),
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return msgError;
      }
    },
    cursorColor: Colors.black,
  );
}

Widget _btonSaveChanges() {
  return Container(
    width: double.infinity,
    height: 50.0,
    child: ElevatedButton(
        style: Constants.buttonPrimary,
        onPressed: () {
          //Get.to(const Opinion());
        },
        child: const Text(
          'Guardar cambios',
          style: TextStyle(fontSize: 20.0),
        )),
  );
}
