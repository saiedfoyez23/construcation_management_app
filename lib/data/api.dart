class Api {
  /// base url

  static const baseUrl = "http://172.252.13.83:5011/api/v1";
  //static const baseUrl = "http://10.10.10.17:5003/api/v1/employees";
  //static const imageUrl = "http://192.168.10.152:5005/";

  ///auth
  static const login = "$baseUrl/auth/login"; // done
  static const uploadFiles = "$baseUrl/upload-files"; // done
  static const signup = "$baseUrl/auth/company-admin-signup"; // done
  static const signResendOtp = "$baseUrl/auth/send-otp"; // done
  static const signVerify = "$baseUrl/auth/verify-otp"; // done
  static const forgetPassword = "$baseUrl/auth/send-otp"; // done
  static const forgetOtp = "$baseUrl/auth/verify-otp"; // done
  static const newPassword = "$baseUrl/auth/create-new-password"; // done
  static const resetForgetPassword =
      "$baseUrl/auth/reset-forgotten-password"; // done
  static const changePassword = "$baseUrl/auth/change-password"; // done


  /// workforce
  static const postWorkforce = "$baseUrl/workforces";
  static const getProjectWorkforce = "$baseUrl/workforces/all";

  /// workforce
  static const postEquipments = "$baseUrl/equipments";
  static const getProjectEquipments = "$baseUrl/equipments/all";

  /// profile
  static const companyProfile = "$baseUrl/company-admins/profile"; // done
  static const profileUpdate = "$baseUrl/company-admins"; // done

  /// Create
  static const createProject = "$baseUrl/projects"; //done
  static const myProject = "$baseUrl/projects?limit=1000000000&sort=-updatedAt"; //done
  static const myProjectSearch = "$baseUrl/projects?limit=1000000000&searchTerm="; //done
  static const updateSingleProject = "$baseUrl/projects"; //done
  static const projectDetails = "$baseUrl/projects"; //done
  static singleProjectDetails({required projectId}) =>
      "$baseUrl/projects/$projectId";

  /// setting
  static const setting = "$baseUrl/settings"; //done

  /// employees
  static const createEmployees = "$baseUrl/employees"; //done
  static const getAllCompanyEmployees = "$baseUrl/employees";
}
