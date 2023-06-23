import 'package:doc_link/widgets/custom_appbar_widgets.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/const/const.dart';

class PrescriptionDetailsScreen extends StatelessWidget {
  const PrescriptionDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Prescription Details'),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            kHeight25,
            Container(
              height: 200,
              width: double.infinity,
              color: greylight1,
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Drug: ',
                      style: kTextStyleMediumBlack,
                    ),
                    kHeight10,
                    Text(
                      'Usage:',
                      style: kTextStyleMediumBlack,
                    ),
                    kHeight10,
                    Text(
                      'Duration:',
                      style: kTextStyleMediumBlack,
                    ),
                    kHeight10,
                    Text(
                      'Remarks:',
                      style: kTextStyleMediumBlack,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
