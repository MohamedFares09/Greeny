num getAvgRating(List<dynamic> reviews) {
  if (reviews.isEmpty) {
    return 0;
  }
  num sum = 0;
  for (var review in reviews) {
    sum += (review['rating'] as num);
  }
  return sum / reviews.length;
}