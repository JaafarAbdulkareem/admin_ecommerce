import 'package:admin_ecommerce/core/localization/key_language.dart';

Map<String, String> english = {
//appbar
  KeyLanguage.appBarHome: "Home",
  KeyLanguage.appBarLogin: "Login",
  KeyLanguage.appBarVerification: "Verification",
  KeyLanguage.appBarForgetPassword: "Check Email",
  KeyLanguage.appBarRePassword: "New Password",
  KeyLanguage.appBarCategory: "Category",
  KeyLanguage.appBarInsertCategory: "Insert Category",
  KeyLanguage.appBarUpdateCategory: "Update Category",
  KeyLanguage.appBarProduct: "Product",
  KeyLanguage.appBarInsertProduct: "Insert Product",
  KeyLanguage.appBarUpdateProduct: "Update Product",
  KeyLanguage.appBarOrder: "Order",
  KeyLanguage.appBarDeliveryOrder: "Delivery Order",
  KeyLanguage.appBarReceiveOrder: "Receive Order",
//validator
  KeyLanguage.empty: "Please, Fill Field",
  KeyLanguage.invalidEmail: "Email Is Invalid",
  KeyLanguage.invalidPassword: "Enter The Digital Password",
  KeyLanguage.lessMin: "Entry length is less than : ",
  KeyLanguage.greaterMax: "Entry length is greater than : ",
//splash
  KeyLanguage.chooseLanguage: "Choose Language",
  KeyLanguage.arabic: "Arabic",
  KeyLanguage.english: "English",
  KeyLanguage.titleSplash: "Welcome To My App",
//auth
  KeyLanguage.titleWelcome: "Welcome Back",
  KeyLanguage.messageLogin:
      "Login with your email and password or continue with social media",
  KeyLanguage.titleForgetPassword: "Forget Password",
  KeyLanguage.messageVerification: "Please, Enter The Digital Code to Sent : ",
  KeyLanguage.forgetPasswordContent:
      "Please, Enter Your Email Address to Recive A Verification Code",
  KeyLanguage.titleRePassword: "Reset Password",
  KeyLanguage.resetPasswordContent: "Please, Enter New Password",
//home
  KeyLanguage.titleCategory: "Category",
  KeyLanguage.titleProduct: "Product",
  KeyLanguage.titleUsers: "Users",
  KeyLanguage.titleOrders: "Orders",
  KeyLanguage.titleReport: "Report",
  KeyLanguage.titleNotification: "Notification",
  KeyLanguage.titleMessage: "Message",
  KeyLanguage.titlePayment: "Payment",
  KeyLanguage.titleSetting: "Setting",
//category
  KeyLanguage.titleCamera: "Camera",
  KeyLanguage.titleGallery: "Gallery",
//product
  KeyLanguage.titleActive: "Active",
//order
  KeyLanguage.titleDelivery: "Delivery",
  KeyLanguage.titleReceive: "Receive",
  KeyLanguage.orderNumber: "Oreder Number : #",
  KeyLanguage.orderType: "Oreder Type : ",
  KeyLanguage.orderPrice: "Order Price : ",
  KeyLanguage.deliveyPrice: "Delivery Price : ",
  KeyLanguage.paymentMethod: "Payment Method : ",
  KeyLanguage.orderStatus: "Order Status : ",
  KeyLanguage.cashOption: "Cash On Delivery",
  KeyLanguage.paymentOption: "Payment Cards",
  KeyLanguage.deliveryOption: "Delivery",
  KeyLanguage.receiveOption: "Receive",
  KeyLanguage.approvedOption: "⏳ Order Is Pending And Awaiting Confirmation.",
  KeyLanguage.prepareOption: "📝 Order Has Been Reviewed And Confirmed.",
  KeyLanguage.onWayOption: "🚚 Order Is Currently In Transit To The Customer.",
  KeyLanguage.doneDeliveryOption: "✅ Order Marked As Delivered And Closed.",
  KeyLanguage.totalPrice: "Total Price",
//dialog
  KeyLanguage.alert: "Alert",
  KeyLanguage.alertWantExit: "Do You Want Exit?",
  KeyLanguage.alertWantDelete: "Do You Want To Delete?",
  // KeyLanguage.emailFoundMessage: "The Email or Phone is Exist",
  KeyLanguage.alertVerifyWrong: "Your Verification Was Wrong, Try Again ",
  KeyLanguage.alertSomeError: "An Error Occurred, Please Try Again Later",
  // KeyLanguage.noApproveMessage:
  //     "verify Your Verification, click Forget Password ",
  KeyLanguage.alertNoFound: "The Email or Password Was Wrong, Try Again",
  KeyLanguage.passwordMismatchMassage:
      "Password Mismatch, Check Your Password again",
  KeyLanguage.alertEnterEmail: "Enter Your Email First Please",
  KeyLanguage.alertNoThingChange:
      "Oops! You Haven’t Changed Anything Yet. Please Make An Update Before Saving.",
  KeyLanguage.alertInsertImage: "Image Is Required. Please Upload An Image.",
  KeyLanguage.alertInsertCategory:
      "Category Type Is Required. Please Choose A Category.",
  // KeyLanguage.incrementMessage:
  //     "Your Cart Contains More Products Than Available In Stock. Please Adjust The Quantity Of Products In Your Cart.",
  // // KeyLanguage.decrementMessage:
  // //     "You Cannot Decrease the Quantity Below the Available Stock. Please Adjust the Quantity Accordingly.",
  // KeyLanguage.notFoundProductMessage: "This Product Is Not Available",
  // KeyLanguage.serviceExceptionMessage:
  //     "Location Services Are Turned Off. Please Enable Location Services To Continue.",
  // KeyLanguage.permissionExceptionMessage:
  //     "Location Permission Is Denied. Please Grant Location Access In Your Device Settings To Continue.",
  // KeyLanguage.orderSuccessMessage: "You’re the best — thanks for your order!",
//label
  KeyLanguage.labelEmail: "Email",
  KeyLanguage.labelPassword: "Password",
  KeyLanguage.labelRePassword: "Re Password",
  KeyLanguage.labelCategoryArabic: "Category (Arabic)",
  KeyLanguage.labelCategoryEnglish: "Category (English)",
  KeyLanguage.labelProductArabicName: "Product Name (Arabic)",
  KeyLanguage.labelProductEnglishName: "Product Name (English)",
  KeyLanguage.labelProductArabicDescription: "Product Description (Arabic)",
  KeyLanguage.labelProductEnglishDescription: "Product Description (English)",
  KeyLanguage.labelCount: "Count",
  KeyLanguage.labelPrice: "Price",
  KeyLanguage.labelDiscount: "Discount (%)",
//hint
  KeyLanguage.hintEmail: "Enter Your Email",
  KeyLanguage.hintPassword: "Enter Your Password",
  KeyLanguage.hintRePassword: "Enter Your Password Again",
  KeyLanguage.hintCategoryArabic: "Enter Your Category Name (Arabic)",
  KeyLanguage.hintCategoryEnglish: "Enter Your Category Name (English) ",
  KeyLanguage.hintProductArabicName: "Enter Product Name (Arabic)",
  KeyLanguage.hintProductEnglishName: "Enter Product Name (English)",
  KeyLanguage.hintProductArabicDescription:
      "Enter Product Description (Arabic)",
  KeyLanguage.hintProductEnglishDescription:
      "Enter Product Description (English)",
  KeyLanguage.hintCount: "Enter Count",
  KeyLanguage.hintPrice: "Enter Price",
  KeyLanguage.hintDiscount: "Discount",
  KeyLanguage.hintProductDrop: "Choose Category Name",
  KeyLanguage.hintSearch: "Search",

//button
  KeyLanguage.buttonLogin: "Login",
  KeyLanguage.buttonYes: "Yes",
  KeyLanguage.buttonNo: "No",
  KeyLanguage.buttonCheck: "Check",
  KeyLanguage.buttonSave: "Save",
  KeyLanguage.buttonAdd: "Add",
  KeyLanguage.buttonChooseImage: "Choose Image",
  KeyLanguage.buttonCancel: "Cancel",
  KeyLanguage.buttonDetail: "Details",
  KeyLanguage.buttonPrepare: "Confirmed",
  KeyLanguage.buttonOnTheWay: "In Transit",
  KeyLanguage.buttonDelivery: "Delivery",
  KeyLanguage.buttonPickUp: "Picked Up",

  //bar
  KeyLanguage.barPending: "Pending",
  KeyLanguage.barProper: "Confirmed", // More clear than "Proper"
  KeyLanguage.barOnTheWay: "Transit", // Shorter than "On the Way"
  KeyLanguage.barArchive: "Archive",
  KeyLanguage.barPendingPickup: "Waiting",
};
  
//   KeyLanguage.easyAndSafePayment: "Easy and Safe Payment",
//   KeyLanguage.trackYourOrder: "Track Your Order",
//   KeyLanguage.fastDelivery: "Fast Delivery",
//   KeyLanguage.bodyChooseProduct:
//       "We Have 100k Product, Choose\nYour Product From Our E-commerce Shop",
//   //button
//   KeyLanguage.continueButton: "Continue",
//   KeyLanguage.signupButton: "SignUp",
//   KeyLanguage.verifyButton: "Verify",
//   KeyLanguage.goToCartButton: "Add To Card",
//   KeyLanguage.nextButton: "Next",
//   KeyLanguage.applyButton: "Apply",
//   KeyLanguage.removeButton: "Remove",
//   KeyLanguage.checkoutButton: "Checkout",
//   KeyLanguage.orderButton: "Place Order",
//   KeyLanguage.deleteButton: "Delete",
//   KeyLanguage.acceptButton: "Accept",
//   KeyLanguage.injectButton: "Inject",
//   KeyLanguage.submitButton: "Submit",

// //auth
//   KeyLanguage.successTitle: "Success",
//   KeyLanguage.signupContent:
//       "Signup with your email and password or continue with social media",
//   KeyLanguage.successContent:
//       "Success! Your Action Is Complete. Please Log In Again.",
// //text field
//   //label
//   KeyLanguage.usernameLabel: "Username",
//   KeyLanguage.phoneLabel: "Phone",
//   KeyLanguage.searchLabel: "Search",
//   KeyLanguage.typeAddressLabel: "Type Building",
//   KeyLanguage.cityLabel: "City",
//   KeyLanguage.streetLabel: "Street",
//   KeyLanguage.detailAddressLabel: "Detail Address(Option)",

//   //hint
//     KeyLanguage.usernameHint: "Enter Your Name",
//   KeyLanguage.phoneHint: "Enter Your Phone",
//   KeyLanguage.searchHint: "Find Your Product Here",
//   KeyLanguage.typeAddressHint: "e.g. Home, Office, School 🏠🏢🏫",
//   KeyLanguage.cityHint: "Enter your city 🏙️",
//   KeyLanguage.streetHint: "Enter your street name 🛣️",
//   KeyLanguage.detailAddressHint: "Apartment number, floor, building 🏢",
//   KeyLanguage.couponsHint: "Enter Coupons",
//   KeyLanguage.ratingHint:
//       "Tap a star to set your rating. Add more description here if you want.",
//   KeyLanguage.commentHint: "Set your custom comment hint",
//   //message
//   
//   KeyLanguage.messageLinkLogin: "Don't have an acconunt?",
//   KeyLanguage.messageLinkSignup: "I really have an account",
//   KeyLanguage.productNoNotAvailableMessage:
//       "Please Note That This Is The Only Unit Currently Available In Our Store.",
  // //validator
  // KeyLanguage.empty: "Please, Fill Field",
  // KeyLanguage.invalidUsername: "Username Is Invalid",
  // KeyLanguage.invalidEmail: "Email Is Invalid",
  // KeyLanguage.invalidPassword: "Enter The Digital Password",
  // KeyLanguage.invalidPhone: "Enter The Phone Number Correctly",
  // KeyLanguage.lessMin: "Entry length is less than : ",
  // KeyLanguage.greaterMax: "Entry length is greater than : ",
  //home
//   KeyLanguage.hello: "Hello",
//   KeyLanguage.titleCategories: "Categories",
//   KeyLanguage.titleDiscountProduct: "Product For You",
//   //botton bar
//   KeyLanguage.barHome: "HOME",
//   KeyLanguage.barSetting: " SETTING",
//   KeyLanguage.barReceipt: "Receipt",
//   // KeyLanguage.barProfile: "PROFILE",
//   KeyLanguage.barNotification: "Notification",
//   //product
//   KeyLanguage.color: "Color",
//   KeyLanguage.addProductMessage: "SORRY, Not More Products",
//   KeyLanguage.removeProductMessage: "This Is The Minimum For This Product",
//   KeyLanguage.outOfStock: "Out Of Stock",
//   //setting
//   // KeyLanguage.nameUSer : "Name : ",
//   KeyLanguage.addressSetting: "Drop Your Address Here",
//   // KeyLanguage.emailUSer : "Email : ",
//   // KeyLanguage.phoneUSer : "Phone : ",
//   // KeyLanguage.passwordUSer : "Password",
//   KeyLanguage.archiveTitle: "Orders archive",
//   KeyLanguage.contectUsTitle: "Contact Us",
//   KeyLanguage.logout: "Logout",
//   //drawer
//   KeyLanguage.aboutUS: "Aboout Us",
//   KeyLanguage.contactWithUs: "contact With Us",
//   KeyLanguage.commonQuestion: "Common Question",
//   KeyLanguage.sendComment: "Send Your Comment",
//   KeyLanguage.changeLangeuag: "Change App Language",
//   KeyLanguage.changeModeDL: "Change ModeDL",
//   KeyLanguage.changeModeBG: "changeModeBG",
//   KeyLanguage.natification: "natification",
//   KeyLanguage.readMoneyAi: "readMoneyAi",
//   //cart
//   KeyLanguage.appBarTitleCart: "My Cart",
//   KeyLanguage.youHave: "You Have",
//   KeyLanguage.listITemCart: "Item/s In Your List",
//   KeyLanguage.shoppingTitle: "Shopping",
//   KeyLanguage.priceTitle: "Price",
//   KeyLanguage.ratingTitle: "Rating",
//   KeyLanguage.couponsDiscount: "Coupon Discount",
//   KeyLanguage.couponsNotFoundMessage:
//       "Oops, That Coupon Didn’t Work. Try Another One!",
//   //search
//   KeyLanguage.enterEnter: "Press Enter or tap 🔍 to start the search.",
//   //address
//   KeyLanguage.appBarTitleInsertAddress: "Add New Address",
//   KeyLanguage.appBarTitleDetailInsertAddress: "Confirm Address Details",
//   KeyLanguage.appBarTitleDisplayAddress: "My Addresse/s",
//   KeyLanguage.waitingGoogleMap: "Waiting, Please...",
//   //checkout
  // KeyLanguage.titlePaymentMethod: "Choose Payment Method",
  // KeyLanguage.titleDeliveryType: "Choose Delivery Type",
  // KeyLanguage.titleShoppingAddress: "Choose Shopping Address",
  // KeyLanguage.cashOption: "Cash On Delivery",
  // KeyLanguage.paymentOption: "Payment Cards",
  // KeyLanguage.deliveryOption: "Delivery",
  // KeyLanguage.receiveOption: "Receive",
  // KeyLanguage.errorAddressMessage:
  //     "Oops! Couldn't Load Your Address. Try Again?",
  // KeyLanguage.chooseDeliveryMessage:
  //     "Oops! Please Select A Delivery Option—Either Delivery Or Receive—Before Continuing. 😊",
  // KeyLanguage.chooseAddressMessage:
  //     "Oops! Please Select One Of Your Saved Addresses Before Continuing. 😊",
  // KeyLanguage.appBarTitleOrder: "Orders",
  // KeyLanguage.appBarTitleDetailOrder: "Orders Detail",
  // KeyLanguage.appBarTitleArchive: "Archive",
  // KeyLanguage.orderNumber: "Oreder Number : #",
  // KeyLanguage.orderType: "Oreder Type : ",
  // KeyLanguage.orderPrice: "Order Price : ",
  // KeyLanguage.deliveyPrice: "Delivery Price : ",
  // KeyLanguage.paymentMethod: "Payment Method : ",
  // KeyLanguage.orderStatus: "Order Status : ",
  // KeyLanguage.approvedOption: "✅ Your Order Is Confirmed!",
  // KeyLanguage.prepareOption: "📦 We’re Preparing Your Order.",
  // KeyLanguage.onWayOption: "🚚 Your Order Is On The Way!",
  // KeyLanguage.doneDeliveryOption: "📬 Your Order Has Been Delivered. Enjoy!",
  // KeyLanguage.productTitle: "Products",
  // KeyLanguage.countTitle: "Counts",
  // KeyLanguage.quantityTitle: "QTY",
  // KeyLanguage.addressTitle: "Shipping Address",
//   //notification
//   KeyLanguage.appBarTitleNotification: "Notificaion",
// };
