class Hotel {
  final int hotelNo;
  final String hotelName;
  final String hotelInformationUrl;
  final String hotelImageUrl;
  final double reviewAverage;
  final int hotelMinCharge;
  final double latitude;
  final double longitude;

  Hotel({
    required this.hotelNo,
    required this.hotelName,
    required this.hotelInformationUrl,
    required this.hotelImageUrl,
    required this.reviewAverage,
    required this.hotelMinCharge,
    required this.latitude,
    required this.longitude,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      hotelNo: json['hotelBasicInfo']['hotelNo'],
      hotelName: json['hotelBasicInfo']['hotelName'],
      hotelInformationUrl: json['hotelBasicInfo']['hotelInformationUrl'],
      hotelImageUrl: json['hotelBasicInfo']['hotelImageUrl'],
      reviewAverage: json['hotelBasicInfo']['reviewAverage'].toDouble(),
      hotelMinCharge: json['hotelBasicInfo']['hotelMinCharge'],
      latitude: json['hotelBasicInfo']['latitude'].toDouble(),
      longitude: json['hotelBasicInfo']['longitude'].toDouble(),
    );
  }
}
