import 'package:flutter/material.dart';
import 'package:peyman/Utils/images.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(360),
          child: Image.asset(
            Images.profilePicture,
            height: 50,
            width: 50,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Image.asset(
          Images.dropDownIcon,
          width: 10,
          height: 5,
        )
      ],
    );
  }
}