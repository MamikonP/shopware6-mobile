import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/product/product_entity.dart';
import '../../../domain/repositories/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    on<ProductListFetched>(_mapProductListFetchedToState);
  }

  final ProductRepository productRepository;

  FutureOr<void> _mapProductListFetchedToState(
      ProductListFetched event, Emitter<ProductState> emit) async {
    try {
      emit(ProductStateBusy());
      final products = await productRepository.fetchProducts();
      emit(ProductListFetch(products: products));
    } catch (e) {
      emit(ProductListFail(error: e.toString()));
    }
  }
}
