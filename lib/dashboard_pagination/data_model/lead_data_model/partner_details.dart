import 'dart:convert';

class PartnerDetails {
  final List<dynamic>? companyName;
  final String? name;

  const PartnerDetails({this.companyName, this.name});

  factory PartnerDetails.fromMap(Map<String, dynamic> data) {
    return PartnerDetails(
      companyName: data['companyName'] as List<dynamic>?,
      name: data['name'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'companyName': companyName,
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PartnerDetails].
  factory PartnerDetails.fromJson(String data) {
    return PartnerDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PartnerDetails] to a JSON string.
  String toJson() => json.encode(toMap());

  PartnerDetails copyWith({
    List<dynamic>? companyName,
    String? name,
  }) {
    return PartnerDetails(
      companyName: companyName ?? this.companyName,
      name: name ?? this.name,
    );
  }

}
