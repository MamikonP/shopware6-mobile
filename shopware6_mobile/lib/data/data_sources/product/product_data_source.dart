import '../../../domain/repositories/api_repository.dart';
import '../../models/base/element_model.dart';
import '../../models/product/product_model.dart';
import '../../models/product/product_param_model.dart';
import 'requests/fetch_product_request.dart';
import 'responses/product_list_response.dart';

abstract class ProductDataSource {
  Future<ElementModel<ProductModel>> fetchProducts(ProductParamModel model);
}

class ProductDataSourceImp implements ProductDataSource {
  ProductDataSourceImp({required this.apiRepository});

  final ApiRepository apiRepository;

  @override
  Future<ElementModel<ProductModel>> fetchProducts(
          ProductParamModel model) async =>
      await apiRepository.request(
        apiRequest: FetchProductsRequest(model),
        apiResponse: ProductListResponse(),
      );
}
