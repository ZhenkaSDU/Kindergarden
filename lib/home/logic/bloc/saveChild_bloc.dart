import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/saveChild_models.dart';
import '../data/repositories/save_repositories.dart';

part 'saveChild_event.dart';
part 'saveChild_state.dart';

class SaveChildBloc extends Bloc<SaveChildEvent, SaveChildState> {
  final SaveChildRepository saveChildRepository;

  SaveChildBloc(this.saveChildRepository) : super(SaveChildInitial());

  @override
  Stream<SaveChildState> mapEventToState(SaveChildEvent event) async* {
    if(event is SaveChildLoadedEvent){
      yield SaveChildLoading();

      try{
        final String saveChild = await saveChildRepository.getCheck();

        yield SaveChildSuccess(saveChild);
      }
      catch (e) {
        yield SaveChildFailure(e.toString());
        throw e;
      }
    }
  }


}
