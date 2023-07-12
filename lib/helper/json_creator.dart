import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:payment_app/helper/app_configuration.dart';
import 'package:payment_app/services/service_configuration.dart';
import 'package:xml/xml.dart';
import 'package:http/http.dart' as http;

void updateXmlData() async {
  // final file = File('path/to/file.xml');
  // final xmlString = await file.readAsString();
  final xmlString = await rootBundle.loadString('assets/546975940140920.xml');
  final document = XmlDocument.parse(xmlString);

  // Update the data as needed
  // final element = document.getElement('XMLCreationDate');

  final finddata = document.getElement('PAN');

  debugPrint("$finddata");
  // element?.setAttribute('attributeName', 'attributeValue');

  // final updatedXmlString = document.toString();
  //
  // final saveFile = File('path/to/file.xml');
  // await saveFile.writeAsString(updatedXmlString);
}

void updateJsonData(
    String panCard,
    String aadhaar,
    String tanOfDeductor,
    double grossSalary,
    double salaryAsPerProvisions,
    double valueOfPerquisites,
    double profitsInLieuOfSalary,
    double travelAllowance,
    double houseRent,
    double totalAmountOfDeductions,
    double standardDeduction,
    double entertainmentAllowance,
    double taxOnEmployment,
    double incomeChargeable,
    double section80C,
    double section80CCC,
    double section80CCDEmployeeOrSE,
    double section80CCD1B,
    double section80CCDEmployer,
    double section80D,
    double section80E,
    double totalChapVIADeductions,
    double dSection80C,
    double dSection80CCD1B,
    double dSection80CCDEmployer,
    double dSection80D,
    double taxPayableOnTotInc,
    double totalSurcharge,
    double educationCess,
    double grossTaxLiability,
    double grossTaxPayable,
    double totTaxRelief,
    double netTaxLiability,
    double rebate87A,
    double donation80GGA,
    double donation80GDA,
    double section80TTA,
    double grossTotalIncome,
    double totIncFromOS,
    double bookExcemtion,
    double foodExcemtion,
    double gadgetExcemtion,
    double giftExcemtion,
    double internetExcemtion,
    double professionalExcemtion,
    double refurbishExcemtion,
    double telephoneExcemtion,
    double one,
    double two,
    double three,
    double four,
    double five,
    double six,
    double seven,
    double eight,
    double nine,
    double ten,
    double eleven,
    double twelve,
    double totalTds) async {
  try {
    changeJson(
        panCard,
        aadhaar,
        tanOfDeductor,
        grossSalary,
        salaryAsPerProvisions,
        valueOfPerquisites,
        profitsInLieuOfSalary,
        travelAllowance,
        houseRent,
        totalAmountOfDeductions,
        standardDeduction,
        entertainmentAllowance,
        taxOnEmployment,
        incomeChargeable,
        section80C,
        section80CCC,
        section80CCDEmployeeOrSE,
        section80CCD1B,
        section80CCDEmployer,
        section80D,
        section80E,
        totalChapVIADeductions,
        dSection80C,
        dSection80CCD1B,
        dSection80CCDEmployer,
        dSection80D,
        taxPayableOnTotInc,
        totalSurcharge,
        educationCess,
        grossTaxLiability,
        grossTaxPayable,
        totTaxRelief,
        netTaxLiability,
        rebate87A,
        donation80GGA,
        donation80GDA,
        section80TTA,
        grossTotalIncome,
        totIncFromOS,
        bookExcemtion,
        foodExcemtion,
        gadgetExcemtion,
        giftExcemtion,
        internetExcemtion,
        professionalExcemtion,
        refurbishExcemtion,
        telephoneExcemtion,
        one,
        two,
        three,
        four,
        five,
        six,
        seven,
        eight,
        nine,
        ten,
        eleven,
        twelve,
        totalTds);
    // final jsonString = await rootBundle.loadString('assets/872783340190722.json');
    final Map<String, dynamic> data = json.decode(paymentJson);

    // Update the data as needed
    // data['ITR']!['ITR2']!['PartA_GEN1']!['PersonalInfo']['PAN'] = panCardNo;
    // data['ITR']!['ITR2']!['ScheduleS']!['Salaries']['Salarys'][0]['GrossSalary'] = int.parse(grossSalary);

    final updatedJsonString = json.encode(data);

    final directory = await getApplicationDocumentsDirectory();
    debugPrint("");

    final file = File('${directory.path}/file.json');

    debugPrint("${directory.path}/file.json");

    await file.writeAsString(updatedJsonString).whenComplete(() {
      // Get.to(() => const PrintedData());
      // sendJsonFile("${directory.path}/file.json ${file.path}");
      // sendJsonFile(file.path);
      uploadJsonFile("${directory.path}/file.json");
    });
  } catch (e) {
    debugPrint("$e");
  }
}

Future<Uint8List> jsonFileToUint8List(String filePath) async {
  final file = File(filePath);
  final fileContent = await file.readAsString();
  final jsonData = jsonDecode(fileContent);
  final jsonString = jsonEncode(jsonData);
  final encodedData = utf8.encode(jsonString);
  return Uint8List.fromList(encodedData);
}

RxBool uploadDataLoading = false.obs;

uploadJsonFile(String path) async {
  final filePath = path;
  final fileContent = await jsonFileToUint8List(filePath);
  final fileName = basename(path);

  if (fileContent.isNotEmpty) {
    uploadDataLoading.value = true;
    try {
      // final jsonData = jsonDecode(fileContent);
      uploadDataLoading.value = true;
      var request = http.MultipartRequest(
          "POST",
          Uri.parse(
              "${ServiceConfiguration.baseUrl}${ServiceConfiguration.uploadDocument}"));

      request.fields['uploadDocument'] = 'uploadDocument';

      //await rootBundle.load("assets/872783340190722.json")

      var jsonFile = http.MultipartFile.fromBytes('uploadDocument', fileContent,
          filename: fileName);

      request.files.add(jsonFile);

      //responce

      var responce = await request.send();
      var responceData = await responce.stream.toBytes();
      var result = String.fromCharCodes(responceData);

      uploadDataLoading.value = false;
      if (responce.statusCode == 200) {
        showToast("Success");
      }

      debugPrint(result);
      // Do something with the JSON data...
    } catch (e) {
      debugPrint('Error parsing JSON file: $e');
      uploadDataLoading.value = false;
    }
  }
}

// Future<void> sendJsonFile(String path) async {
//   final file = File(path);
//   final fileContent = await file.readAsString();

//   String fileName = file.path.split('/').last;
//   print(fileName);

//   try {
//     if (await checkConnection()) {
//       FormData data = FormData({
//         "uploadDocument": await MultipartFile(
//           file.path,
//           filename: fileName,
//         ),
//       });
//       // isLoading.value = true;
//       // Map<String, dynamic> requestBody = {
//       //   'FirstName': firstName,
//       //   "MiddleName": middleName,
//       //   "LastName": lastName,
//       //   "Gender": gender
//       // };
//       // debugPrint("----------requestBody$requestBody");
//       String url =
//           "${ServiceConfiguration.baseUrl}${ServiceConfiguration.uploadDocument}";
//       // Map<String, String> herader = {
//       //   "Content-Type": "application/json",
//       //   'Authorization': 'Bearer ${Settings.accessToken}'
//       // };
//       // isLoading.value = true;
//       var response = await http.post(Uri.parse(url), body: data);
//       // isLoading.value = false;
//       debugPrint("getBankDetails STATUS CODE===>>>${response.statusCode}");
//       debugPrint("getBankDetails Body===>>>${response.body}");
//       if (response.statusCode == 200) {
//         //   // leaderBoadrDataLoaded.value = true;
//         //   var result = BankDetailsModel.fromJson(json.decode(response.body));
//         //   isLoading.value = false;
//         //   showToast("${result.status}");
//         // Get.find<BankDetailsController>().getAllBankDetailsData();

//         // Get.toNamed(AppPages.payment);
//         // Get.back();

//         showToast("Success");

//         //   bankDetails.value = result.data ?? [];
//         //   debugPrint(
//         //       "getBankDetails STATUS CODE===>>> ${bankDetails.first.ifscNumber}");
//       }
//     } else {
//       showToast("Check Internet Connection");
//     }
//   } catch (e) {
//     debugPrint("getBankDetails:- $e");
//     showToast(ServiceConfiguration.commonErrorMessage);
//     // isLoading.value = false;
//   }
// }

String paymentJson = "";

String paymentXml = "";

void changeJson(
    String panCard,
    String aadhaar,
    String tanOfDeductor,
    double grossSalary,
    double salaryAsPerProvisions,
    double valueOfPerquisites,
    double profitsInLieuOfSalary,
    double travelAllowance,
    double houseRent,
    double totalAmountOfDeductions,
    double standardDeduction,
    double entertainmentAllowance,
    double taxOnEmployment,
    double incomeChargeable,
    double section80C,
    double section80CCC,
    double section80CCDEmployeeOrSE,
    double section80CCD1B,
    double section80CCDEmployer,
    double section80D,
    double section80E,
    double totalChapVIADeductions,
    double dSection80C,
    double dSection80CCD1B,
    double dSection80CCDEmployer,
    double dSection80D,
    double taxPayableOnTotInc,
    double totalSurcharge,
    double educationCess,
    double grossTaxLiability,
    double grossTaxPayable,
    double totTaxRelief,
    double netTaxLiability,
    double rebate87A,
    double donation80GGA,
    double donation80GDA,
    double section80TTA,
    double grossTotalIncome,
    double totIncFromOS,
    double bookExcemtion,
    double foodExcemtion,
    double gadgetExcemtion,
    double giftExcemtion,
    double internetExcemtion,
    double professionalExcemtion,
    double refurbishExcemtion,
    double telephoneExcemtion,
    double one,
    double two,
    double three,
    double four,
    double five,
    double six,
    double seven,
    double eight,
    double nine,
    double ten,
    double eleven,
    double twelve,
    double totalTds) {
  paymentJson = """
{
  "ITR": {
    "ITR2": {
      "CreationInfo": {
        "SWVersionNo": "",
        "SWCreatedBy": "",
        "JSONCreatedBy": "",
        "JSONCreationDate": "",
        "IntermediaryCity": "",
        "Digest": ""
      },
      "Form_ITR2": {
        "FormName": "ITR-2",
        "Description": "For Individuals and HUFs not having income from profits and gains of business or profession",
        "AssessmentYear": "",
        "SchemaVer": "Ver1.0",
        "FormVer": "Ver1.0"
      },
      "PartA_GEN1": {
        "PersonalInfo": {
          "AssesseeName": {
            "FirstName": "",
            "SurNameOrOrgName": ""
          },
          "PAN": "$panCard",
          "Address": {
            "ResidenceNo": "",
            "ResidenceName": "",
            "RoadOrStreet": "",
            "LocalityOrArea": "",
            "CityOrTownOrDistrict": "",
            "StateCode": "",
            "CountryCode": "",
            "PinCode": "",
            "CountryCodeMobile": "",
            "MobileNo": "91",
            "EmailAddress": ""
          },
          "DOB": "",
          "Status": "",
          "AadhaarCardNo": "$aadhaar"
        },
        "FilingStatus": {
          "ReturnFileSec": ,
          "NewTaxRegime": "",
          "SeventhProvisio139": "",
          "ResidentialStatus": "",
          "ConditionsResStatus": "",
          "BenefitUs115HFlg": "",
          "AsseseeRepFlg": "",
          "PortugeseCC5A": "",
          "CompDirectorPrvYrFlg": "",
          "HeldUnlistedEqShrPrYrFlg": ""
        }
      },
      "ScheduleS": {
        "Salaries": [
          {
            "NameOfEmployer": "",
            "NatureOfEmployment": "",
            "TANofEmployer": "",
            "AddressDetail": {
              "AddrDetail": "",
              "CityOrTownOrDistrict": "",
              "StateCode": "",
              "PinCode": ""
            },
            "Salarys": {
              "GrossSalary": $grossSalary,
              "Salary": $salaryAsPerProvisions,
              "NatureOfSalary": {
                "OthersIncDtls": [
                  {
                    "NatureDesc": "1",
                    "OthAmount": 0
                  },
                  {
                    "NatureDesc": "7",
                    "OthAmount": 0
                  },
                  {
                    "NatureDesc": "3",
                    "OthAmount": 0
                  },
                  {
                    "NatureDesc": "4",
                    "OthAmount": 0
                  }
                ]
              },
              "ValueOfPerquisites": $valueOfPerquisites,
              "ProfitsinLieuOfSalary": $profitsInLieuOfSalary,
              "IncomeNotified89A": 0,
              "IncomeNotifiedOther89A": 0
            }
          }
        ],
        "TotalGrossSalary": $grossSalary,
        "AllwncExtentExemptUs10": 0,
        "AllwncExemptUs10": {
          "AllwncExemptUs10Dtls": [
            {
              "SalNatureDesc": "OTH",
              "SalOthNatOfInc": "BOOK & PERIODIC ALLOWANCE U/S 10",
              "SalOthAmount": $bookExcemtion
            },
            {
              "SalNatureDesc": "OTH",
              "SalOthNatOfInc": "FOOD ALLOWANCE U/S 10",
              "SalOthAmount": $foodExcemtion
            },
            {
              "SalNatureDesc": "OTH",
              "SalOthNatOfInc": "GADGET ALLOWANCE U/S 10",
              "SalOthAmount": $gadgetExcemtion
            },
            {
              "SalNatureDesc": "OTH",
              "SalOthNatOfInc": "GIFT ALLOWANCE U/S 10",
              "SalOthAmount": $giftExcemtion
            },
            {
              "SalNatureDesc": "OTH",
              "SalOthNatOfInc": "INTERNET ALLOWANCE U/S 10",
              "SalOthAmount": $internetExcemtion
            },
            {
              "SalNatureDesc": "OTH",
              "SalOthNatOfInc": "PROFESSIONAL ALLOWANCE U/S 10",
              "SalOthAmount": $professionalExcemtion
            },
            {
              "SalNatureDesc": "OTH",
              "SalOthNatOfInc": "REFURBISH ALLOWANCE U/S 10",
              "SalOthAmount": $refurbishExcemtion
            },
            {
              "SalNatureDesc": "OTH",
              "SalOthNatOfInc": "TELEPHONE ALLOWANCE U/S 10",
              "SalOthAmount": $telephoneExcemtion
            },
            {
              "SalNatureDesc": "OTH",
              "SalOthNatOfInc": "TRAVEL ALLOWANCE U/S 10 (5)",
              "SalOthAmount": $travelAllowance
            },
            {
              "SalNatureDesc": "10(13A)",
              "SalOthAmount": $houseRent
            }
          ]
        },
        "Increliefus89A": 0,
        "NetSalary": 0,
        "DeductionUS16": $totalAmountOfDeductions,
        "DeductionUnderSection16ia": $standardDeduction,
        "EntertainmntalwncUs16ii": $entertainmentAllowance,
        "ProfessionalTaxUs16iii": $taxOnEmployment,
        "TotIncUnderHeadSalaries": $incomeChargeable
      },
      "ScheduleCGFor23": {
        "ShortTermCapGainFor23": {
          "SaleofLandBuild": {
            "SaleofLandBuildDtls": [
              {
                "FullConsideration": 0,
                "PropertyValuation": 0,
                "FullConsideration50C": 0,
                "AquisitCost": 0,
                "ImproveCost": 0,
                "ExpOnTrans": 0,
                "TotalDedn": 0,
                "Balance": 0,
                "DeductionUs54B": 0,
                "STCGonImmvblPrprty": 0
              }
            ]
          },
          "NRITransacSec48Dtl": {
            "NRItaxSTTPaid": 0,
            "NRItaxSTTNotPaid": 0
          },
          "NRISecur115AD": {
            "FullValueConsdRecvUnqshr": 0,
            "FairMrktValueUnqshr": 0,
            "FullValueConsdSec50CA": 0,
            "FullValueConsdOthUnqshr": 0,
            "FullConsideration": 0,
            "DeductSec48": {
              "AquisitCost": 0,
              "ImproveCost": 0,
              "ExpOnTrans": 0,
              "TotalDedn": 0
            },
            "BalanceCG": 0,
            "LossSec94of7Or94of8": 0,
            "CapgainonAssets": 0
          },
          "SaleOnOtherAssets": {
            "FullValueConsdRecvUnqshr": 0,
            "FairMrktValueUnqshr": 0,
            "FullValueConsdSec50CA": 0,
            "FullValueConsdOthUnqshr": 0,
            "FullConsideration": 0,
            "DeductSec48": {
              "AquisitCost": 0,
              "ImproveCost": 0,
              "ExpOnTrans": 0,
              "TotalDedn": 0
            },
            "BalanceCG": 0,
            "LossSec94of7Or94of8": 0,
            "CapgainonAssets": 0
          },
          "UnutilizedStcgFlag": "X",
          "TotalAmtDeemedStcg": 0,
          "PassThrIncNatureSTCG": 0,
          "PassThrIncNatureSTCG15Per": 0,
          "PassThrIncNatureSTCG30Per": 0,
          "PassThrIncNatureSTCGAppRate": 0,
          "TotalAmtNotTaxUsDTAAStcg": 0,
          "TotalAmtTaxUsDTAAStcg": 0,
          "TotalSTCG": 0
        },
        "LongTermCapGain23": {
          "SaleofLandBuild": {
            "SaleofLandBuildDtls": [
              {
                "FullConsideration": 0,
                "PropertyValuation": 0,
                "FullConsideration50C": 0,
                "AquisitCost": 0,
                "AquisitCostIndex": 0,
                "ImproveCost": 0,
                "ExpOnTrans": 0,
                "TotalDedn": 0,
                "Balance": 0,
                "ExemptionOrDednUs54": {
                  "ExemptionGrandTotal": 0
                },
                "LTCGonImmvblPrprty": 0
              }
            ]
          },
          "SaleofBondsDebntr": {
            "FullConsideration": 0,
            "DeductSec48": {
              "AquisitCost": 0,
              "ImproveCost": 0,
              "ExpOnTrans": 0,
              "TotalDedn": 0
            },
            "BalanceCG": 0,
            "DeductionUs54F": 0,
            "CapgainonAssets": 0
          },
          "SaleOfEquityShareUs112A": {
            "BalanceCG": 0,
            "DeductionUs54F": 0,
            "CapgainonAssets": 0
          },
          "NRIProvisoSec48": {
            "LTCGWithoutBenefit": 0,
            "DeductionUs54F": 0,
            "BalanceCG": 0
          },
          "NRISaleOfEquityShareUs112A": {
            "BalanceCG": 0,
            "DeductionUs54F": 0,
            "CapgainonAssets": 0
          },
          "NRISaleofForeignAsset": {
            "SaleonSpecAsset": 0,
            "DednSpecAssetus115": 0,
            "BalonSpeciAsset": 0,
            "SaleOtherSpecAsset": 0,
            "DednOtherSpecAssetus115": 0,
            "BalOtherthanSpecAsset": 0
          },
          "SaleofAssetNA": {
            "FullValueConsdRecvUnqshr": 0,
            "FairMrktValueUnqshr": 0,
            "FullValueConsdSec50CA": 0,
            "FullValueConsdOthUnqshr": 0,
            "FullConsideration": 0,
            "DeductSec48": {
              "AquisitCost": 0,
              "ImproveCost": 0,
              "ExpOnTrans": 0,
              "TotalDedn": 0
            },
            "BalanceCG": 0,
            "DeductionUs54F": 0,
            "CapgainonAssets": 0
          },
          "TotalAmtDeemedLtcg": 0,
          "PassThrIncNatureLTCG": 0,
          "PassThrIncNatureLTCGUs112A": 0,
          "PassThrIncNatureLTCG10Per": 0,
          "PassThrIncNatureLTCG20Per": 0,
          "TotalAmtNotTaxUsDTAALtcg": 0,
          "TotalAmtTaxUsDTAALtcg": 0,
          "TotalLTCG": 0
        },
        "TotScheduleCGFor23": 0,
        "DeducClaimInfo": {
          "TotDeductClaim": 0
        },
        "CurrYrLosses": {
          "InLossSetOff": {
            "StclSetoff15Per": 0,
            "StclSetoff30Per": 0,
            "StclSetoffAppRate": 0,
            "StclSetoffDTAARate": 0,
            "LtclSetOff10Per": 0,
            "LtclSetOff20Per": 0,
            "LtclSetOffDTAARate": 0
          },
          "InStcg15Per": {
            "CurrYearIncome": 0,
            "StclSetoff30Per": 0,
            "StclSetoffAppRate": 0,
            "StclSetoffDTAARate": 0,
            "CurrYrCapGain": 0
          },
          "InStcg30Per": {
            "CurrYearIncome": 0,
            "StclSetoff15Per": 0,
            "StclSetoffAppRate": 0,
            "StclSetoffDTAARate": 0,
            "CurrYrCapGain": 0
          },
          "InStcgAppRate": {
            "CurrYearIncome": 0,
            "StclSetoff15Per": 0,
            "StclSetoff30Per": 0,
            "StclSetoffDTAARate": 0,
            "CurrYrCapGain": 0
          },
          "InStcgDTAARate": {
            "CurrYearIncome": 0,
            "StclSetoff15Per": 0,
            "StclSetoff30Per": 0,
            "StclSetoffAppRate": 0,
            "CurrYrCapGain": 0
          },
          "InLtcg10Per": {
            "CurrYearIncome": 0,
            "StclSetoff15Per": 0,
            "StclSetoff30Per": 0,
            "StclSetoffAppRate": 0,
            "StclSetoffDTAARate": 0,
            "LtclSetOff20Per": 0,
            "LtclSetOffDTAARate": 0,
            "CurrYrCapGain": 0
          },
          "InLtcg20Per": {
            "CurrYearIncome": 0,
            "StclSetoff15Per": 0,
            "StclSetoff30Per": 0,
            "StclSetoffAppRate": 0,
            "StclSetoffDTAARate": 0,
            "LtclSetOff10Per": 0,
            "LtclSetOffDTAARate": 0,
            "CurrYrCapGain": 0
          },
          "InLtcgDTAARate": {
            "CurrYearIncome": 0,
            "StclSetoff15Per": 0,
            "StclSetoff30Per": 0,
            "StclSetoffAppRate": 0,
            "StclSetoffDTAARate": 0,
            "LtclSetOff10Per": 0,
            "LtclSetOff20Per": 0,
            "CurrYrCapGain": 0
          },
          "TotLossSetOff": {
            "StclSetoff15Per": 0,
            "StclSetoff30Per": 0,
            "StclSetoffAppRate": 0,
            "StclSetoffDTAARate": 0,
            "LtclSetOff10Per": 0,
            "LtclSetOff20Per": 0,
            "LtclSetOffDTAARate": 0
          },
          "LossRemainSetOff": {
            "StclSetoff15Per": 0,
            "StclSetoff30Per": 0,
            "StclSetoffAppRate": 0,
            "StclSetoffDTAARate": 0,
            "LtclSetOff10Per": 0,
            "LtclSetOff20Per": 0,
            "LtclSetOffDTAARate": 0
          }
        },
        "AccruOrRecOfCG": {
          "ShortTermUnder15Per": {
            "DateRange": {
              "Upto15Of6": 0,
              "Upto15Of9": 0,
              "Up16Of9To15Of12": 0,
              "Up16Of12To15Of3": 0,
              "Up16Of3To31Of3": 0
            }
          },
          "ShortTermUnder30Per": {
            "DateRange": {
              "Upto15Of6": 0,
              "Upto15Of9": 0,
              "Up16Of9To15Of12": 0,
              "Up16Of12To15Of3": 0,
              "Up16Of3To31Of3": 0
            }
          },
          "ShortTermUnderAppRate": {
            "DateRange": {
              "Upto15Of6": 0,
              "Upto15Of9": 0,
              "Up16Of9To15Of12": 0,
              "Up16Of12To15Of3": 0,
              "Up16Of3To31Of3": 0
            }
          },
          "ShortTermUnderDTAARate": {
            "DateRange": {
              "Upto15Of6": 0,
              "Upto15Of9": 0,
              "Up16Of9To15Of12": 0,
              "Up16Of12To15Of3": 0,
              "Up16Of3To31Of3": 0
            }
          },
          "LongTermUnder10Per": {
            "DateRange": {
              "Upto15Of6": 0,
              "Upto15Of9": 0,
              "Up16Of9To15Of12": 0,
              "Up16Of12To15Of3": 0,
              "Up16Of3To31Of3": 0
            }
          },
          "LongTermUnder20Per": {
            "DateRange": {
              "Upto15Of6": 0,
              "Upto15Of9": 0,
              "Up16Of9To15Of12": 0,
              "Up16Of12To15Of3": 0,
              "Up16Of3To31Of3": 0
            }
          },
          "LongTermUnderDTAARate": {
            "DateRange": {
              "Upto15Of6": 0,
              "Upto15Of9": 0,
              "Up16Of9To15Of12": 0,
              "Up16Of12To15Of3": 0,
              "Up16Of3To31Of3": 0
            }
          }
        }
      },
      "Schedule112A": {
        "Schedule112ADtls": [
          {
            "ShareOnOrBefore": "AE",
            "ISINCode": "INNOTREQUIRD",
            "ShareUnitName": "CONSOLIDATED",
            "NumSharesUnits": 0,
            "SalePricePerShareUnit": 0,
            "TotSaleValue": 0,
            "CostAcqWithoutIndx": 0,
            "AcquisitionCost": 0,
            "LTCGBeforelowerB1B2": 0,
            "FairMktValuePerShareunit": 0,
            "TotFairMktValueCapAst": 0,
            "ExpExclCnctTransfer": 0,
            "TotalDeductions": 0,
            "Balance": 0
          }
        ],
        "SaleValue112A": 519784,
        "CostAcqWithoutIndx112A": 0,
        "AcquisitionCost112A": 0,
        "LTCGBeforelowerB1B2112A": 0,
        "FairMktValueCapAst112A": 0,
        "ExpExclCnctTransfer112A": 0,
        "Deductions112A": 0,
        "Balance112A": 0
      },
      "Schedule115AD": {
        "SaleValue115AD": 0,
        "CostAcqWithoutIndx115AD": 0,
        "AcquisitionCost115AD": 0,
        "LTCGBeforelowerB1B2115AD": 0,
        "FairMktValueCapAst115AD": 0,
        "ExpExclCnctTransfer115AD": 0,
        "Deductions115AD": 0,
        "Balance115AD": 0
      },
      "ScheduleOS": {
        "IncOthThanOwnRaceHorse": {
          "GrossIncChrgblTaxAtAppRate": 0,
          "DividendGross": 0,
          "DividendOthThan22e": 0,
          "Dividend22e": 0,
          "InterestGross": 0,
          "IntrstFrmSavingBank": 0,
          "IntrstFrmTermDeposit": 0,
          "IntrstFrmIncmTaxRefund": 0,
          "NatofPassThrghIncome": 0,
          "IntrstFrmOthers": 0,
          "RentFromMachPlantBldgs": 0,
          "Tot562x": 0,
          "Aggrtvaluewithoutcons562x": 0,
          "Immovpropwithoutcons562x": 0,
          "Immovpropinadeqcons562x": 0,
          "Anyotherpropwithoutcons562x": 0,
          "Anyotherpropinadeqcons562x": 0,
          "FamilyPension": 0,
          "IncomeNotified89AOS": 0,
          "IncomeNotifiedOther89AOS": 0,
          "AnyOtherIncome": 0,
          "IncChargeableSpecialRates": 0,
          "LtryPzzlChrgblUs115BB": 0,
          "IncChrgblUs115BBE": 0,
          "CashCreditsUs68": 0,
          "UnExplndInvstmntsUs69": 0,
          "UnExplndMoneyUs69A": 0,
          "UnDsclsdInvstmntsUs69B": 0,
          "UnExplndExpndtrUs69C": 0,
          "AmtBrwdRepaidOnHundiUs69D": 0,
          "TaxAccumulatedBalRecPF": {
            "TotalIncomeBenefit": 0,
            "TotalTaxBenefit": 0
          },
          "OthersGross": 0,
          "PassThrIncOSChrgblSplRate": 0,
          "IncChargblSplRateOS": {
            "TotalAmtTaxUsDTAASchOs": 0
          },
          "Deductions": {
            "Expenses": 0,
            "UsrIntExp57": 0,
            "IntExp57": 0,
            "DeductionUs57iia": 0,
            "Depreciation": 0,
            "TotDeductions": 0
          },
          "AmtNotDeductibleUs58": 0,
          "ProfitChargTaxUs59": 0,
          "Increliefus89AOS": 0,
          "BalanceNoRaceHorse": 0
        },
        "TotOthSrcNoRaceHorse": 0,
        "IncFromOwnHorse": {
          "Receipts": 0,
          "DeductSec57": 0,
          "AmtNotDeductibleUs58": 0,
          "ProfitChargTaxUs59": 0,
          "BalanceOwnRaceHorse": 0
        },
        "IncChargeable": 0,
        "DividendIncUs115BBDA": {
          "DateRange": {
            "Upto15Of6": 0,
            "Upto15Of9": 0,
            "Up16Of9To15Of12": 0,
            "Up16Of12To15Of3": 0,
            "Up16Of3To31Of3": 0
          }
        },
        "IncFrmLottery": {
          "DateRange": {
            "Upto15Of6": 0,
            "Upto15Of9": 0,
            "Up16Of9To15Of12": 0,
            "Up16Of12To15Of3": 0,
            "Up16Of3To31Of3": 0
          }
        },
        "DividendDTAA": {
          "DateRange": {
            "Upto15Of6": 0,
            "Upto15Of9": 0,
            "Up16Of9To15Of12": 0,
            "Up16Of12To15Of3": 0,
            "Up16Of3To31Of3": 0
          }
        },
        "DividendIncUs115A1ai": {
          "DateRange": {
            "Upto15Of6": 0,
            "Upto15Of9": 0,
            "Up16Of9To15Of12": 0,
            "Up16Of12To15Of3": 0,
            "Up16Of3To31Of3": 0
          }
        },
        "DividendIncUs115AC": {
          "DateRange": {
            "Upto15Of6": 0,
            "Upto15Of9": 0,
            "Up16Of9To15Of12": 0,
            "Up16Of12To15Of3": 0,
            "Up16Of3To31Of3": 0
          }
        },
        "DividendIncUs115ACA": {
          "DateRange": {
            "Upto15Of6": 0,
            "Upto15Of9": 0,
            "Up16Of9To15Of12": 0,
            "Up16Of12To15Of3": 0,
            "Up16Of3To31Of3": 0
          }
        },
        "DividendIncUs115AD1i": {
          "DateRange": {
            "Upto15Of6": 0,
            "Upto15Of9": 0,
            "Up16Of9To15Of12": 0,
            "Up16Of12To15Of3": 0,
            "Up16Of3To31Of3": 0
          }
        },
        "NOT89A": {
          "DateRange": {
            "Upto15Of6": 0,
            "Upto15Of9": 0,
            "Up16Of9To15Of12": 0,
            "Up16Of12To15Of3": 0,
            "Up16Of3To31Of3": 0
          }
        }
      },
      "ScheduleCYLA": {
        "Salary": {
          "IncCYLA": {
            "IncOfCurYrUnderThatHead": 0,
            "HPlossCurYrSetoff": 0,
            "OthSrcLossNoRaceHorseSetoff": 0,
            "IncOfCurYrAfterSetOff": 0
          }
        },
        "HP": {
          "IncCYLA": {
            "IncOfCurYrUnderThatHead": 0,
            "OthSrcLossNoRaceHorseSetoff": 0,
            "IncOfCurYrAfterSetOff": 0
          }
        },
        "STCG15Per": {
          "IncCYLA": {
            "IncOfCurYrUnderThatHead": 0,
            "HPlossCurYrSetoff": 0,
            "OthSrcLossNoRaceHorseSetoff": 0,
            "IncOfCurYrAfterSetOff": 0
          }
        },
        "STCG30Per": {
          "IncCYLA": {
            "IncOfCurYrUnderThatHead": 0,
            "HPlossCurYrSetoff": 0,
            "OthSrcLossNoRaceHorseSetoff": 0,
            "IncOfCurYrAfterSetOff": 0
          }
        },
        "STCGAppRate": {
          "IncCYLA": {
            "IncOfCurYrUnderThatHead": 0,
            "HPlossCurYrSetoff": 0,
            "OthSrcLossNoRaceHorseSetoff": 0,
            "IncOfCurYrAfterSetOff": 0
          }
        },
        "STCGDTAARate": {
          "IncCYLA": {
            "IncOfCurYrUnderThatHead": 0,
            "HPlossCurYrSetoff": 0,
            "OthSrcLossNoRaceHorseSetoff": 0,
            "IncOfCurYrAfterSetOff": 0
          }
        },
        "LTCG10Per": {
          "IncCYLA": {
            "IncOfCurYrUnderThatHead": 0,
            "HPlossCurYrSetoff": 0,
            "OthSrcLossNoRaceHorseSetoff": 0,
            "IncOfCurYrAfterSetOff": 0
          }
        },
        "LTCG20Per": {
          "IncCYLA": {
            "IncOfCurYrUnderThatHead": 0,
            "HPlossCurYrSetoff": 0,
            "OthSrcLossNoRaceHorseSetoff": 0,
            "IncOfCurYrAfterSetOff": 0
          }
        },
        "LTCGDTAARate": {
          "IncCYLA": {
            "IncOfCurYrUnderThatHead": 0,
            "HPlossCurYrSetoff": 0,
            "OthSrcLossNoRaceHorseSetoff": 0,
            "IncOfCurYrAfterSetOff": 0
          }
        },
        "OthSrcExclRaceHorse": {
          "IncCYLA": {
            "IncOfCurYrUnderThatHead": 0,
            "HPlossCurYrSetoff": 0,
            "IncOfCurYrAfterSetOff": 0
          }
        },
        "OthSrcRaceHorse": {
          "IncCYLA": {
            "IncOfCurYrUnderThatHead": 0,
            "HPlossCurYrSetoff": 0,
            "OthSrcLossNoRaceHorseSetoff": 0,
            "IncOfCurYrAfterSetOff": 0
          }
        },
        "TotalCurYr": {
          "TotHPlossCurYr": 0,
          "TotOthSrcLossNoRaceHorse": 0
        },
        "TotalLossSetOff": {
          "TotHPlossCurYrSetoff": 0,
          "TotOthSrcLossNoRaceHorseSetoff": 0
        },
        "LossRemAftSetOff": {
          "BalHPlossCurYrAftSetoff": 0,
          "BalOthSrcLossNoRaceHorseAftSetoff": 0
        }
      },
      "ScheduleBFLA": {
        "Salary": {
          "IncBFLA": {
            "IncOfCurYrUndHeadFromCYLA": 0,
            "IncOfCurYrAfterSetOffBFLosses": 0
          }
        },
        "HP": {
          "IncBFLA": {
            "IncOfCurYrUndHeadFromCYLA": 0,
            "BFlossPrevYrUndSameHeadSetoff": 0,
            "IncOfCurYrAfterSetOffBFLosses": 0
          }
        },
        "STCG15Per": {
          "IncBFLA": {
            "IncOfCurYrUndHeadFromCYLA": 0,
            "BFlossPrevYrUndSameHeadSetoff": 0,
            "IncOfCurYrAfterSetOffBFLosses": 0
          }
        },
        "STCG30Per": {
          "IncBFLA": {
            "IncOfCurYrUndHeadFromCYLA": 0,
            "BFlossPrevYrUndSameHeadSetoff": 0,
            "IncOfCurYrAfterSetOffBFLosses": 0
          }
        },
        "STCGAppRate": {
          "IncBFLA": {
            "IncOfCurYrUndHeadFromCYLA": 0,
            "BFlossPrevYrUndSameHeadSetoff": 0,
            "IncOfCurYrAfterSetOffBFLosses": 0
          }
        },
        "STCGDTAARate": {
          "IncBFLA": {
            "IncOfCurYrUndHeadFromCYLA": 0,
            "BFlossPrevYrUndSameHeadSetoff": 0,
            "IncOfCurYrAfterSetOffBFLosses": 0
          }
        },
        "LTCG10Per": {
          "IncBFLA": {
            "IncOfCurYrUndHeadFromCYLA": 0,
            "BFlossPrevYrUndSameHeadSetoff": 0,
            "IncOfCurYrAfterSetOffBFLosses": 0
          }
        },
        "LTCG20Per": {
          "IncBFLA": {
            "IncOfCurYrUndHeadFromCYLA": 0,
            "BFlossPrevYrUndSameHeadSetoff": 0,
            "IncOfCurYrAfterSetOffBFLosses": 0
          }
        },
        "LTCGDTAARate": {
          "IncBFLA": {
            "IncOfCurYrUndHeadFromCYLA": 0,
            "BFlossPrevYrUndSameHeadSetoff": 0,
            "IncOfCurYrAfterSetOffBFLosses": 0
          }
        },
        "OthSrcExclRaceHorse": {
          "IncBFLA": {
            "IncOfCurYrUndHeadFromCYLA": 0,
            "IncOfCurYrAfterSetOffBFLosses": 0
          }
        },
        "OthSrcRaceHorse": {
          "IncBFLA": {
            "IncOfCurYrUndHeadFromCYLA": 0,
            "BFlossPrevYrUndSameHeadSetoff": 0,
            "IncOfCurYrAfterSetOffBFLosses": 0
          }
        },
        "TotalBFLossSetOff": {
          "TotBFLossSetoff": 0
        },
        "IncomeOfCurrYrAftCYLABFLA": 0
      },
      "ScheduleCFL": {
        "TotalOfBFLossesEarlierYrs": {
          "LossSummaryDetail": {
            "TotalHPPTILossCF": 0,
            "TotalSTCGPTILossCF": 0,
            "TotalLTCGPTILossCF": 0,
            "OthSrcLossRaceHorseCF": 0
          }
        },
        "AdjTotBFLossInBFLA": {
          "LossSummaryDetail": {
            "TotalHPPTILossCF": 0,
            "TotalSTCGPTILossCF": 0,
            "TotalLTCGPTILossCF": 0,
            "OthSrcLossRaceHorseCF": 0
          }
        },
        "CurrentAYloss": {
          "LossSummaryDetail": {
            "TotalHPPTILossCF": 0,
            "TotalSTCGPTILossCF": 0,
            "TotalLTCGPTILossCF": 0,
            "OthSrcLossRaceHorseCF": 0
          }
        },
        "TotalLossCFSummary": {
          "LossSummaryDetail": {
            "TotalHPPTILossCF": 0,
            "TotalSTCGPTILossCF": 0,
            "TotalLTCGPTILossCF": 0,
            "OthSrcLossRaceHorseCF": 0
          }
        }
      },
      "ScheduleVIA": {
        "UsrDeductUndChapVIA": {
          "Section80C": $section80C,
          "Section80CCC": $section80CCC,
          "Section80CCDEmployeeOrSE": $section80CCDEmployeeOrSE,
          "Section80CCD1B": $section80CCD1B,
          "Section80CCDEmployer": $section80CCDEmployer,
          "Section80D": $section80D,
          "Section80DD": 0,
          "Section80DDB": 0,
          "Section80E": $section80E,
          "Section80EE": 0,
          "Section80EEA": 0,
          "Section80EEB": 0,
          "Section80G": 0,
          "Section80GG": 0,
          "Section80GGA": 0,
          "Section80GGC": 0,
          "Section80U": 0,
          "Section80RRB": 0,
          "Section80QQB": 0,
          "Section80TTA": $section80TTA,
          "Section80TTB": 0,
          "TotalChapVIADeductions": $totalChapVIADeductions
        },
        "DeductUndChapVIA": {
          "Section80C": $dSection80C,
          "Section80CCD1B": $dSection80CCD1B,
          "Section80CCDEmployer": $dSection80CCDEmployer,
          "Section80D": $dSection80D,
          "Section80TTA": $section80TTA,
          "TotalChapVIADeductions": $totalChapVIADeductions
        }
      },
      "Schedule80D": {
        "Sec80DSelfFamSrCtznHealth": {
          "SeniorCitizenFlag": "N",
          "SelfAndFamily": $section80D,
          "HealthInsPremSlfFam": $section80D,
          "PrevHlthChckUpSlfFam": 0,
          "SelfAndFamilySeniorCitizen": 0,
          "HlthInsPremSlfFamSrCtzn": 0,
          "PrevHlthChckUpSlfFamSrCtzn": 0,
          "MedicalExpSlfFamSrCtzn": 0,
          "ParentsSeniorCitizenFlag": "P",
          "Parents": 0,
          "HlthInsPremParents": 0,
          "PrevHlthChckUpParents": 0,
          "ParentsSeniorCitizen": 0,
          "HlthInsPremParentsSrCtzn": 0,
          "PrevHlthChckUpParentsSrCtzn": 0,
          "MedicalExpParentsSrCtzn": 0,
          "EligibleAmountOfDedn": $dSection80D
        }
      },
      "Schedule80G": {
        "Don100Percent": {
          "TotDon100PercentCash": 0,
          "TotDon100PercentOtherMode": 0,
          "TotDon100Percent": 0,
          "TotEligibleDon100Percent": 0
        },
        "Don50PercentNoApprReqd": {
          "TotDon50PercentNoApprReqdCash": 0,
          "TotDon50PercentNoApprReqdOtherMode": 0,
          "TotDon50PercentNoApprReqd": 0,
          "TotEligibleDon50Percent": 0
        },
        "Don100PercentApprReqd": {
          "TotDon100PercentApprReqdCash": 0,
          "TotDon100PercentApprReqdOtherMode": 0,
          "TotDon100PercentApprReqd": 0,
          "TotEligibleDon100PercentApprReqd": 0
        },
        "Don50PercentApprReqd": {
          "TotDon50PercentApprReqdCash": 0,
          "TotDon50PercentApprReqdOtherMode": 0,
          "TotDon50PercentApprReqd": 0,
          "TotEligibleDon50PercentApprReqd": 0
        },
        "TotalDonationsUs80GCash": 0,
        "TotalDonationsUs80GOtherMode": 0,
        "TotalDonationsUs80G": $donation80GGA,
        "TotalEligibleDonationsUs80G": $donation80GDA
      },
      "Schedule80GGA": {
        "TotalDonationAmtCash80GGA": 0,
        "TotalDonationAmtOtherMode80GGA": 0,
        "TotalDonationsUs80GGA": 0,
        "TotalEligibleDonationAmt80GGA": 0
      },
      "ScheduleAMT": {
        "TotalIncItemPartBTI": 0,
        "DeductionClaimUndrAnySec": 0,
        "AdjustedUnderSec115JC": 0,
        "TaxPayableUnderSec115JC": 0
      },
      "ScheduleAMTC": {
        "TaxSection115JC": 0,
        "TaxOthProvisions": 0,
        "AmtTaxCreditAvailable": 0,
        "ScheduleAMTCDtls": [
          {
            "AssYr": "2013-14",
            "Gross": 0,
            "AmtCreditSetOfEy": 0,
            "AmtCreditBalBroughtFwd": 0,
            "AmtCreditUtilized": 0,
            "BalAmtCreditCarryFwd": 0
          },
          {
            "AssYr": "2014-15",
            "Gross": 0,
            "AmtCreditSetOfEy": 0,
            "AmtCreditBalBroughtFwd": 0,
            "AmtCreditUtilized": 0,
            "BalAmtCreditCarryFwd": 0
          },
          {
            "AssYr": "2015-16",
            "Gross": 0,
            "AmtCreditSetOfEy": 0,
            "AmtCreditBalBroughtFwd": 0,
            "AmtCreditUtilized": 0,
            "BalAmtCreditCarryFwd": 0
          },
          {
            "AssYr": "2016-17",
            "Gross": 0,
            "AmtCreditSetOfEy": 0,
            "AmtCreditBalBroughtFwd": 0,
            "AmtCreditUtilized": 0,
            "BalAmtCreditCarryFwd": 0
          },
          {
            "AssYr": "2017-18",
            "Gross": 0,
            "AmtCreditSetOfEy": 0,
            "AmtCreditBalBroughtFwd": 0,
            "AmtCreditUtilized": 0,
            "BalAmtCreditCarryFwd": 0
          },
          {
            "AssYr": "2018-19",
            "Gross": 0,
            "AmtCreditSetOfEy": 0,
            "AmtCreditBalBroughtFwd": 0,
            "AmtCreditUtilized": 0,
            "BalAmtCreditCarryFwd": 0
          },
          {
            "AssYr": "2019-20",
            "Gross": 0,
            "AmtCreditSetOfEy": 0,
            "AmtCreditBalBroughtFwd": 0,
            "AmtCreditUtilized": 0,
            "BalAmtCreditCarryFwd": 0
          },
          {
            "AssYr": "2020-21",
            "Gross": 0,
            "AmtCreditSetOfEy": 0,
            "AmtCreditBalBroughtFwd": 0,
            "AmtCreditUtilized": 0,
            "BalAmtCreditCarryFwd": 0
          },
          {
            "AssYr": "2021-22",
            "Gross": 0,
            "AmtCreditSetOfEy": 0,
            "AmtCreditBalBroughtFwd": 0,
            "AmtCreditUtilized": 0,
            "BalAmtCreditCarryFwd": 0
          }
        ],
        "CurrAssYr": "2022-23",
        "CurrYrAmtCreditFwd": 0,
        "CurrYrCreditCarryFwd": 0,
        "TotAMTGross": 0,
        "TotSetOffEys": 0,
        "TotBalBF": 0,
        "TotAmtCreditUtilisedCY": 0,
        "TotBalAMTCreditCF": 0,
        "TaxSection115JD": 0,
        "AmtLiabilityAvailable": 0
      },
      "ScheduleSI": {
        "SplCodeRateTax": [
          {
            "SecCode": "1",
            "SplRatePercent": 0,
            "SplRateInc": 0,
            "SplRateIncTax": 0
          },
          {
            "SecCode": "1A",
            "SplRatePercent": 0,
            "SplRateInc": 0,
            "SplRateIncTax": 0
          },
          {
            "SecCode": "21",
            "SplRatePercent": 0,
            "SplRateInc": 0,
            "SplRateIncTax": 0
          },
          {
            "SecCode": "22",
            "SplRatePercent": 0,
            "SplRateInc": 0,
            "SplRateIncTax": 0
          },
          {
            "SecCode": "21ciii",
            "SplRatePercent": 0,
            "SplRateInc": 0,
            "SplRateIncTax": 0
          },
          {
            "SecCode": "2A",
            "SplRatePercent": 0,
            "SplRateInc": 0,
            "SplRateIncTax": 0
          },
          {
            "SecCode": "5BB",
            "SplRatePercent": 0,
            "SplRateInc": 0,
            "SplRateIncTax": 0
          },
          {
            "SecCode": "5ADii",
            "SplRatePercent": 0,
            "SplRateInc": 0,
            "SplRateIncTax": 0
          },
          {
            "SecCode": "5ADiiiP",
            "SplRatePercent": 0,
            "SplRateInc": 0,
            "SplRateIncTax": 0
          },
          {
            "SecCode": "DTAASTCG",
            "SplRatePercent": 1,
            "SplRateInc": 0,
            "SplRateIncTax": 0
          },
          {
            "SecCode": "DTAALTCG",
            "SplRatePercent": 0,
            "SplRateInc": 0,
            "SplRateIncTax": 0
          },
          {
            "SecCode": "DTAAOS",
            "SplRatePercent": 0,
            "SplRateInc": 0,
            "SplRateIncTax": 0
          }
        ],
        "TotSplRateInc": 0,
        "TotSplRateIncTax": 0
      },
      "PartB-TI": {
        "Salaries": 0,
        "IncomeFromHP": 0,
        "CapGain": {
          "ShortTerm": {
            "ShortTerm15Per": 0,
            "ShortTerm30Per": 0,
            "ShortTermAppRate": 0,
            "ShortTermSplRateDTAA": 0,
            "TotalShortTerm": 0
          },
          "LongTerm": {
            "LongTerm10Per": 0,
            "LongTerm20Per": 0,
            "LongTermSplRateDTAA": 0,
            "TotalLongTerm": 0
          },
          "TotalCapGains": 0
        },
        "IncFromOS": {
          "OtherSrcThanOwnRaceHorse": 0,
          "IncChargblSplRate": 0,
          "FromOwnRaceHorse": 0,
          "TotIncFromOS": $totIncFromOS
        },
        "TotalTI": 0,
        "CurrentYearLoss": 0,
        "BalanceAfterSetoffLosses": 0,
        "BroughtFwdLossesSetoff": 0,
        "GrossTotalIncome": $grossTotalIncome,
        "IncChargeTaxSplRate111A112": 0,
        "DeductionsUnderScheduleVIA": 0,
        "TotalIncome": 0,
        "IncChargeableTaxSplRates": 0,
        "NetAgricultureIncomeOrOtherIncomeForRate": 0,
        "AggregateIncome": 0,
        "LossesOfCurrentYearCarriedFwd": 0,
        "DeemedIncomeUs115JC": 0
      },
      "PartB_TTI": {
        "TaxPayDeemedTotIncUs115JC": 0,
        "Surcharge": 0,
        "HealthEduCess": $educationCess,
        "TotalTaxPayablDeemedTotInc": 0,
        "ComputationOfTaxLiability": {
          "TaxPayableOnTI": {
            "TaxAtNormalRatesOnAggrInc": 0,
            "TaxAtSpecialRates": 0,
            "RebateOnAgriInc": 0,
            "TaxPayableOnTotInc": $taxPayableOnTotInc
          },
          "Rebate87A": $rebate87A,
          "TaxPayableOnRebate": 0,
          "Surcharge25ofSI": 0,
          "SurchargeOnAboveCrore": 0,
          "Surcharge25ofSIBeforeMarginal": 0,
          "SurchargeOnAboveCroreBeforeMarginal": 0,
          "TotalSurcharge": $totalSurcharge,
          "EducationCess": $educationCess,
          "GrossTaxLiability": $grossTaxLiability,
          "GrossTaxPayable": $grossTaxPayable,
          "GrossTaxPay": {
            "TaxInc17": 0,
            "TaxDeferred17": 0,
            "TaxDeferredPayableCY": 0
          },
          "CreditUS115JD": 0,
          "TaxPayAfterCreditUs115JD": 0,
          "TaxRelief": {
            "Section89": 0,
            "Section90": 0,
            "Section91": 0,
            "TotTaxRelief": $totTaxRelief
          },
          "NetTaxLiability": $netTaxLiability,
          "IntrstPay": {
            "IntrstPayUs234A": 0,
            "IntrstPayUs234B": 0,
            "IntrstPayUs234C": 0,
            "LateFilingFee234F": 0,
            "TotalIntrstPay": 0
          },
          "AggregateTaxInterestLiability": 0
        },
        "TaxPaid": {
          "TaxesPaid": {
            "AdvanceTax": 0,
            "TDS": $totalTds,
            "TCS": 0,
            "SelfAssessmentTax": 0,
            "TotalTaxesPaid": $totalTds
          },
          "BalTaxPayable": 0
        },
        "Refund": {
          "RefundDue": 0,
          "BankAccountDtls": {
            "BankDtlsFlag": "Y",
            "AddtnlBankDetails": [
              {
                "IFSCCode": "",
                "BankName": "",
                "BankAccountNo": "",
                "UseForRefund": ""
              },
              {
                "IFSCCode": "",
                "BankName": "",
                "BankAccountNo": "",
                "UseForRefund": ""
              }
            ]
          }
        },
        "AssetOutIndiaFlag": ""
      },
      "ScheduleIT": {
        "TotalTaxPayments": 0
      },
      "ScheduleTDS1": {
        "TDSonSalary": [
          {
            "EmployerOrDeductorOrCollectDetl": {
              "TAN": "$tanOfDeductor",
              "EmployerOrDeductorOrCollecterName": "ROPPEN TRANSPORTATION SERVICES PRIVATE LIMITED"
            },
            "IncChrgSal": 0,
            "TotalTDSSal": $twelve
          },
          {
            "EmployerOrDeductorOrCollectDetl": {
              "TAN": "$tanOfDeductor",
              "EmployerOrDeductorOrCollecterName": "ROPPEN TRANSPORTATION SERVICES PRIVATE LIMITED"
            },
            "IncChrgSal": 0,
            "TotalTDSSal": $eleven
          },
          {
            "EmployerOrDeductorOrCollectDetl": {
              "TAN": "$tanOfDeductor",
              "EmployerOrDeductorOrCollecterName": "ROPPEN TRANSPORTATION SERVICES PRIVATE LIMITED"
            },
            "IncChrgSal": 0,
            "TotalTDSSal": $ten
          },
          {
            "EmployerOrDeductorOrCollectDetl": {
              "TAN": "$tanOfDeductor",
              "EmployerOrDeductorOrCollecterName": "ROPPEN TRANSPORTATION SERVICES PRIVATE LIMITED"
            },
            "IncChrgSal": 0,
            "TotalTDSSal": $nine
          },
          {
            "EmployerOrDeductorOrCollectDetl": {
              "TAN": "$tanOfDeductor",
              "EmployerOrDeductorOrCollecterName": "ROPPEN TRANSPORTATION SERVICES PRIVATE LIMITED"
            },
            "IncChrgSal": 0,
            "TotalTDSSal": $eight
          },
          {
            "EmployerOrDeductorOrCollectDetl": {
              "TAN": "$tanOfDeductor",
              "EmployerOrDeductorOrCollecterName": "ROPPEN TRANSPORTATION SERVICES PRIVATE LIMITED"
            },
            "IncChrgSal": 0,
            "TotalTDSSal": $seven
          },
          {
            "EmployerOrDeductorOrCollectDetl": {
              "TAN": "$tanOfDeductor",
              "EmployerOrDeductorOrCollecterName": "ROPPEN TRANSPORTATION SERVICES PRIVATE LIMITED"
            },
            "IncChrgSal": 0,
            "TotalTDSSal": $six
          },
          {
            "EmployerOrDeductorOrCollectDetl": {
              "TAN": "$tanOfDeductor",
              "EmployerOrDeductorOrCollecterName": "ROPPEN TRANSPORTATION SERVICES PRIVATE LIMITED"
            },
            "IncChrgSal": 0,
            "TotalTDSSal": $five
          },
          {
            "EmployerOrDeductorOrCollectDetl": {
              "TAN": "$tanOfDeductor",
              "EmployerOrDeductorOrCollecterName": "ROPPEN TRANSPORTATION SERVICES PRIVATE LIMITED"
            },
            "IncChrgSal": 0,
            "TotalTDSSal": $four
          },
          {
            "EmployerOrDeductorOrCollectDetl": {
              "TAN": "$tanOfDeductor",
              "EmployerOrDeductorOrCollecterName": "ROPPEN TRANSPORTATION SERVICES PRIVATE LIMITED"
            },
            "IncChrgSal": 0,
            "TotalTDSSal": $three
          },
          {
            "EmployerOrDeductorOrCollectDetl": {
              "TAN": "$tanOfDeductor",
              "EmployerOrDeductorOrCollecterName": "ROPPEN TRANSPORTATION SERVICES PRIVATE LIMITED"
            },
            "IncChrgSal": 0,
            "TotalTDSSal": $two
          },
          {
            "EmployerOrDeductorOrCollectDetl": {
              "TAN": "$tanOfDeductor",
              "EmployerOrDeductorOrCollecterName": "ROPPEN TRANSPORTATION SERVICES PRIVATE LIMITED"
            },
            "IncChrgSal": 0,
            "TotalTDSSal": $one
          }
        ],
        "TotalTDSonSalaries": $totalTds
      },
      "ScheduleTDS2": {
        "TotalTDSonOthThanSals": 0
      },
      "ScheduleTDS3": {
        "TotalTDS3OnOthThanSal": 0
      },
      "ScheduleTCS": {
        "TotalSchTCS": 0
      },
      "Verification": {
        "Declaration": {
          "AssesseeVerName": "",
          "FatherName": "",
          "AssesseeVerPAN": ""
        },
        "Capacity": "S"
      }
    }
  }
}

""";
}

void changexml(String pan) {
  paymentXml = """
<?xml version="1.0" encoding="utf-8"?>
<ITRETURN:ITR xmlns:ITR2FORM="http://incometaxindiaefiling.gov.in/ITR2" xmlns:ITRForm="http://incometaxindiaefiling.gov.in/master" xmlns:ITRETURN="http://incometaxindiaefiling.gov.in/main">
  <ITR2FORM:ITR2>
    <ITRForm:CreationInfo>
      <ITRForm:SWVersionNo>1.0</ITRForm:SWVersionNo>
      <ITRForm:SWCreatedBy>SW10002102</ITRForm:SWCreatedBy>
      <ITRForm:XMLCreatedBy>SW10002102</ITRForm:XMLCreatedBy>
      <ITRForm:XMLCreationDate>2020-09-14</ITRForm:XMLCreationDate>
      <ITRForm:IntermediaryCity>New Delhi</ITRForm:IntermediaryCity>
      <ITRForm:Digest>xI9NYbh625eH0UqLsnud0sPszVSMyBCah8FXKYXPcls=</ITRForm:Digest>
    </ITRForm:CreationInfo>
    <ITRForm:Form_ITR2>
      <ITRForm:FormName>ITR-2</ITRForm:FormName>
      <ITRForm:Description>For Individuals and HUFs not having income from profits and gains of business or profession</ITRForm:Description>
      <ITRForm:AssessmentYear>2020</ITRForm:AssessmentYear>
      <ITRForm:SchemaVer>Ver1.0</ITRForm:SchemaVer>
      <ITRForm:FormVer>Ver1.0</ITRForm:FormVer>
    </ITRForm:Form_ITR2>
    <ITRForm:PartA_GEN1>
      <ITRForm:PersonalInfo>
        <ITRForm:AssesseeName>
          <ITRForm:FirstName>SIDDHARTH</ITRForm:FirstName>
          <ITRForm:SurNameOrOrgName>KUMAR</ITRForm:SurNameOrOrgName>
        </ITRForm:AssesseeName>
        <ITRForm:PAN>$pan</ITRForm:PAN>
        <ITRForm:Address>
          <ITRForm:ResidenceNo>27</ITRForm:ResidenceNo>
          <ITRForm:RoadOrStreet>2ND CROSS, DVG LAYOUT</ITRForm:RoadOrStreet>
          <ITRForm:LocalityOrArea>T C PALYA MAIN ROAD</ITRForm:LocalityOrArea>
          <ITRForm:CityOrTownOrDistrict>Bangalore</ITRForm:CityOrTownOrDistrict>
          <ITRForm:StateCode>15</ITRForm:StateCode>
          <ITRForm:CountryCode>91</ITRForm:CountryCode>
          <ITRForm:PinCode>560036</ITRForm:PinCode>
          <ITRForm:CountryCodeMobile>91</ITRForm:CountryCodeMobile>
          <ITRForm:MobileNo>8095908526</ITRForm:MobileNo>
          <ITRForm:EmailAddress>siddharthissiddharth@gmail.com</ITRForm:EmailAddress>
        </ITRForm:Address>
        <ITRForm:DOB>1993-08-22</ITRForm:DOB>
        <ITRForm:Status>I</ITRForm:Status>
        <ITRForm:AadhaarCardNo>428431873980</ITRForm:AadhaarCardNo>
      </ITRForm:PersonalInfo>
      <ITRForm:FilingStatus>
        <ITRForm:ReturnFileSec>11</ITRForm:ReturnFileSec>
        <ITRForm:SeventhProvisio139>N</ITRForm:SeventhProvisio139>
        <ITRForm:DepAmtAggAmtExcd1CrPrYrFlg>N</ITRForm:DepAmtAggAmtExcd1CrPrYrFlg>
        <ITRForm:IncrExpAggAmt2LkTrvFrgnCntryFlg>N</ITRForm:IncrExpAggAmt2LkTrvFrgnCntryFlg>
        <ITRForm:IncrExpAggAmt1LkElctrctyPrYrFlg>N</ITRForm:IncrExpAggAmt1LkElctrctyPrYrFlg>
        <ITRForm:ResidentialStatus>RES</ITRForm:ResidentialStatus>
        <ITRForm:ConditionsResStatus>1</ITRForm:ConditionsResStatus>
        <ITRForm:BenefitUs115HFlg>N</ITRForm:BenefitUs115HFlg>
        <ITRForm:AsseseeRepFlg>N</ITRForm:AsseseeRepFlg>
        <ITRForm:PortugeseCC5A>N</ITRForm:PortugeseCC5A>
        <ITRForm:CompDirectorPrvYrFlg>N</ITRForm:CompDirectorPrvYrFlg>
        <ITRForm:HeldUnlistedEqShrPrYrFlg>N</ITRForm:HeldUnlistedEqShrPrYrFlg>
      </ITRForm:FilingStatus>
    </ITRForm:PartA_GEN1>
    <ITRForm:ScheduleS>
      <ITRForm:Salaries>
        <ITRForm:NameOfEmployer>ROPPEN TRANSPORTATION SERVICES PRIVATE LIMITED</ITRForm:NameOfEmployer>
        <ITRForm:NatureOfEmployment>OTH</ITRForm:NatureOfEmployment>
        <ITRForm:TANofEmployer>HYDR09831D</ITRForm:TANofEmployer>
        <ITRForm:AddressDetail>
          <ITRForm:AddrDetail>Plot No-24/NP, Sector-2C, Alkapur Townsh, Puppalguda, Manikonda</ITRForm:AddrDetail>
          <ITRForm:CityOrTownOrDistrict>Hyderabad</ITRForm:CityOrTownOrDistrict>
          <ITRForm:StateCode>02</ITRForm:StateCode>
          <ITRForm:PinCode>500089</ITRForm:PinCode>
        </ITRForm:AddressDetail>
        <ITRForm:Salarys>
          <ITRForm:GrossSalary>1378404</ITRForm:GrossSalary>
          <ITRForm:Salary>1378404</ITRForm:Salary>
          <ITRForm:NatureOfSalary>
            <ITRForm:OthersIncDtls>
              <ITRForm:NatureDesc>1</ITRForm:NatureDesc>
              <ITRForm:OthAmount>700008</ITRForm:OthAmount>
            </ITRForm:OthersIncDtls>
            <ITRForm:OthersIncDtls>
              <ITRForm:NatureDesc>4</ITRForm:NatureDesc>
              <ITRForm:OthAmount>350004</ITRForm:OthAmount>
            </ITRForm:OthersIncDtls>
            <ITRForm:OthersIncDtls>
              <ITRForm:NatureDesc>5</ITRForm:NatureDesc>
              <ITRForm:OthAmount>30000</ITRForm:OthAmount>
            </ITRForm:OthersIncDtls>
            <ITRForm:OthersIncDtls>
              <ITRForm:NatureDesc>3</ITRForm:NatureDesc>
              <ITRForm:OthAmount>19200</ITRForm:OthAmount>
            </ITRForm:OthersIncDtls>
            <ITRForm:OthersIncDtls>
              <ITRForm:NatureDesc>OTH</ITRForm:NatureDesc>
              <ITRForm:OthNatOfInc>Medical Allowance</ITRForm:OthNatOfInc>
              <ITRForm:OthAmount>15000</ITRForm:OthAmount>
            </ITRForm:OthersIncDtls>
            <ITRForm:OthersIncDtls>
              <ITRForm:NatureDesc>OTH</ITRForm:NatureDesc>
              <ITRForm:OthNatOfInc>CITY COMPENSATORY ALLOWANCE</ITRForm:OthNatOfInc>
              <ITRForm:OthAmount>264192</ITRForm:OthAmount>
            </ITRForm:OthersIncDtls>
          </ITRForm:NatureOfSalary>
          <ITRForm:ValueOfPerquisites>0</ITRForm:ValueOfPerquisites>
          <ITRForm:ProfitsinLieuOfSalary>0</ITRForm:ProfitsinLieuOfSalary>
        </ITRForm:Salarys>
      </ITRForm:Salaries>
      <ITRForm:TotalGrossSalary>1378404</ITRForm:TotalGrossSalary>
      <ITRForm:AllwncExtentExemptUs10>29964</ITRForm:AllwncExtentExemptUs10>
      <ITRForm:AllwncExemptUs10>
        <ITRForm:AllwncExemptUs10Dtls>
          <ITRForm:SalNatureDesc>OTH</ITRForm:SalNatureDesc>
          <ITRForm:SalOthNatOfInc>Others</ITRForm:SalOthNatOfInc>
          <ITRForm:SalOthAmount>29964</ITRForm:SalOthAmount>
        </ITRForm:AllwncExemptUs10Dtls>
      </ITRForm:AllwncExemptUs10>
      <ITRForm:NetSalary>1348440</ITRForm:NetSalary>
      <ITRForm:DeductionUS16>52400</ITRForm:DeductionUS16>
      <ITRForm:DeductionUnderSection16ia>50000</ITRForm:DeductionUnderSection16ia>
      <ITRForm:EntertainmntalwncUs16ii>0</ITRForm:EntertainmntalwncUs16ii>
      <ITRForm:ProfessionalTaxUs16iii>2400</ITRForm:ProfessionalTaxUs16iii>
      <ITRForm:TotIncUnderHeadSalaries>1296040</ITRForm:TotIncUnderHeadSalaries>
    </ITRForm:ScheduleS>
    <ITRForm:ScheduleHP>
      <ITRForm:TotalIncomeChargeableUnHP>0</ITRForm:TotalIncomeChargeableUnHP>
    </ITRForm:ScheduleHP>
    <ITRForm:ScheduleCGFor23>
      <ITRForm:ShortTermCapGainFor23>
        <ITRForm:SaleofLandBuild>
          <ITRForm:SaleofLandBuildDtls>
            <ITRForm:FullConsideration>0</ITRForm:FullConsideration>
            <ITRForm:PropertyValuation>0</ITRForm:PropertyValuation>
            <ITRForm:FullConsideration50C>0</ITRForm:FullConsideration50C>
            <ITRForm:AquisitCost>0</ITRForm:AquisitCost>
            <ITRForm:ImproveCost>0</ITRForm:ImproveCost>
            <ITRForm:ExpOnTrans>0</ITRForm:ExpOnTrans>
            <ITRForm:TotalDedn>0</ITRForm:TotalDedn>
            <ITRForm:Balance>0</ITRForm:Balance>
            <ITRForm:DeductionUs54B>0</ITRForm:DeductionUs54B>
            <ITRForm:STCGonImmvblPrprty>0</ITRForm:STCGonImmvblPrprty>
          </ITRForm:SaleofLandBuildDtls>
        </ITRForm:SaleofLandBuild>
        <ITRForm:EquityMFonSTT>
          <ITRForm:MFSectionCode>1A</ITRForm:MFSectionCode>
          <ITRForm:EquityMFonSTTDtls>
            <ITRForm:FullConsideration>43580</ITRForm:FullConsideration>
            <ITRForm:DeductSec48>
              <ITRForm:AquisitCost>32413</ITRForm:AquisitCost>
              <ITRForm:ImproveCost>0</ITRForm:ImproveCost>
              <ITRForm:ExpOnTrans>0</ITRForm:ExpOnTrans>
              <ITRForm:TotalDedn>32413</ITRForm:TotalDedn>
            </ITRForm:DeductSec48>
            <ITRForm:BalanceCG>11167</ITRForm:BalanceCG>
            <ITRForm:LossSec94of7Or94of8>0</ITRForm:LossSec94of7Or94of8>
            <ITRForm:CapgainonAssets>11167</ITRForm:CapgainonAssets>
          </ITRForm:EquityMFonSTTDtls>
        </ITRForm:EquityMFonSTT>
        <ITRForm:EquityMFonSTT>
          <ITRForm:MFSectionCode>5AD1biip</ITRForm:MFSectionCode>
          <ITRForm:EquityMFonSTTDtls>
            <ITRForm:FullConsideration>0</ITRForm:FullConsideration>
            <ITRForm:DeductSec48>
              <ITRForm:AquisitCost>0</ITRForm:AquisitCost>
              <ITRForm:ImproveCost>0</ITRForm:ImproveCost>
              <ITRForm:ExpOnTrans>0</ITRForm:ExpOnTrans>
              <ITRForm:TotalDedn>0</ITRForm:TotalDedn>
            </ITRForm:DeductSec48>
            <ITRForm:BalanceCG>0</ITRForm:BalanceCG>
            <ITRForm:LossSec94of7Or94of8>0</ITRForm:LossSec94of7Or94of8>
            <ITRForm:CapgainonAssets>0</ITRForm:CapgainonAssets>
          </ITRForm:EquityMFonSTTDtls>
        </ITRForm:EquityMFonSTT>
        <ITRForm:NRITransacSec48Dtl>
          <ITRForm:NRItaxSTTPaid>0</ITRForm:NRItaxSTTPaid>
          <ITRForm:NRItaxSTTNotPaid>0</ITRForm:NRItaxSTTNotPaid>
        </ITRForm:NRITransacSec48Dtl>
        <ITRForm:NRISecur115AD>
          <ITRForm:FullValueConsdRecvUnqshr>0</ITRForm:FullValueConsdRecvUnqshr>
          <ITRForm:FairMrktValueUnqshr>0</ITRForm:FairMrktValueUnqshr>
          <ITRForm:FullValueConsdSec50CA>0</ITRForm:FullValueConsdSec50CA>
          <ITRForm:FullValueConsdOthUnqshr>0</ITRForm:FullValueConsdOthUnqshr>
          <ITRForm:FullConsideration>0</ITRForm:FullConsideration>
          <ITRForm:DeductSec48>
            <ITRForm:AquisitCost>0</ITRForm:AquisitCost>
            <ITRForm:ImproveCost>0</ITRForm:ImproveCost>
            <ITRForm:ExpOnTrans>0</ITRForm:ExpOnTrans>
            <ITRForm:TotalDedn>0</ITRForm:TotalDedn>
          </ITRForm:DeductSec48>
          <ITRForm:BalanceCG>0</ITRForm:BalanceCG>
          <ITRForm:LossSec94of7Or94of8>0</ITRForm:LossSec94of7Or94of8>
          <ITRForm:CapgainonAssets>0</ITRForm:CapgainonAssets>
        </ITRForm:NRISecur115AD>
        <ITRForm:SaleOnOtherAssets>
          <ITRForm:FullValueConsdRecvUnqshr>0</ITRForm:FullValueConsdRecvUnqshr>
          <ITRForm:FairMrktValueUnqshr>0</ITRForm:FairMrktValueUnqshr>
          <ITRForm:FullValueConsdSec50CA>0</ITRForm:FullValueConsdSec50CA>
          <ITRForm:FullValueConsdOthUnqshr>402405</ITRForm:FullValueConsdOthUnqshr>
          <ITRForm:FullConsideration>402405</ITRForm:FullConsideration>
          <ITRForm:DeductSec48>
            <ITRForm:AquisitCost>397594</ITRForm:AquisitCost>
            <ITRForm:ImproveCost>0</ITRForm:ImproveCost>
            <ITRForm:ExpOnTrans>0</ITRForm:ExpOnTrans>
            <ITRForm:TotalDedn>397594</ITRForm:TotalDedn>
          </ITRForm:DeductSec48>
          <ITRForm:BalanceCG>4811</ITRForm:BalanceCG>
          <ITRForm:LossSec94of7Or94of8>0</ITRForm:LossSec94of7Or94of8>
          <ITRForm:CapgainonAssets>4811</ITRForm:CapgainonAssets>
        </ITRForm:SaleOnOtherAssets>
        <ITRForm:UnutilizedStcgFlag>X</ITRForm:UnutilizedStcgFlag>
        <ITRForm:TotalAmtDeemedStcg>0</ITRForm:TotalAmtDeemedStcg>
        <ITRForm:PassThrIncNatureSTCG>0</ITRForm:PassThrIncNatureSTCG>
        <ITRForm:PassThrIncNatureSTCG15Per>0</ITRForm:PassThrIncNatureSTCG15Per>
        <ITRForm:PassThrIncNatureSTCG30Per>0</ITRForm:PassThrIncNatureSTCG30Per>
        <ITRForm:PassThrIncNatureSTCGAppRate>0</ITRForm:PassThrIncNatureSTCGAppRate>
        <ITRForm:TotalAmtNotTaxUsDTAAStcg>0</ITRForm:TotalAmtNotTaxUsDTAAStcg>
        <ITRForm:TotalAmtTaxUsDTAAStcg>0</ITRForm:TotalAmtTaxUsDTAAStcg>
        <ITRForm:TotalSTCG>15978</ITRForm:TotalSTCG>
      </ITRForm:ShortTermCapGainFor23>
      <ITRForm:LongTermCapGain23>
        <ITRForm:SaleofLandBuild>
          <ITRForm:SaleofLandBuildDtls>
            <ITRForm:FullConsideration>0</ITRForm:FullConsideration>
            <ITRForm:PropertyValuation>0</ITRForm:PropertyValuation>
            <ITRForm:FullConsideration50C>0</ITRForm:FullConsideration50C>
            <ITRForm:AquisitCost>0</ITRForm:AquisitCost>
            <ITRForm:ImproveCost>0</ITRForm:ImproveCost>
            <ITRForm:ExpOnTrans>0</ITRForm:ExpOnTrans>
            <ITRForm:TotalDedn>0</ITRForm:TotalDedn>
            <ITRForm:Balance>0</ITRForm:Balance>
            <ITRForm:ExemptionOrDednUs54>
              <ITRForm:ExemptionGrandTotal>0</ITRForm:ExemptionGrandTotal>
            </ITRForm:ExemptionOrDednUs54>
            <ITRForm:LTCGonImmvblPrprty>0</ITRForm:LTCGonImmvblPrprty>
          </ITRForm:SaleofLandBuildDtls>
        </ITRForm:SaleofLandBuild>
        <ITRForm:SaleofBondsDebntr>
          <ITRForm:FullConsideration>0</ITRForm:FullConsideration>
          <ITRForm:DeductSec48>
            <ITRForm:AquisitCost>0</ITRForm:AquisitCost>
            <ITRForm:ImproveCost>0</ITRForm:ImproveCost>
            <ITRForm:ExpOnTrans>0</ITRForm:ExpOnTrans>
            <ITRForm:TotalDedn>0</ITRForm:TotalDedn>
          </ITRForm:DeductSec48>
          <ITRForm:BalanceCG>0</ITRForm:BalanceCG>
          <ITRForm:DeductionUs54F>0</ITRForm:DeductionUs54F>
          <ITRForm:CapgainonAssets>0</ITRForm:CapgainonAssets>
        </ITRForm:SaleofBondsDebntr>
        <ITRForm:Proviso112Applicable>
          <ITRForm:Proviso112SectionCode>22</ITRForm:Proviso112SectionCode>
          <ITRForm:Proviso112Applicabledtls>
            <ITRForm:FullConsideration>0</ITRForm:FullConsideration>
            <ITRForm:DeductSec48>
              <ITRForm:AquisitCost>0</ITRForm:AquisitCost>
              <ITRForm:ImproveCost>0</ITRForm:ImproveCost>
              <ITRForm:ExpOnTrans>0</ITRForm:ExpOnTrans>
              <ITRForm:TotalDedn>0</ITRForm:TotalDedn>
            </ITRForm:DeductSec48>
            <ITRForm:BalanceCG>0</ITRForm:BalanceCG>
            <ITRForm:DeductionUs54F>0</ITRForm:DeductionUs54F>
            <ITRForm:CapgainonAssets>0</ITRForm:CapgainonAssets>
          </ITRForm:Proviso112Applicabledtls>
        </ITRForm:Proviso112Applicable>
        <ITRForm:Proviso112Applicable>
          <ITRForm:Proviso112SectionCode>5ACA1b</ITRForm:Proviso112SectionCode>
          <ITRForm:Proviso112Applicabledtls>
            <ITRForm:FullConsideration>0</ITRForm:FullConsideration>
            <ITRForm:DeductSec48>
              <ITRForm:AquisitCost>0</ITRForm:AquisitCost>
              <ITRForm:ImproveCost>0</ITRForm:ImproveCost>
              <ITRForm:ExpOnTrans>0</ITRForm:ExpOnTrans>
              <ITRForm:TotalDedn>0</ITRForm:TotalDedn>
            </ITRForm:DeductSec48>
            <ITRForm:BalanceCG>0</ITRForm:BalanceCG>
            <ITRForm:DeductionUs54F>0</ITRForm:DeductionUs54F>
            <ITRForm:CapgainonAssets>0</ITRForm:CapgainonAssets>
          </ITRForm:Proviso112Applicabledtls>
        </ITRForm:Proviso112Applicable>
        <ITRForm:SaleOfEquityShareUs112A>
          <ITRForm:BalanceCG>370</ITRForm:BalanceCG>
          <ITRForm:DeductionUs54F>0</ITRForm:DeductionUs54F>
          <ITRForm:CapgainonAssets>370</ITRForm:CapgainonAssets>
        </ITRForm:SaleOfEquityShareUs112A>
        <ITRForm:NRIProvisoSec48>
          <ITRForm:LTCGWithoutBenefit>0</ITRForm:LTCGWithoutBenefit>
          <ITRForm:DeductionUs54F>0</ITRForm:DeductionUs54F>
          <ITRForm:BalanceCG>0</ITRForm:BalanceCG>
        </ITRForm:NRIProvisoSec48>
        <ITRForm:NRISaleOfEquityShareUs112A>
          <ITRForm:BalanceCG>0</ITRForm:BalanceCG>
          <ITRForm:DeductionUs54F>0</ITRForm:DeductionUs54F>
          <ITRForm:CapgainonAssets>0</ITRForm:CapgainonAssets>
        </ITRForm:NRISaleOfEquityShareUs112A>
        <ITRForm:NRISaleofForeignAsset>
          <ITRForm:SaleonSpecAsset>0</ITRForm:SaleonSpecAsset>
          <ITRForm:DednSpecAssetus115>0</ITRForm:DednSpecAssetus115>
          <ITRForm:BalonSpeciAsset>0</ITRForm:BalonSpeciAsset>
          <ITRForm:SaleOtherSpecAsset>0</ITRForm:SaleOtherSpecAsset>
          <ITRForm:DednOtherSpecAssetus115>0</ITRForm:DednOtherSpecAssetus115>
          <ITRForm:BalOtherthanSpecAsset>0</ITRForm:BalOtherthanSpecAsset>
        </ITRForm:NRISaleofForeignAsset>
        <ITRForm:SaleofAssetNA>
          <ITRForm:FullValueConsdRecvUnqshr>0</ITRForm:FullValueConsdRecvUnqshr>
          <ITRForm:FairMrktValueUnqshr>0</ITRForm:FairMrktValueUnqshr>
          <ITRForm:FullValueConsdSec50CA>0</ITRForm:FullValueConsdSec50CA>
          <ITRForm:FullValueConsdOthUnqshr>0</ITRForm:FullValueConsdOthUnqshr>
          <ITRForm:FullConsideration>0</ITRForm:FullConsideration>
          <ITRForm:DeductSec48>
            <ITRForm:AquisitCost>0</ITRForm:AquisitCost>
            <ITRForm:ImproveCost>0</ITRForm:ImproveCost>
            <ITRForm:ExpOnTrans>0</ITRForm:ExpOnTrans>
            <ITRForm:TotalDedn>0</ITRForm:TotalDedn>
          </ITRForm:DeductSec48>
          <ITRForm:BalanceCG>0</ITRForm:BalanceCG>
          <ITRForm:DeductionUs54F>0</ITRForm:DeductionUs54F>
          <ITRForm:CapgainonAssets>0</ITRForm:CapgainonAssets>
        </ITRForm:SaleofAssetNA>
        <ITRForm:UnutilizedLtcgFlag>X</ITRForm:UnutilizedLtcgFlag>
        <ITRForm:TotalAmtDeemedLtcg>0</ITRForm:TotalAmtDeemedLtcg>
        <ITRForm:PassThrIncNatureLTCG>0</ITRForm:PassThrIncNatureLTCG>
        <ITRForm:PassThrIncNatureLTCGUs112A>0</ITRForm:PassThrIncNatureLTCGUs112A>
        <ITRForm:PassThrIncNatureLTCG10Per>0</ITRForm:PassThrIncNatureLTCG10Per>
        <ITRForm:PassThrIncNatureLTCG20Per>0</ITRForm:PassThrIncNatureLTCG20Per>
        <ITRForm:TotalAmtNotTaxUsDTAALtcg>0</ITRForm:TotalAmtNotTaxUsDTAALtcg>
        <ITRForm:TotalAmtTaxUsDTAALtcg>0</ITRForm:TotalAmtTaxUsDTAALtcg>
        <ITRForm:TotalLTCG>370</ITRForm:TotalLTCG>
      </ITRForm:LongTermCapGain23>
      <ITRForm:TotScheduleCGFor23>16348</ITRForm:TotScheduleCGFor23>
      <ITRForm:DeducClaimInfo>
        <ITRForm:TotDeductClaim>0</ITRForm:TotDeductClaim>
      </ITRForm:DeducClaimInfo>
      <ITRForm:CurrYrLosses>
        <ITRForm:InLossSetOff>
          <ITRForm:TypeOfCapGain>LOSS_TO_BE_SET_OFF</ITRForm:TypeOfCapGain>
          <ITRForm:StclSetoff15Per>0</ITRForm:StclSetoff15Per>
          <ITRForm:StclSetoff30Per>0</ITRForm:StclSetoff30Per>
          <ITRForm:StclSetoffAppRate>0</ITRForm:StclSetoffAppRate>
          <ITRForm:StclSetoffDTAARate>0</ITRForm:StclSetoffDTAARate>
          <ITRForm:LtclSetOff10Per>0</ITRForm:LtclSetOff10Per>
          <ITRForm:LtclSetOff20Per>0</ITRForm:LtclSetOff20Per>
          <ITRForm:LtclSetOffDTAARate>0</ITRForm:LtclSetOffDTAARate>
        </ITRForm:InLossSetOff>
        <ITRForm:InStcg15Per>
          <ITRForm:TypeOfCapGain>STCG_PER_15</ITRForm:TypeOfCapGain>
          <ITRForm:CurrYearIncome>11167</ITRForm:CurrYearIncome>
          <ITRForm:StclSetoff30Per>0</ITRForm:StclSetoff30Per>
          <ITRForm:StclSetoffAppRate>0</ITRForm:StclSetoffAppRate>
          <ITRForm:StclSetoffDTAARate>0</ITRForm:StclSetoffDTAARate>
          <ITRForm:CurrYrCapGain>11167</ITRForm:CurrYrCapGain>
        </ITRForm:InStcg15Per>
        <ITRForm:InStcg30Per>
          <ITRForm:TypeOfCapGain>STCG_PER_30</ITRForm:TypeOfCapGain>
          <ITRForm:CurrYearIncome>0</ITRForm:CurrYearIncome>
          <ITRForm:StclSetoff15Per>0</ITRForm:StclSetoff15Per>
          <ITRForm:StclSetoffAppRate>0</ITRForm:StclSetoffAppRate>
          <ITRForm:StclSetoffDTAARate>0</ITRForm:StclSetoffDTAARate>
          <ITRForm:CurrYrCapGain>0</ITRForm:CurrYrCapGain>
        </ITRForm:InStcg30Per>
        <ITRForm:InStcgAppRate>
          <ITRForm:TypeOfCapGain>STCG_PER_APP_RATE</ITRForm:TypeOfCapGain>
          <ITRForm:CurrYearIncome>4811</ITRForm:CurrYearIncome>
          <ITRForm:StclSetoff15Per>0</ITRForm:StclSetoff15Per>
          <ITRForm:StclSetoff30Per>0</ITRForm:StclSetoff30Per>
          <ITRForm:StclSetoffDTAARate>0</ITRForm:StclSetoffDTAARate>
          <ITRForm:CurrYrCapGain>4811</ITRForm:CurrYrCapGain>
        </ITRForm:InStcgAppRate>
        <ITRForm:InStcgDTAARate>
          <ITRForm:TypeOfCapGain>STCG_PER_DTAA_RATE</ITRForm:TypeOfCapGain>
          <ITRForm:CurrYearIncome>0</ITRForm:CurrYearIncome>
          <ITRForm:StclSetoff15Per>0</ITRForm:StclSetoff15Per>
          <ITRForm:StclSetoff30Per>0</ITRForm:StclSetoff30Per>
          <ITRForm:StclSetoffAppRate>0</ITRForm:StclSetoffAppRate>
          <ITRForm:CurrYrCapGain>0</ITRForm:CurrYrCapGain>
        </ITRForm:InStcgDTAARate>
        <ITRForm:InLtcg10Per>
          <ITRForm:TypeOfCapGain>LTCG_PER_10</ITRForm:TypeOfCapGain>
          <ITRForm:CurrYearIncome>370</ITRForm:CurrYearIncome>
          <ITRForm:StclSetoff15Per>0</ITRForm:StclSetoff15Per>
          <ITRForm:StclSetoff30Per>0</ITRForm:StclSetoff30Per>
          <ITRForm:StclSetoffAppRate>0</ITRForm:StclSetoffAppRate>
          <ITRForm:StclSetoffDTAARate>0</ITRForm:StclSetoffDTAARate>
          <ITRForm:LtclSetOff20Per>0</ITRForm:LtclSetOff20Per>
          <ITRForm:LtclSetOffDTAARate>0</ITRForm:LtclSetOffDTAARate>
          <ITRForm:CurrYrCapGain>370</ITRForm:CurrYrCapGain>
        </ITRForm:InLtcg10Per>
        <ITRForm:InLtcg20Per>
          <ITRForm:TypeOfCapGain>LTCG_PER_20</ITRForm:TypeOfCapGain>
          <ITRForm:CurrYearIncome>0</ITRForm:CurrYearIncome>
          <ITRForm:StclSetoff15Per>0</ITRForm:StclSetoff15Per>
          <ITRForm:StclSetoff30Per>0</ITRForm:StclSetoff30Per>
          <ITRForm:StclSetoffAppRate>0</ITRForm:StclSetoffAppRate>
          <ITRForm:StclSetoffDTAARate>0</ITRForm:StclSetoffDTAARate>
          <ITRForm:LtclSetOff10Per>0</ITRForm:LtclSetOff10Per>
          <ITRForm:LtclSetOffDTAARate>0</ITRForm:LtclSetOffDTAARate>
          <ITRForm:CurrYrCapGain>0</ITRForm:CurrYrCapGain>
        </ITRForm:InLtcg20Per>
        <ITRForm:InLtcgDTAARate>
          <ITRForm:TypeOfCapGain>LTCG_PER_DTAA_RATE</ITRForm:TypeOfCapGain>
          <ITRForm:CurrYearIncome>0</ITRForm:CurrYearIncome>
          <ITRForm:StclSetoff15Per>0</ITRForm:StclSetoff15Per>
          <ITRForm:StclSetoff30Per>0</ITRForm:StclSetoff30Per>
          <ITRForm:StclSetoffAppRate>0</ITRForm:StclSetoffAppRate>
          <ITRForm:StclSetoffDTAARate>0</ITRForm:StclSetoffDTAARate>
          <ITRForm:LtclSetOff10Per>0</ITRForm:LtclSetOff10Per>
          <ITRForm:LtclSetOff20Per>0</ITRForm:LtclSetOff20Per>
          <ITRForm:CurrYrCapGain>0</ITRForm:CurrYrCapGain>
        </ITRForm:InLtcgDTAARate>
        <ITRForm:TotLossSetOff>
          <ITRForm:TypeOfCapGain>TOT_LOSS_SET_OFF</ITRForm:TypeOfCapGain>
          <ITRForm:StclSetoff15Per>0</ITRForm:StclSetoff15Per>
          <ITRForm:StclSetoff30Per>0</ITRForm:StclSetoff30Per>
          <ITRForm:StclSetoffAppRate>0</ITRForm:StclSetoffAppRate>
          <ITRForm:StclSetoffDTAARate>0</ITRForm:StclSetoffDTAARate>
          <ITRForm:LtclSetOff10Per>0</ITRForm:LtclSetOff10Per>
          <ITRForm:LtclSetOff20Per>0</ITRForm:LtclSetOff20Per>
          <ITRForm:LtclSetOffDTAARate>0</ITRForm:LtclSetOffDTAARate>
        </ITRForm:TotLossSetOff>
        <ITRForm:LossRemainSetOff>
          <ITRForm:TypeOfCapGain>LOSS_REMAIN_SET_OFF</ITRForm:TypeOfCapGain>
          <ITRForm:StclSetoff15Per>0</ITRForm:StclSetoff15Per>
          <ITRForm:StclSetoff30Per>0</ITRForm:StclSetoff30Per>
          <ITRForm:StclSetoffAppRate>0</ITRForm:StclSetoffAppRate>
          <ITRForm:StclSetoffDTAARate>0</ITRForm:StclSetoffDTAARate>
          <ITRForm:LtclSetOff10Per>0</ITRForm:LtclSetOff10Per>
          <ITRForm:LtclSetOff20Per>0</ITRForm:LtclSetOff20Per>
          <ITRForm:LtclSetOffDTAARate>0</ITRForm:LtclSetOffDTAARate>
        </ITRForm:LossRemainSetOff>
      </ITRForm:CurrYrLosses>
      <ITRForm:AccruOrRecOfCG>
        <ITRForm:ShortTermUnder15Per>
          <ITRForm:DateRange>
            <ITRForm:Upto15Of6>0</ITRForm:Upto15Of6>
            <ITRForm:Upto15Of9>0</ITRForm:Upto15Of9>
            <ITRForm:Up16Of9To15Of12>11167</ITRForm:Up16Of9To15Of12>
            <ITRForm:Up16Of12To15Of3>0</ITRForm:Up16Of12To15Of3>
            <ITRForm:Up16Of3To31Of3>0</ITRForm:Up16Of3To31Of3>
          </ITRForm:DateRange>
        </ITRForm:ShortTermUnder15Per>
        <ITRForm:ShortTermUnder30Per>
          <ITRForm:DateRange>
            <ITRForm:Upto15Of6>0</ITRForm:Upto15Of6>
            <ITRForm:Upto15Of9>0</ITRForm:Upto15Of9>
            <ITRForm:Up16Of9To15Of12>0</ITRForm:Up16Of9To15Of12>
            <ITRForm:Up16Of12To15Of3>0</ITRForm:Up16Of12To15Of3>
            <ITRForm:Up16Of3To31Of3>0</ITRForm:Up16Of3To31Of3>
          </ITRForm:DateRange>
        </ITRForm:ShortTermUnder30Per>
        <ITRForm:ShortTermUnderAppRate>
          <ITRForm:DateRange>
            <ITRForm:Upto15Of6>0</ITRForm:Upto15Of6>
            <ITRForm:Upto15Of9>0</ITRForm:Upto15Of9>
            <ITRForm:Up16Of9To15Of12>0</ITRForm:Up16Of9To15Of12>
            <ITRForm:Up16Of12To15Of3>4811</ITRForm:Up16Of12To15Of3>
            <ITRForm:Up16Of3To31Of3>0</ITRForm:Up16Of3To31Of3>
          </ITRForm:DateRange>
        </ITRForm:ShortTermUnderAppRate>
        <ITRForm:ShortTermUnderDTAARate>
          <ITRForm:DateRange>
            <ITRForm:Upto15Of6>0</ITRForm:Upto15Of6>
            <ITRForm:Upto15Of9>0</ITRForm:Upto15Of9>
            <ITRForm:Up16Of9To15Of12>0</ITRForm:Up16Of9To15Of12>
            <ITRForm:Up16Of12To15Of3>0</ITRForm:Up16Of12To15Of3>
            <ITRForm:Up16Of3To31Of3>0</ITRForm:Up16Of3To31Of3>
          </ITRForm:DateRange>
        </ITRForm:ShortTermUnderDTAARate>
        <ITRForm:LongTermUnder10Per>
          <ITRForm:DateRange>
            <ITRForm:Upto15Of6>0</ITRForm:Upto15Of6>
            <ITRForm:Upto15Of9>0</ITRForm:Upto15Of9>
            <ITRForm:Up16Of9To15Of12>370</ITRForm:Up16Of9To15Of12>
            <ITRForm:Up16Of12To15Of3>0</ITRForm:Up16Of12To15Of3>
            <ITRForm:Up16Of3To31Of3>0</ITRForm:Up16Of3To31Of3>
          </ITRForm:DateRange>
        </ITRForm:LongTermUnder10Per>
        <ITRForm:LongTermUnder20Per>
          <ITRForm:DateRange>
            <ITRForm:Upto15Of6>0</ITRForm:Upto15Of6>
            <ITRForm:Upto15Of9>0</ITRForm:Upto15Of9>
            <ITRForm:Up16Of9To15Of12>0</ITRForm:Up16Of9To15Of12>
            <ITRForm:Up16Of12To15Of3>0</ITRForm:Up16Of12To15Of3>
            <ITRForm:Up16Of3To31Of3>0</ITRForm:Up16Of3To31Of3>
          </ITRForm:DateRange>
        </ITRForm:LongTermUnder20Per>
        <ITRForm:LongTermUnderDTAARate>
          <ITRForm:DateRange>
            <ITRForm:Upto15Of6>0</ITRForm:Upto15Of6>
            <ITRForm:Upto15Of9>0</ITRForm:Upto15Of9>
            <ITRForm:Up16Of9To15Of12>0</ITRForm:Up16Of9To15Of12>
            <ITRForm:Up16Of12To15Of3>0</ITRForm:Up16Of12To15Of3>
            <ITRForm:Up16Of3To31Of3>0</ITRForm:Up16Of3To31Of3>
          </ITRForm:DateRange>
        </ITRForm:LongTermUnderDTAARate>
      </ITRForm:AccruOrRecOfCG>
    </ITRForm:ScheduleCGFor23>
    <ITRForm:Schedule112A>
      <ITRForm:Schedule112ADtls>
        <ITRForm:ISINCode>INE726G01019</ITRForm:ISINCode>
        <ITRForm:ShareUnitName>ICICIPRULI</ITRForm:ShareUnitName>
        <ITRForm:NumSharesUnits>6.00</ITRForm:NumSharesUnits>
        <ITRForm:SalePricePerShareUnit>514.00</ITRForm:SalePricePerShareUnit>
        <ITRForm:TotSaleValue>3084.00</ITRForm:TotSaleValue>
        <ITRForm:CostAcqWithoutIndx>1927</ITRForm:CostAcqWithoutIndx>
        <ITRForm:AcquisitionCost>1927</ITRForm:AcquisitionCost>
        <ITRForm:LTCGBeforelowerB1B2>0.00</ITRForm:LTCGBeforelowerB1B2>
        <ITRForm:FairMktValuePerShareunit>0</ITRForm:FairMktValuePerShareunit>
        <ITRForm:TotFairMktValueCapAst>0.00</ITRForm:TotFairMktValueCapAst>
        <ITRForm:ExpExclCnctTransfer>0</ITRForm:ExpExclCnctTransfer>
        <ITRForm:TotalDeductions>1927</ITRForm:TotalDeductions>
        <ITRForm:Balance>1157.00</ITRForm:Balance>
      </ITRForm:Schedule112ADtls>
      <ITRForm:Schedule112ADtls>
        <ITRForm:ISINCode>INE424H01027</ITRForm:ISINCode>
        <ITRForm:ShareUnitName>SUNTV</ITRForm:ShareUnitName>
        <ITRForm:NumSharesUnits>2.00</ITRForm:NumSharesUnits>
        <ITRForm:SalePricePerShareUnit>498.10</ITRForm:SalePricePerShareUnit>
        <ITRForm:TotSaleValue>996.20</ITRForm:TotSaleValue>
        <ITRForm:CostAcqWithoutIndx>1222</ITRForm:CostAcqWithoutIndx>
        <ITRForm:AcquisitionCost>1222</ITRForm:AcquisitionCost>
        <ITRForm:LTCGBeforelowerB1B2>0.00</ITRForm:LTCGBeforelowerB1B2>
        <ITRForm:FairMktValuePerShareunit>0</ITRForm:FairMktValuePerShareunit>
        <ITRForm:TotFairMktValueCapAst>0.00</ITRForm:TotFairMktValueCapAst>
        <ITRForm:ExpExclCnctTransfer>0</ITRForm:ExpExclCnctTransfer>
        <ITRForm:TotalDeductions>1222</ITRForm:TotalDeductions>
        <ITRForm:Balance>-225.80</ITRForm:Balance>
      </ITRForm:Schedule112ADtls>
      <ITRForm:Schedule112ADtls>
        <ITRForm:ISINCode>INE424H01027</ITRForm:ISINCode>
        <ITRForm:ShareUnitName>SUNTV</ITRForm:ShareUnitName>
        <ITRForm:NumSharesUnits>1.00</ITRForm:NumSharesUnits>
        <ITRForm:SalePricePerShareUnit>498.10</ITRForm:SalePricePerShareUnit>
        <ITRForm:TotSaleValue>498.10</ITRForm:TotSaleValue>
        <ITRForm:CostAcqWithoutIndx>611</ITRForm:CostAcqWithoutIndx>
        <ITRForm:AcquisitionCost>611</ITRForm:AcquisitionCost>
        <ITRForm:LTCGBeforelowerB1B2>0.00</ITRForm:LTCGBeforelowerB1B2>
        <ITRForm:FairMktValuePerShareunit>0</ITRForm:FairMktValuePerShareunit>
        <ITRForm:TotFairMktValueCapAst>0.00</ITRForm:TotFairMktValueCapAst>
        <ITRForm:ExpExclCnctTransfer>0</ITRForm:ExpExclCnctTransfer>
        <ITRForm:TotalDeductions>611</ITRForm:TotalDeductions>
        <ITRForm:Balance>-112.90</ITRForm:Balance>
      </ITRForm:Schedule112ADtls>
      <ITRForm:Schedule112ADtls>
        <ITRForm:ISINCode>INE424H01027</ITRForm:ISINCode>
        <ITRForm:ShareUnitName>SUNTV</ITRForm:ShareUnitName>
        <ITRForm:NumSharesUnits>3.00</ITRForm:NumSharesUnits>
        <ITRForm:SalePricePerShareUnit>498.10</ITRForm:SalePricePerShareUnit>
        <ITRForm:TotSaleValue>1494.30</ITRForm:TotSaleValue>
        <ITRForm:CostAcqWithoutIndx>1863</ITRForm:CostAcqWithoutIndx>
        <ITRForm:AcquisitionCost>1863</ITRForm:AcquisitionCost>
        <ITRForm:LTCGBeforelowerB1B2>0.00</ITRForm:LTCGBeforelowerB1B2>
        <ITRForm:FairMktValuePerShareunit>0</ITRForm:FairMktValuePerShareunit>
        <ITRForm:TotFairMktValueCapAst>0.00</ITRForm:TotFairMktValueCapAst>
        <ITRForm:ExpExclCnctTransfer>0</ITRForm:ExpExclCnctTransfer>
        <ITRForm:TotalDeductions>1863</ITRForm:TotalDeductions>
        <ITRForm:Balance>-368.70</ITRForm:Balance>
      </ITRForm:Schedule112ADtls>
      <ITRForm:Schedule112ADtls>
        <ITRForm:ISINCode>INE424H01027</ITRForm:ISINCode>
        <ITRForm:ShareUnitName>SUNTV</ITRForm:ShareUnitName>
        <ITRForm:NumSharesUnits>1.00</ITRForm:NumSharesUnits>
        <ITRForm:SalePricePerShareUnit>498.10</ITRForm:SalePricePerShareUnit>
        <ITRForm:TotSaleValue>498.10</ITRForm:TotSaleValue>
        <ITRForm:CostAcqWithoutIndx>577</ITRForm:CostAcqWithoutIndx>
        <ITRForm:AcquisitionCost>577</ITRForm:AcquisitionCost>
        <ITRForm:LTCGBeforelowerB1B2>0.00</ITRForm:LTCGBeforelowerB1B2>
        <ITRForm:FairMktValuePerShareunit>0</ITRForm:FairMktValuePerShareunit>
        <ITRForm:TotFairMktValueCapAst>0.00</ITRForm:TotFairMktValueCapAst>
        <ITRForm:ExpExclCnctTransfer>0</ITRForm:ExpExclCnctTransfer>
        <ITRForm:TotalDeductions>577</ITRForm:TotalDeductions>
        <ITRForm:Balance>-78.90</ITRForm:Balance>
      </ITRForm:Schedule112ADtls>
      <ITRForm:SaleValue112A>6570.70</ITRForm:SaleValue112A>
      <ITRForm:CostAcqWithoutIndx112A>6200</ITRForm:CostAcqWithoutIndx112A>
      <ITRForm:AcquisitionCost112A>6200</ITRForm:AcquisitionCost112A>
      <ITRForm:LTCGBeforelowerB1B2112A>0.00</ITRForm:LTCGBeforelowerB1B2112A>
      <ITRForm:FairMktValueCapAst112A>0.00</ITRForm:FairMktValueCapAst112A>
      <ITRForm:ExpExclCnctTransfer112A>0</ITRForm:ExpExclCnctTransfer112A>
      <ITRForm:Deductions112A>6200</ITRForm:Deductions112A>
      <ITRForm:Balance112A>370.70</ITRForm:Balance112A>
    </ITRForm:Schedule112A>
    <ITRForm:ScheduleOS>
      <ITRForm:IncOthThanOwnRaceHorse>
        <ITRForm:GrossIncChrgblTaxAtAppRate>29970</ITRForm:GrossIncChrgblTaxAtAppRate>
        <ITRForm:DividendGross>0</ITRForm:DividendGross>
        <ITRForm:InterestGross>0</ITRForm:InterestGross>
        <ITRForm:IntrstFrmSavingBank>0</ITRForm:IntrstFrmSavingBank>
        <ITRForm:IntrstFrmTermDeposit>0</ITRForm:IntrstFrmTermDeposit>
        <ITRForm:IntrstFrmIncmTaxRefund>0</ITRForm:IntrstFrmIncmTaxRefund>
        <ITRForm:NatofPassThrghIncome>0</ITRForm:NatofPassThrghIncome>
        <ITRForm:IntrstFrmOthers>0</ITRForm:IntrstFrmOthers>
        <ITRForm:RentFromMachPlantBldgs>0</ITRForm:RentFromMachPlantBldgs>
        <ITRForm:Tot562x>0</ITRForm:Tot562x>
        <ITRForm:Aggrtvaluewithoutcons562x>0</ITRForm:Aggrtvaluewithoutcons562x>
        <ITRForm:Immovpropwithoutcons562x>0</ITRForm:Immovpropwithoutcons562x>
        <ITRForm:Immovpropinadeqcons562x>0</ITRForm:Immovpropinadeqcons562x>
        <ITRForm:Anyotherpropwithoutcons562x>0</ITRForm:Anyotherpropwithoutcons562x>
        <ITRForm:Anyotherpropinadeqcons562x>0</ITRForm:Anyotherpropinadeqcons562x>
        <ITRForm:FamilyPension>0</ITRForm:FamilyPension>
        <ITRForm:AnyOtherIncome>29970</ITRForm:AnyOtherIncome>
        <ITRForm:OthersInc>
          <ITRForm:OthersIncDtls>
            <ITRForm:OthNatOfInc>Others</ITRForm:OthNatOfInc>
            <ITRForm:OthAmount>29970</ITRForm:OthAmount>
          </ITRForm:OthersIncDtls>
          <ITRForm:OthersIncDtls>
            <ITRForm:OthNatOfInc>NotInitialized</ITRForm:OthNatOfInc>
            <ITRForm:OthAmount>0</ITRForm:OthAmount>
          </ITRForm:OthersIncDtls>
        </ITRForm:OthersInc>
        <ITRForm:IncChargeableSpecialRates>0</ITRForm:IncChargeableSpecialRates>
        <ITRForm:LtryPzzlChrgblUs115BB>0</ITRForm:LtryPzzlChrgblUs115BB>
        <ITRForm:IncChrgblUs115BBE>0</ITRForm:IncChrgblUs115BBE>
        <ITRForm:CashCreditsUs68>0</ITRForm:CashCreditsUs68>
        <ITRForm:UnExplndInvstmntsUs69>0</ITRForm:UnExplndInvstmntsUs69>
        <ITRForm:UnExplndMoneyUs69A>0</ITRForm:UnExplndMoneyUs69A>
        <ITRForm:UnDsclsdInvstmntsUs69B>0</ITRForm:UnDsclsdInvstmntsUs69B>
        <ITRForm:UnExplndExpndtrUs69C>0</ITRForm:UnExplndExpndtrUs69C>
        <ITRForm:AmtBrwdRepaidOnHundiUs69D>0</ITRForm:AmtBrwdRepaidOnHundiUs69D>
        <ITRForm:TaxAccumulatedBalRecPF>
          <ITRForm:TotalIncomeBenefit>0</ITRForm:TotalIncomeBenefit>
          <ITRForm:TotalTaxBenefit>0</ITRForm:TotalTaxBenefit>
        </ITRForm:TaxAccumulatedBalRecPF>
        <ITRForm:OthersGross>0</ITRForm:OthersGross>
        <ITRForm:PassThrIncOSChrgblSplRate>0</ITRForm:PassThrIncOSChrgblSplRate>
        <ITRForm:IncChargblSplRateOS>
          <ITRForm:TotalAmtTaxUsDTAASchOs>0</ITRForm:TotalAmtTaxUsDTAASchOs>
        </ITRForm:IncChargblSplRateOS>
        <ITRForm:Deductions>
          <ITRForm:Expenses>0</ITRForm:Expenses>
          <ITRForm:DeductionUs57iia>0</ITRForm:DeductionUs57iia>
          <ITRForm:Depreciation>0</ITRForm:Depreciation>
          <ITRForm:TotDeductions>0</ITRForm:TotDeductions>
        </ITRForm:Deductions>
        <ITRForm:AmtNotDeductibleUs58>0</ITRForm:AmtNotDeductibleUs58>
        <ITRForm:ProfitChargTaxUs59>0</ITRForm:ProfitChargTaxUs59>
        <ITRForm:BalanceNoRaceHorse>29970</ITRForm:BalanceNoRaceHorse>
      </ITRForm:IncOthThanOwnRaceHorse>
      <ITRForm:TotOthSrcNoRaceHorse>29970</ITRForm:TotOthSrcNoRaceHorse>
      <ITRForm:IncFromOwnHorse>
        <ITRForm:Receipts>0</ITRForm:Receipts>
        <ITRForm:DeductSec57>0</ITRForm:DeductSec57>
        <ITRForm:AmtNotDeductibleUs58>0</ITRForm:AmtNotDeductibleUs58>
        <ITRForm:ProfitChargTaxUs59>0</ITRForm:ProfitChargTaxUs59>
        <ITRForm:BalanceOwnRaceHorse>0</ITRForm:BalanceOwnRaceHorse>
      </ITRForm:IncFromOwnHorse>
      <ITRForm:IncChargeable>29970</ITRForm:IncChargeable>
      <ITRForm:DividendIncUs115BBDA>
        <ITRForm:DateRange>
          <ITRForm:Upto15Of6>0</ITRForm:Upto15Of6>
          <ITRForm:Upto15Of9>0</ITRForm:Upto15Of9>
          <ITRForm:Up16Of9To15Of12>0</ITRForm:Up16Of9To15Of12>
          <ITRForm:Up16Of12To15Of3>0</ITRForm:Up16Of12To15Of3>
          <ITRForm:Up16Of3To31Of3>0</ITRForm:Up16Of3To31Of3>
        </ITRForm:DateRange>
      </ITRForm:DividendIncUs115BBDA>
      <ITRForm:IncFrmLottery>
        <ITRForm:DateRange>
          <ITRForm:Upto15Of6>0</ITRForm:Upto15Of6>
          <ITRForm:Upto15Of9>0</ITRForm:Upto15Of9>
          <ITRForm:Up16Of9To15Of12>0</ITRForm:Up16Of9To15Of12>
          <ITRForm:Up16Of12To15Of3>0</ITRForm:Up16Of12To15Of3>
          <ITRForm:Up16Of3To31Of3>0</ITRForm:Up16Of3To31Of3>
        </ITRForm:DateRange>
      </ITRForm:IncFrmLottery>
    </ITRForm:ScheduleOS>
    <ITRForm:ScheduleCYLA>
      <ITRForm:Salary>
        <ITRForm:IncCYLA>
          <ITRForm:IncOfCurYrUnderThatHead>1296040</ITRForm:IncOfCurYrUnderThatHead>
          <ITRForm:HPlossCurYrSetoff>0</ITRForm:HPlossCurYrSetoff>
          <ITRForm:OthSrcLossNoRaceHorseSetoff>0</ITRForm:OthSrcLossNoRaceHorseSetoff>
          <ITRForm:IncOfCurYrAfterSetOff>1296040</ITRForm:IncOfCurYrAfterSetOff>
        </ITRForm:IncCYLA>
      </ITRForm:Salary>
      <ITRForm:HP>
        <ITRForm:IncCYLA>
          <ITRForm:IncOfCurYrUnderThatHead>0</ITRForm:IncOfCurYrUnderThatHead>
          <ITRForm:OthSrcLossNoRaceHorseSetoff>0</ITRForm:OthSrcLossNoRaceHorseSetoff>
          <ITRForm:IncOfCurYrAfterSetOff>0</ITRForm:IncOfCurYrAfterSetOff>
        </ITRForm:IncCYLA>
      </ITRForm:HP>
      <ITRForm:STCG15Per>
        <ITRForm:IncCYLA>
          <ITRForm:IncOfCurYrUnderThatHead>11167</ITRForm:IncOfCurYrUnderThatHead>
          <ITRForm:HPlossCurYrSetoff>0</ITRForm:HPlossCurYrSetoff>
          <ITRForm:OthSrcLossNoRaceHorseSetoff>0</ITRForm:OthSrcLossNoRaceHorseSetoff>
          <ITRForm:IncOfCurYrAfterSetOff>11167</ITRForm:IncOfCurYrAfterSetOff>
        </ITRForm:IncCYLA>
      </ITRForm:STCG15Per>
      <ITRForm:STCG30Per>
        <ITRForm:IncCYLA>
          <ITRForm:IncOfCurYrUnderThatHead>0</ITRForm:IncOfCurYrUnderThatHead>
          <ITRForm:HPlossCurYrSetoff>0</ITRForm:HPlossCurYrSetoff>
          <ITRForm:OthSrcLossNoRaceHorseSetoff>0</ITRForm:OthSrcLossNoRaceHorseSetoff>
          <ITRForm:IncOfCurYrAfterSetOff>0</ITRForm:IncOfCurYrAfterSetOff>
        </ITRForm:IncCYLA>
      </ITRForm:STCG30Per>
      <ITRForm:STCGAppRate>
        <ITRForm:IncCYLA>
          <ITRForm:IncOfCurYrUnderThatHead>4811</ITRForm:IncOfCurYrUnderThatHead>
          <ITRForm:HPlossCurYrSetoff>0</ITRForm:HPlossCurYrSetoff>
          <ITRForm:OthSrcLossNoRaceHorseSetoff>0</ITRForm:OthSrcLossNoRaceHorseSetoff>
          <ITRForm:IncOfCurYrAfterSetOff>4811</ITRForm:IncOfCurYrAfterSetOff>
        </ITRForm:IncCYLA>
      </ITRForm:STCGAppRate>
      <ITRForm:STCGDTAARate>
        <ITRForm:IncCYLA>
          <ITRForm:IncOfCurYrUnderThatHead>0</ITRForm:IncOfCurYrUnderThatHead>
          <ITRForm:HPlossCurYrSetoff>0</ITRForm:HPlossCurYrSetoff>
          <ITRForm:OthSrcLossNoRaceHorseSetoff>0</ITRForm:OthSrcLossNoRaceHorseSetoff>
          <ITRForm:IncOfCurYrAfterSetOff>0</ITRForm:IncOfCurYrAfterSetOff>
        </ITRForm:IncCYLA>
      </ITRForm:STCGDTAARate>
      <ITRForm:LTCG10Per>
        <ITRForm:IncCYLA>
          <ITRForm:IncOfCurYrUnderThatHead>370</ITRForm:IncOfCurYrUnderThatHead>
          <ITRForm:HPlossCurYrSetoff>0</ITRForm:HPlossCurYrSetoff>
          <ITRForm:OthSrcLossNoRaceHorseSetoff>0</ITRForm:OthSrcLossNoRaceHorseSetoff>
          <ITRForm:IncOfCurYrAfterSetOff>370</ITRForm:IncOfCurYrAfterSetOff>
        </ITRForm:IncCYLA>
      </ITRForm:LTCG10Per>
      <ITRForm:LTCG20Per>
        <ITRForm:IncCYLA>
          <ITRForm:IncOfCurYrUnderThatHead>0</ITRForm:IncOfCurYrUnderThatHead>
          <ITRForm:HPlossCurYrSetoff>0</ITRForm:HPlossCurYrSetoff>
          <ITRForm:OthSrcLossNoRaceHorseSetoff>0</ITRForm:OthSrcLossNoRaceHorseSetoff>
          <ITRForm:IncOfCurYrAfterSetOff>0</ITRForm:IncOfCurYrAfterSetOff>
        </ITRForm:IncCYLA>
      </ITRForm:LTCG20Per>
      <ITRForm:LTCGDTAARate>
        <ITRForm:IncCYLA>
          <ITRForm:IncOfCurYrUnderThatHead>0</ITRForm:IncOfCurYrUnderThatHead>
          <ITRForm:HPlossCurYrSetoff>0</ITRForm:HPlossCurYrSetoff>
          <ITRForm:OthSrcLossNoRaceHorseSetoff>0</ITRForm:OthSrcLossNoRaceHorseSetoff>
          <ITRForm:IncOfCurYrAfterSetOff>0</ITRForm:IncOfCurYrAfterSetOff>
        </ITRForm:IncCYLA>
      </ITRForm:LTCGDTAARate>
      <ITRForm:OthSrcExclRaceHorse>
        <ITRForm:IncCYLA>
          <ITRForm:IncOfCurYrUnderThatHead>29970</ITRForm:IncOfCurYrUnderThatHead>
          <ITRForm:HPlossCurYrSetoff>0</ITRForm:HPlossCurYrSetoff>
          <ITRForm:IncOfCurYrAfterSetOff>29970</ITRForm:IncOfCurYrAfterSetOff>
        </ITRForm:IncCYLA>
      </ITRForm:OthSrcExclRaceHorse>
      <ITRForm:OthSrcRaceHorse>
        <ITRForm:IncCYLA>
          <ITRForm:IncOfCurYrUnderThatHead>0</ITRForm:IncOfCurYrUnderThatHead>
          <ITRForm:HPlossCurYrSetoff>0</ITRForm:HPlossCurYrSetoff>
          <ITRForm:OthSrcLossNoRaceHorseSetoff>0</ITRForm:OthSrcLossNoRaceHorseSetoff>
          <ITRForm:IncOfCurYrAfterSetOff>0</ITRForm:IncOfCurYrAfterSetOff>
        </ITRForm:IncCYLA>
      </ITRForm:OthSrcRaceHorse>
      <ITRForm:TotalCurYr>
        <ITRForm:TotHPlossCurYr>0</ITRForm:TotHPlossCurYr>
        <ITRForm:TotOthSrcLossNoRaceHorse>0</ITRForm:TotOthSrcLossNoRaceHorse>
      </ITRForm:TotalCurYr>
      <ITRForm:TotalLossSetOff>
        <ITRForm:TotHPlossCurYrSetoff>0</ITRForm:TotHPlossCurYrSetoff>
        <ITRForm:TotOthSrcLossNoRaceHorseSetoff>0</ITRForm:TotOthSrcLossNoRaceHorseSetoff>
      </ITRForm:TotalLossSetOff>
      <ITRForm:LossRemAftSetOff>
        <ITRForm:BalHPlossCurYrAftSetoff>0</ITRForm:BalHPlossCurYrAftSetoff>
        <ITRForm:BalOthSrcLossNoRaceHorseAftSetoff>0</ITRForm:BalOthSrcLossNoRaceHorseAftSetoff>
      </ITRForm:LossRemAftSetOff>
    </ITRForm:ScheduleCYLA>
    <ITRForm:ScheduleBFLA>
      <ITRForm:Salary>
        <ITRForm:IncBFLA>
          <ITRForm:IncOfCurYrUndHeadFromCYLA>1296040</ITRForm:IncOfCurYrUndHeadFromCYLA>
          <ITRForm:IncOfCurYrAfterSetOffBFLosses>1296040</ITRForm:IncOfCurYrAfterSetOffBFLosses>
        </ITRForm:IncBFLA>
      </ITRForm:Salary>
      <ITRForm:HP>
        <ITRForm:IncBFLA>
          <ITRForm:IncOfCurYrUndHeadFromCYLA>0</ITRForm:IncOfCurYrUndHeadFromCYLA>
          <ITRForm:BFlossPrevYrUndSameHeadSetoff>0</ITRForm:BFlossPrevYrUndSameHeadSetoff>
          <ITRForm:IncOfCurYrAfterSetOffBFLosses>0</ITRForm:IncOfCurYrAfterSetOffBFLosses>
        </ITRForm:IncBFLA>
      </ITRForm:HP>
      <ITRForm:STCG15Per>
        <ITRForm:IncBFLA>
          <ITRForm:IncOfCurYrUndHeadFromCYLA>11167</ITRForm:IncOfCurYrUndHeadFromCYLA>
          <ITRForm:BFlossPrevYrUndSameHeadSetoff>0</ITRForm:BFlossPrevYrUndSameHeadSetoff>
          <ITRForm:IncOfCurYrAfterSetOffBFLosses>11167</ITRForm:IncOfCurYrAfterSetOffBFLosses>
        </ITRForm:IncBFLA>
      </ITRForm:STCG15Per>
      <ITRForm:STCG30Per>
        <ITRForm:IncBFLA>
          <ITRForm:IncOfCurYrUndHeadFromCYLA>0</ITRForm:IncOfCurYrUndHeadFromCYLA>
          <ITRForm:BFlossPrevYrUndSameHeadSetoff>0</ITRForm:BFlossPrevYrUndSameHeadSetoff>
          <ITRForm:IncOfCurYrAfterSetOffBFLosses>0</ITRForm:IncOfCurYrAfterSetOffBFLosses>
        </ITRForm:IncBFLA>
      </ITRForm:STCG30Per>
      <ITRForm:STCGAppRate>
        <ITRForm:IncBFLA>
          <ITRForm:IncOfCurYrUndHeadFromCYLA>4811</ITRForm:IncOfCurYrUndHeadFromCYLA>
          <ITRForm:BFlossPrevYrUndSameHeadSetoff>0</ITRForm:BFlossPrevYrUndSameHeadSetoff>
          <ITRForm:IncOfCurYrAfterSetOffBFLosses>4811</ITRForm:IncOfCurYrAfterSetOffBFLosses>
        </ITRForm:IncBFLA>
      </ITRForm:STCGAppRate>
      <ITRForm:STCGDTAARate>
        <ITRForm:IncBFLA>
          <ITRForm:IncOfCurYrUndHeadFromCYLA>0</ITRForm:IncOfCurYrUndHeadFromCYLA>
          <ITRForm:BFlossPrevYrUndSameHeadSetoff>0</ITRForm:BFlossPrevYrUndSameHeadSetoff>
          <ITRForm:IncOfCurYrAfterSetOffBFLosses>0</ITRForm:IncOfCurYrAfterSetOffBFLosses>
        </ITRForm:IncBFLA>
      </ITRForm:STCGDTAARate>
      <ITRForm:LTCG10Per>
        <ITRForm:IncBFLA>
          <ITRForm:IncOfCurYrUndHeadFromCYLA>370</ITRForm:IncOfCurYrUndHeadFromCYLA>
          <ITRForm:BFlossPrevYrUndSameHeadSetoff>0</ITRForm:BFlossPrevYrUndSameHeadSetoff>
          <ITRForm:IncOfCurYrAfterSetOffBFLosses>370</ITRForm:IncOfCurYrAfterSetOffBFLosses>
        </ITRForm:IncBFLA>
      </ITRForm:LTCG10Per>
      <ITRForm:LTCG20Per>
        <ITRForm:IncBFLA>
          <ITRForm:IncOfCurYrUndHeadFromCYLA>0</ITRForm:IncOfCurYrUndHeadFromCYLA>
          <ITRForm:BFlossPrevYrUndSameHeadSetoff>0</ITRForm:BFlossPrevYrUndSameHeadSetoff>
          <ITRForm:IncOfCurYrAfterSetOffBFLosses>0</ITRForm:IncOfCurYrAfterSetOffBFLosses>
        </ITRForm:IncBFLA>
      </ITRForm:LTCG20Per>
      <ITRForm:LTCGDTAARate>
        <ITRForm:IncBFLA>
          <ITRForm:IncOfCurYrUndHeadFromCYLA>0</ITRForm:IncOfCurYrUndHeadFromCYLA>
          <ITRForm:BFlossPrevYrUndSameHeadSetoff>0</ITRForm:BFlossPrevYrUndSameHeadSetoff>
          <ITRForm:IncOfCurYrAfterSetOffBFLosses>0</ITRForm:IncOfCurYrAfterSetOffBFLosses>
        </ITRForm:IncBFLA>
      </ITRForm:LTCGDTAARate>
      <ITRForm:OthSrcExclRaceHorse>
        <ITRForm:IncBFLA>
          <ITRForm:IncOfCurYrUndHeadFromCYLA>29970</ITRForm:IncOfCurYrUndHeadFromCYLA>
          <ITRForm:IncOfCurYrAfterSetOffBFLosses>29970</ITRForm:IncOfCurYrAfterSetOffBFLosses>
        </ITRForm:IncBFLA>
      </ITRForm:OthSrcExclRaceHorse>
      <ITRForm:OthSrcRaceHorse>
        <ITRForm:IncBFLA>
          <ITRForm:IncOfCurYrUndHeadFromCYLA>0</ITRForm:IncOfCurYrUndHeadFromCYLA>
          <ITRForm:BFlossPrevYrUndSameHeadSetoff>0</ITRForm:BFlossPrevYrUndSameHeadSetoff>
          <ITRForm:IncOfCurYrAfterSetOffBFLosses>0</ITRForm:IncOfCurYrAfterSetOffBFLosses>
        </ITRForm:IncBFLA>
      </ITRForm:OthSrcRaceHorse>
      <ITRForm:TotalBFLossSetOff>
        <ITRForm:TotBFLossSetoff>0</ITRForm:TotBFLossSetoff>
      </ITRForm:TotalBFLossSetOff>
      <ITRForm:IncomeOfCurrYrAftCYLABFLA>1342358</ITRForm:IncomeOfCurrYrAftCYLABFLA>
    </ITRForm:ScheduleBFLA>
    <ITRForm:ScheduleVIA>
      <ITRForm:DepPayInvClmUndDednVIA>N</ITRForm:DepPayInvClmUndDednVIA>
      <ITRForm:UsrDeductUndChapVIA>
        <ITRForm:Section80C>150000</ITRForm:Section80C>
        <ITRForm:Section80CCD1B>50000</ITRForm:Section80CCD1B>
        <ITRForm:Section80D>50000</ITRForm:Section80D>
        <ITRForm:Section80DD>0</ITRForm:Section80DD>
        <ITRForm:Section80DDB>0</ITRForm:Section80DDB>
        <ITRForm:Section80EEA>0</ITRForm:Section80EEA>
        <ITRForm:Section80EEB>0</ITRForm:Section80EEB>
        <ITRForm:Section80G>0</ITRForm:Section80G>
        <ITRForm:Section80GG>0</ITRForm:Section80GG>
        <ITRForm:Section80GGA>0</ITRForm:Section80GGA>
        <ITRForm:Section80GGC>0</ITRForm:Section80GGC>
        <ITRForm:Section80UUsrType>1</ITRForm:Section80UUsrType>
        <ITRForm:Section80U>0</ITRForm:Section80U>
        <ITRForm:TotalChapVIADeductions>250000</ITRForm:TotalChapVIADeductions>
      </ITRForm:UsrDeductUndChapVIA>
      <ITRForm:DeductUndChapVIA>
        <ITRForm:Section80C>150000</ITRForm:Section80C>
        <ITRForm:Section80CCC>0</ITRForm:Section80CCC>
        <ITRForm:Section80CCDEmployeeOrSE>0</ITRForm:Section80CCDEmployeeOrSE>
        <ITRForm:Section80CCD1B>50000</ITRForm:Section80CCD1B>
        <ITRForm:Section80CCDEmployer>0</ITRForm:Section80CCDEmployer>
        <ITRForm:Section80D>50000</ITRForm:Section80D>
        <ITRForm:Section80DD>0</ITRForm:Section80DD>
        <ITRForm:Section80DDB>0</ITRForm:Section80DDB>
        <ITRForm:Section80E>0</ITRForm:Section80E>
        <ITRForm:Section80EE>0</ITRForm:Section80EE>
        <ITRForm:Section80EEA>0</ITRForm:Section80EEA>
        <ITRForm:Section80EEB>0</ITRForm:Section80EEB>
        <ITRForm:Section80G>0</ITRForm:Section80G>
        <ITRForm:Section80GG>0</ITRForm:Section80GG>
        <ITRForm:Section80GGA>0</ITRForm:Section80GGA>
        <ITRForm:Section80GGC>0</ITRForm:Section80GGC>
        <ITRForm:Section80U>0</ITRForm:Section80U>
        <ITRForm:Section80RRB>0</ITRForm:Section80RRB>
        <ITRForm:Section80QQB>0</ITRForm:Section80QQB>
        <ITRForm:Section80TTA>0</ITRForm:Section80TTA>
        <ITRForm:Section80TTB>0</ITRForm:Section80TTB>
        <ITRForm:TotalChapVIADeductions>250000</ITRForm:TotalChapVIADeductions>
      </ITRForm:DeductUndChapVIA>
    </ITRForm:ScheduleVIA>
    <ITRForm:Schedule80D>
      <ITRForm:Sec80DSelfFamSrCtznHealth>
        <ITRForm:SeniorCitizenFlag>N</ITRForm:SeniorCitizenFlag>
        <ITRForm:SelfAndFamily>25000</ITRForm:SelfAndFamily>
        <ITRForm:HealthInsPremSlfFam>22500</ITRForm:HealthInsPremSlfFam>
        <ITRForm:PrevHlthChckUpSlfFam>2500</ITRForm:PrevHlthChckUpSlfFam>
        <ITRForm:SelfAndFamilySeniorCitizen>0</ITRForm:SelfAndFamilySeniorCitizen>
        <ITRForm:HlthInsPremSlfFamSrCtzn>0</ITRForm:HlthInsPremSlfFamSrCtzn>
        <ITRForm:PrevHlthChckUpSlfFamSrCtzn>0</ITRForm:PrevHlthChckUpSlfFamSrCtzn>
        <ITRForm:MedicalExpSlfFamSrCtzn>0</ITRForm:MedicalExpSlfFamSrCtzn>
        <ITRForm:ParentsSeniorCitizenFlag>N</ITRForm:ParentsSeniorCitizenFlag>
        <ITRForm:Parents>25000</ITRForm:Parents>
        <ITRForm:HlthInsPremParents>22500</ITRForm:HlthInsPremParents>
        <ITRForm:PrevHlthChckUpParents>2500</ITRForm:PrevHlthChckUpParents>
        <ITRForm:ParentsSeniorCitizen>0</ITRForm:ParentsSeniorCitizen>
        <ITRForm:HlthInsPremParentsSrCtzn>0</ITRForm:HlthInsPremParentsSrCtzn>
        <ITRForm:PrevHlthChckUpParentsSrCtzn>0</ITRForm:PrevHlthChckUpParentsSrCtzn>
        <ITRForm:MedicalExpParentsSrCtzn>0</ITRForm:MedicalExpParentsSrCtzn>
        <ITRForm:EligibleAmountOfDedn>50000</ITRForm:EligibleAmountOfDedn>
      </ITRForm:Sec80DSelfFamSrCtznHealth>
    </ITRForm:Schedule80D>
    <ITRForm:ScheduleAMT>
      <ITRForm:TotalIncItemPartBTI>1092360</ITRForm:TotalIncItemPartBTI>
      <ITRForm:DeductionClaimUndrAnySec>0</ITRForm:DeductionClaimUndrAnySec>
      <ITRForm:AdjustedUnderSec115JC>1092360</ITRForm:AdjustedUnderSec115JC>
      <ITRForm:TaxPayableUnderSec115JC>0</ITRForm:TaxPayableUnderSec115JC>
    </ITRForm:ScheduleAMT>
    <ITRForm:ScheduleAMTC>
      <ITRForm:TaxSection115JC>0</ITRForm:TaxSection115JC>
      <ITRForm:TaxOthProvisions>143959</ITRForm:TaxOthProvisions>
      <ITRForm:AmtTaxCreditAvailable>143959</ITRForm:AmtTaxCreditAvailable>
      <ITRForm:ScheduleAMTCDtls>
        <ITRForm:AssYr>2013-14</ITRForm:AssYr>
        <ITRForm:Gross>0</ITRForm:Gross>
        <ITRForm:AmtCreditSetOfEy>0</ITRForm:AmtCreditSetOfEy>
        <ITRForm:AmtCreditBalBroughtFwd>0</ITRForm:AmtCreditBalBroughtFwd>
        <ITRForm:AmtCreditUtilized>0</ITRForm:AmtCreditUtilized>
        <ITRForm:BalAmtCreditCarryFwd>0</ITRForm:BalAmtCreditCarryFwd>
      </ITRForm:ScheduleAMTCDtls>
      <ITRForm:ScheduleAMTCDtls>
        <ITRForm:AssYr>2014-15</ITRForm:AssYr>
        <ITRForm:Gross>0</ITRForm:Gross>
        <ITRForm:AmtCreditSetOfEy>0</ITRForm:AmtCreditSetOfEy>
        <ITRForm:AmtCreditBalBroughtFwd>0</ITRForm:AmtCreditBalBroughtFwd>
        <ITRForm:AmtCreditUtilized>0</ITRForm:AmtCreditUtilized>
        <ITRForm:BalAmtCreditCarryFwd>0</ITRForm:BalAmtCreditCarryFwd>
      </ITRForm:ScheduleAMTCDtls>
      <ITRForm:ScheduleAMTCDtls>
        <ITRForm:AssYr>2015-16</ITRForm:AssYr>
        <ITRForm:Gross>0</ITRForm:Gross>
        <ITRForm:AmtCreditSetOfEy>0</ITRForm:AmtCreditSetOfEy>
        <ITRForm:AmtCreditBalBroughtFwd>0</ITRForm:AmtCreditBalBroughtFwd>
        <ITRForm:AmtCreditUtilized>0</ITRForm:AmtCreditUtilized>
        <ITRForm:BalAmtCreditCarryFwd>0</ITRForm:BalAmtCreditCarryFwd>
      </ITRForm:ScheduleAMTCDtls>
      <ITRForm:ScheduleAMTCDtls>
        <ITRForm:AssYr>2016-17</ITRForm:AssYr>
        <ITRForm:Gross>0</ITRForm:Gross>
        <ITRForm:AmtCreditSetOfEy>0</ITRForm:AmtCreditSetOfEy>
        <ITRForm:AmtCreditBalBroughtFwd>0</ITRForm:AmtCreditBalBroughtFwd>
        <ITRForm:AmtCreditUtilized>0</ITRForm:AmtCreditUtilized>
        <ITRForm:BalAmtCreditCarryFwd>0</ITRForm:BalAmtCreditCarryFwd>
      </ITRForm:ScheduleAMTCDtls>
      <ITRForm:ScheduleAMTCDtls>
        <ITRForm:AssYr>2017-18</ITRForm:AssYr>
        <ITRForm:Gross>0</ITRForm:Gross>
        <ITRForm:AmtCreditSetOfEy>0</ITRForm:AmtCreditSetOfEy>
        <ITRForm:AmtCreditBalBroughtFwd>0</ITRForm:AmtCreditBalBroughtFwd>
        <ITRForm:AmtCreditUtilized>0</ITRForm:AmtCreditUtilized>
        <ITRForm:BalAmtCreditCarryFwd>0</ITRForm:BalAmtCreditCarryFwd>
      </ITRForm:ScheduleAMTCDtls>
      <ITRForm:ScheduleAMTCDtls>
        <ITRForm:AssYr>2018-19</ITRForm:AssYr>
        <ITRForm:Gross>0</ITRForm:Gross>
        <ITRForm:AmtCreditSetOfEy>0</ITRForm:AmtCreditSetOfEy>
        <ITRForm:AmtCreditBalBroughtFwd>0</ITRForm:AmtCreditBalBroughtFwd>
        <ITRForm:AmtCreditUtilized>0</ITRForm:AmtCreditUtilized>
        <ITRForm:BalAmtCreditCarryFwd>0</ITRForm:BalAmtCreditCarryFwd>
      </ITRForm:ScheduleAMTCDtls>
      <ITRForm:ScheduleAMTCDtls>
        <ITRForm:AssYr>2019-20</ITRForm:AssYr>
        <ITRForm:Gross>0</ITRForm:Gross>
        <ITRForm:AmtCreditSetOfEy>0</ITRForm:AmtCreditSetOfEy>
        <ITRForm:AmtCreditBalBroughtFwd>0</ITRForm:AmtCreditBalBroughtFwd>
        <ITRForm:AmtCreditUtilized>0</ITRForm:AmtCreditUtilized>
        <ITRForm:BalAmtCreditCarryFwd>0</ITRForm:BalAmtCreditCarryFwd>
      </ITRForm:ScheduleAMTCDtls>
      <ITRForm:CurrAssYr>2020-21</ITRForm:CurrAssYr>
      <ITRForm:CurrYrAmtCreditFwd>0</ITRForm:CurrYrAmtCreditFwd>
      <ITRForm:CurrYrCreditCarryFwd>0</ITRForm:CurrYrCreditCarryFwd>
      <ITRForm:TotAMTGross>0</ITRForm:TotAMTGross>
      <ITRForm:TotSetOffEys>0</ITRForm:TotSetOffEys>
      <ITRForm:TotBalBF>0</ITRForm:TotBalBF>
      <ITRForm:TotAmtCreditUtilisedCY>0</ITRForm:TotAmtCreditUtilisedCY>
      <ITRForm:TotBalAMTCreditCF>0</ITRForm:TotBalAMTCreditCF>
      <ITRForm:TaxSection115JD>0</ITRForm:TaxSection115JD>
      <ITRForm:AmtLiabilityAvailable>0</ITRForm:AmtLiabilityAvailable>
    </ITRForm:ScheduleAMTC>
    <ITRForm:ScheduleSI>
      <ITRForm:SplCodeRateTax>
        <ITRForm:SecCode>1</ITRForm:SecCode>
        <ITRForm:SplRatePercent>1</ITRForm:SplRatePercent>
        <ITRForm:SplRateInc>0</ITRForm:SplRateInc>
        <ITRForm:SplRateIncTax>0</ITRForm:SplRateIncTax>
      </ITRForm:SplCodeRateTax>
      <ITRForm:SplCodeRateTax>
        <ITRForm:SecCode>1A</ITRForm:SecCode>
        <ITRForm:SplRatePercent>15</ITRForm:SplRatePercent>
        <ITRForm:SplRateInc>11167</ITRForm:SplRateInc>
        <ITRForm:SplRateIncTax>1675</ITRForm:SplRateIncTax>
      </ITRForm:SplCodeRateTax>
      <ITRForm:SplCodeRateTax>
        <ITRForm:SecCode>21</ITRForm:SecCode>
        <ITRForm:SplRatePercent>20</ITRForm:SplRatePercent>
        <ITRForm:SplRateInc>0</ITRForm:SplRateInc>
        <ITRForm:SplRateIncTax>0</ITRForm:SplRateIncTax>
      </ITRForm:SplCodeRateTax>
      <ITRForm:SplCodeRateTax>
        <ITRForm:SecCode>22</ITRForm:SecCode>
        <ITRForm:SplRatePercent>10</ITRForm:SplRatePercent>
        <ITRForm:SplRateInc>0</ITRForm:SplRateInc>
        <ITRForm:SplRateIncTax>0</ITRForm:SplRateIncTax>
      </ITRForm:SplCodeRateTax>
      <ITRForm:SplCodeRateTax>
        <ITRForm:SecCode>21ciii</ITRForm:SecCode>
        <ITRForm:SplRatePercent>10</ITRForm:SplRatePercent>
        <ITRForm:SplRateInc>0</ITRForm:SplRateInc>
        <ITRForm:SplRateIncTax>0</ITRForm:SplRateIncTax>
      </ITRForm:SplCodeRateTax>
      <ITRForm:SplCodeRateTax>
        <ITRForm:SecCode>2A</ITRForm:SecCode>
        <ITRForm:SplRatePercent>10</ITRForm:SplRatePercent>
        <ITRForm:SplRateInc>370</ITRForm:SplRateInc>
        <ITRForm:SplRateIncTax>0</ITRForm:SplRateIncTax>
      </ITRForm:SplCodeRateTax>
      <ITRForm:SplCodeRateTax>
        <ITRForm:SecCode>5BB</ITRForm:SecCode>
        <ITRForm:SplRatePercent>30</ITRForm:SplRatePercent>
        <ITRForm:SplRateInc>0</ITRForm:SplRateInc>
        <ITRForm:SplRateIncTax>0</ITRForm:SplRateIncTax>
      </ITRForm:SplCodeRateTax>
      <ITRForm:SplCodeRateTax>
        <ITRForm:SecCode>5ADii</ITRForm:SecCode>
        <ITRForm:SplRatePercent>30</ITRForm:SplRatePercent>
        <ITRForm:SplRateInc>0</ITRForm:SplRateInc>
        <ITRForm:SplRateIncTax>0</ITRForm:SplRateIncTax>
      </ITRForm:SplCodeRateTax>
      <ITRForm:SplCodeRateTax>
        <ITRForm:SecCode>5ADiiiP</ITRForm:SecCode>
        <ITRForm:SplRatePercent>10</ITRForm:SplRatePercent>
        <ITRForm:SplRateInc>0</ITRForm:SplRateInc>
        <ITRForm:SplRateIncTax>0</ITRForm:SplRateIncTax>
      </ITRForm:SplCodeRateTax>
      <ITRForm:SplCodeRateTax>
        <ITRForm:SecCode>DTAASTCG</ITRForm:SecCode>
        <ITRForm:SplRatePercent>1</ITRForm:SplRatePercent>
        <ITRForm:SplRateInc>0</ITRForm:SplRateInc>
        <ITRForm:SplRateIncTax>0</ITRForm:SplRateIncTax>
      </ITRForm:SplCodeRateTax>
      <ITRForm:SplCodeRateTax>
        <ITRForm:SecCode>DTAALTCG</ITRForm:SecCode>
        <ITRForm:SplRatePercent>1</ITRForm:SplRatePercent>
        <ITRForm:SplRateInc>0</ITRForm:SplRateInc>
        <ITRForm:SplRateIncTax>0</ITRForm:SplRateIncTax>
      </ITRForm:SplCodeRateTax>
      <ITRForm:SplCodeRateTax>
        <ITRForm:SecCode>DTAAOS</ITRForm:SecCode>
        <ITRForm:SplRatePercent>1</ITRForm:SplRatePercent>
        <ITRForm:SplRateInc>0</ITRForm:SplRateInc>
        <ITRForm:SplRateIncTax>0</ITRForm:SplRateIncTax>
      </ITRForm:SplCodeRateTax>
      <ITRForm:TotSplRateInc>11537</ITRForm:TotSplRateInc>
      <ITRForm:TotSplRateIncTax>1675</ITRForm:TotSplRateIncTax>
    </ITRForm:ScheduleSI>
    <ITRForm:ScheduleEI>
      <ITRForm:NetAgriIncOrOthrIncRule7>0</ITRForm:NetAgriIncOrOthrIncRule7>
      <ITRForm:OthersInc>
      </ITRForm:OthersInc>
      <ITRForm:Others>0</ITRForm:Others>
      <ITRForm:IncNotChrgblToTax>0</ITRForm:IncNotChrgblToTax>
      <ITRForm:PassThrIncNotChrgblTax>0</ITRForm:PassThrIncNotChrgblTax>
      <ITRForm:TotalExemptInc>0</ITRForm:TotalExemptInc>
    </ITRForm:ScheduleEI>
    <ITRForm:ScheduleDI>
      <ITRForm:DeductionUndChapVIA>
        <ITRForm:Section>80C</ITRForm:Section>
        <ITRForm:EligibleAmount>0</ITRForm:EligibleAmount>
        <ITRForm:DeductionAttribute>0</ITRForm:DeductionAttribute>
      </ITRForm:DeductionUndChapVIA>
      <ITRForm:DeductionUndChapVIA>
        <ITRForm:Section>80CCC</ITRForm:Section>
        <ITRForm:EligibleAmount>0</ITRForm:EligibleAmount>
        <ITRForm:DeductionAttribute>0</ITRForm:DeductionAttribute>
      </ITRForm:DeductionUndChapVIA>
      <ITRForm:DeductionUndChapVIA>
        <ITRForm:Section>80CCD_SE</ITRForm:Section>
        <ITRForm:EligibleAmount>0</ITRForm:EligibleAmount>
        <ITRForm:DeductionAttribute>0</ITRForm:DeductionAttribute>
      </ITRForm:DeductionUndChapVIA>
      <ITRForm:DeductionUndChapVIA>
        <ITRForm:Section>80CCD1B</ITRForm:Section>
        <ITRForm:EligibleAmount>0</ITRForm:EligibleAmount>
        <ITRForm:DeductionAttribute>0</ITRForm:DeductionAttribute>
      </ITRForm:DeductionUndChapVIA>
      <ITRForm:DeductionUndChapVIA>
        <ITRForm:Section>80CCDEmp</ITRForm:Section>
        <ITRForm:EligibleAmount>0</ITRForm:EligibleAmount>
        <ITRForm:DeductionAttribute>0</ITRForm:DeductionAttribute>
      </ITRForm:DeductionUndChapVIA>
      <ITRForm:DeductionUndChapVIA>
        <ITRForm:Section>80D</ITRForm:Section>
        <ITRForm:EligibleAmount>0</ITRForm:EligibleAmount>
        <ITRForm:DeductionAttribute>0</ITRForm:DeductionAttribute>
      </ITRForm:DeductionUndChapVIA>
      <ITRForm:DeductionUndChapVIA>
        <ITRForm:Section>80DD</ITRForm:Section>
        <ITRForm:EligibleAmount>0</ITRForm:EligibleAmount>
        <ITRForm:DeductionAttribute>0</ITRForm:DeductionAttribute>
      </ITRForm:DeductionUndChapVIA>
      <ITRForm:DeductionUndChapVIA>
        <ITRForm:Section>80DDB</ITRForm:Section>
        <ITRForm:EligibleAmount>0</ITRForm:EligibleAmount>
        <ITRForm:DeductionAttribute>0</ITRForm:DeductionAttribute>
      </ITRForm:DeductionUndChapVIA>
      <ITRForm:DeductionUndChapVIA>
        <ITRForm:Section>80E</ITRForm:Section>
        <ITRForm:EligibleAmount>0</ITRForm:EligibleAmount>
        <ITRForm:DeductionAttribute>0</ITRForm:DeductionAttribute>
      </ITRForm:DeductionUndChapVIA>
      <ITRForm:DeductionUndChapVIA>
        <ITRForm:Section>80EE</ITRForm:Section>
        <ITRForm:EligibleAmount>0</ITRForm:EligibleAmount>
        <ITRForm:DeductionAttribute>0</ITRForm:DeductionAttribute>
      </ITRForm:DeductionUndChapVIA>
      <ITRForm:DeductionUndChapVIA>
        <ITRForm:Section>80EEA</ITRForm:Section>
        <ITRForm:EligibleAmount>0</ITRForm:EligibleAmount>
        <ITRForm:DeductionAttribute>0</ITRForm:DeductionAttribute>
      </ITRForm:DeductionUndChapVIA>
      <ITRForm:DeductionUndChapVIA>
        <ITRForm:Section>80EEB</ITRForm:Section>
        <ITRForm:EligibleAmount>0</ITRForm:EligibleAmount>
        <ITRForm:DeductionAttribute>0</ITRForm:DeductionAttribute>
      </ITRForm:DeductionUndChapVIA>
      <ITRForm:DeductionUndChapVIA>
        <ITRForm:Section>80G</ITRForm:Section>
        <ITRForm:EligibleAmount>0</ITRForm:EligibleAmount>
        <ITRForm:DeductionAttribute>0</ITRForm:DeductionAttribute>
      </ITRForm:DeductionUndChapVIA>
      <ITRForm:DeductionUndChapVIA>
        <ITRForm:Section>80GG</ITRForm:Section>
        <ITRForm:EligibleAmount>0</ITRForm:EligibleAmount>
        <ITRForm:DeductionAttribute>0</ITRForm:DeductionAttribute>
      </ITRForm:DeductionUndChapVIA>
      <ITRForm:DeductionUndChapVIA>
        <ITRForm:Section>80GGA</ITRForm:Section>
        <ITRForm:EligibleAmount>0</ITRForm:EligibleAmount>
        <ITRForm:DeductionAttribute>0</ITRForm:DeductionAttribute>
      </ITRForm:DeductionUndChapVIA>
      <ITRForm:DeductionUndChapVIA>
        <ITRForm:Section>80GGC</ITRForm:Section>
        <ITRForm:EligibleAmount>0</ITRForm:EligibleAmount>
        <ITRForm:DeductionAttribute>0</ITRForm:DeductionAttribute>
      </ITRForm:DeductionUndChapVIA>
      <ITRForm:TotalEligibleAmount>0</ITRForm:TotalEligibleAmount>
      <ITRForm:TotalDeductionAttribute>0</ITRForm:TotalDeductionAttribute>
      <ITRForm:LongTermCapitalGain>
        <ITRForm:Section>54</ITRForm:Section>
        <ITRForm:AmountUtilizedCG>0</ITRForm:AmountUtilizedCG>
        <ITRForm:AmountUtilized>0</ITRForm:AmountUtilized>
      </ITRForm:LongTermCapitalGain>
      <ITRForm:LongTermCapitalGain>
        <ITRForm:Section>54B</ITRForm:Section>
        <ITRForm:AmountUtilizedCG>0</ITRForm:AmountUtilizedCG>
        <ITRForm:AmountUtilized>0</ITRForm:AmountUtilized>
      </ITRForm:LongTermCapitalGain>
      <ITRForm:LongTermCapitalGain>
        <ITRForm:Section>54F</ITRForm:Section>
        <ITRForm:AmountUtilizedCG>0</ITRForm:AmountUtilizedCG>
        <ITRForm:AmountUtilized>0</ITRForm:AmountUtilized>
      </ITRForm:LongTermCapitalGain>
      <ITRForm:LongTermCapitalGain>
        <ITRForm:Section>54GB</ITRForm:Section>
        <ITRForm:AmountUtilizedCG>0</ITRForm:AmountUtilizedCG>
        <ITRForm:AmountUtilized>0</ITRForm:AmountUtilized>
      </ITRForm:LongTermCapitalGain>
      <ITRForm:TotalAmountUtilizedCGLTCG>0</ITRForm:TotalAmountUtilizedCGLTCG>
      <ITRForm:TotalAmountUtilizedLTCG>0</ITRForm:TotalAmountUtilizedLTCG>
      <ITRForm:ShortTermCapitalGain>
        <ITRForm:Section>54B</ITRForm:Section>
        <ITRForm:AmountUtilizedCG>0</ITRForm:AmountUtilizedCG>
        <ITRForm:AmountUtilized>0</ITRForm:AmountUtilized>
      </ITRForm:ShortTermCapitalGain>
      <ITRForm:TotalAmountUtilizedCGSTCG>0</ITRForm:TotalAmountUtilizedCGSTCG>
      <ITRForm:TotalAmountUtilizedSTCG>0</ITRForm:TotalAmountUtilizedSTCG>
    </ITRForm:ScheduleDI>
    <ITRForm:PartB-TI>
      <ITRForm:Salaries>1296040</ITRForm:Salaries>
      <ITRForm:IncomeFromHP>0</ITRForm:IncomeFromHP>
      <ITRForm:CapGain>
        <ITRForm:ShortTerm>
          <ITRForm:ShortTerm15Per>11167</ITRForm:ShortTerm15Per>
          <ITRForm:ShortTerm30Per>0</ITRForm:ShortTerm30Per>
          <ITRForm:ShortTermAppRate>4811</ITRForm:ShortTermAppRate>
          <ITRForm:ShortTermSplRateDTAA>0</ITRForm:ShortTermSplRateDTAA>
          <ITRForm:TotalShortTerm>15978</ITRForm:TotalShortTerm>
        </ITRForm:ShortTerm>
        <ITRForm:LongTerm>
          <ITRForm:LongTerm10Per>370</ITRForm:LongTerm10Per>
          <ITRForm:LongTerm20Per>0</ITRForm:LongTerm20Per>
          <ITRForm:LongTermSplRateDTAA>0</ITRForm:LongTermSplRateDTAA>
          <ITRForm:TotalLongTerm>370</ITRForm:TotalLongTerm>
        </ITRForm:LongTerm>
        <ITRForm:TotalCapGains>16348</ITRForm:TotalCapGains>
      </ITRForm:CapGain>
      <ITRForm:IncFromOS>
        <ITRForm:OtherSrcThanOwnRaceHorse>29970</ITRForm:OtherSrcThanOwnRaceHorse>
        <ITRForm:IncChargblSplRate>0</ITRForm:IncChargblSplRate>
        <ITRForm:FromOwnRaceHorse>0</ITRForm:FromOwnRaceHorse>
        <ITRForm:TotIncFromOS>29970</ITRForm:TotIncFromOS>
      </ITRForm:IncFromOS>
      <ITRForm:TotalTI>1342358</ITRForm:TotalTI>
      <ITRForm:CurrentYearLoss>0</ITRForm:CurrentYearLoss>
      <ITRForm:BalanceAfterSetoffLosses>1342358</ITRForm:BalanceAfterSetoffLosses>
      <ITRForm:BroughtFwdLossesSetoff>0</ITRForm:BroughtFwdLossesSetoff>
      <ITRForm:GrossTotalIncome>1342358</ITRForm:GrossTotalIncome>
      <ITRForm:IncChargeTaxSplRate111A112>11537</ITRForm:IncChargeTaxSplRate111A112>
      <ITRForm:DeductionsUnderScheduleVIA>250000</ITRForm:DeductionsUnderScheduleVIA>
      <ITRForm:TotalIncome>1092360</ITRForm:TotalIncome>
      <ITRForm:IncChargeableTaxSplRates>11537</ITRForm:IncChargeableTaxSplRates>
      <ITRForm:NetAgricultureIncomeOrOtherIncomeForRate>0</ITRForm:NetAgricultureIncomeOrOtherIncomeForRate>
      <ITRForm:AggregateIncome>1080823</ITRForm:AggregateIncome>
      <ITRForm:LossesOfCurrentYearCarriedFwd>0</ITRForm:LossesOfCurrentYearCarriedFwd>
      <ITRForm:DeemedIncomeUs115JC>1092360</ITRForm:DeemedIncomeUs115JC>
    </ITRForm:PartB-TI>
    <ITRForm:PartB_TTI>
      <ITRForm:TaxPayDeemedTotIncUs115JC>0</ITRForm:TaxPayDeemedTotIncUs115JC>
      <ITRForm:Surcharge>0</ITRForm:Surcharge>
      <ITRForm:HealthEduCess>0</ITRForm:HealthEduCess>
      <ITRForm:TotalTaxPayablDeemedTotInc>0</ITRForm:TotalTaxPayablDeemedTotInc>
      <ITRForm:ComputationOfTaxLiability>
        <ITRForm:TaxPayableOnTI>
          <ITRForm:TaxAtNormalRatesOnAggrInc>136747</ITRForm:TaxAtNormalRatesOnAggrInc>
          <ITRForm:TaxAtSpecialRates>1675</ITRForm:TaxAtSpecialRates>
          <ITRForm:RebateOnAgriInc>0</ITRForm:RebateOnAgriInc>
          <ITRForm:TaxPayableOnTotInc>138422</ITRForm:TaxPayableOnTotInc>
        </ITRForm:TaxPayableOnTI>
        <ITRForm:Rebate87A>0</ITRForm:Rebate87A>
        <ITRForm:TaxPayableOnRebate>138422</ITRForm:TaxPayableOnRebate>
        <ITRForm:Surcharge25ofSI>0</ITRForm:Surcharge25ofSI>
        <ITRForm:SurchargeOnAboveCrore>0</ITRForm:SurchargeOnAboveCrore>
        <ITRForm:TotalSurcharge>0</ITRForm:TotalSurcharge>
        <ITRForm:EducationCess>5537</ITRForm:EducationCess>
        <ITRForm:GrossTaxLiability>143959</ITRForm:GrossTaxLiability>
        <ITRForm:GrossTaxPayable>143959</ITRForm:GrossTaxPayable>
        <ITRForm:CreditUS115JD>0</ITRForm:CreditUS115JD>
        <ITRForm:TaxPayAfterCreditUs115JD>143959</ITRForm:TaxPayAfterCreditUs115JD>
        <ITRForm:TaxRelief>
          <ITRForm:Section89>0</ITRForm:Section89>
          <ITRForm:Section90>0</ITRForm:Section90>
          <ITRForm:Section91>0</ITRForm:Section91>
          <ITRForm:TotTaxRelief>0</ITRForm:TotTaxRelief>
        </ITRForm:TaxRelief>
        <ITRForm:NetTaxLiability>143959</ITRForm:NetTaxLiability>
        <ITRForm:IntrstPay>
          <ITRForm:IntrstPayUs234A>0</ITRForm:IntrstPayUs234A>
          <ITRForm:IntrstPayUs234B>0</ITRForm:IntrstPayUs234B>
          <ITRForm:IntrstPayUs234C>0</ITRForm:IntrstPayUs234C>
          <ITRForm:LateFilingFee234F>0</ITRForm:LateFilingFee234F>
          <ITRForm:TotalIntrstPay>0</ITRForm:TotalIntrstPay>
        </ITRForm:IntrstPay>
        <ITRForm:AggregateTaxInterestLiability>143959</ITRForm:AggregateTaxInterestLiability>
      </ITRForm:ComputationOfTaxLiability>
      <ITRForm:TaxPaid>
        <ITRForm:TaxesPaid>
          <ITRForm:AdvanceTax>0</ITRForm:AdvanceTax>
          <ITRForm:TDS>134423</ITRForm:TDS>
          <ITRForm:TCS>0</ITRForm:TCS>
          <ITRForm:SelfAssessmentTax>9545</ITRForm:SelfAssessmentTax>
          <ITRForm:TotalTaxesPaid>143968</ITRForm:TotalTaxesPaid>
        </ITRForm:TaxesPaid>
        <ITRForm:BalTaxPayable>0</ITRForm:BalTaxPayable>
      </ITRForm:TaxPaid>
      <ITRForm:Refund>
        <ITRForm:RefundDue>10</ITRForm:RefundDue>
        <ITRForm:BankAccountDtls>
          <ITRForm:BankDtlsFlag>Y</ITRForm:BankDtlsFlag>
          <ITRForm:AddtnlBankDetails>
            <ITRForm:IFSCCode>CITI0000004</ITRForm:IFSCCode>
            <ITRForm:BankName>CITIBANK</ITRForm:BankName>
            <ITRForm:BankAccountNo>5309495813</ITRForm:BankAccountNo>
            <ITRForm:UseForRefund>false</ITRForm:UseForRefund>
          </ITRForm:AddtnlBankDetails>
          <ITRForm:AddtnlBankDetails>
            <ITRForm:IFSCCode>SBIN0013159</ITRForm:IFSCCode>
            <ITRForm:BankName>State Bank of India</ITRForm:BankName>
            <ITRForm:BankAccountNo>20162498841</ITRForm:BankAccountNo>
            <ITRForm:UseForRefund>true</ITRForm:UseForRefund>
          </ITRForm:AddtnlBankDetails>
        </ITRForm:BankAccountDtls>
      </ITRForm:Refund>
      <ITRForm:AssetOutIndiaFlag>NO</ITRForm:AssetOutIndiaFlag>
    </ITRForm:PartB_TTI>
    <ITRForm:ScheduleIT>
      <ITRForm:TaxPayment>
        <ITRForm:BSRCode>0013283</ITRForm:BSRCode>
        <ITRForm:DateDep>2020-09-14</ITRForm:DateDep>
        <ITRForm:SrlNoOfChaln>119</ITRForm:SrlNoOfChaln>
        <ITRForm:Amt>9545</ITRForm:Amt>
      </ITRForm:TaxPayment>
      <ITRForm:TotalTaxPayments>9545</ITRForm:TotalTaxPayments>
    </ITRForm:ScheduleIT>
    <ITRForm:ScheduleTDS1>
      <ITRForm:TDSonSalary>
        <ITRForm:EmployerOrDeductorOrCollectDetl>
          <ITRForm:TAN>HYDR09831D</ITRForm:TAN>
          <ITRForm:EmployerOrDeductorOrCollecterName>ROPPEN TRANSPORTATION SERVICES PRIVATE LIMITED</ITRForm:EmployerOrDeductorOrCollecterName>
        </ITRForm:EmployerOrDeductorOrCollectDetl>
        <ITRForm:IncChrgSal>1296040</ITRForm:IncChrgSal>
        <ITRForm:TotalTDSSal>132924</ITRForm:TotalTDSSal>
      </ITRForm:TDSonSalary>
      <ITRForm:TotalTDSonSalaries>132924</ITRForm:TotalTDSonSalaries>
    </ITRForm:ScheduleTDS1>
    <ITRForm:ScheduleTDS2>
      <ITRForm:TDSOthThanSalaryDtls>
        <ITRForm:TDSCreditName>S</ITRForm:TDSCreditName>
        <ITRForm:TANOfDeductor>PNEA03242B</ITRForm:TANOfDeductor>
        <ITRForm:TaxDeductCreditDtls>
          <ITRForm:TaxDeductedOwnHands>1499</ITRForm:TaxDeductedOwnHands>
          <ITRForm:TaxClaimedOwnHands>1499</ITRForm:TaxClaimedOwnHands>
        </ITRForm:TaxDeductCreditDtls>
        <ITRForm:GrossAmount>29970</ITRForm:GrossAmount>
        <ITRForm:HeadOfIncome>OS</ITRForm:HeadOfIncome>
        <ITRForm:AmtCarriedFwd>0</ITRForm:AmtCarriedFwd>
      </ITRForm:TDSOthThanSalaryDtls>
      <ITRForm:TotalTDSonOthThanSals>1499</ITRForm:TotalTDSonOthThanSals>
    </ITRForm:ScheduleTDS2>
    <ITRForm:Verification>
      <ITRForm:Declaration>
        <ITRForm:AssesseeVerName>SIDDHARTH KUMAR</ITRForm:AssesseeVerName>
        <ITRForm:FatherName>VIMALENDU BHUSHAN KUMAR</ITRForm:FatherName>
        <ITRForm:AssesseeVerPAN>CLCPK8184N</ITRForm:AssesseeVerPAN>
      </ITRForm:Declaration>
      <ITRForm:Capacity>S</ITRForm:Capacity>
    </ITRForm:Verification>
  </ITR2FORM:ITR2>
</ITRETURN:ITR>
""";
}
