import 'package:bloc/bloc.dart';
import 'package:bookly_application/features/home/data/models/home_category_model.dart';
import 'package:bookly_application/features/home/data/services/home_category_service.dart';
import 'package:meta/meta.dart';

part 'topoftheweak_state.dart';

class TopoftheweakCubit extends Cubit<TopoftheweakState> {
  TopoftheweakCubit() : super(TopoftheweakInitialState());
  late List<HomeCategoryModel> books;
  getTopOfTheWeakBooks() async {
    emit(TopoftheweakLoadingState());
    try {
      books = await HomeCategoryService().getHomeBooks(category: 'football');
      emit(TopoftheweakLoadedState());
    } catch (e) {
      emit(TopoftheweakFailureState());
    }
  }
}
