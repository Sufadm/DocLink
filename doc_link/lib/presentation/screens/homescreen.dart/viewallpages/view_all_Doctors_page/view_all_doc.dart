import 'package:doc_link/shared/const/const.dart';
import 'package:doc_link/presentation/screens/homescreen.dart/doctors/doctors_details.dart';
import 'package:doc_link/presentation/screens/homescreen.dart/viewallpages/view_all_Doctors_page/widgets/doctors_list_widget.dart';
import 'package:doc_link/core/search_form.dart';
import 'package:flutter/material.dart';
import '../../../../../model/doctor_profile_model.dart';
import '../../../../../services/firestore_service.dart';
import '../../../../../core/custom_appbar_widgets.dart';

class ViewAllDoctorsPage extends StatelessWidget {
  const ViewAllDoctorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        text: 'All Doctors',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            kHeight15,

            //?search Form------------------------------------------
            const SearchForm(),
            //?all doctors list here-----
            kHeight15,
            StreamBuilder<List<ProfileModel>>(
              stream: FirestoreService().getDoctorsProfilesStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final doctorsList = snapshot.data!;
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: doctorsList.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        kHeight10,
                    itemBuilder: (BuildContext context, int index) {
                      final doctor = doctorsList[index];
                      return DoctorsListWidget(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DoctorsDetails(
                                profile: doctor,
                              ),
                            ),
                          );
                        },
                        doctorname: doctor.name,
                        avatarImageUrl: doctor.imageUrl,
                        categorie: doctor.category,
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
