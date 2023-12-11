import 'package:dio/dio.dart';
import 'package:edspertid/src/models/banner_model.dart';

class BannerRepository {
  Future<List<BannerData>> getBannerList() async {
    try {
      const url = 'https://edspert.widyaedu.com/event/list?limit=5';
      final response = await Dio().get(url,
          options: Options(headers: {
            'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0',
          }));

      final bannerResponse = BannerResponse.fromJson(response.data);
      return bannerResponse.data;
    } catch (e) {
      rethrow;
    }
  }
}