import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:the_basics/home/logic/data/repositories/save_repositories.dart';


part 'save_child_event.dart';
part 'save_child_state.dart';

class SaveChildBloc extends Bloc<SaveChildEvent, SaveChildState> {
  final SaveRepository saveRepository;
  SaveChildBloc(this.saveRepository) : super(SaveChildInitial()) {
    on<SaveData>((event, emit) async {
      emit(SaveChildLoading());
      try {
        final String res = await saveRepository.saveChildRes(event.sessionId, event.id, event.firstName, event.lastName, event.parents);
        emit(SaveChildSuccess(res));
      } on DioError catch (e) {
        emit(SaveChildFailure(e.response!));
      }
    });
  }
}

