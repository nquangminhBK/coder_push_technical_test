import 'dart:math';
import 'dart:ui';

import 'package:coder_push_interview/db_sources/user_api.dart';
import 'package:coder_push_interview/db_sources/user_local_db.dart';
import 'package:coder_push_interview/models/user_detail_model.dart';
import 'package:coder_push_interview/models/user_response_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

enum CardStatus { like, dislike, superLike }

class HomeScreenController extends GetxController {
  static const limit = 20;
  final userRepository = Get.find<UserRepository>();
  Rx<bool> isDragging = Rx<bool>(false);
  Rx<Offset> position = Rx<Offset>(Offset.zero);
  Rx<Size> screenSize = Rx<Size>(Size.zero);
  Rx<double> angle = Rx<double>(0);

  Rx<List<UserBasicInfo>?> listUserToShow = Rx<List<UserBasicInfo>?>([]);

  Rx<int> currentIndex = Rx<int>(0);
  Rx<int> ageUserToShow = Rx<int>(-1);
  String currentUserId = "";
  UserBasicInfo? currentUser ;
  int currentPage = 0;

  @override
  void onInit() async {
    listUserToShow.value = await getListUser(currentPage);
    update();
    if(listUserToShow.value!= null){
      currentUserId = listUserToShow.value![0].id!;
      currentUser = listUserToShow.value![0];
      getUserDetail(currentUserId);
    }
    currentIndex.listen((index) async {
      currentUser = listUserToShow.value![0];
      String idUserShowing = listUserToShow.value![1].id!;
      getUserDetail(idUserShowing);
      await loadMore(index);
    });
  }

  getUserDetail(String id) async {
    UserDetailModel? res = await UserApi.getUserDetail(id);
    if (res != null) {
      DateTime dateTime = DateTime.parse(res.dateOfBirth!);
      ageUserToShow.value = DateTime.now().year - dateTime.year;
      update();
    }
  }

  loadMore(int index) async {
    if (listUserToShow.value != null &&
        index == (currentPage + 1) * limit - 10) {
      currentPage++;
      List<UserBasicInfo>? res = await getListUser(currentPage);
      final temp = [...listUserToShow.value!, ...res!];
      listUserToShow.value = temp;
      update();
    }
  }

  Future<List<UserBasicInfo>?> getListUser(int currentPage) async {
    final res = await UserApi.getListUser(currentPage);
    if (res != null && res.data != null) {
      return res.data!.toList();
    }
    return null;
  }

  void startPosition(DragStartDetails details) {
    isDragging.value = true;
    update();
  }

  void updatePosition(DragUpdateDetails details) {
    position.value += details.delta;
    final x = position.value.dx;
    angle.value = 45 * x / screenSize.value.width;
    update();
  }

  void endPosition() {
    isDragging.value = false;
    update();
    final status = getStatus(force: true);
    if (status != null) {
      print(status.toString().split('.').last);
    }
    switch (status) {
      case CardStatus.like:
        like();
        break;
      case CardStatus.dislike:
        dislike();
        break;
      case CardStatus.superLike:
        superLike();
        break;
      default:
        resetPosition();
    }
  }

  double getStatusOpacity() {
    const delta = 100;
    final pos = max(position.value.dx.abs(), position.value.dy.abs());
    final opacity = pos / delta;
    return min(opacity, 1);
  }

  resetPosition() {
    isDragging.value = false;
    position.value = Offset.zero;
    angle.value = 0;
    update();
  }

  void setScreenSize(Size size) {
    screenSize.value = Get.size;
  }

  CardStatus? getStatus({bool force = false}) {
    final x = position.value.dx;
    final y = position.value.dy;
    final forceSuperLike = x.abs() < 20;

    if (force) {
      const delta = 100;
      if (x >= delta) {
        return CardStatus.like;
      } else if (x <= -delta) {
        return CardStatus.dislike;
      } else if (y <= -delta / 2 && forceSuperLike) {
        return CardStatus.superLike;
      }
    } else {
      const delta = 20;
      if (x >= delta) {
        return CardStatus.like;
      } else if (x <= -delta) {
        return CardStatus.dislike;
      } else if (y <= -delta / 2 && forceSuperLike) {
        return CardStatus.superLike;
      }
    }
  }

  void like() {
    angle.value = 20;
    position.value += Offset(2 * screenSize.value.width, 0);
    _nextCard();
    currentIndex.value++;
    ageUserToShow.value = -1;
    print("like ${currentUser!.lastName!}");
    userRepository.addToLikedUserBox(currentUser!);
    update();
  }

  void dislike() {
    angle.value = -20;
    position.value -= Offset(2 * screenSize.value.width, 0);
    _nextCard();
    currentIndex.value++;
    ageUserToShow.value = -1;
    print("dislike ${currentUser!.lastName!}");
    userRepository.addToDislikedUserBox(currentUser!);
    update();
  }

  void superLike() {
    angle.value = 0;
    position.value -= Offset(0, screenSize.value.height);
    update();
    _nextCard();
    currentIndex.value++;
    ageUserToShow.value = -1;
    print("like ${currentUser!.lastName!}");
    userRepository.addToLikedUserBox(currentUser!);
    update();
  }

  Future _nextCard() async {
    if (listUserToShow.value == null || listUserToShow.value!.isEmpty) return;
    await Future.delayed(Duration(milliseconds: 200));
    var newList = listUserToShow.value!;
    newList.removeAt(0);
    listUserToShow.value = newList;
    update();
    resetPosition();
  }
}
