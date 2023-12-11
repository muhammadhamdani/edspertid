part of 'banner_bloc.dart';

@immutable
abstract class BannerState {}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}

class BannerSuccess extends BannerState {
  final List<BannerData> bannerList;

  BannerSuccess({required this.bannerList});
}

class BannerFailed extends BannerState {
  final String errorMessage;

  BannerFailed({required this.errorMessage});
}
