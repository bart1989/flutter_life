import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_life/cn/lijinfei/flutter_life/home/bloc/home_bloc.dart';
import 'package:flutter_life/cn/lijinfei/flutter_life/home/model/weather_model.dart';
import 'package:flutter_life/cn/lijinfei/flutter_life/utils/common/bloc_provider.dart';
import 'package:path/path.dart';

class HomeWidget extends StatelessWidget{



  @override
  Widget build(BuildContext context) {

    final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Code'),
      ),
      body: Center(
        child: StreamBuilder<Weather>(
            stream: homeBloc.outSteam,
            initialData: null,
            builder: (BuildContext context,
                AsyncSnapshot<Weather> weather) {
              print(weather);
              if(weather.data!=null){
                String result = "今天是"+weather.data.date+weather.data.week+",\n"+weather.data.city+"的天气为"+weather.data.weather+",\n"+weather.data.wind+"，\n气温为"+weather.data.temperature
              +weather.data.washIndex+"擦洗车辆,\n"+weather.data.humidity+",\n"+"空气质量"+weather.data.airCondition;
                return Text(result);
              }else{
                return Text("");
              }
            }),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(height: 50.0,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
//          homeBloc.requestData();
          homeBloc.requestLocation();
        },
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }


}