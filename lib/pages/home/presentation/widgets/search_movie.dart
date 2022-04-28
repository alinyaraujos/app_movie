import 'package:flutter/material.dart';
import 'package:app_movie/core/ui/extensions/screen_size_extensions.dart';
import 'package:app_movie/core/ui/theming/app_fonts.dart';

class SearchMovie extends StatelessWidget {
  const SearchMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 56, right: 70),
          child: Text(
            'Hello, what do you want to watch ?',
            style: TextStyle(
              fontFamily: AppFonts.openSans,
              color: Colors.white,
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 24.h),
        Container(
          margin: const EdgeInsets.only(right: 30, left: 56),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0.3),
          ),
          padding: EdgeInsets.only(
            left: 17.h,
          ),
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.white,
                size: 16.sp,
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: TextFormField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 6.h),
                      isDense: true,
                      fillColor: Colors.transparent,
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 13.sp,
                      ),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class SearchMovie extends StatelessWidget {
//   const SearchMovie({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 56, right: 70),
//           child: Text(
//             'Hello, what do you want to watch ?',
//             style: TextStyle(
//               fontFamily: AppFonts.openSans,
//               color: Colors.white,
//               fontSize: 26.sp,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 24, left: 56, right: 30),
//                 child: TextFormField(
//                   // autofocus: true,
//                   decoration: InputDecoration(
//                     filled: true,
//                     contentPadding: const EdgeInsets.only(
//                       left: 8.0,
//                       bottom: 6.0,
//                       top: 6.0,
//                     ),
//                     isDense: true,
//                     // contentPadding: EdgeInsets.zero,

//                     fillColor: Colors.white.withOpacity(0.3),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                       borderSide: BorderSide.none,
//                     ),
//                     // filled: true,
//                     prefix: Padding(
//                       padding: const EdgeInsets.only(right: 8),
//                       child: Icon(
//                         Icons.search,
//                         color: Colors.white,
//                         size: 16.sp,
//                       ),
//                     ),
//                     prefixIconColor: Colors.white,
//                     hintText: 'Search',
//                     hintStyle: TextStyle(
//                       color: Colors.white,
//                       fontSize: 13.sp,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
