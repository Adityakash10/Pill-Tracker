import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/components/button.dart';
import 'package:flutter_application_2/model/pill_reminder_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  var textcontroller = TextEditingController();
  var medicineNameController = TextEditingController();
  var quantityController = TextEditingController();

  var selectedDate = DateTime.now();
  var selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 179, 227, 153),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 179, 227, 153),
        title: Text(
          "Pill tracker",
          style: GoogleFonts.dmSerifDisplay(fontSize: 44, color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) =>
                  StatefulBuilder(builder: (context, setState) {
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Medication Name Input
                            TextField(
                              controller: medicineNameController,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                labelText: 'Medication Name',
                                filled: true,
                                fillColor: Colors.green[100],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: quantityController,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                labelText: 'Quantity',
                                filled: true,
                                fillColor: Colors.green[100],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),

                            const SizedBox(height: 20),

                            // Start Date Picker
                            ElevatedButton(
                              onPressed: () async {
                                var pickDate = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2099));
                                if (pickDate == null) return;
                                setState(() {
                                  selectedDate = pickDate!;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  backgroundColor: Colors.amber),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(DateFormat("dd-MM-yyyy")
                                      .format(selectedDate)
                                      .toString()),
                                  const Icon(Icons.calendar_today),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () async {
                                var pickTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now());

                                if (pickTime == null) return;
                                setState(() {
                                  selectedTime = pickTime;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(selectedTime.format(context)),
                                  const Icon(Icons.schedule),
                                ],
                              ),
                            ),
                            // Next Button
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () async {
                                // Do something like saving the data
                                try {
                                  var reminder = PillReminderModel(
                                      medicineName:
                                          medicineNameController.text.trim(),
                                      quantity: quantityController.text.trim(),
                                      uid: FirebaseAuth
                                          .instance.currentUser!.uid
                                          .toString(),
                                      addeddate:
                                          Timestamp.fromDate(selectedDate),
                                      time: selectedTime.format(context));

                                  await FirebaseFirestore.instance
                                      .collection("pillReminder")
                                      .add(reminder.toMap());

                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text('Successfully Added!')));
                                } catch (e) {}
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Center(
                                child: Text('Submit'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }));
        },
        child: Icon(Icons.add_circle),
        backgroundColor: Color.fromARGB(255, 126, 189, 93),
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "My pills",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 32, color: Colors.black),
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("pillReminder")
                    .where('uid',
                        isEqualTo:
                            FirebaseAuth.instance.currentUser!.uid.toString())
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data!.docs
                        .map((e) => PillReminderModel.fromMap(e.data()))
                        .toList();
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Card(
                                //        padding: EdgeInsets.all(12),
                                color: Colors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              data[index]
                                                  .medicineName
                                                  .toString(),
                                              style: GoogleFonts.nunito(
                                                  fontSize: 20,
                                                  color: Colors.black)),
                                          Text(data[index].quantity.toString(),
                                              style: GoogleFonts.nunito(
                                                  fontSize: 20,
                                                  color: Colors.black))
                                        ],
                                      ),
                                      Text(data[index].time.toString(),
                                          style: GoogleFonts.nunito(
                                              fontSize: 20,
                                              color: Colors.black))
                                    ],
                                  ),
                                ),
                              ),
                            ));
                  }
                  return Container(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Pain killer",
                                style: GoogleFonts.nunito(
                                    fontSize: 20, color: Colors.black)),
                            Text("1 tablet",
                                style: GoogleFonts.nunito(
                                    fontSize: 20, color: Colors.black))
                          ],
                        ),
                        Text("8 AM",
                            style: GoogleFonts.nunito(
                                fontSize: 20, color: Colors.black))
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
