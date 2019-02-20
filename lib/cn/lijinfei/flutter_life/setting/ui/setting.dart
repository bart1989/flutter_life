import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget{

  SettingPage({this.title});
  final String title;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
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