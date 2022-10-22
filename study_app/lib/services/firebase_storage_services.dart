import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../firebase_reference/firebase_ref.dart';

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
    } on FirebaseException catch (e) {
      print(" The error is ${e}");
      Get.snackbar('Error', '${e.toString}',
          duration: const Duration(
            seconds: 6,
          ),
          backgroundColor: Colors.black54,
          colorText: Colors.white,
          messageText: Text(
            '${e.toString}',
            style: const TextStyle(
              fontSize: 18,
            ),
          ));
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
}
