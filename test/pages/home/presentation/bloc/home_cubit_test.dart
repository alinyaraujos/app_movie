import 'package:app_movie/pages/home/domain/entities/movie.dart';
import 'package:app_movie/pages/home/domain/entities/result_movie.dart';
import 'package:app_movie/pages/home/domain/use_cases/get_movie_use_case.dart';
import 'package:app_movie/pages/home/presentation/bloc/home_cubit.dart';
import 'package:app_movie/pages/home/presentation/bloc/home_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetMovieUseCase extends Mock implements GetMovieUseCase {}

class MockGetMovieUseCaseImp extends Mock implements GetMovieUseCaseImpl {}

void main() {
  late GetMovieUseCase getMovieUseCase;
  late HomeCubit cubit;
  late List<Movie> moviesMock;
  late ResultMovie resultMovieMock;

  setUp(() {
    getMovieUseCase = MockGetMovieUseCaseImp();
    cubit = HomeCubit(getMovie: getMovieUseCase);
    moviesMock = [
      Movie(
        title: 'Moonshot',
        posterPath: '/thqgzBPEDYQX0taszVus5nYMtTZ.jpg',
        overview:
            'In a future where Mars is terraformed and colonized by the best humanity has to offer, two very different college students wind up joining forces and sneak onboard a space shuttle to the red planet in order to be united with their significant others.',
        voteAverage: 10,
      )
    ];
    resultMovieMock = ResultMovie(page: 1, totalPages: 10, results: moviesMock);
  });
  blocTest<HomeCubit, HomeState>(
      'lists of top movie categories on the home page',
      build: () => cubit,
      act: (cubit) => cubit.getMovie(),
      setUp: () {
        when(
          () => getMovieUseCase.getMoviePopular(),
        ).thenAnswer((_) async => resultMovieMock);
        when(
          () => getMovieUseCase.getMovieNowPlaying(),
        ).thenAnswer((_) async => resultMovieMock);
        when(
          () => getMovieUseCase.getMovieTopRated(),
        ).thenAnswer((_) async => resultMovieMock);
        when(
          () => getMovieUseCase.getMovieUpcoming(),
        ).thenAnswer((_) async => resultMovieMock);
      },
      verify: (_) {
        verify(() => getMovieUseCase.getMovieNowPlaying()).called(1);
        verify(() => getMovieUseCase.getMoviePopular()).called(1);
        verify(() => getMovieUseCase.getMovieTopRated()).called(1);
        verify(() => getMovieUseCase.getMovieUpcoming()).called(1);
      },
      expect: () => [isA<LoadedHomeState>()]);
}
