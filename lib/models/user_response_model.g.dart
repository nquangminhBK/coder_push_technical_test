// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserBasicInfoAdapter extends TypeAdapter<UserBasicInfo> {
  @override
  final int typeId = 1;

  @override
  UserBasicInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserBasicInfo()
      .._id = fields[0] as String?
      .._title = fields[1] as String?
      .._firstName = fields[2] as String?
      .._lastName = fields[3] as String?
      .._picture = fields[4] as String?;
  }

  @override
  void write(BinaryWriter writer, UserBasicInfo obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(1)
      ..write(obj._title)
      ..writeByte(2)
      ..write(obj._firstName)
      ..writeByte(3)
      ..write(obj._lastName)
      ..writeByte(4)
      ..write(obj._picture);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserBasicInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
