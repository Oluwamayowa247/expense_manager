import 'package:expense_manager/components/CardList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:expense_manager/Components/CardView.dart';
import 'package:expense_manager/Providers/CardProvider.dart';
import 'package:expense_manager/components/transcationView.dart';
import 'package:expense_manager/model/CardModel.dart';
import 'package:expense_manager/model/transcationModel.dart';
import 'package:expense_manager/pages/addCard.dart';

void main() => runApp(ChangeNotifierProvider<CardProvider>(
      create: (context) => CardProvider(),
      child: new MaterialApp(
        theme: ThemeData(),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    ));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<CardProvider>(context).initialState();

    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 241, 242, 1),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        centerTitle: true,
        title: Text(
          'Home Page',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromRGBO(238, 241, 242, 1),
        elevation: 0,
        leading: null,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddCard()));
            },
            icon: Icon(Icons.add),
            color: Colors.black,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (Provider.of<CardProvider>(context).getCardLength() > 0
                  ? Container(
                      height: 210,
                      child: Consumer<CardProvider>(
                        builder: (context, cards, child) =>
                            CardList(cards: cards.allCards),
                      ),
                      // child: CardView(CardModel(
                      //     1,
                      //     'MasterCard',
                      //     'Alat by WemaNg',
                      //     '1234 **** **** 4321',
                      //     ' US',
                      //     1000)),
                    )
                  : Container(
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Add your new card click the \n + \n button in the top right',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    )),
              SizedBox(
                height: 30,
              ),
              Text(
                'Last Transcations',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black45),
              ),
              SizedBox(
                height: 12,
              ),
              TranscationView(
                  transcation:
                      TranscationModel(1, 'Shopping', 1000, '-', ' US')),
              TranscationView(
                  transcation:
                      TranscationModel(2, 'Salary', 150000, '+', 'US')),
              TranscationView(
                  transcation:
                      TranscationModel(2, 'School Fees', 25000, '-', 'US')),
              TranscationView(
                  transcation:
                      TranscationModel(2, 'Birthday Gift', 25000, '+', 'US'))
            ],
          ),
        ),
      ),
    );
  }
}
