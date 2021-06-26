import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

// part 'app_bar_state.dart';

// todo -- Look into Cubits
// todo -- Make A Tutorial

// changed state to double b/c that's all that's needed
// class AppBarCubit extends Cubit<AppBarState> {
// AppBarCubit() : super(AppBarInitial());
// }

class AppBarCubit extends Cubit<double> {
  // Super (0) == initial value of the double
  AppBarCubit() : super(0);

  void setOffset(double offset) => emit(offset);
}
