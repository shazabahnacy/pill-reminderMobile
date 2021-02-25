import 'package:medicine_reminder/src/models/medicine.dart';
import 'package:flutter/cupertino.dart';
import 'package:medicine_reminder/src/models/medicine.dart';
import 'package:medicine_reminder/src/screens/new_entry/editReminder.dart';

class CartItem extends ChangeNotifier {
  List<Medicines> products = [];

  editreminder(Medicines medicines) {
    products.add(medicines);
    notifyListeners();
  }

  deleteProduct(Medicines product) {
    products.remove(product);
    notifyListeners();
  }
}
