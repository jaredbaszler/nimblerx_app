import 'package:flutter/material.dart';

class NimbleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NimbleAppBar({Key? key}) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Center(
        child: SizedBox(
          width: 150,
          height: kToolbarHeight,
          child: Image.asset('assets/images/nimblerx_logo.png'),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
