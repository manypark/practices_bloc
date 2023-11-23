part of 'dark_mode_bloc.dart';

class DarkModeState extends Equatable {

  final bool isDarkMode;

  const DarkModeState({
    this.isDarkMode = false
  });
  
  @override
  List<Object> get props => [isDarkMode];

  DarkModeState copyWith({
    bool? isDarkMode,
  }) {
    return DarkModeState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
