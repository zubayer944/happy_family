import 'package:flutter/material.dart';

import '../custom_text_field/text_field_title.dart';

class RadiusBorderDatePicker extends StatelessWidget {
  final String title;
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;

  const RadiusBorderDatePicker({super.key, this.selectedDate, required this.onDateSelected,required this.title});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFieldTitle(title),
          const SizedBox(height: 5,),
          InkWell(
            onTap: () {
              _selectDate(context);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding:const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today),
                  const SizedBox(width: 16),
                  Text(
                    "${selectedDate?.toLocal()}".split(' ')[0],
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {

    final DateTime? picked = await showDatePicker(
        context: context,
        fieldHintText: "Select Date",
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate) {
      onDateSelected(picked);
    }
  }

}