import '../features/home/domainModels/bitsnap_model.dart';
import '../features/home/domainModels/bitsnap_order_book_model.dart';

abstract class BitSnapServices {
  Future<SingleBitsnapResponse> getSingleBitsnap({String searchValue});
  Future<BitstampBook> getBitstampOrder({String searchValue});
}
