import 'package:flutter/material.dart';
import 'package:app_movie/core/ui/extensions/screen_size_extensions.dart';

class SessionTitle extends StatelessWidget {
  final String title;

  const SessionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 13.sp,
            ),
          ),
          Text(
            'See all',
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.w600,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }
}
