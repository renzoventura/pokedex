import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/utils/extensions/int_extension.dart';
import 'package:pokedex/utils/extensions/string_extension.dart';
import 'package:pokedex/utils/extensions/response_extension.dart';
import 'package:dio/dio.dart';

void main() {
  group("Int Extenstion Test", () {
    test("1 should be #001", () {
      String expectedResult = "#001";
      int integerValue = 1;
      String pokemonIdId = integerValue.toPokemonNumber();
      expect(pokemonIdId, expectedResult);
    });
    test("10 should be #010", () {
      String expectedResult = "#010";
      int integerValue = 10;
      String pokemonIdId = integerValue.toPokemonNumber();
      expect(pokemonIdId, expectedResult);
    });
    test("100 should be #100", () {
      String expectedResult = "#100";
      int integerValue = 100;
      String pokemonIdId = integerValue.toPokemonNumber();
      expect(pokemonIdId, expectedResult);
    });
    test("1001 should be #1001", () {
      String expectedResult = "#1001";
      int integerValue = 1001;
      String pokemonIdId = integerValue.toPokemonNumber();
      expect(pokemonIdId, expectedResult);
    });
    test("999999 should be #999999", () {
      String expectedResult = "#999999";
      int integerValue = 999999;
      String pokemonIdId = integerValue.toPokemonNumber();
      expect(pokemonIdId, expectedResult);
    });
    test("null should be '' empty string", () {
      String expectedResult = "";
      int integerValue;
      String pokemonIdId = integerValue.toPokemonNumber();
      expect(pokemonIdId, expectedResult);
    });
    test("-1 should be #001", () {
      String expectedResult = "#001";
      int integerValue = -1;
      String pokemonIdId = integerValue.toPokemonNumber();
      expect(pokemonIdId, expectedResult);
    });
  });


  group("String isNullOrEmpty Extenstion Test", () {
    test("null string should return true", () {
      String stringValue;
      bool result = stringValue.isNullOrEmpty;
      expect(result, true);
    });
    test("empty string should return false", () {
      String stringValue = "";
      bool result = stringValue.isNullOrEmpty;
      expect(result, true);
    });
    test("non empty string should return true", () {
      String stringValue = "TEST";
      bool result = stringValue.isNullOrEmpty;
      expect(result, false);
    });
  });

  group("String isNotNullAndNotEmpty Extenstion Test", () {
    test("null string should return true", () {
      String stringValue;
      bool result = stringValue.isNotNullAndNotEmpty;
      expect(result, false);
    });
    test("empty string should return false", () {
      String stringValue = "";
      bool result = stringValue.isNotNullAndNotEmpty;
      expect(result, false);
    });
    test("non empty string should return true", () {
      String stringValue = "TEST";
      bool result = stringValue.isNotNullAndNotEmpty;
      expect(result, true);
    });
  });


  group("Response Extenstion Test", () {
    test("Status code 200 is Successful", () {
      Response response = Response(statusCode: 200);
      bool result = response.isSuccess;
      expect(result, true);
    });
    test("Status code 201 is Successful", () {
      Response response = Response(statusCode: 201);
      bool result = response.isSuccess;
      expect(result, true);
    });
    test("Status code 202 is Successful", () {
      Response response = Response(statusCode: 202);
      bool result = response.isSuccess;
      expect(result, true);
    });
    test("Status code 300 failed", () {
      Response response = Response(statusCode: 300);
      bool result = response.isSuccess;
      expect(result, false);
    });
    test("Status code 400 failed", () {
      Response response = Response(statusCode: 400);
      bool result = response.isSuccess;
      expect(result, false);
    });
    test("Status code 404 failed", () {
      Response response = Response(statusCode: 404);
      bool result = response.isSuccess;
      expect(result, false);
    });
  });



}

