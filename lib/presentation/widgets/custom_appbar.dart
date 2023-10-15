import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const CustomAppBar({super.key, this.height = kToolbarHeight});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
        bottom: PreferredSize(
      preferredSize: preferredSize,
      child: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
              width: screenSize.width * 10 / 100,
              child:
                  const Icon(size: 28, Icons.arrow_back_rounded, color: Colors.white)),
          Row(
            children: [
              /// in case it's fixed icons
              const Padding(
                padding: EdgeInsets.all(2.0),
                child: CircleAvatar(
                    backgroundImage: AssetImage('assets/icons/Avatar.png'),
                    radius: 10),
              ),
              Text('r/mechanicalKeyboards', style: textTheme.subtitle1),
            ],
          ),
          IconButton(
              icon: const Icon(Icons.more_vert_outlined, color: Colors.white),
              onPressed: () {}),
        ]),
      ),
    ));
  }
}
