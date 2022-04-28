import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_movie/core/ui/theming/app_colors.dart';
import 'package:app_movie/core/ui/extensions/screen_size_extensions.dart';
import 'package:app_movie/pages/home/presentation/bloc/home_cubit.dart';
import 'package:app_movie/pages/home/presentation/widgets/list_movie_tile.dart';
import 'package:app_movie/pages/home/presentation/widgets/search_movie.dart';
import 'package:app_movie/pages/home/presentation/widgets/session_title.dart';

import 'bloc/home_state.dart';

class HomePage extends StatelessWidget {
  final HomeCubit _homeCubit;
  const HomePage({Key? key, required HomeCubit homeCubit})
      : _homeCubit = homeCubit,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _homeCubit,
      child: Scaffold(
        backgroundColor: AppColors.blue,
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: false,
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.lightBlue,
              expandedHeight: 200.h,
              flexibleSpace: const FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: SearchMovie(),
                titlePadding: EdgeInsets.zero,
              ),
              elevation: 0,
              titleSpacing: 0,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Column(
                  children: [
                    Container(
                      height: 20.h,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: AppColors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 38),
                  SessionTitle(
                    title: 'Em cartaz'.toUpperCase(),
                  ),
                  SizedBox(
                    height: 250.h,
                    child: BlocBuilder<HomeCubit, HomeState>(
                      bloc: Modular.get(),
                      builder: (_, state) {
                        return (state is LoadedHomeState)
                            ? ListMovieTile(
                                movies: state.nowPlaying,
                              )
                            : const SizedBox.shrink();
                      },
                    ),
                  ),
                  // const SizedBox(height: 20),
                  SessionTitle(
                    title: 'Populares'.toUpperCase(),
                  ),
                  SizedBox(
                    height: 250.h,
                    child: BlocBuilder<HomeCubit, HomeState>(
                      bloc: Modular.get(),
                      builder: (_, state) {
                        return (state is LoadedHomeState)
                            ? ListMovieTile(
                                movies: state.popular,
                              )
                            : const SizedBox.shrink();
                      },
                    ),
                  ),
                  SessionTitle(
                    title: 'Melhores avaliados'.toUpperCase(),
                  ),
                  SizedBox(
                    height: 250.h,
                    child: BlocBuilder<HomeCubit, HomeState>(
                      bloc: Modular.get(),
                      builder: (_, state) {
                        return (state is LoadedHomeState)
                            ? ListMovieTile(
                                movies: state.topRated,
                              )
                            : const SizedBox.shrink();
                      },
                    ),
                  ),
                  SessionTitle(
                    title: 'Em breve'.toUpperCase(),
                  ),
                  SizedBox(
                    height: 250.h,
                    child: BlocBuilder<HomeCubit, HomeState>(
                      bloc: Modular.get(),
                      builder: (_, state) {
                        return (state is LoadedHomeState)
                            ? ListMovieTile(
                                movies: state.upcoming,
                              )
                            : const SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//       child: Scaffold(
//         backgroundColor: AppColors.lightBlue,
//         body: Column(
//           children: [
//             SizedBox(
//               height: 220.h,
//               child: const SearchMovie(),
//             ),
//             Expanded(
//               child: Container(
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(20),
//                     topLeft: Radius.circular(20),
//                   ),
//                   color: AppColors.blue,
//                 ),
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 30),
//                     child: Column(
//                       children: [
//                         const SizedBox(height: 38),
//                         SessionTitle(
//                           title: 'Em cartaz'.toUpperCase(),
//                         ),
//                         SizedBox(
//                           height: 250.h,
//                           child: BlocBuilder<HomeCubit, HomeState>(
//                             bloc: Modular.get(),
//                             builder: (_, state) {
//                               return ListMovieTile(
//                                 movies: state.nowPlaying,
//                               );
//                             },
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         SessionTitle(
//                           title: 'Populares'.toUpperCase(),
//                         ),
//                         SizedBox(
//                           height: 250.h,
//                           child: BlocBuilder<HomeCubit, HomeState>(
//                             bloc: Modular.get(),
//                             builder: (_, state) {
//                               return ListMovieTile(
//                                 movies: state.popular,
//                               );
//                             },
//                           ),
//                         ),
//                         SessionTitle(
//                           title: 'Melhores avaliados'.toUpperCase(),
//                         ),
//                         SizedBox(
//                           height: 250.h,
//                           child: BlocBuilder<HomeCubit, HomeState>(
//                             bloc: Modular.get(),
//                             builder: (_, state) {
//                               return ListMovieTile(
//                                 movies: state.topRated,
//                               );
//                             },
//                           ),
//                         ),
//                         SessionTitle(
//                           title: 'Em breve'.toUpperCase(),
//                         ),
//                         SizedBox(
//                           height: 250.h,
//                           child: BlocBuilder<HomeCubit, HomeState>(
//                             bloc: Modular.get(),
//                             builder: (_, state) {
//                               return ListMovieTile(
//                                 movies: state.upcoming,
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
