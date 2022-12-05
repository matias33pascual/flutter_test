List<String> parseStringArrayToListString(String stringArray) {
  // remove the [ ] from the string
  final stringArrayWithoutBrackets =
      stringArray.substring(1, stringArray.length - 1);

  // make the list string
  final list = stringArrayWithoutBrackets.split(',');

  // remove the " " from every string in the list
  return list.map((e) => e.substring(1, e.length - 1)).toList();
}
