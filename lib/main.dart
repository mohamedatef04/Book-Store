import 'package:bookly_application/core/app_router.dart';
import 'package:bookly_application/core/constants.dart';
import 'package:bookly_application/features/categories/data/categories_service.dart';
import 'package:bookly_application/features/home/cubits/bestseller/bestseller_cubit.dart';
import 'package:bookly_application/features/home/cubits/topofweak/topoftheweak_cubit.dart';
import 'package:bookly_application/features/providers/favourite_item.dart';
import 'package:bookly_application/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  CategoriesService().getCategoriesBooks(category: 'general');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const BooklyApplication());
}

class BooklyApplication extends StatelessWidget {
  const BooklyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BestsellerCubit(),
          ),
          BlocProvider(
            create: (context) => TopoftheweakCubit(),
          )
        ],
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<FavouriteItem>(
              create: (context) => FavouriteItem(),
            )
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter().router,
            theme: ThemeData(
              useMaterial3: false,
              brightness: Brightness.light,
              scaffoldBackgroundColor: mainColor,
            ),
          ),
        ),
      ),
    );
  }
}
