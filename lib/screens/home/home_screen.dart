import 'package:calculadora_getx/screens/home/home_controller.dart';
import 'package:calculadora_getx/widgets/calculator_button.dart';
import 'package:calculadora_getx/widgets/horizontal_divider.dart';
import 'package:calculadora_getx/widgets/main_result.dart';
import 'package:calculadora_getx/widgets/sub_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final homeCtrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(child: Container()),
              
              MathResults(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton(
                    onTap: () => homeCtrl.resetAll(), 
                    text: 'AC',
                    bgColor: const Color(0xffA5A5A5),
                  ),
                  CalculatorButton(
                    onTap: () => homeCtrl.changeNegativePositive(),
                    text: '+/-',
                    bgColor: const Color(0xffA5A5A5),
                  ),
                  CalculatorButton(
                    onTap: () => homeCtrl.deleteLastEntry(),
                    text: 'del',
                    bgColor: const Color(0xffA5A5A5),
                  ),
                  CalculatorButton(
                    onTap: () => homeCtrl.selectOperation('/'), 
                    text: '/',
                    bgColor: const Color(0xffF0A23B),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton(
                    onTap: () => homeCtrl.addNumber('7'),
                    text: '7',
                  ),
                  CalculatorButton(
                    onTap: () => homeCtrl.addNumber('8'),
                    text: '8',
                  ),
                  CalculatorButton(
                    onTap: () => homeCtrl.addNumber('9'),
                    text: '9',
                  ),
                  CalculatorButton(
                    onTap: () => homeCtrl.selectOperation('X'),
                    text: 'X',
                    bgColor: const Color(0xffF0A23B),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton(
                    onTap: () => homeCtrl.addNumber('4'),
                    text: '4',
                  ),
                  CalculatorButton(
                    onTap: () => homeCtrl.addNumber('5'),
                    text: '5',
                  ),
                  CalculatorButton(
                    onTap: () => homeCtrl.addNumber('6'), 
                    text: '6',
                  ),
                  CalculatorButton(
                    onTap: () => homeCtrl.selectOperation('-'),
                    text: '-',
                    bgColor: const Color(0xffF0A23B),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton(
                    onTap: () => homeCtrl.addNumber('1'),
                    text: '1',
                  ),
                  CalculatorButton(
                    onTap: () => homeCtrl.addNumber('2'),
                    text: '2',
                  ),
                  CalculatorButton(
                    onTap: () => homeCtrl.addNumber('3'),
                    text: '3',
                  ),
                  CalculatorButton(
                    onTap: () => homeCtrl.selectOperation('+'),
                    text: '+',
                    bgColor: const Color(0xffF0A23B),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton(
                    onTap: () => homeCtrl.addNumber('0'),
                    text: '0',
                    big: true,
                  ),
                  CalculatorButton(
                    onTap: () => homeCtrl.addDecimalPoint(), 
                    text: '.',
                  ),
                  CalculatorButton(
                    onTap: () => homeCtrl.calculateOperation(),
                    text: '=',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MathResults extends StatelessWidget {
  MathResults({Key? key}) : super(key: key);

  var homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [
        SubResult(text: homeCtrl.firstNumber.value),
        SubResult(text: homeCtrl.operation.value),
        SubResult(text: homeCtrl.secondNumber.value),
        HorizontalDivider(),
        MainResult(text: homeCtrl.resultNumber.value),
      ],
    ));
  }
}