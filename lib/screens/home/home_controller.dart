import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  var firstNumber = '0'.obs;
  var secondNumber = '0'.obs;
  var resultNumber = '0'.obs;
  var operation = '+'.obs;

  resetAll(){
    firstNumber.value = '0';
    secondNumber.value = '0';
    resultNumber.value = '0';
    operation.value = '+';
  }

  changeNegativePositive(){
    if(resultNumber.startsWith('-'))
      resultNumber.value = resultNumber.value.replaceFirst('-', '');
    else
      resultNumber.value = '-' + resultNumber.value;
  }

  addNumber(String number){
    if(resultNumber.value == '0')
      return resultNumber.value = number;

    if(resultNumber.value == '-0')
      return resultNumber.value = '-' + number;

    resultNumber.value += number;
  }

  addDecimalPoint(){
    if(!resultNumber.value.contains('.'))
      resultNumber.value += '.';
  }

  selectOperation(String operation){
    this.operation.value = operation;
    firstNumber.value = resultNumber.value;
    resultNumber.value = '0';
  }

  deleteLastEntry(){
    if(resultNumber.value.replaceAll('-', '').length > 1){
      resultNumber.value = resultNumber.value.substring(0, resultNumber.value.length - 1);
    }
    else{
      resultNumber.value = '0';
    }
  }

  calculateOperation(){
    double num1 = double.parse(firstNumber.value); 
    double num2 = double.parse(resultNumber.value);

    secondNumber.value = resultNumber.value;

    switch (operation.value) {
      case '/':
        if(num2 == 0) {
          showSnackBar('No es posible dividir entre cero');
          return;
        }
        resultNumber.value = '${ num1 / num2 }';
        break;
      case 'X':
        resultNumber.value = '${ num1 * num2 }';
        break;
      case '-':
        resultNumber.value = '${ num1 - num2 }';
        break;
      case '+':
        resultNumber.value = '${ num1 + num2 }';
        break;
      default:
        return;
    }

    if(resultNumber.value.endsWith('.0')){
      resultNumber.value = resultNumber.value.substring(0, resultNumber.value.length - 2);
    }
  }

  showSnackBar(String message){
    Get.snackbar(
      '', 
      '',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(milliseconds: 1500),
      titleText: Center(
        child: Text(
          message,
          style: const TextStyle(fontSize: 20),
        )
      ),
      messageText: Container(),
      snackStyle: SnackStyle.GROUNDED
    );
  }
}