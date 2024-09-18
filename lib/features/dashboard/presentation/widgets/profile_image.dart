import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Stack(
      children: [
        const CircleAvatar(radius: 40),
        Positioned(
          bottom: 0,
          right: 0,
          child: Material(
            type: MaterialType.transparency,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            clipBehavior: Clip.hardEdge,
            child: Ink(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.25, 0.75],
                  colors: [
                    Color(0xFF3F432F),
                    Color(0xFF6E7453),
                  ],
                ),
                shape: BoxShape.circle,
              ),
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(Insets.xxsmall),
                  child: Assets.svgs.iconCheck.svg(
                    height: 16,
                    width: 16,
                    colorFilter: ColorFilter.mode(colorScheme.onSurface, BlendMode.srcATop),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
