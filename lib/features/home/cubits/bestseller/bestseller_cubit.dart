import 'package:bloc/bloc.dart';
import 'package:bookly_application/features/home/data/models/home_category_model.dart';
import 'package:bookly_application/features/home/data/services/home_category_service.dart';
import 'package:meta/meta.dart';

part 'bestseller_state.dart';

class BestsellerCubit extends Cubit<BestsellerState> {
  BestsellerCubit() : super(BestsellerInitialState());
  late List<HomeCategoryModel> books;
  getBestSellerBooks() async {
    emit(BestsellerLoadingState());
    try {
      books = await HomeCategoryService().getHomeBooks(category: 'bestseller');
      emit(BestsellerLoadedState());
    } catch (e) {
      emit(BestsellerFailureState());
    }
  }
}
