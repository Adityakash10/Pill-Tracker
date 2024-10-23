import 'package:cloud_firestore/cloud_firestore.dart';

class PillReminderModel {
  String? medicineName;
  String? quantity;
  String? time;
  String? uid;
  Timestamp? addeddate;

  PillReminderModel({
    this.medicineName,
    this.quantity,
    this.time,
    this.uid,
    this.addeddate,
  });

  Map<String, dynamic> toMap() {
    return {
      'medicineName': medicineName,
      'quantity': quantity,
      'time': time,
      'uid': uid,
      'addeddate': addeddate,
    };
  }

  factory PillReminderModel.fromMap(Map<String, dynamic> map) {
    return PillReminderModel(
      medicineName: map['medicineName'],
      quantity: map['quantity'],
      time: map['time'],
      uid: map['uid'],
      addeddate: map['addeddate'],
    );
  }
}
