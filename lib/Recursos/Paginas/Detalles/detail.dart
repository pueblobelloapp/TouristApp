import 'package:app_turismo_usuario/Recursos/Paginas/Detalles/detailController.dart';
import 'package:app_turismo_usuario/Recursos/Widget/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Detail extends GetView<DetailController> {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _containerPhoto(),
          const SizedBox(
            height: 8.0,
          ),
          Expanded(child: SingleChildScrollView(child: _containerDescripcion()))
        ],
      ),
    );
  }
}

Widget _containerPhoto() {
  return Stack(children: [
    SafeArea(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0)),
        child: Container(
          width: double.infinity,
          height: 282.0,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('Assets/Img/sitiocard.png'), //
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ),
    _btnArrowBack()
  ]);
}

Widget _btnArrowBack() {
  return CustomBackButton(onPressed: () {
    Get.back();
  });
  /*Positioned(
    top: 40.0,
    left: 10.0,
    child: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {},
    ),
  );*/
}

Widget _containerDescripcion() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        //SizedBox(height: 320.0),
        Text(
          'Título',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta dignissimos numquam hic deserunt asperiores id obcaecati dicta repudiandae nihil magnam neque nostrum laborum, ullam distinctio voluptatem tenetur eveniet blanditiis ducimus.',
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          'Subtitulo 1',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta dignissimos numquam hic deserunt asperiores id obcaecati dicta repudiandae nihil magnam neque nostrum laborum, ullam distinctio voluptatem tenetur eveniet blanditiis ducimus.',
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          'Subtitulo 2',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta dignissimos numquam hic deserunt asperiores id obcaecati dicta repudiandae nihil magnam neque nostrum laborum, ullam distinctio voluptatem tenetur eveniet blanditiis ducimus.',
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          'Subtitulo 3',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta dignissimos numquam hic deserunt asperiores id obcaecati dicta repudiandae nihil magnam neque nostrum laborum, ullam distinctio voluptatem tenetur eveniet blanditiis ducimus.',
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          'Subtitulo 4',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta dignissimos numquam hic deserunt asperiores id obcaecati dicta repudiandae nihil magnam neque nostrum laborum, ullam distinctio voluptatem tenetur eveniet blanditiis ducimus.',
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
