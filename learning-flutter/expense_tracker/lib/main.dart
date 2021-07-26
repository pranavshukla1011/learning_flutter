import './widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      home: MyAppHomepage(),
    );
  }
}

class MyAppHomepage extends StatefulWidget {
  // const myAppHomepage({Key? key}) : super(key: key);

  @override
  _MyAppHomepageState createState() => _MyAppHomepageState();
}

class _MyAppHomepageState extends State<MyAppHomepage> {
  final List<Transaction> _userTransactions = [
    Transaction(id: '0', title: 'Shoes', amount: 35, date: DateTime.now()),
    Transaction(id: '1', title: 'Clothes', amount: 135, date: DateTime.now())
  ];

  String id = '0';

  void _addNewTransaction({String title = '', double amount = -1}) {
    if (title != '' && amount >= 0) {
      setState(() {
        _userTransactions.add(
          Transaction(
              id: id, amount: amount, title: title, date: DateTime.now()),
        );
      });
      id = (int.parse(id) + 1).toString();
    }
  }

  void _startAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Track Your Expense'),
          actions: [
            IconButton(
              onPressed: () => _startAddTransaction(context),
              icon: Icon(Icons.add),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _startAddTransaction(context),
          child: Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Card(
                  child: Text(
                    'Chart',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  color: Colors.blue,
                ),
              ),
              TransactionList(_userTransactions),
              Container(
                height: 300,
                color: Colors.red,
              ),
            ],
          ),
        ));
  }
}
