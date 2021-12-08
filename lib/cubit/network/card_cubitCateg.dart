import 'package:blogonomy/Repository/card_repositoriesCateg.dart';
import 'package:blogonomy/cubit/network/card_modelCateg.dart';
import 'package:blogonomy/cubit/network/card_stateCateg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardCubit extends Cubit<CardState> {
  final CardRepository cardRepository;

  CardCubit(this.cardRepository) : super(CardLoadedState());

  Future<void> fetchCard() async {
    try {
      emit(CardLoadingState());
      final List<CardModel> _loaded = await cardRepository.getAllCards();
      print("приватная  $_loaded");
      emit(CardLoadedState(loadedCard: _loaded));
    } catch (_) {
      emit(CardErrorState());
    }
  }

  Future<void> clearCard() async {
    emit(CardEmptyState());
  }
}

class BlogersCubit extends Cubit<BlogersState> {
  final BlogersRepository blogersRepository;

  BlogersCubit(this.blogersRepository) : super(BlogersLoadedState());

  Future<void> fetchBlogers() async {
    try {
      emit(BlogersLoadingState());
      final List<BlogersModel> _loaded2 =
          await blogersRepository.getAllBlogers();
      print("приватная  $_loaded2");
      emit(BlogersLoadedState(loadedBlogers: _loaded2));
    } catch (_) {
      emit(BlogersErrorState());
    }
  }

  Future<void> clearBlogers() async {
    emit(BlogersEmptyState());
  }
}
