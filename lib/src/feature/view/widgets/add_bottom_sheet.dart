import 'package:flutter/material.dart';
import 'package:to_do/src/constant/app_color.dart';
import 'package:to_do/src/feature/view/widgets/app_text_field.dart';

showAddSheet(BuildContext context, {required void Function(String) onSave}) {
  String toDo = '';
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder:
        (context) => BottomSheet(
          enableDrag: false,
          backgroundColor: AppColor.secondaryColor,
          onClosing: () {},
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
                bottom: MediaQuery.viewInsetsOf(context).bottom + 20,
              ),
              child: StatefulBuilder(
                builder:
                    (context, setState) => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                            Text(
                              'New-To-Do',
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                              onPressed: () => onSave(toDo),

                              child: Text(
                                'Save',
                                style: TextStyle(
                                  color:
                                      toDo.trim().isEmpty
                                          ? Colors.grey
                                          : Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        AppTextField(
                          onChanged: (value) => setState(() => toDo = value),
                        ),
                      ],
                    ),
              ),
            );
          },
        ),
  );
}
