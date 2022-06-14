import 'package:expense_manager/Providers/CardProvider.dart';
import 'package:expense_manager/components/cardView.dart';
import 'package:expense_manager/model/cardModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CardViewPage extends StatefulWidget {
  final CardModel card;
  const CardViewPage({Key? key, required this.card}) : super(key: key);

  @override
  State<CardViewPage> createState() => _CardViewPageState();
}

class _CardViewPageState extends State<CardViewPage> {
  void onRemove(card) {
    Provider.of<CardProvider>(context, listen: false).removeCard(card);
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 241, 242, 1),
      appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          centerTitle: true,
          title: Text(
            'Card View',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color.fromRGBO(238, 241, 242, 1),
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black45,
                size: 20,
              )),
          actions: [
            IconButton(
                icon: Icon(Icons.delete, color: Colors.black45),
                onPressed: () {
                  onRemove(widget.card);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ));
                }),
          ]),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Transform.translate(
            offset: Offset.fromDirection(0, 9),
            child: Container(
              height: 210,
              child: CardView(card: widget.card),
            ),
          ),
        ),
      ),
    );
  }
}
