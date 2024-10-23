// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/button.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatefulWidget {
  IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  var textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 179, 227, 153),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 25),
            Text(
              "SIMPILLIFY",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 28, color: Colors.white),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Image.asset(
                'assets/Screenshot 2024-10-22 at 7.50.02 PM.png',
                height: 300,
              ),
              // add image here
            ),
            SizedBox(height: 25),
            Text(
              "SIMPLIFY YOUR LIFE",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 44, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              "Simplify your medications",
              style: TextStyle(
                color: Colors.grey[300],
                height: 2,
              ),
            ),
            SizedBox(height: 25),
            MyButton(
              text: "Get Started",
              onTap: () {
                Navigator.pushNamed(context, '/loginpage');
              },
            )
          ],
        ),
      ),
    );
  }
}










      /*
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
                              onChanged: (value) {
                                setState(() {
                                  //  _medicationName = value;
                                });
                              },
                              decoration: InputDecoration(
                                labelText: 'Medication Name',
                                filled: true,
                                fillColor: Colors.green[100],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 20),

                            // Frequency Selector
                            ElevatedButton(
                              onPressed: () {
                                setState(() {});
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
                                  Text('Remind me everyday'),
                                  Icon(Icons.edit),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),

                            // Start Date Picker
                            ElevatedButton(
                              onPressed: () async {
                                var pickDate = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2099));
                                setState(() {
                                  selectedDate = pickDate!;
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
                                  Text(selectedDate.toString()),
                                  Icon(Icons.calendar_today),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),

                            // Next Button
                            ElevatedButton(
                              onPressed: () {
                                // Do something like saving the data
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Center(
                                child: Text('Next'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }));
        },
        child: Icon(Icons.add_circle),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Color.fromARGB(255, 130, 250, 200),
      body: Center(child: bottomPageList.elementAt(currentIndex)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              //color: Colors.green,
              size: 40,
            ),
            label: 'Add Medicine',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 40),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}*/
