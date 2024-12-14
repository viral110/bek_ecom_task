import 'package:bek_task/src/app/custom_nav_bar/presentation/pages/custom_nav_bar_page.dart';
import 'package:bek_task/src/app/login/presentation/pages/forgot_password.dart';
import 'package:bek_task/src/app/login/presentation/pages/login_page.dart';
import 'package:bek_task/src/app/product/presentation/pages/product_detail_page.dart';
import 'package:bek_task/src/app/product/presentation/pages/product_page.dart';
import 'package:bek_task/src/app/register/presentation/pages/register_page.dart';
import 'package:bek_task/src/app/welcome/presentation/welcome_page.dart';
import 'package:bek_task/src/common/constant/storage_helper.dart';
import 'package:bek_task/src/routes/app_route_name.dart';
import 'package:bek_task/src/utils/error_page.dart';
import 'package:bek_task/src/utils/storage_utils.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: "/",
        path: AppRouteName.root,
        builder: (context, state) => StorageUtil.getBool(StorageHelper.isLogin) ? const CustomNavBarPage() : const WelcomePage(),

      ),
      GoRoute(
        name: "Login",
        path: AppRouteName.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: "Register",
        path: AppRouteName.register,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        name: "Product Page",
        path: AppRouteName.productPage,
        builder: (context, state) => ProductPage(),
      ),
      GoRoute(
        name: "Product Detail Page",
        path: AppRouteName.productDetailPage,
        builder: (context, state) {
          Map<String, dynamic> data = state.extra! as Map<String, dynamic>;
          return ProductDetailPage(product: data['product']);
        },
      ),
      GoRoute(
        name: "Forgot Password Page",
        path: AppRouteName.forgotPasswordPage,
        builder: (context, state) => const ForgotPasswordPage(),
      ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
}
