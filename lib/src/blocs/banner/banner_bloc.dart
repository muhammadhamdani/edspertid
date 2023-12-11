import 'package:edspertid/src/models/banner_model.dart';
import 'package:edspertid/src/repositories/banner_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRepository bannerRepository;

  BannerBloc({required this.bannerRepository}) : super(BannerInitial()) {
    on<BannerEvent>((events, emit) async {
      // TODO: implement event handler
      if (events is GetBannerListEvent) {
        emit(BannerLoading());

        final data = await bannerRepository.getBannerList();

        emit(BannerSuccess(bannerList: data));
      }

    });
  }
}
