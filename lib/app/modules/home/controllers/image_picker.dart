import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  RxString imagePath = ''.obs;

  Future<String?> getImage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      return image.path;
    }
    return null;
  }

  // Metode untuk mengatur gambar sebagai foto profil
  void setProfileImage(String path) {
    imagePath.value = path;
  }
}
