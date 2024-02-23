class Hotel {
  final int hotelNo;
  final String hotelName;
  final String hotelInformationUrl;
  final String hotelImageUrl;
  final double reviewAverage;
  final int hotelMinCharge;

  Hotel({
    required this.hotelNo,
    required this.hotelName,
    required this.hotelInformationUrl,
    required this.hotelImageUrl,
    required this.reviewAverage,
    required this.hotelMinCharge,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      hotelNo: json['hotelBasicInfo']['hotelNo'],
      hotelName: json['hotelBasicInfo']['hotelName'],
      hotelInformationUrl: json['hotelBasicInfo']['hotelInformationUrl'],
      hotelImageUrl: json['hotelBasicInfo']['hotelImageUrl'],
      reviewAverage: json['hotelBasicInfo']['reviewAverage'].toDouble(),
      hotelMinCharge: json['hotelBasicInfo']['hotelMinCharge'],
    );
  }
}
