import '../../domain/entities/product/product_entity.dart';
import '../../domain/entities/product/product_param_entity.dart';
import '../../domain/repositories/product_repository.dart';
import '../data_sources/product/product_data_source.dart';
import '../models/product/product_param_model.dart';

class ProductRepositoryImp implements ProductRepository {
  ProductRepositoryImp({required this.productDataSource});

  final ProductDataSource productDataSource;

  @override
  Future<List<ProductEntity>> fetchProducts(ProductParamEntity entity) async {
    final model = await productDataSource
        .fetchProducts(ProductParamModel.fromEntity(entity));
    return model.elements?.map((e) => e.toEntity()).toList() ?? [];
  }
}
