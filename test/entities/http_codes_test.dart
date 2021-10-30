import 'package:flutter_clean_architecture/app/domain/entities/http_cat.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('The fields added in the constructor must match the attributes.', () {
    String statusCode = "200";
    String image = "https://http.cat/200";
    HttpCat httpCat = new HttpCat(statusCode: statusCode, image: image);

    expect(statusCode, httpCat.statusCode);
    expect(image, httpCat.image);
  });
}

