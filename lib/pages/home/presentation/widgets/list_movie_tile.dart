import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_movie/core/helpers/environments.dart';
import 'package:app_movie/core/ui/extensions/screen_size_extensions.dart';
import 'package:app_movie/core/ui/theming/app_colors.dart';
import 'package:app_movie/pages/home/domain/entities/movie.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class ListMovieTile extends StatelessWidget {
  final List<Movie> movies;
  final Function() onEndOfPage;

  const ListMovieTile({
    Key? key,
    required this.movies,
    required this.onEndOfPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LazyLoadScrollView(
      onEndOfPage: onEndOfPage,
      scrollDirection: Axis.horizontal,
      child: ListView.builder(
        itemCount: movies.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(top: 20),
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.only(right: 20, left: (index == 0) ? 30 : 0),
            child: SizedBox(
              width: 130.w,
              child: GestureDetector(
                onTap: () {
                  Modular.to.pushNamed('/details/', arguments: movies[index]);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 170.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl:
                              "${Environments.param('base_url_image')}/${movies[index].posterPath}",
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.lightBlue,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 6,
                      ),
                      child: Text(
                        movies[index].title,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                    Wrap(
                      children: List.generate(5, (indexStar) {
                        return Icon(
                          Icons.star_rate,
                          color: ((movies[index].voteAverage ~/ 2) > indexStar)
                              ? AppColors.yellow
                              : AppColors.yellow.withOpacity(0.2),
                          size: 16,
                        );
                      }),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
