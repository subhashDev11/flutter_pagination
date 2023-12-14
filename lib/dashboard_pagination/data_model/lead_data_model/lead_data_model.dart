import 'dart:convert';
import 'partner_details.dart';
import 'policy_type_details.dart';
import 'status_history.dart';

class LeadDataModel {
  final String? id;
  final String? name;
  final String? email;
  final String? status;
  final String? mobile;
  final String? leadNumber;
  final List<StatusHistory>? statusHistory;
  final PolicyTypeDetails? policyTypeDetails;
  final int? createdAt;
  final String? complaintTypeName;
  final String? insuranceCompanyName;
  final String? assignToExpert;
  final String? leadCreatedBy;
  final PartnerDetails? partnerDetails;

  const LeadDataModel({
    this.id,
    this.name,
    this.email,
    this.status,
    this.mobile,
    this.leadNumber,
    this.statusHistory,
    this.policyTypeDetails,
    this.createdAt,
    this.complaintTypeName,
    this.insuranceCompanyName,
    this.assignToExpert,
    this.leadCreatedBy,
    this.partnerDetails,
  });

  factory LeadDataModel.fromMap(Map<String, dynamic> data) => LeadDataModel(
        id: data['_id'] as String?,
        name: data['name'] as String?,
        email: data['email'] as String?,
        status: data['status'] as String?,
        mobile: data['mobile'] as String?,
        leadNumber: data['leadNumber'] as String?,
        statusHistory: (data['statusHistory'] as List<dynamic>?)
            ?.map((e) => StatusHistory.fromMap(e as Map<String, dynamic>))
            .toList(),
        policyTypeDetails: data['policyTypeDetails'] == null
            ? null
            : PolicyTypeDetails.fromMap(
                data['policyTypeDetails'] as Map<String, dynamic>),
        createdAt: data['createdAt'] as int?,
        complaintTypeName: data['complaintTypeName'] as String?,
        insuranceCompanyName: data['insuranceCompanyName'] as String?,
        assignToExpert: data['assignToExpert'] as String?,
        leadCreatedBy: data['leadCreatedBy'] as String?,
        partnerDetails: data['partnerDetails'] == null
            ? null
            : PartnerDetails.fromMap(
                data['partnerDetails'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        '_id': id,
        'name': name,
        'email': email,
        'status': status,
        'mobile': mobile,
        'leadNumber': leadNumber,
        'statusHistory': statusHistory?.map((e) => e.toMap()).toList(),
        'policyTypeDetails': policyTypeDetails?.toMap(),
        'createdAt': createdAt,
        'complaintTypeName': complaintTypeName,
        'insuranceCompanyName': insuranceCompanyName,
        'assignToExpert': assignToExpert,
        'leadCreatedBy': leadCreatedBy,
        'partnerDetails': partnerDetails?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LeadDataModel].
  factory LeadDataModel.fromJson(String data) {
    return LeadDataModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LeadDataModel] to a JSON string.
  String toJson() => json.encode(toMap());

  LeadDataModel copyWith({
    String? id,
    String? name,
    String? email,
    String? status,
    String? mobile,
    String? leadNumber,
    List<StatusHistory>? statusHistory,
    PolicyTypeDetails? policyTypeDetails,
    int? createdAt,
    String? complaintTypeName,
    String? insuranceCompanyName,
    String? assignToExpert,
    String? leadCreatedBy,
    PartnerDetails? partnerDetails,
  }) {
    return LeadDataModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      status: status ?? this.status,
      mobile: mobile ?? this.mobile,
      leadNumber: leadNumber ?? this.leadNumber,
      statusHistory: statusHistory ?? this.statusHistory,
      policyTypeDetails: policyTypeDetails ?? this.policyTypeDetails,
      createdAt: createdAt ?? this.createdAt,
      complaintTypeName: complaintTypeName ?? this.complaintTypeName,
      insuranceCompanyName: insuranceCompanyName ?? this.insuranceCompanyName,
      assignToExpert: assignToExpert ?? this.assignToExpert,
      leadCreatedBy: leadCreatedBy ?? this.leadCreatedBy,
      partnerDetails: partnerDetails ?? this.partnerDetails,
    );
  }

}
