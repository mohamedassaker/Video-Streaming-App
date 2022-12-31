import 'package:hive/hive.dart';
part 'video_model.g.dart';

@HiveType(typeId: 7)
class APIVideo extends HiveObject{
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String link;
}