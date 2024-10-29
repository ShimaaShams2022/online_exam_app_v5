
String formatDuration(Duration remainingTime) {
  String minutes = remainingTime.inMinutes.remainder(60).toString().padLeft(2, '0');
  String seconds = remainingTime.inSeconds.remainder(60).toString().padLeft(2, '0');
  return "$minutes:$seconds";
}
