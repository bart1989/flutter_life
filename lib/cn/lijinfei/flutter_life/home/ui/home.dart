import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Code'),
      ),
      body: Center(
        child: Text('You have pressed the button 0 times.'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(height: 50.0,),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () => setState(() {
//          _count++;
//        }),
//        tooltip: 'Increment Counter',
//        child: Icon(Icons.add),
//      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }


}