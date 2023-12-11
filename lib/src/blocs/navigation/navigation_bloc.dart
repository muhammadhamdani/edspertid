import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial(currentNavigation: 0)) {
    on<NavigationEvent>((event, emit) {
      // TODO: implement event handler
      if(event is NavigationTabChange){
        emit(NavigationInitial(currentNavigation: event.currentNavigation));
      }
    });
  }
}
