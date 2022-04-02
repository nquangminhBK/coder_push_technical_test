import 'package:coder_push_interview/screens/list_user_screen/list_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListUserScreen extends GetWidget<ListUserController> {
  const ListUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: TextButton(
            onPressed: Get.back,
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          Get.arguments["type"] == "dislike"
              ? "Dislike Users list"
              : "Like users list",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
        ),
      ),
      body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: GetBuilder<ListUserController>(
            builder: (_) {
              return ListView.builder(
                  itemCount: controller.listUsers.value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(10)),
                      margin:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network(
                              controller.listUsers.value[index].picture!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 30),
                            child: Text(
                                "${controller.listUsers.value[index].lastName!} ${controller.listUsers.value[index].firstName!}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                          )
                        ],
                      ),
                    );
                  });
            },
          )),
    );
  }
}
