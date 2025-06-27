import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;

  const UserInfoWidget({
    super.key,
    required this.name,
    required this.email,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    print(
      "UserInfoWidget received: name=$name, email=$email, imageUrl=$imageUrl",
    );

    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage:
              imageUrl.isNotEmpty
                  ? NetworkImage(imageUrl)
                  : NetworkImage("https://via.placeholder.com/150"),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              email,
              style: const TextStyle(fontSize: 11),
              overflow: TextOverflow.clip,
            ),
          ],
        ),
      ],
    );
  }
}
