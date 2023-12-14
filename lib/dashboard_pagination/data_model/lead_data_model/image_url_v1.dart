import 'dart:convert';

class ImageUrlV1 {
  final String? selectedImageUrl;
  final String? unselectedImageUrl;

  const ImageUrlV1({this.selectedImageUrl, this.unselectedImageUrl});

  factory ImageUrlV1.fromMap(Map<String, dynamic> data) => ImageUrlV1(
        selectedImageUrl: data['selectedImageUrl'] as String?,
        unselectedImageUrl: data['unselectedImageUrl'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'selectedImageUrl': selectedImageUrl,
        'unselectedImageUrl': unselectedImageUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ImageUrlV1].
  factory ImageUrlV1.fromJson(String data) {
    return ImageUrlV1.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ImageUrlV1] to a JSON string.
  String toJson() => json.encode(toMap());

  ImageUrlV1 copyWith({
    String? selectedImageUrl,
    String? unselectedImageUrl,
  }) {
    return ImageUrlV1(
      selectedImageUrl: selectedImageUrl ?? this.selectedImageUrl,
      unselectedImageUrl: unselectedImageUrl ?? this.unselectedImageUrl,
    );
  }

}
