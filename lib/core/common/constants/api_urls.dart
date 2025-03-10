abstract class ApiUrls {
  static const baseURL = "https://dev.api.kursol.uz/kursol-api/";

  static const grantCode = "${baseURL}v1/auth/grant-code";

  static const login = "${baseURL}v1/auth/login";
  static const registerEmail = "${baseURL}v1/auth/register/email";
  static const registerPhone = "${baseURL}v1/auth/register/phone";
  static const verifyOtp = "${baseURL}v1/auth/otp-verification";
  static const logout = "${baseURL}v1/auth/logout";
  static const refreshToken = "${baseURL}v1/auth/refresh-token";
  static const resetPassword = "${baseURL}v1/auth/reset-password";
  static const resetPasswordPhone = "${baseURL}v1/auth/reset-password/phone";
  static const resetPasswordEmail = "${baseURL}v1/auth/reset-password/email";

}
