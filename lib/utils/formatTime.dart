  String formatType(int sec){

    String resultFormat;

    final duration = Duration(seconds: sec);

    int hour = duration.inHours;
    int minute = duration.inMinutes;
    int second = duration.inSeconds;

    if (second>3600) {
      resultFormat="$hour:${minute.remainder(60)}:${second.remainder(60)}";
    } else {
      resultFormat = "$minute:${second.remainder(60)}";
    }   
    return resultFormat;
}