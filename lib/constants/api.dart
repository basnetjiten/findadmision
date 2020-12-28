class AffiliatesConst {
  static final String BASE_URL = "https://api.findadmission.com/partnerapi/api";
  static final String TYPE_LOGIN = "type/login/page";
  static final String TYPE_SHARED = "type/shared/page";
  static final String appCheck = "$BASE_URL/$TYPE_LOGIN/appcheck";
  static final String loginUrl = "$BASE_URL/$TYPE_LOGIN/logincheckapp";
  static final String signUpUrl = "$BASE_URL/$TYPE_LOGIN/signupapppin";
  static final String mailCheck = "$BASE_URL/$TYPE_LOGIN/mailcheck";
  static final String pinVerifyUrl = "$BASE_URL/$TYPE_LOGIN/verifycheck";
  static final String resendPinUrl = "$BASE_URL/$TYPE_LOGIN/resendcheckapp";
  static final String resetPassUrl = "$BASE_URL/$TYPE_LOGIN/resetme";

  //office urls
  static final officeListUrl = "$BASE_URL/$TYPE_LOGIN/officelist";
  static final addOfficeUrl = "$BASE_URL/$TYPE_LOGIN/addoffice";
  static final removeOfficeUrl = "$BASE_URL/$TYPE_LOGIN/removeoffice";
  static final updateOfficeUrl = "$BASE_URL/$TYPE_LOGIN/addoffice";


  //token check url

  static final tokenCheckUrl = "$BASE_URL/$TYPE_SHARED/tokencheck";
  static final firebaseTokenCheckUrl = "$BASE_URL/$TYPE_SHARED/heartbeat";

  //university url
  static final String UNI_BASE_URL =
      "https://api.findadmission.com/newjson/api";

  static final univFilterUrl = "$UNI_BASE_URL/type/directapply/page/instlist";

  //student url

  static final String studentListUrl = "$BASE_URL/type/login/page/studentlist";
  static final String updateStdStatus = "$BASE_URL/type/login/page/updatestudent/";
  static final String addStudentUrl = "$BASE_URL/type/app/page/addstudent";

  //application url
  static final String applicationList = "$UNI_BASE_URL/type/directapply/page/alistdata/";

  //application apply
  static final String applyApplicationUrl="$UNI_BASE_URL/type/profilesetup/page/applystartnewflow/";
  static final String uploadFAFileUrl="$UNI_BASE_URL/type/aupload/page/defaultupload/";
  static final String uploadSingleFileUrl="$UNI_BASE_URL/type/aupload/page/fileuploadsingle/";
  static final String uploadOtherFileUrl="$UNI_BASE_URL/type/aupload/page/otherupload/";
  static final String deleteFileUrl="$UNI_BASE_URL/type/aupload/page/delfile/";
  //institues detail page
  static final String instituteDetailUrl="$BASE_URL/type/app/page/institutedetails";
  static final String loadDataUrl="$UNI_BASE_URL/type/profilesetup/page/loaddata";
  static final String previewApplyUrl="$UNI_BASE_URL/type/detail/page/previewdataapply/";
  static final String submitApplyUrl="$UNI_BASE_URL/type/profilesetup/page/submitreviewnew/";
  static final String submitCourseUrl="$UNI_BASE_URL/type/profilesetup/page/applystartcourse/";
  static final String loadFileDataUrl="$UNI_BASE_URL/type/aupload/page/filelist/";
  static final String uploadFileUrl="$UNI_BASE_URL/type/profilesetup/page/fileuploadapply";
  static final String deleteDocUrl="$UNI_BASE_URL/type/profilesetup/page/delfilebnew";
  static final String addWorkExpUrl="https://api.findadmission.com/json/api/type/detail/page/addwxp";
//institue save and delete
  static final String saveInstUrl="$BASE_URL/type/shared/page/saveinst/";
  static final String deleteInstUrl="$BASE_URL/type/shared/page/delinst/";
  static final String savedInstListUrl="$BASE_URL/type/app/page/savedinstlist/";

  //student api
static final String loadStudentDataUrl ="$UNI_BASE_URL/type/profilesetup/page/loaddata";
static final String saveCourseUrl ="$UNI_BASE_URL/type/profilesetup/page/savecourse";
static final String myPlanFirsStepUrl ="$UNI_BASE_URL/type/profilesetup/page/finishfirststep";
static final String stdWrkExpUrl ="$UNI_BASE_URL/type/detail/page/addwxp";
static final String saveFundUrl ="$UNI_BASE_URL/type/profilesetup/page/savefundnew";
static final String saveSecEduUrl ="$UNI_BASE_URL/type/profilesetup/page/savesec";
static final String saveHighEduUrl ="$UNI_BASE_URL/type/profilesetup/page/savehigh";
static final String saveOtherEduUrl ="$UNI_BASE_URL/type/profilesetup/page/savehighd";
static final String addStudentWorkExpUrl ="https://api.findadmission.com/json/api/type/detail/page/addwxp";
static final String studentFileUploadUrl ="https://api.findadmission.com/json/api/type/regapi/page/fileupload";
//changing password
 static final String changePwUrl= "$UNI_BASE_URL/type/dashboard/page/changepasswordpartner/";
 //DASHBOARD

  static final String dashboardUrl= "$BASE_URL/type/login/page/dashboardnew/";
  static final String notificationListUrl= "$BASE_URL/type/shared/page/notificationall";
  static final String settingLoadUrl= "$BASE_URL/type/shared/page/accountnsettingpartner";
  static final String settingUpdateUrl= "$BASE_URL/type/shared/page/basicchangepartner/";

}
