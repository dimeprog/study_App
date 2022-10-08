import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

Reference storage = FirebaseStorage.instance.ref();

class FirebaseStorageServices extends GetxService {
  Future<String?> getImage(String? image) async {
    if (image == null) {
      print('no image passed');
      return null;
    }
    try {
      final urlRef = storage
          .child('question_papers_images')
          .child('${image.toLowerCase()}.png');
      final imgUrl = await urlRef.getDownloadURL();
      print('This is the image url $imgUrl');
      return imgUrl;
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
}
