import 'package:flutter/material.dart';
import 'package:lancemeup/constants/text_constants.dart';
import 'package:lancemeup/presentation/screens/login_screen/widgets/custom_text.dart';

Future<bool?> showLogoutBottomSheet(BuildContext context) {
  return showModalBottomSheet<bool>(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: CustomText(text: sureText, size: 16, isBold: true),
            ),
            const SizedBox(height: 8),
            const CustomText(text: sureDesc, size: 12),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const CustomText(text: "Logout")),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: InkWell(
                    onTap: () => Navigator.of(context).pop(false),
                    child: const CustomText(text: "Cancel")),
              ),
            )
          ],
        ),
      );
    },
  );
}
