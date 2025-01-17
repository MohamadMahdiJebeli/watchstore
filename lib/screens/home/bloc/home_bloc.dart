import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchstore/data/model/home.dart';
import 'package:watchstore/data/repo/homeRepo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final IHomeRepo homeRepo;

  HomeBloc(this.homeRepo) : super(HomeLoading()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeInit) {
        try {
          emit(HomeLoading());
          final home = await homeRepo.getHome();
          emit(HomeLoaded(home));
        } catch (e) {
          emit(HomeError());
        }
      }
    });
  }
}