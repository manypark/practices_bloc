import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dark_mode_event.dart';
part 'dark_mode_state.dart';

class DarkModeBloc extends Bloc<DarkModeEvent, DarkModeState> {

  DarkModeBloc() : super( const DarkModeState() ) {
    on<DarkModeEvent>( _onDarkModeHandler );
  }

  void changeDarkMode() {
    add( DarkModeEvent( isDarkMode: !state.isDarkMode ) );
  }

  _onDarkModeHandler( DarkModeEvent event, Emitter<DarkModeState> emit ) {
    emit( state.copyWith( isDarkMode: event.isDarkMode ) );
  }

}
