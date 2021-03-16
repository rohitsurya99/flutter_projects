import 'package:flutter/material.dart';
import 'quote.dart';

void main() {
  runApp(MaterialApp(
    home: quote_app(),
  ));
}

class quote_app extends StatefulWidget {
  @override
  _quote_appState createState() => _quote_appState();
}

class _quote_appState extends State<quote_app> {
  List<Quote> quotes = [
    Quote(text: 'If there is will there is way', author: 'Rohit'),
    Quote(
        text: 'every small thing will make grete difference', author: 'surya'),
    Quote(
        text: 'what if I lose the war, I lived the battle', author: 'titanium')
  ];

  Widget quoteTemp(quote) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Text(
                  quote.text,
                  style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(quote.author,
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[800]))
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            'Quotes',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body:
            Column(children: quotes.map((quote) => quoteTemp(quote)).toList()));
  }
}
