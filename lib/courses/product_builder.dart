import 'package:http/http.dart';

import 'package:continental_app/product/services/api_product_service.dart';
import 'package:continental_app/product/services/iproduct_service.dart';

import 'package:continental_app/product/view_models/product_view_model.dart';

class ProductBuilder {
  static ProductViewModel builder() {
    IProductService service = APIProductService(Client());
    return ProductViewModel(service);
  }
}
