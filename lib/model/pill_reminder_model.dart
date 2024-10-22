import 'package:cloud_firestore/cloud_firestore.dart';

class PillReminderModel {
  String? medicineName;
  String? quantity;
  String? time;
  Timestamp? addeddate;

  PillReminderModel({
    this.medicineName,
    this.quantity,
    this.time,
    this.addeddate,
  });

  Map<String, dynamic> toMap() {
    return {
      'medicineName': medicineName,
      'quantity': quantity,
      'time': time,
      'addeddate': addeddate,
    };
  }

  factory PillReminderModel.fromMap(Map<String, dynamic> map) {
    return PillReminderModel(
      medicineName: map['medicineName'],
      quantity: map['quantity'],
      time: map['time'],
      addeddate: map['addeddate'],
    );
  }
}
