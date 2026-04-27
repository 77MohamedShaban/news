import 'package:News/core/resources/strings_Manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternet extends StatelessWidget {
  void Function() onClick;
  NoInternet({required this.onClick});
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20.h,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringsManager.noInternetConnection,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontSize: 16),
        ),
        InkWell(
          onTap: onClick,
          child: Icon(
            Icons.replay_circle_filled,
            color: Theme.of(context).colorScheme.primary,
            size: 32.sp,
          ),
        ),
      ],
    );
  }
}
