part of 'bestseller_cubit.dart';

@immutable
abstract class BestsellerState {}

class BestsellerInitialState extends BestsellerState {}

class BestsellerLoadedState extends BestsellerState {}

class BestsellerLoadingState extends BestsellerState {}

class BestsellerFailureState extends BestsellerState {}
