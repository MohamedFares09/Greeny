import 'package:fruits_app/core/utils/app_image.dart';

class ButtonNavigationBarEntity {
  final String inActiveImage, activeImage;
  final String name;

  ButtonNavigationBarEntity({required this.inActiveImage, required this.activeImage, required this.name});
}
List<ButtonNavigationBarEntity> buttonNavigationBarItems = [
  ButtonNavigationBarEntity(
      inActiveImage: Assets.home_image_inActive,
      activeImage: Assets.home_image_active,
      name: 'الرئيسية'),
  ButtonNavigationBarEntity(
      inActiveImage: Assets.product_image_inActive,
      activeImage: Assets.product_image_active,
      name: 'المنتجات'),
  ButtonNavigationBarEntity(
      inActiveImage: Assets.shopping_cart_image_inActive,
      activeImage: Assets.shopping_cart_image_active,
      name: 'سله التسوف'),
  ButtonNavigationBarEntity(
      inActiveImage: Assets.user_image_inActive,
      activeImage: Assets.user_image_active,
      name: 'حسابي'),
];