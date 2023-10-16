import 'package:flutter/material.dart';
import 'package:reddit_app/presentation/views/bottom_sheet.dart';
import 'package:reddit_app/presentation/views/play_progress_row.dart';
import 'package:reddit_app/presentation/widgets/colors.dart';
import 'package:video_player/video_player.dart';

import '../constatns/app_icons.dart';
import '../widgets/animated_like_button.dart';
import '../widgets/custom_appbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late VideoPlayerController _controller;
  bool isLiked = false;
  bool isBottomSheetOpened = false;
  int likes = 5;
  int comments = 0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  void _onLike() => setState(() {
        likes += 2;
        isLiked = !isLiked;
      });

  void _onUnLike() => setState(() {
        likes -= 2;
        isLiked = !isLiked;
      });

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(height: 80),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Expanded(child: SizedBox.expand()),
            Expanded(
              flex: 2,
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(height: 10),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Column(children: [
                                const Spacer(),
                                ListTile(
                                  leading: Image.asset('assets/icons/Avatar.png'),
                                  title: const Text('User Name'),
                                  subtitle: const Text(
                                      'this post contain what the user post'),
                                ),
                              ]),
                            ),
                            Column(children: [
                              LikeButton(
                                  iconName:
                                      isLiked ? AppIcons.shiftedUp : AppIcons.shiftUp,
                                  isLiked: isLiked,
                                  iconColor: isLiked ? Colors.red : Colors.white,
                                  onPress: !isLiked ? () => _onLike() : () {}),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('$likes')),
                              LikeButton(
                                  iconName: !isLiked
                                      ? AppIcons.shiftedDown
                                      : AppIcons.shiftDown,
                                  isLiked: !isLiked,
                                  iconColor:
                                      !isLiked ? AppColors.unLikeColor : Colors.white,
                                  onPress: isLiked ? () => _onUnLike() : () {}),
                              const ShowBottomModalSheet(),
                              IconButton(
                                  onPressed: () {}, icon: const Icon(AppIcons.upload)),
                            ]),
                          ],
                        ),
                      ),
                      PlayProgressRow(controller: _controller),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
