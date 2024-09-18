import 'package:akashx/app/themes/app_spacing.dart';
import 'package:akashx/features/community/for_you/presentation/components/for_you_feed_list_item.dart';
import 'package:flutter/material.dart';

class ForYouTab extends StatelessWidget {
  const ForYouTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Insets.medium,
      ),
      child: ListView.builder(
        itemBuilder: (_, pos) => ForYouFeedListItem(
          name: "Akashx",
          image: pos % 2 == 0
              ? 'https://i.pinimg.com/originals/bc/b6/8d/bcb68d711527b4655e12882cb64d5c7c.jpg'
              : null,
          date: "12/12/1212",
          time: "12:12 AM",
          description:
              "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ",
        ),
        itemCount: 10,
      ),
    );
  }
}
