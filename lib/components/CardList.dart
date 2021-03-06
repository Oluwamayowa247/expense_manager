// ignore: file_names
import 'package:expense_manager/components/cardView.dart';

import 'package:expense_manager/model/cardModel.dart';
import 'package:expense_manager/pages/CardViewPage.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  final List<CardModel> cards;

  const CardList({Key? key, required this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: getChildrenCards(context),
    );
  }

  List<Widget> getChildrenCards(context) {
    return cards
        .map((card) => GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CardViewPage(card: card)));
            },
            child: CardView(card: card)))
        .toList();
  }
}
