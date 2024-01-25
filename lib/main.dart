import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies/screens/category-filter-screen/category_filter_screen_cubit.dart';
import 'package:movies/screens/home_screen/home_cubit/home_cubit.dart';
import 'package:movies/screens/home_screen/home_screen.dart';
import 'package:movies/screens/movie_details/movie_details_cubit.dart';
import 'package:movies/shared/const.dart';
import 'package:movies/shared/styles/theming/mytheme.dart';
import 'bloc_observer.dart';
import 'home_layout/home_layout.dart';
import 'models/results.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  //Hive.registerAdapter();

  Hive.registerAdapter(ResultsAdapter());

  var moviesBox = await Hive.openBox<Results>(Const.SAVED_MOVIES_BOX);
  var saveReleasesIndexBox = await Hive.openBox(Const.SAVED_RELEAS_INDEX_BOX);
  var savePopularIndexBox = await Hive.openBox(Const.SAVED_POPULAR_INDEX_BOX);
  var saveRecommendedIndexBox = await Hive.openBox(Const.SAVED_RECOMMENDED_INDEX_BOX);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [                                 //1
          BlocProvider(create: (BuildContext context) {
            return HomeCubit()..getPopularMovies().then((value) => const Duration(seconds:4))..getCategoriesList().then((value) {const Duration(seconds: 4);})..fetchaAllMovies();
          },),
          BlocProvider(create: (BuildContext context) => CategoryFilterScreenCubit(),),
          BlocProvider(create: (BuildContext context) => MovieDetailsCubit(),),
        ],

      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        routes:{
          HomeScreen.routeName:(_)=>const HomeScreen(),


        },
        theme: MyThemeData.darkTheme ,
        home: const HomeLayout(),
      ),

    );
  }

}