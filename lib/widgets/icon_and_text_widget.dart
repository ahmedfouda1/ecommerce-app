import 'package:ecommerce_app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';

import '../utils/dimensions.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconcolor;

  const IconAndTextWidget({Key? key,
    required this.icon,
    required this.text,
    required this.iconcolor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconcolor,size: Dimensions.iconsize24,),
        SizedBox(width: 5,),
        SmallText(text: text,),
      ],
    );
  }
}
