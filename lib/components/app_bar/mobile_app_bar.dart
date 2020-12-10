import 'package:flutter/material.dart';
import 'package:pokedex/components/drawer/drawer_button.dart';
import 'package:pokedex/components/fade_in_image_container.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/utils/image_utils.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar = AppBar();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        InkWell(
          onTap: () => Scaffold.of(context).openEndDrawer(),
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: logoAppBarEndingMobilePadding),
            child: Center(
                child: DrawerButton()),
          ),
        ),
      ],
      leading: Padding(
        padding: EdgeInsets.only(left: logoAppBarLeadingMobilePadding),
        child: FadeInImageContainer(
          image: AssetImage(ImageUtils.JM_LOGO),
        ),
      ),
      backgroundColor: PRIMARY_COLOR,
      leadingWidth: double.infinity,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}

//
// class AppBarMobile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//             color: Color(0xff333333),
//     child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(left: logoAppBarMobilePadding),
//             child: FadeInImageContainer(
//               image: AssetImage(ImageUtils.JM_LOGO),
//             ),
//           ),
//                   InkWell(
//           onTap: () => Scaffold.of(context).openEndDrawer(),
//           child: Text("drawer"),
//         ),
//         ],
//       ),
//     );
//
//   }
//
// }
