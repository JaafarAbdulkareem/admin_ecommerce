import 'package:admin_ecommerce/controller/base/base_floating_button_controller.dart';
import 'package:admin_ecommerce/core/class/alert_default.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
import 'package:admin_ecommerce/core/function/dialog_want_delete.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/data/data_source/remote/category/category_remote.dart';
import 'package:admin_ecommerce/data/models/category_model.dart';
import 'package:get/get.dart';

abstract class CategoryController extends BaseFloatingButtonController {
  void deleteCategory(int index);
  void goToUpdateCategory(int index);
}

class CategoryControllerImp extends CategoryController {
  static List<CategoryModel> categoryData = [];
  static bool firstTime = true;
  late StatusRequest statusRequest;
  late CategoryRemote categoryRemote;

  final AlertDefault _alertDefault = AlertDefault();

  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    categoryRemote = CategoryRemote(curd: Get.find());
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    if (firstTime) {
      categoryData.clear();
      firstTime = false;
      statusRequest = StatusRequest.loading;
      update();
      var response = await categoryRemote.getData();
      statusRequest = handleStatus(response);
      if (statusRequest == StatusRequest.success) {
        if (response[ApiResult.status] == ApiResult.success) {
          fetchData(response[ApiResult.data]);
          checkDataLength();
        } else {
          statusRequest = StatusRequest.failure;
          update();
        }
      } else {
        firstTime = true;
        update();
      }
    } else {
      statusRequest = StatusRequest.success;
      update();
    }
  }

  fetchData(response) {
    for (var element in response) {
      categoryData.add(CategoryModel.fromJson(element));
    }
  }

  void checkDataLength() {
    if (categoryData.isEmpty) {
      statusRequest = StatusRequest.failure;
      update();
    } else {
      statusRequest = StatusRequest.success;
      update();
    }
  }

  @override
  void deleteCategory(int index) {
    dialogWantDelete(
      yesButton: () async {
        statusRequest = StatusRequest.loading;
        update();
        var response = await categoryRemote.deleteCategory(
          id: categoryData[index].id.toString(),
          image: categoryData[index].image,
        );
        statusRequest = handleStatus(response);
        if (statusRequest == StatusRequest.success) {
          if (response[ApiResult.status] == ApiResult.success) {
            categoryData.removeAt(index);
            if (categoryData.isEmpty) {
              statusRequest = StatusRequest.failure;
              update();
            } else {
              statusRequest = StatusRequest.success;
              update();
            }
          } else {
            statusRequest = StatusRequest.success;
            update();
            _alertDefault.snackBarDefault();
          }
        } else {
          update();
        }
        Get.back();
      },
    );
  }

  @override
  void goToInsertPage() {
    Get.toNamed(ConstantScreenName.insertCategory);
  }

  @override
  void goToUpdateCategory(int index) {
    Get.toNamed(
      ConstantScreenName.updateCategory,
      arguments: {
        ConstantKey.categoryData: categoryData[index],
      },
    );
  }
}
