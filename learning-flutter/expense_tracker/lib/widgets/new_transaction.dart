import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  // const NewTransaction({Key? key}) : super(key: key);
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void onSubmit() {
    widget.addTransaction(
      title: titleController.text,
      amount: double.parse(amountController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(fontSize: 12),
                  ),
                  controller: titleController,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(fontSize: 12),
                ),
                controller: amountController,
                style: TextStyle(fontSize: 16),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.purple,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  ),
                  onPressed: onSubmit,
                  child: Text('Add Transaction'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
