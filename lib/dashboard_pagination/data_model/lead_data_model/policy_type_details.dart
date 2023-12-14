import 'dart:convert';
import 'image_url_v1.dart';

class PolicyTypeDetails {
  final String? id;
  final bool? isActive;
  final int? createdAt;
  final int? updatedAt;
  final String? name;
  final int? v;
  final String? hindiName;
  final String? imageUrl;
  final ImageUrlV1? imageUrlV1;

  const PolicyTypeDetails({
    this.id,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.v,
    this.hindiName,
    this.imageUrl,
    this.imageUrlV1,
  });

  factory PolicyTypeDetails.fromMap(Map<String, dynamic> data) {
    return PolicyTypeDetails(
      id: data['_id'] as String?,
      isActive: data['isActive'] as bool?,
      createdAt: data['createdAt'] as int?,
      updatedAt: data['updatedAt'] as int?,
      name: data['name'] as String?,
      v: data['__v'] as int?,
      hindiName: data['hindiName'] as String?,
      imageUrl: data['imageUrl'] as String?,
      imageUrlV1: data['imageUrlV1'] == null
          ? null
          : ImageUrlV1.fromMap(data['imageUrlV1'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        '_id': id,
        'isActive': isActive,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'name': name,
        '__v': v,
        'hindiName': hindiName,
        'imageUrl': imageUrl,
        'imageUrlV1': imageUrlV1?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PolicyTypeDetails].
  factory PolicyTypeDetails.fromJson(String data) {
    return PolicyTypeDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PolicyTypeDetails] to a JSON string.
  String toJson() => json.encode(toMap());

  PolicyTypeDetails copyWith({
    String? id,
    bool? isActive,
    int? createdAt,
    int? updatedAt,
    String? name,
    int? v,
    String? hindiName,
    String? imageUrl,
    ImageUrlV1? imageUrlV1,
  }) {
    return PolicyTypeDetails(
      id: id ?? this.id,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      v: v ?? this.v,
      hindiName: hindiName ?? this.hindiName,
      imageUrl: imageUrl ?? this.imageUrl,
      imageUrlV1: imageUrlV1 ?? this.imageUrlV1,
    );
  }

}
