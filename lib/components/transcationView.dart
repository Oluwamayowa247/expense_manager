import 'package:expense_manager/model/transcationModel.dart';
import 'package:flutter/material.dart';

class TranscationView extends StatefulWidget {
  final TranscationModel transcation;

  const TranscationView({Key? key, required this.transcation})
      : super(key: key);

  @override
  State<TranscationView> createState() => _TranscationViewState();
}

class _TranscationViewState extends State<TranscationView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              widget.transcation.type == "+"
                  ? Icon(
                      Icons.arrow_downward,
                      color: Colors.green,
                    )
                  : Icon(
                      Icons.arrow_upward,
                      color: Colors.red,
                    ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.transcation.name,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.transcation.type + widget.transcation.price.toString(),
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                widget.transcation.currency,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
