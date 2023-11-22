import 'package:famhive/components/text_content.dart';
import 'package:flutter/material.dart';
import 'package:famhive/components/representative_color.dart';
import 'package:famhive/components/textFormField.dart';
import 'package:famhive/constants.dart';

class PersonCard extends StatefulWidget {
  const PersonCard({
    super.key,
    this.emptyForm = true,
    required this.nameController,
    // this.representativeColor = Colors.white,
  });

  final bool emptyForm;
  final TextEditingController nameController;
  // late final Color representativeColor;

  @override
  State<PersonCard> createState() => _PersonCardState();
}

class _PersonCardState extends State<PersonCard> {
  List<Map<String, dynamic>> colors = [
    {'color': AppColors.colorBlue, 'select': false},
    {'color': AppColors.colorOrange, 'select': false},
    {'color': AppColors.colorYelow, 'select': false},
    {'color': AppColors.colorPurple, 'select': false},
    {'color': AppColors.colorGreen, 'select': false},
    {'color': AppColors.colorGrey, 'select': false},
    {'color': AppColors.colorBlack, 'select': false},
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> representative = List.generate(7, (index) {
      return RepresentativeColor(
          color: colors[index]['color'],
          selected: colors[index]['select'],
          onTap: () {
            setState(() {
              for (var i = 0; i < colors.length; i++) {
                colors[i]['select'] = false;
              }
              colors[index]['select'] = true;
              AppColors.representativeColor = colors[index]['color'];
            });
          });
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextContent(text: 'Name', top: 20),
        CustomTextField(
          text: 'Enter his/ her name',
          empty: widget.emptyForm,
          controller: widget.nameController,
        ),
        const TextContent(
          text: 'Representative Color',
          top: 20,
        ),
        Row(
          children: representative,
        ),
      ],
    );
  }
}
