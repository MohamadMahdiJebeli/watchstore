class EndPoints{
  static const baseURL="https://watchstore.sasansafari.com$versionRoute";
  static const versionRoute="/public/api/v1";
  static const sendSMS="$baseURL/send_sms";
  static const checkSMSCode="$baseURL/check_sms_code";
  static const register="$baseURL/register";
  static const productsByBrand="$baseURL/products_by_brand/";
  static const productsByCategory="$baseURL/products_by_category/";
  static const search="$baseURL/all_products/";
  static const home="$baseURL/home";
  static const productDetails="$baseURL/product_details/";
  static const userCart="$baseURL/user_cart";
  static const addToCart="$baseURL/add_to_cart";
  static const removeFromCart="$baseURL/remove_from_cart";
  static const deleteFromCart="$baseURL/delete_from_cart";
  static const totalCartPrice="$baseURL/total_cart_price";
  static const payment = "$baseURL/payment";
  static const profile = "$baseURL/profile";
}

class ProductSortRoutes{
  static const newestProducts = "/newest_products";
  static const cheapestProducts = "/cheapest_products";
  static const mostExpensiveProducts = "/most_expensive_products";
  static const mostViewedProducts = "/most_viewed_products";
}