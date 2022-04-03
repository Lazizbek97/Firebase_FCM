import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/core/utils/size_config.dart';

class NotificaitonAddingPage extends StatelessWidget {
  const NotificaitonAddingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter a title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(
              height: getHeight(15),
            ),
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Enter a discription",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(
              height: getHeight(15),
            ),
            Visibility(
              visible: true,
              child: Container(
                height: getHeight(150),
                width: getWidth(300),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://source.unsplash.com/random"),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Choose a Photo"),
              style:
                  ElevatedButton.styleFrom(primary: Constants.elevatedBtnColor),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Send Notification"),
              style:
                  ElevatedButton.styleFrom(primary: Constants.elevatedBtnColor),
            ),
          ],
        ),
      ),
    );
  }
}
