import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {

  final int index;
DetailsPage(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Song details'),
      ),
      body: Center(
        child:Text('The song composed by#$index', style: TextStyle(fontSize: 32.0),),
      ),
    );
  }
}
