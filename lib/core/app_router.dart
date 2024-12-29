import 'package:bookly_application/features/bookdetails/presentation/views/book_details_view.dart';
import 'package:bookly_application/features/categories/cubits/categorybooks/categorybooks_cubit.dart';
import 'package:bookly_application/features/categories/presentation/views/category_view.dart';
import 'package:bookly_application/features/favourits/presentation/views/favourite_view.dart';
import 'package:bookly_application/features/home/data/models/category_model.dart';
import 'package:bookly_application/features/home/data/models/home_category_model.dart';
import 'package:bookly_application/features/home/presentation/views/home_view.dart';
import 'package:bookly_application/features/login/presentation/views/login_view.dart';
import 'package:bookly_application/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:bookly_application/features/resetpassword/presentation/views/reset_password_view.dart';
import 'package:bookly_application/features/signup/presentation/views/signup_view.dart';
import 'package:bookly_application/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: '/OnboardingView',
        builder: (context, state) => OnboardingView(),
      ),
      GoRoute(
        path: '/LoginView',
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: '/SignupView',
        builder: (context, state) => SignupView(),
      ),
      GoRoute(
        path: '/ResetPasswordView',
        builder: (context, state) => ResetPasswordView(),
      ),
      GoRoute(
        path: '/HomeView',
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: '/CategoryView',
        builder: (context, state) => BlocProvider(
          create: (context) => CategorybooksCubit(),
          child: CategoryView(
            categoryModel: state.extra as CategoryModel,
          ),
        ),
      ),
      GoRoute(
        path: '/BookDetailsView',
        builder: (context, state) => BookDetailsView(
          homeCategoryModel: state.extra as HomeCategoryModel,
        ),
      ),
      GoRoute(
        path: '/FavouriteView',
        builder: (context, state) => FavouriteView(),
      ),
    ],
  );
}
