class Tooth {
  int? id;
  String? userId;
  String? toothNo;
  String? toothStatus;
  String? hospitalName;
  String? doctorName;
  String? prescription;
  String? xray;
  String? report;
  String? date;

  Tooth(
      {this.id,
      this.userId,
      this.toothNo,
      this.toothStatus,
      this.hospitalName,
      this.doctorName,
      this.prescription,
      this.xray,
      this.report,
      this.date});

  Tooth.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    toothNo = json['tooth_no'];
    toothStatus = json['tooth_status'];
    hospitalName = json['hospital_name'];
    doctorName = json['doctor_name'];
    prescription = json['prescription'];
    xray = json['xray'];
    report = json['report'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['tooth_no'] = toothNo;
    data['tooth_status'] = toothStatus;
    data['hospital_name'] = hospitalName;
    data['doctor_name'] = doctorName;
    data['prescription'] = prescription;
    data['xray'] = xray;
    data['report'] = report;
    data['date'] = date;
    return data;
  }
}
