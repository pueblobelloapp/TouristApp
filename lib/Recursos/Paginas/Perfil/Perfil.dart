import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../Widget/Constans.dart';
import 'PerfilController.dart';

class PerfilPage extends GetView<PerfilController> {
  String _generoValue = "";
  final lista = ['Masculino', 'Femenino'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
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
        ),
      ),
    );
  }
}
