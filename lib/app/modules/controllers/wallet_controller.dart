import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/data/services/profile_service.dart';

import '../../data/models/profile/wallet.dart';

class WalletController extends GetxController {
  final profileService = Get.put(ProfileService());
  Wallet? wallet;
  @override
  void onInit() async {
    super.onInit();
    fetchWallet();
  }

  Future<void> fetchWallet() async {
    wallet = await profileService.getWallet();
  }
}
