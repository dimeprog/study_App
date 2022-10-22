import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fireStore = FirebaseFirestore.instance;
final questionPaperRF = fireStore.collection('questionPapers');
DocumentReference questionRF(
        {required String paperID, required String questionID}) =>
    questionPaperRF.doc(paperID).collection('question').doc(questionID);
Reference storage = FirebaseStorage.instance.ref();
