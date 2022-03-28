import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiselect Dropdown'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              DropDownMultiSelect(
                options: controller.options,
                whenEmpty: 'Select State Management Library',
                onChanged: (value) {
                  controller.selectedOptionList.value = value;
                  controller.selectedOption.value = "";
                  controller.selectedOptionList.value.forEach((element) {
                    controller.selectedOption.value =
                        controller.selectedOption.value + " " + element;
                  });
                },
                selectedValues: controller.selectedOptionList.value,
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() => Text(controller.selectedOption.value))
            ],
          ),
        ),
      ),
    );
  }
}
