class MyRequestItemsModel {
  final int? age;
  final String? gender;
  final String maritalStatus;
  final String? occupation;
  final String? monthlyIncome;
  final String? educationalQualifications;
  final int? familySize;
  final double latitude;
  final double longitude;
  final int pincode;
  final String? feedback;

  MyRequestItemsModel({
    this.age,
    required this.gender,
    required this.maritalStatus,
    this.occupation,
    this.monthlyIncome,
    this.educationalQualifications,
    this.familySize,
    required this.latitude,
    required this.longitude,
    required this.pincode,
    this.feedback,
  });

  factory MyRequestItemsModel.fromJson(Map<String, dynamic> json) =>
      MyRequestItemsModel(
        age: json['Age'] as int?,
        gender: json['Gender'] as String? ?? '',
        maritalStatus: json['Marital Status'] as String? ?? '',
        occupation: json['Occupation'] as String?,
        monthlyIncome: json['Monthly Income'] as String?,
        educationalQualifications:
            json['Educational Qualifications'] as String?,
        familySize: json['Family size'] as int?,
        latitude: json['latitude'] as double? ?? 0.0,
        longitude: json['longitude'] as double? ?? 0.0,
        pincode: json['Pin code'] as int? ?? 0,
        feedback: json['Feedback'] as String?,
      );

  Map<String, dynamic> toJson() => {
        if (age != null) 'Age': age,
        'Gender': gender,
        'Marital Status': maritalStatus,
        if (occupation != null) 'Occupation': occupation,
        if (monthlyIncome != null) 'Monthly Income': monthlyIncome,
        if (educationalQualifications != null)
          'Educational Qualifications': educationalQualifications,
        if (familySize != null) 'Family size': familySize,
        'latitude': latitude,
        'longitude': longitude,
        'Pin code': pincode,
        if (feedback != null) 'Feedback': feedback,
      };
}
