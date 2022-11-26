List<String> parseStringArrayToListString(String stringArray) {
  final stringArrayWithoutBrackets =
      stringArray.substring(1, stringArray.length - 1);

  return stringArrayWithoutBrackets.split(',');
}
