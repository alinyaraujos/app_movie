import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_movie/core/helpers/environments.dart';
import 'package:app_movie/core/ui/extensions/screen_size_extensions.dart';
import 'package:app_movie/core/ui/theming/app_colors.dart';
import 'package:app_movie/pages/home/domain/entities/movie.dart';

class ListMovieTile extends StatelessWidget {
  final List<Movie> movies;

  const ListMovieTile({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                  Container(
                    height: 170.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(
                            '${Environments.param('base_url_image')}/${movies[index].posterPath}'),
                        fit: BoxFit.fill,
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
    );
  }
}
