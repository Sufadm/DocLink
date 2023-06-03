import 'package:doc_link/const/const.dart';
import 'package:doc_link/presentation/screens/homescreen.dart/doctors/widgets/doctors_profile_widget.dart';
import 'package:doc_link/presentation/screens/homescreen.dart/doctors/widgets/prescriptionlist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorsDetails extends StatelessWidget {
  const DoctorsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHeight10,
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            //Doctors profile---------------------------------------------------
            const DoctorsProfileWidget(),
            kHeight25,
            Container(
              margin: const EdgeInsets.only(
                left: 80,
                right: 115,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment',
                    style: GoogleFonts.lato(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 67, 63, 63)),
                  ),
                  Text(
                    "₹ 550/",
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: const Color.fromARGB(255, 67, 63, 63)),
                  )
                ],
              ),
            ),
            kHeight25,
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            //prescription List-------------------------------------------------
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                'Prescriptions',
                style: kTextStyleLargeBlack,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: const [
                    PrescriptionListWidget(
                      prescriptionName: 'Prescription 1',
                    ),
                    kHeight10,
                    PrescriptionListWidget(
                      prescriptionName: 'Prescription 2',
                    ),
                    kHeight10,
                    PrescriptionListWidget(
                      prescriptionName: 'Prescription 3',
                    ),
                  ],
                ),
              ),
            ),
            //prescription List---END----------------------------------------
          ],
        ),
      ),
    );
  }
}