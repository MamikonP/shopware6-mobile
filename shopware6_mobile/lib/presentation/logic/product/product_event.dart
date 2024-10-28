part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

final class ProductListFetched extends ProductEvent {}

final class ProductListFailed extends ProductEvent {
  const ProductListFailed({required this.error});

  final String? error;
}

final class ProductListChanged extends ProductEvent {
  const ProductListChanged({required this.error});

  final String? error;
}
