import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_movie/core/helpers/environments.dart';
import 'package:app_movie/core/ui/extensions/screen_size_extensions.dart';
import 'package:app_movie/core/ui/theming/app_colors.dart';
import 'package:app_movie/core/ui/theming/app_fonts.dart';
import 'package:app_movie/pages/home/domain/entities/movie.dart';

class DetailsMoviePage extends StatelessWidget {
  final Movie movie;

  const DetailsMoviePage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.blue,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Modular.to.pop();
                  },
                  child: const Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.white,
                  ),
                ),
                const Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.white,
                )
              ],
            ),
            pinned: true,
            expandedHeight: 300.h,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: movie.posterPath != null
                    ? Image.network(
                        '${Environments.param('base_url_image')}/${movie.posterPath}',
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  SizedBox(height: 27.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Image.asset('assets/image/4k-fullhd.png')
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 9),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Text(
                          'WATCH NOW',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        children: List.generate(5, (indexStar) {
                          return Icon(
                            Icons.star_rate,
                            color: ((movie.voteAverage ~/ 2) > indexStar)
                                ? AppColors.yellow
                                : AppColors.yellow.withOpacity(0.2),
                            size: 16,
                          );
                        }),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    movie.overview,
                    style: TextStyle(
                      height: 1.5.h,
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppFonts.openSans,
                    ),
                  ),
                  SizedBox(height: 24.h)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
