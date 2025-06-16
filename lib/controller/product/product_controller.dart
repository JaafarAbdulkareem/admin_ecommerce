import 'package:admin_ecommerce/controller/base/base_floating_button_controller.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/constant_key.dart';
import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
import 'package:admin_ecommerce/core/function/dialog_want_delete.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/data/data_source/remote/product/product_remote.dart';
import 'package:admin_ecommerce/data/models/product/product_model.dart';
import 'package:get/get.dart';

abstract class ProductController extends BaseFloatingButtonController {
  void deleteProduct(int index);
  void goToUpdateProduct(int index);
}

class ProductControllerImp extends ProductController {
  static List<ProductModel> productData = [];
  static bool firstTime = true;
  late StatusRequest statusRequest;
  late ProductRemote productRemote;

  @override
  void onInit() {
    statusRequest = StatusRequest.initial;
    productRemote = ProductRemote(curd: Get.find());
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    if (firstTime) {
      productData.clear();
      firstTime = false;
      statusRequest = StatusRequest.loading;
      update();
      var response = await productRemote.getData();
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
        update();
      }
    } else {
      statusRequest = StatusRequest.success;
      update();
    }
  }

  fetchData(response) {
    for (var element in response) {
      productData.add(ProductModel.fromJson(element));
    }
  }

  void checkDataLength() {
    if (productData.isEmpty) {
      statusRequest = StatusRequest.failure;
      update();
    } else {
      statusRequest = StatusRequest.success;
      update();
    }
  }

  @override
  void deleteProduct(int index) {
    dialogWantDelete(
      yesButton: () async {
        statusRequest = StatusRequest.loading;
        update();
        var response = await productRemote.deleteProduct(
          id: productData[index].id,
          image: productData[index].image,
        );
        statusRequest = handleStatus(response);
        if (statusRequest == StatusRequest.success) {
          if (response[ApiResult.status] == ApiResult.success) {
            productData.removeAt(index);
            if (productData.isEmpty) {
              statusRequest = StatusRequest.failure;
              update();
            } else {
              statusRequest = StatusRequest.success;
              update();
            }
          } else {
            await Get.defaultDialog(
              title: KeyLanguage.alert.tr,
              middleText: KeyLanguage.alertSomeError.tr,
            );
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
    Get.toNamed(ConstantScreenName.insertProduct);
  }

  @override
  void goToUpdateProduct(int index) {
    Get.toNamed(
      ConstantScreenName.updateProduct,
      arguments: {
        ConstantKey.productData: productData[index],
      },
    );
  }
}
