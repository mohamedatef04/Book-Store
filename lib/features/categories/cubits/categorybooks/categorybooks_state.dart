part of 'categorybooks_cubit.dart';

@immutable
abstract class CategorybooksState {}

class CategorybooksInitialState extends CategorybooksState {}

class CategorybooksLoadedState extends CategorybooksState {}

class CategorybooksLoadingState extends CategorybooksState {}

class CategorybooksFailureState extends CategorybooksState {}
