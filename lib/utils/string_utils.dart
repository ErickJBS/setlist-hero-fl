List<String> toStringArray (List<dynamic> array) {
  if (array == null)
    return List<String>();
  return array.map((e) => e.toString()).toList();
}