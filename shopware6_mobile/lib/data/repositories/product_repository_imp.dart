import '../../domain/entities/product/product_entity.dart';
import '../../domain/repositories/product_repository.dart';
import '../data_sources/product/product_data_source.dart';

class ProductRepositoryImp implements ProductRepository {
  ProductRepositoryImp({required this.productDataSource});

  final ProductDataSource productDataSource;

  @override
  Future<List<ProductEntity>> fetchProducts() async {
    final model = await productDataSource.fetchProducts();
    return model.elements?.map((e) => e.toEntity()).toList() ?? [];
  }
}
