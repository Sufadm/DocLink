import 'package:doc_link/const/const.dart';
import 'package:flutter/material.dart';

class ViewAllCategorieWidget extends StatelessWidget {
  final String categoriename;
  const ViewAllCategorieWidget({
    super.key,
    required this.categoriename,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 220, 220, 220)),
        height: 60,
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.person),
              Text(
                categoriename,
                style: kTextStyleMediumBlack,
              ),
            ],
          ),
        ),
      ),
    );
  }
}