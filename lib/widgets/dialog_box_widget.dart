import 'package:flutter/material.dart';
import 'package:peyman/Utils/font_style.dart';
import 'package:peyman/widgets/custom_button.dart';
import 'package:peyman/widgets/responsive/adaptive_reolution.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const SuccessDialog({
    super.key,
    this.title = 'Successfully gathered the information!',
    this.message =
        'We\'ve gathered all the information from your \'Title Deed\' successfully, please proceed to the next step to verify your info.',
    this.buttonText = 'Verify',
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Container(
      width: 680.w,
      height: 418.h,
      padding: EdgeInsets.only(top: 40.h, left: 30.w, right: 30.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 103.w,
            height: 100.w,
            decoration: const BoxDecoration(
              color: Color(0xFF6A3DE8),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 36.w,
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: getDialogBoxHeadingTextStyle(context),
          ),
          SizedBox(height: 10.h),
          Text(
            message,
            textAlign: TextAlign.center,
            style: getDialogBoxInfoTextStyle(context),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: 300.w,
            child: CustomButton(
              height: 54,
              label: 'Verify',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

void showSuccessDialogWithAnimation(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: 'Dismiss',
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) => const SizedBox(),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutQuad,
      );

      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1), // Start from bottom
          end: Offset.zero, // End at center
        ).animate(curvedAnimation),
        child: FadeTransition(
          opacity: animation,
          child: SuccessDialog(
            onButtonPressed: () {
              Navigator.of(context).pop(); // Close dialog
              // Add your verify action here
            },
          ),
        ),
      );
    },
  );
}
