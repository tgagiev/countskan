const String tableMeter = 'meterReading';

class MeterFields {
  static final List<String> values = [id, hotWater, coldWater, electricity, date];
  
  static const String id = 'id';
  static const String hotWater = 'hot_water';
  static const String coldWater = 'cold_water';
  static const String electricity = 'electricity';
  static const String date = 'date';
}

class Meter {
  final int? id;
  final int hotWater;
  final int coldWater;
  final int electricity;
  final String date;

  const Meter({
    this.id,
    required this.hotWater,
    required this.coldWater,
    required this.electricity,
    required this.date
  });

  Meter copy({
    int? id,
    int? hotWater,
    int? coldWater,
    int? electricity,
    String? date
  }) =>
      Meter(
        id: id ?? this.id,
        hotWater: hotWater ?? this.hotWater,
        coldWater: coldWater ?? this.coldWater,
        electricity: electricity ?? this.electricity,
        date: date ?? this.date
      );

  static Meter fromJson(Map<String, Object?> json) => Meter(
        id: json[MeterFields.id] as int?,
        hotWater: json[MeterFields.hotWater] as int,
        coldWater: json[MeterFields.coldWater] as int,
        electricity: json[MeterFields.electricity] as int,
        date: json[MeterFields.date] as String
      );

  Map<String, Object?> toJson() => {
        MeterFields.id: id,
        MeterFields.hotWater: hotWater,
        MeterFields.coldWater: coldWater,
        MeterFields.electricity: electricity,
        MeterFields.date: date,
      };
}

