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
        title: Text('Weather'),
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
              +"\n"+weather.data.washIndex+"擦洗车辆,\n"+weather.data.humidity+",\n"+"空气质量"+weather.data.airCondition;
                String weatherImageName = "assets/images/fine.png";
                if(weather.data.weather == "晴"){
                  weatherImageName = "assets/images/fine.png";
                }else if(weather.data.weather.contains(new RegExp('阴'))||weather.data.weather.contains(new RegExp('云'))){
                  weatherImageName = "assets/images/cloudy.png";
                }else if(weather.data.weather == "多云转晴"){
                  weatherImageName = "assets/images/cloudy_becoming_fine.png";
                }else if(weather.data.weather.contains(new RegExp('雷'))){
                  weatherImageName = "assets/images/thunderstorm.png";
                }else if(weather.data.weather.contains(new RegExp('雪'))){
                  weatherImageName = "assets/images/sonw.png";
                }

                Image image = new Image(
                    image: new AssetImage(weatherImageName),width: 100.0,height: 100.0,
              // ...
              );
                Column column = new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    new Padding(padding: new EdgeInsets.all(10.0), child: image),
                    new Text(result)
                  ],
                );

                return column;
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