import 'package:flutter/material.dart';

import '../constatns/app_icons.dart';

class LikeButton extends StatefulWidget {
  LikeButton(
      {super.key,
      required this.iconName,
      required this.isLiked,
      required this.iconColor,
      required this.onPress});

  final IconData iconName;
  final Color iconColor;
  final void Function() onPress;
  bool isLiked;

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _positionAnimation;

  @override
  void initState() {
    final isDirection =
        widget.iconName == AppIcons.shiftedUp || widget.iconName == AppIcons.shiftUp
            ? -15.0
            : 15.0;
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 200));

    _positionAnimation = Tween<double>(begin: 0.0, end: isDirection).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack),
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) _animationController.reverse();
    });

    _animationController.addListener(() => setState(() {}));
  }

  void _toggleLike() {
    setState(() {
      widget.isLiked = !widget.isLiked;
      widget.isLiked ? _animationController.forward() : _animationController.reverse();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPress();
        _toggleLike();
      },
      child: SizedBox(
        width: 40,
        height: 50,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 10,
              top: _positionAnimation.value,
              child: Icon(widget.iconName, size: 28, color: widget.iconColor),
            ),
          ],
        ),
      ),
    );
  }
}
