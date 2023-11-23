part of 'dark_mode_bloc.dart';

class DarkModeEvent extends Equatable {

  final bool isDarkMode;

  const DarkModeEvent({
    this.isDarkMode = false
  });

  @override
  List<Object> get props => [isDarkMode];
}
