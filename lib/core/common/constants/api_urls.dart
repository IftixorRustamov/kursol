abstract class ApiUrls {
  static const baseURL = "https://dev.api.kursol.uz/kursol-api/";

  // Authentication endpoints
  static const resetPassword = "${baseURL}v1/auth/reset-password";
  static const resetPasswordPhone = "${baseURL}v1/auth/reset-password/phone";
  static const resetPasswordEmail = "${baseURL}v1/auth/reset-password/email";
  static const logout = "${baseURL}v1/auth/logout";
  static const login = "${baseURL}v1/auth/login";
  static const registerWithPhone = "${baseURL}v1/auth/register/phone";
  static const registerWithEmail = "${baseURL}v1/auth/register/email";
  static const refreshToken = "${baseURL}v1/auth/refresh-token";
  static const verifyOtp = "${baseURL}v1/auth/otp-verification";
  static const getGrantCode = "${baseURL}v1/auth/grant-code";
}
