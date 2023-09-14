import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PhotoLoad extends GetxController {
  // Variable para guardar la foto
  var selectedPhotoUser = XFile('').obs;
  var photoUserRegister = XFile('').obs;
  var imagePerfilUrl = ''.obs;

  // Método para seleccionar una foto galeria
  void selectPhoto() async {
    final imagePicker = ImagePicker();
    final XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      selectedPhotoUser.value = pickedImage;
      photoUserRegister.value = pickedImage;
      update();
    }
  }

  // Método para seleccionar una foto galeria
  void takePhoto() async {
    final imagePicker = ImagePicker();
    final XFile? takenImage =
        await imagePicker.pickImage(source: ImageSource.camera);

    if (takenImage != null) {
      selectedPhotoUser.value = takenImage;
      update();
    }
  }

  void updatePhotoUrl(String urlImage) {
    print("Cargando foto");
    imagePerfilUrl.value = urlImage;
    update();
  }

  void resetPhoto() {
    photoUserRegister.value = XFile('');
    update();
  }
}
