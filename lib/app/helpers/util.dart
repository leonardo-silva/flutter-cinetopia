String limitString(String input, int limit) {
  if (input.length <= limit) {
    return input;
  }
  // Returns the first 'limit' characters of the string
  return input.substring(0, limit);
}
