import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomHospitalcard extends StatelessWidget {
  const CustomHospitalcard({
    super.key,
    required this.hospitalName,
    required this.hospitalLocation,
    required this.hospitalRating,
  });
  final String hospitalName;
  final String hospitalLocation;
  final int hospitalRating;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.brown.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: FaIcon(
            FontAwesomeIcons.staffSnake,
            color: Colors.brown.shade300,
            fontWeight: FontWeight.w500,
          ),
        ),
        title: Text(hospitalName),
        subtitle: Text(hospitalLocation),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            return Icon(
              Icons.star,
              color: index < hospitalRating
                  ? Colors.amber
                  : Colors.grey.shade300,
              size: 12,
            );
          }),
        ),
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => ListView(children: [] ),
          );
        },
      ),
    );
  }
}
