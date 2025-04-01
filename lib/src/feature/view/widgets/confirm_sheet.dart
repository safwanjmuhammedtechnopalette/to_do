import 'package:flutter/material.dart';
import 'package:to_do/src/constant/app_color.dart';

class ConfirmSheet extends StatelessWidget {
  const ConfirmSheet({super.key});

  static Future<bool> show(BuildContext context) async {
    // the [result] will be false if user cancel and true if user confirm
    final result = await showModalBottomSheet<bool>(
      context: context,
      backgroundColor: AppColor.secondaryColor,
      builder: (context) => ConfirmSheet(),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            'Are you sure you want to delete?',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text('Cancel', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  // Perform delete action here
                  Navigator.pop(
                    context,
                    true,
                  ); // Close and return true if deleted
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Delete'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
