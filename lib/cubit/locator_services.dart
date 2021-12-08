import 'package:blogonomy/Repository/card_repositoriesCateg.dart';
import 'package:blogonomy/cubit/network/card_cubitCateg.dart';
import 'package:blogonomy/cubit/panel_controller_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
final cardRepository = CardRepository();
final blogersRepository = BlogersRepository();

Future<void> init() async {
  sl.registerFactory(() => SlidingUpCubit());
  sl.registerFactory(() => SlidingUpCubit2());
  sl.registerFactory(() => CardCubit(cardRepository));
  sl.registerFactory(() => BlogersCubit(blogersRepository));
}
