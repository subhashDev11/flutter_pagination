import 'dart:convert';

class StatusHistory {
  final String? currStatus;
  final DateTime? date;
  final String? id;

  const StatusHistory({this.currStatus, this.date, this.id});

  factory StatusHistory.fromMap(Map<String, dynamic> data) => StatusHistory(
        currStatus: data['currStatus'] as String?,
        date: data['date'] == null
            ? null
            : DateTime.parse(data['date'] as String),
        id: data['_id'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'currStatus': currStatus,
        'date': date?.toIso8601String(),
        '_id': id,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StatusHistory].
  factory StatusHistory.fromJson(String data) {
    return StatusHistory.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [StatusHistory] to a JSON string.
  String toJson() => json.encode(toMap());

  StatusHistory copyWith({
    String? currStatus,
    DateTime? date,
    String? id,
  }) {
    return StatusHistory(
      currStatus: currStatus ?? this.currStatus,
      date: date ?? this.date,
      id: id ?? this.id,
    );
  }

}
