import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCloudHelper {
  FirebaseCloudHelper._();

  static final FirebaseCloudHelper firebaseCloudHelper = FirebaseCloudHelper._();

  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


  CollectionReference author = firebaseFirestore.collection("authors");
  CollectionReference counter = firebaseFirestore.collection("counter");

  insertData({required String name, required String book}) async {

    QuerySnapshot querySnapshot = await counter.get();

    List<QueryDocumentSnapshot> queryDocumentSnapshot = querySnapshot.docs;


    Map<String, dynamic> noteCounter = queryDocumentSnapshot.last.data() as Map<String, dynamic>;

    int id = noteCounter["id"];

    log(id.toString(),name: "Helper ID");

    await author.doc().set({'name': name, 'book': book,});
    id++;

    counter.doc("author_counter").update({"id": id});
  }

  Stream<QuerySnapshot> fetchAllData() {
    Stream<QuerySnapshot> stream = author.snapshots();

    return stream;
  }

// Todo: Update Data
  Future<void> updateData({required String id, required String name, required String book}) async {
    await author.doc(id).update({
      "name": name,
      "book": book,
    });
  }

// Todo: Delete Data
  Future<void> deleteData({required String deleteId}) async {


    QuerySnapshot querySnapshot = await counter.get();
    List<QueryDocumentSnapshot> queryDocumentSnapshot = querySnapshot.docs;
    Map<String, dynamic> authorCounter = queryDocumentSnapshot.last.data() as Map<String, dynamic>;
    int id = authorCounter["id"];
    id--;
    counter.doc("author_counter").update({"id": id});

    await author.doc(deleteId).delete();

  }


}