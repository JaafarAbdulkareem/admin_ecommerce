import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/api_key.dart';
import 'package:admin_ecommerce/core/constant/constant_screen_name.dart';
import 'package:admin_ecommerce/core/function/handle_status.dart';
import 'package:admin_ecommerce/core/localization/key_language.dart';
import 'package:admin_ecommerce/data/data_source/remote/category/category_remote.dart';
import 'package:admin_ecommerce/data/models/category_model.dart';
import 'package:get/get.dart';

abstract class CategoryController extends GetxController {
  void deleteCategory(int index);
  void goToInsertCategory();
  void goToUpdateCategory();
}

class CategoryControllerImp extends CategoryController {
  static List<CategoryModel> categoryData = [];
  static bool firstTime = true;
  // late GlobalKey<FormState> keyLogin;
  // late TextEditingController email;
  // late TextEditingController password;
  late StatusRequest statusRequest;
  late CategoryRemote categoryRemote;
  // late String titleDialog;
  // late SharedPrefsService prefs;
  @override
  void onInit() {
    // keyLogin = GlobalKey<FormState>();
    // email = TextEditingController();
    // password = TextEditingController();
    //
    statusRequest = StatusRequest.initial;
    categoryRemote = CategoryRemote(curd: Get.find());
    // titleDialog = KeyLanguage.alert.tr;
    // prefs = Get.find<SharedPrefsService>();
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
  void deleteCategory(int index) async {
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
        await Get.defaultDialog(
          title: KeyLanguage.alert.tr,
          middleText: KeyLanguage.alertSomeError.tr,
        );
      }
    } else {
      update();
    }
  }

  @override
  void goToInsertCategory() {
    Get.toNamed(ConstantScreenName.insertCategory);
  }

  @override
  void goToUpdateCategory() {
    // TODO: implement goToUpdateCategory
  }
}
