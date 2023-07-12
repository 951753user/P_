import 'package:flutter/material.dart';
import 'package:payment_app/helper/json_creator.dart';

class PrintedData extends StatelessWidget {
  const PrintedData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SelectableText(paymentJson),
    );
  }
}

/*
{
  "ITR": {
    "ITR2": {
      "CreationInfo": {
        "SWVersionNo": "2.22.7.1",
        "SWCreatedBy": "SW20000126",
        "JSONCreatedBy": "SW20000126",
        "JSONCreationDate": "2022-07-19",
        "IntermediaryCity": "JAIPUR",
        "Digest": "WOaFc5+pcUalhBORI5EAOdDHY0Ui1ok4wHTs4S3Ghro="
      },
      "Form_ITR2": {
        "FormName": "ITR-2",
        "Description": "For Individuals and HUFs not having income from profits and gains of business or profession",
        "AssessmentYear": "2022",
        "SchemaVer": "Ver1.0",
        "FormVer": "Ver1.0"
      },
      "PartA_GEN1": {
        "PersonalInfo": {
          "AssesseeName": {
            "FirstName": "SIDDHARTH",
            "SurNameOrOrgName": "KUMAR"
          },
          "PAN": "$panCard",
          "Address": {
            "ResidenceNo": "27",
            "ResidenceName": "2ND CROSS",
            "RoadOrStreet": "DVG LAYOUT",
            "LocalityOrArea": "T C PALYA MAIN ROAD",
            "CityOrTownOrDistrict": "Bangalore",
            "StateCode": "15",
            "CountryCode": "91",
            "PinCode": 560036,
            "CountryCodeMobile": 91,
            "MobileNo": 8095908526,
            "EmailAddress": "prajapatishyamsundar36@gmail.com"
          },
          "DOB": "1993-08-22",
          "Status": "I",
          "AadhaarCardNo": "$aadhaar"
        },
        "FilingStatus": {
          "ReturnFileSec": 11,
          "NewTaxRegime": "N",
          "SeventhProvisio139": "N",
          "ResidentialStatus": "RES",
          "ConditionsResStatus": "1",
          "BenefitUs115HFlg": "N",
          "AsseseeRepFlg": "N",
          "PortugeseCC5A": "N",
          "CompDirectorPrvYrFlg": "N",
          "HeldUnlistedEqShrPrYrFlg": "N"
        }
      },
      "ScheduleS": {
        "Salaries": [
          {
            "NameOfEmployer": "ROPPEN TRANSPORTATION SERVICES PRIVATE LIMITED (HYDR09831D)",
            "NatureOfEmployment": "OTH",
            "TANofEmployer": "HYDR09831D",
            "AddressDetail": {
              "AddrDetail": "PLOT NO. 24/NP, ROPPEN TRANSPORTATION SERVICES PRIVATE LIMITED, ALKAPUR TOWNSH, PUPPALGUDA",
              "CityOrTownOrDistrict": "HYDERABAD",
              "StateCode": "36",
              "PinCode": 500089
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
                "IFSCCode": "SBIN0013159",
                "BankName": "STATE BANK OF INDIA",
                "BankAccountNo": "20162498841",
                "UseForRefund": "true"
              },
              {
                "IFSCCode": "CITI0000004",
                "BankName": "CITI BANK",
                "BankAccountNo": "5309495813",
                "UseForRefund": "false"
              }
            ]
          }
        },
        "AssetOutIndiaFlag": "NO"
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
          "AssesseeVerName": "SIDDHARTH KUMAR",
          "FatherName": "VIMALENDU BHUSHAN KUMAR",
          "AssesseeVerPAN": "CLCPK8184N"
        },
        "Capacity": "S"
      }
    }
  }
}
*/