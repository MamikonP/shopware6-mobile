part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState({this.products = const []});

  final List<ProductEntity> products;

  @override
  List<Object?> get props => [products];
}

final class ProductInitial extends ProductState {}

final class ProductStateBusy extends ProductState {}

final class ProductListFetch extends ProductState {
  const ProductListFetch({required super.products});
}

final class ProductListFail extends ProductState {
  const ProductListFail({required this.error});

  final String? error;

  @override
  List<Object?> get props => [error];
}
