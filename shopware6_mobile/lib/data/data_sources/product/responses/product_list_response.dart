import '../../../models/base/element_model.dart';
import '../../../models/product/product_model.dart';
import '../../remote/api/api_response.dart';

class ProductListResponse
    extends ApiObjectResponse<ElementModel<ProductModel>> {
  @override
  ElementModel<ProductModel> model(body) => parseModel(
        body,
        (dynamic json) => ElementModel.fromJson(
          json,
          (dynamic jsonData) => ProductModel.fromJson(jsonData),
        ),
      );
}
