class Weather {
  String airCondition;
  AirQuality airQuality;
  String city;
  String coldIndex;
  String date;
  String distrct;
  String dressingIndex;
  String exerciseIndex;
  List<Future> future;
  String humidity;
  String pollutionIndex;
  String province;
  String sunrise;
  String sunset;
  String temperature;
  String time;
  String updateTime;
  String washIndex;
  String weather;
  String week;
  String wind;

  Weather(
      {this.airCondition,
        this.airQuality,
        this.city,
        this.coldIndex,
        this.date,
        this.distrct,
        this.dressingIndex,
        this.exerciseIndex,
        this.future,
        this.humidity,
        this.pollutionIndex,
        this.province,
        this.sunrise,
        this.sunset,
        this.temperature,
        this.time,
        this.updateTime,
        this.washIndex,
        this.weather,
        this.week,
        this.wind});

  Weather.fromJson(Map<String, dynamic> json) {
    airCondition = json['airCondition'];
    airQuality = json['airQuality'] != null
        ? new AirQuality.fromJson(json['airQuality'])
        : null;
    city = json['city'];
    coldIndex = json['coldIndex'];
    date = json['date'];
    distrct = json['distrct'];
    dressingIndex = json['dressingIndex'];
    exerciseIndex = json['exerciseIndex'];
    if (json['future'] != null) {
      future = new List<Future>();
      json['future'].forEach((v) {
        future.add(new Future.fromJson(v));
      });
    }
    humidity = json['humidity'];
    pollutionIndex = json['pollutionIndex'];
    province = json['province'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temperature = json['temperature'];
    time = json['time'];
    updateTime = json['updateTime'];
    washIndex = json['washIndex'];
    weather = json['weather'];
    week = json['week'];
    wind = json['wind'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['airCondition'] = this.airCondition;
    if (this.airQuality != null) {
      data['airQuality'] = this.airQuality.toJson();
    }
    data['city'] = this.city;
    data['coldIndex'] = this.coldIndex;
    data['date'] = this.date;
    data['distrct'] = this.distrct;
    data['dressingIndex'] = this.dressingIndex;
    data['exerciseIndex'] = this.exerciseIndex;
    if (this.future != null) {
      data['future'] = this.future.map((v) => v.toJson()).toList();
    }
    data['humidity'] = this.humidity;
    data['pollutionIndex'] = this.pollutionIndex;
    data['province'] = this.province;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['temperature'] = this.temperature;
    data['time'] = this.time;
    data['updateTime'] = this.updateTime;
    data['washIndex'] = this.washIndex;
    data['weather'] = this.weather;
    data['week'] = this.week;
    data['wind'] = this.wind;
    return data;
  }
}
class AirQuality {
  int aqi;
  String city;
  String district;
  List<FetureData> fetureData;
  List<HourData> hourData;
  int no2;
  int pm10;
  int pm25;
  String province;
  String quality;
  int so2;
  String updateTime;

  AirQuality(
      {this.aqi,
        this.city,
        this.district,
        this.fetureData,
        this.hourData,
        this.no2,
        this.pm10,
        this.pm25,
        this.province,
        this.quality,
        this.so2,
        this.updateTime});

  AirQuality.fromJson(Map<String, dynamic> json) {
    aqi = json['aqi'];
    city = json['city'];
    district = json['district'];
    if (json['fetureData'] != null) {
      fetureData = new List<FetureData>();
      json['fetureData'].forEach((v) {
        fetureData.add(new FetureData.fromJson(v));
      });
    }
    if (json['hourData'] != null) {
      hourData = new List<HourData>();
      json['hourData'].forEach((v) {
        hourData.add(new HourData.fromJson(v));
      });
    }
    no2 = json['no2'];
    pm10 = json['pm10'];
    pm25 = json['pm25'];
    province = json['province'];
    quality = json['quality'];
    so2 = json['so2'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aqi'] = this.aqi;
    data['city'] = this.city;
    data['district'] = this.district;
    if (this.fetureData != null) {
      data['fetureData'] = this.fetureData.map((v) => v.toJson()).toList();
    }
    if (this.hourData != null) {
      data['hourData'] = this.hourData.map((v) => v.toJson()).toList();
    }
    data['no2'] = this.no2;
    data['pm10'] = this.pm10;
    data['pm25'] = this.pm25;
    data['province'] = this.province;
    data['quality'] = this.quality;
    data['so2'] = this.so2;
    data['updateTime'] = this.updateTime;
    return data;
  }
}

class FetureData {
  int aqi;
  String date;
  String quality;

  FetureData({this.aqi, this.date, this.quality});

  FetureData.fromJson(Map<String, dynamic> json) {
    aqi = json['aqi'];
    date = json['date'];
    quality = json['quality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aqi'] = this.aqi;
    data['date'] = this.date;
    data['quality'] = this.quality;
    return data;
  }
}

class HourData {
  int aqi;
  String dateTime;

  HourData({this.aqi, this.dateTime});

  HourData.fromJson(Map<String, dynamic> json) {
    aqi = json['aqi'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aqi'] = this.aqi;
    data['dateTime'] = this.dateTime;
    return data;
  }
}

class Future {
  String date;
  String dayTime;
  String night;
  String temperature;
  String week;
  String wind;

  Future(
      {this.date,
        this.dayTime,
        this.night,
        this.temperature,
        this.week,
        this.wind});

  Future.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dayTime = json['dayTime'];
    night = json['night'];
    temperature = json['temperature'];
    week = json['week'];
    wind = json['wind'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['dayTime'] = this.dayTime;
    data['night'] = this.night;
    data['temperature'] = this.temperature;
    data['week'] = this.week;
    data['wind'] = this.wind;
    return data;
  }
}
