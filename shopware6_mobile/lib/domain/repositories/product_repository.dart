import '../entities/product/product_entity.dart';
import '../entities/product/product_param_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> fetchProducts(ProductParamEntity entity);
}
