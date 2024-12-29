import 'package:bloc/bloc.dart';
import 'package:bookly_application/features/categories/data/categories_service.dart';
import 'package:bookly_application/features/home/data/models/home_category_model.dart';
import 'package:meta/meta.dart';

part 'categorybooks_state.dart';

class CategorybooksCubit extends Cubit<CategorybooksState> {
  CategorybooksCubit() : super(CategorybooksInitialState());
  late List<HomeCategoryModel> books;
  getCategoryBooks({required String category}) async {
    emit(CategorybooksLoadingState());
    try {
      books = await CategoriesService().getCategoriesBooks(category: category);
      emit(CategorybooksLoadedState());
    } catch (e) {
      emit(CategorybooksFailureState());
    }
  }
}
