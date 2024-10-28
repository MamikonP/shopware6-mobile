import '../base/translated_entity.dart';
import 'cover_entity.dart';
import 'price_entity.dart';

class ProductEntity {
  ProductEntity({this.translated, this.calculatedPrice, this.cover});

  final TranslatedEntity? translated;
  final PriceEntity? calculatedPrice;
  final CoverEntity? cover;
}
