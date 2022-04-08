import 'dart:async';

import 'package:coder_push_interview/models/user_response_model.dart';
import 'package:hive/hive.dart';

class UserRepository {
  String dislikeUserBox = "dislikeUserBox";
  String likeUserBox = "likeUserBox";

  // open a box
  Future<Box> dislikedUserBox() async {
    var box = await Hive.openBox<UserBasicInfo>(dislikeUserBox);
    return box;
  }

  Future<Box> likedUserBox() async {
    var box = await Hive.openBox<UserBasicInfo>(likeUserBox);
    return box;
  }

  Future<List<UserBasicInfo>> getAllLikedUser() async {
    final box = await likedUserBox();
    List users = box.values.toList();
    return users as List<UserBasicInfo>;
  }

  Future<void> addToLikedUserBox(UserBasicInfo user) async {
    final box = await likedUserBox();
    await box.put(user.id, user);
  }

  Future<List<UserBasicInfo>> getAllDislikedUser() async {
    final box = await dislikedUserBox();
    List users = box.values.toList();
    return users as List<UserBasicInfo>;
  }

  Future<void> addToDislikedUserBox(UserBasicInfo user) async {
    final box = await dislikedUserBox();
    await box.put(user.id, user);
  }

  Future<bool> checkIfUserAlreadyInTheBox(String userId) async {
    final boxDislike = await dislikedUserBox();
    final boxLike = await likedUserBox();
    if (boxDislike.get(userId, defaultValue: null) == null) return false;
    if (boxLike.get(userId, defaultValue: null) == null) return false;
    return true;
  }
}
