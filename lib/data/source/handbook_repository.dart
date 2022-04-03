import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_babycare/data/model/handbook/theme_handbook_model.dart';

class HandBookRepository {
  static Future<List<ThemeHandBookModel>> fetchAllThemeHandBook() async {
    List<ThemeHandBookModel> list;
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('handbook_theme').get();
      list = snapshot.docs
          .map((doc) => ThemeHandBookModel.fromSnapshot(doc))
          .toList();
    } catch (error) {
      print(error);
      return null;
    }
    return list;
  }
}
