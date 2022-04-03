// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationMessageModelAdapter
    extends TypeAdapter<NotificationMessageModel> {
  @override
  final int typeId = 0;

  @override
  NotificationMessageModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationMessageModel(
      id: fields[0] as String?,
      title: fields[1] as String?,
      disc: fields[2] as String?,
      time: fields[3] as String?,
      isRead: fields[4] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationMessageModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.disc)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.isRead);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationMessageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
