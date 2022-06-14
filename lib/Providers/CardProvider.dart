// ignore: file_names
import 'dart:collection';
import 'dart:convert';

import 'package:expense_manager/model/cardModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardProvider with ChangeNotifier {
  late List<CardModel> cards = [];
  late CardModel cardModel;

  UnmodifiableListView<CardModel> get allCards => UnmodifiableListView(cards);

  void initialState() {
    syncDataWithProvider();
  }

  void addCard(CardModel _card) {
    cards.add(_card);

    updateSharedPreferences();

    notifyListeners();
  }

  void removeCard(CardModel _card) {
    cards.removeWhere((element) => element.number == _card.number);
    updateSharedPreferences();
    notifyListeners();
  }

  int getCardLength() {
    return cards.length;
  }

  Future<void> updateSharedPreferences() async {
    List<String> myCards = cards.map((e) => json.encode(e.toJson())).toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('cards', myCards);
  }

  Future syncDataWithProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var reslut = prefs.getStringList('cards');

    if (reslut != null) {
      cards = reslut
          .map((e) => CardModel.fromJson(json.decode(e), cards.toString()))
          .toList();
    }
    notifyListeners();
  }
}
