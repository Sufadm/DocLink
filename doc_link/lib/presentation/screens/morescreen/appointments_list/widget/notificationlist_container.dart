import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../shared/const/const.dart';
import '../appointment_details.dart';

class NotificationListDetailsWidget extends StatelessWidget {
  const NotificationListDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('doctors')
          .where('userId', isEqualTo: currentUser?.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<QueryDocumentSnapshot> appointments =
              snapshot.data!.docs.cast<QueryDocumentSnapshot>();
          if (appointments.isEmpty) {
            return Center(
              child: Text(
                'No Appointments!',
                style: kTextStyleMediumBlack,
              ),
            );
          }
          final groupedAppointments = groupAppointmentsByUser(appointments);

          return ListView.separated(
            itemBuilder: (context, index) {
              final appointmentGroup = groupedAppointments[index];
              // final appointmentData =
              //     appointments[index].data() as Map<String, dynamic>;
              final name = appointmentGroup[0]['doctorName'] as String?;
              final category = appointmentGroup[0]['doctorCategory'] as String?;
              final time = appointmentGroup[0]['appointmentTime'];
              final date = appointmentGroup[0]['appointmentDate'];
              final gender = appointmentGroup[0]['gender'];

              final image = appointmentGroup[0]['doctorImage'];
              final appointmentCount = appointmentGroup.length;

              return Card(
                color: kWhiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10, // Adjust the vertical padding as desired
                    horizontal: 12,
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(image),
                    radius: 25,
                  ),
                  // title:
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name ?? '',
                            style: GoogleFonts.outfit(
                                color: kBlackColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            category ?? '',
                            style: GoogleFonts.outfit(color: kBlackColor),
                          ),
                        ],
                      ),
                      Text(
                        date,
                        style: GoogleFonts.outfit(color: kBlackColor),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 7),
                        child: CircleAvatar(
                          foregroundColor: kBlackColor,
                          radius: 20,
                          child: Text(
                            '$appointmentCount',
                            style: GoogleFonts.outfit(),
                          ),
                        ),
                      )
                    ],
                  ),
                  // Add onTap functionality if required
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AppointmentDetails(
                        times: appointmentGroup
                            .map((appointment) =>
                                appointment['appointmentTime'] as String)
                            .toList(),
                        // dates: appointmentGroup
                        //     .map((appointment) =>
                        //         appointment['appointmentDate'] as String)
                        //     .toList(),
                        names: appointmentGroup
                            .map((appointment) =>
                                appointment['doctorName'] as String)
                            .toList(),
                        images: appointmentGroup
                            .map((appointment) =>
                                appointment['doctorImage'] as String)
                            .toList(),
                      );
                    }));
                  },
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 15),
            itemCount: groupedAppointments.length,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  List<List<QueryDocumentSnapshot>> groupAppointmentsByUser(
      List<QueryDocumentSnapshot> appointments) {
    final Map<String, List<QueryDocumentSnapshot>> groupedMap = {};
    for (final appointment in appointments) {
      final userName = appointment['userName'];
      if (groupedMap.containsKey(userName)) {
        groupedMap[userName]!.add(appointment);
      } else {
        groupedMap[userName] = [appointment];
      }
    }
    return groupedMap.values.toList();
  }
}
