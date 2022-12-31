// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class APIVideoAdapter extends TypeAdapter<APIVideo> {
  @override
  final int typeId = 7;

  @override
  APIVideo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return APIVideo()
      ..name = fields[0] as String
      ..link = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, APIVideo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.link);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is APIVideoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
