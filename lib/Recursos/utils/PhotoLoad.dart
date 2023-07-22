
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PhotoLoad extends GetxController {

  // Variable para guardar la foto
  var selectedPhoto = XFile('').obs;
  var imagePerfilUrl = ''.obs;

  // Método para seleccionar una foto
  void selectPhoto() async {
    final imagePicker = ImagePicker();
    final XFile? pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      selectedPhoto.value = pickedImage;
      update();
    }
  }

  void updatePhotoUrl(String urlImage) {
    print("Cargando foto");
    imagePerfilUrl.value = urlImage;
    update();
  }
}