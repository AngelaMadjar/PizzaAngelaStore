import 'package:flutter/material.dart';
import 'package:pizza_angela_store/inner_screens/upload_product_form.dart';

import 'bottom_bar.dart';

class MainScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [BottomBarScreen(), UploadProductForm()],
    );
  }
}
