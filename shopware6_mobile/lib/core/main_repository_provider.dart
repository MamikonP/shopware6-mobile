import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/data_sources/product/product_data_source.dart';
import '../data/data_sources/remote/api/api_data_source.dart';
import '../data/repositories/api_repository_imp.dart';
import '../data/repositories/product_repository_imp.dart';
import '../domain/repositories/api_repository.dart';
import '../domain/repositories/product_repository.dart';

typedef MainRepositoryBuilderCallback = Widget Function(BuildContext context);

class MainRepositoryProvider extends StatelessWidget {
  const MainRepositoryProvider({super.key, required this.builder});

  final MainRepositoryBuilderCallback builder;

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
        providers: <RepositoryProvider<dynamic>>[
          RepositoryProvider<ApiDataSource>(
            create: (context) => ApiDataSourceImp(),
          ),
          RepositoryProvider<ApiRepository>(
            create: (context) =>
                ApiRepositoryImp(apiDataSource: RepositoryProvider.of(context)),
          ),
          RepositoryProvider<ProductDataSource>(
            create: (context) => ProductDataSourceImp(
              apiRepository: RepositoryProvider.of(context),
            ),
          ),
          RepositoryProvider<ProductRepository>(
            create: (context) => ProductRepositoryImp(
                productDataSource: RepositoryProvider.of(context)),
          ),
        ],
        child: builder(context),
      );
}
