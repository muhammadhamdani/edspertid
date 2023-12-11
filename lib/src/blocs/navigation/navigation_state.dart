part of 'navigation_bloc.dart';

@immutable
abstract class NavigationState {
  final int currentNavigation;

  const NavigationState({required this.currentNavigation});}

class NavigationInitial extends NavigationState {
  const NavigationInitial({required super.currentNavigation});
}
