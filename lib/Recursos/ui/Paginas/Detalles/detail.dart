import 'package:app_turismo_usuario/Recursos/ui/Widget/Card/card_image_list.dart';
// import 'package:app_turismo_usuario/Recursos/Paginas/Detalles/detailController.dart';
import 'package:app_turismo_usuario/Recursos/ui/Widget/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Detail extends GetView {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {    

    List<String> imagePaths = [
      'https://picsum.photos/536/354',
      'https://picsum.photos/536/354',
    ];

    return Scaffold(
      body: Column(
        children: [
          _containerPhoto(imagePaths),
          const SizedBox(
            height: 8.0,
          ),
          Expanded(child: SingleChildScrollView(child: _containerDescripcion()))
        ],
      ),
    );
  }
}

Widget _containerPhoto(List<String> imagePaths) {
  // final controller = Get.put<DetailController>(DetailController());
  return Stack(children: [
    SafeArea(child: CardImageList(imageList: imagePaths)),
    _btnArrowBack()
  ]);
}

Widget _btnArrowBack() {
  return Positioned(
    top: 50.0,
    left: 10.0,
    child: CustomBackButton(onPressed: () {
      Get.back();
    }),
  );
}

Widget _containerDescripcion() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
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
