part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {}

class NavigationTabChange extends NavigationEvent {
  final int currentNavigation;

  NavigationTabChange({required this.currentNavigation});
}