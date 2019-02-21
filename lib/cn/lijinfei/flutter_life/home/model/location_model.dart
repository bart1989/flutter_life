class LocationModel {

  String formattedAddress;
  AddressComponent addressComponent;





  LocationModel(
      {
        this.formattedAddress,

        this.addressComponent,
        });

  LocationModel.fromJson(Map<String, dynamic> json) {

    formattedAddress = json['formatted_address'];

    addressComponent = json['addressComponent'] != null
        ? new AddressComponent.fromJson(json['addressComponent'])
        : null;


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['formatted_address'] = this.formattedAddress;

    if (this.addressComponent != null) {
      data['addressComponent'] = this.addressComponent.toJson();
    }

    return data;
  }
}

class AddressComponent {
  String country;
  int countryCode;
  String countryCodeIso;
  String countryCodeIso2;
  String province;
  String city;
  int cityLevel;
  String district;
  String town;
  String adcode;
  String street;
  String streetNumber;
  String direction;
  String distance;

  AddressComponent(
      {this.country,
        this.countryCode,
        this.countryCodeIso,
        this.countryCodeIso2,
        this.province,
        this.city,
        this.cityLevel,
        this.district,
        this.town,
        this.adcode,
        this.street,
        this.streetNumber,
        this.direction,
        this.distance});

  AddressComponent.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    countryCode = json['country_code'];
    countryCodeIso = json['country_code_iso'];
    countryCodeIso2 = json['country_code_iso2'];
    province = json['province'];
    city = json['city'];
    cityLevel = json['city_level'];
    district = json['district'];
    town = json['town'];
    adcode = json['adcode'];
    street = json['street'];
    streetNumber = json['street_number'];
    direction = json['direction'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['country_code'] = this.countryCode;
    data['country_code_iso'] = this.countryCodeIso;
    data['country_code_iso2'] = this.countryCodeIso2;
    data['province'] = this.province;
    data['city'] = this.city;
    data['city_level'] = this.cityLevel;
    data['district'] = this.district;
    data['town'] = this.town;
    data['adcode'] = this.adcode;
    data['street'] = this.street;
    data['street_number'] = this.streetNumber;
    data['direction'] = this.direction;
    data['distance'] = this.distance;
    return data;
  }
}

