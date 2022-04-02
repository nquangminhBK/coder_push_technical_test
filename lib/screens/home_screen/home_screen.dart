import 'package:coder_push_interview/routes/app_routes.dart';
import 'package:coder_push_interview/screens/home_screen/home_controller.dart';
import 'package:coder_push_interview/widgets/tinder_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                child: buildCards())));
  }

  Widget buildCards() {
    return GetBuilder<HomeScreenController>(
      builder: (controller) {
        return controller.listUserToShow.value != null
            ? Column(
                children: [
                  buildButtonNavigate(),
                  Expanded(
                    child: Stack(
                      children: controller.listUserToShow.value!
                          .map((user) => TinderCard(user,
                              controller.listUserToShow.value!.first == user))
                          .toList()
                          .reversed
                          .toList(),
                    ),
                  ),
                  buildButtonsAction()
                ],
              )
            : Container();
      },
    );
  }

  Widget buildButtonNavigate() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: (){
              Get.toNamed(Routes.LIST_USER, arguments: {"type" : "like"});
            },
            child: Row(
              children: const [Icon(Icons.favorite), Text("Like list")],
            ),
          ),
          InkWell(
            onTap: (){
              Get.toNamed(Routes.LIST_USER, arguments: {"type" : "dislike"});
            },
            child: Row(
              children: const [Icon(Icons.clear), Text("dislike list")],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtonsAction() {
    final status = controller.getStatus();
    final isLike = status == CardStatus.like;
    final isDislike = status == CardStatus.dislike;
    final isSuperLike = status == CardStatus.superLike;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              style: ButtonStyle(
                foregroundColor: getColor(Colors.red, Colors.white, isDislike),
                backgroundColor: getColor(Colors.white, Colors.red, isDislike),
                side: getBorder(Colors.red, Colors.white, isDislike),
              ),
              onPressed: () {
                controller.dislike();
              },
              child: const Icon(
                Icons.clear,
              )),
          ElevatedButton(
              style: ButtonStyle(
                foregroundColor:
                    getColor(Colors.blue, Colors.white, isSuperLike),
                backgroundColor:
                    getColor(Colors.white, Colors.blue, isSuperLike),
                side: getBorder(Colors.blue, Colors.white, isSuperLike),
              ),
              onPressed: () {
                controller.superLike();
              },
              child: const Icon(
                Icons.star,
              )),
          ElevatedButton(
              style: ButtonStyle(
                foregroundColor: getColor(Colors.green, Colors.white, isLike),
                backgroundColor: getColor(Colors.white, Colors.green, isLike),
                side: getBorder(Colors.green, Colors.white, isLike),
              ),
              onPressed: () {
                controller.like();
              },
              child: const Icon(
                Icons.favorite,
              )),
        ],
      ),
    );
  }

  MaterialStateProperty<Color> getColor(
      Color color, Color colorPressed, bool force) {
    getColor(Set<MaterialState> states) {
      if (force || states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    }

    return MaterialStateProperty.resolveWith(getColor);
  }

  MaterialStateProperty<BorderSide> getBorder(
      Color color, Color colorPressed, bool force) {
    getBorder(Set<MaterialState> states) {
      if (force || states.contains(MaterialState.pressed)) {
        return const BorderSide(color: Colors.transparent);
      } else {
        return BorderSide(color: color);
      }
    }

    return MaterialStateProperty.resolveWith(getBorder);
  }
}
