# Upgrading to ABAP SDK version 1.3.0

**Note**: If migrating from a version less than v1.2.0, also see
[Upgrading to ABAP SDK version 1.2.0](https://github.com/IBM/abap-sdk-nwas-x/blob/1.2.0/MIGRATION-V1.2.0.md).

<details>
  <summary>Table of Contents</summary>

- [Breaking changes by service](#breaking-changes-by-service)
  - [watsonx.ai](#watsonxai)
  - [watsonx.ai Runtime (formerly: Watson Machine Learning)](#watsonxai-runtime-formerly-watson-machine-learning)
- [New features by service](#new-features-by-service)
  - [watsonx.ai](#watsonxai-1)
  - [watsonx.ai Runtime (formerly: Watson Machine Learning)](#watsonxai-runtime-formerly-watson-machine-learning-1)

</details>

## Breaking changes by service

### watsonx.ai

 - A number of ABAP datatypes have been renamed:

   | Old name                            | New name                           |
   | :---                                | :---                               |
   | `T_DPLYMNT_RESOURCE_COLLECTION`     | `T_DEPLOYMENT_RESRC_COLLECTION`    |
   | `T_DPLYMNT_RESOURCE_PROTOTYPE`      | `T_DEPLOYMENT_RESRC_PROTOTYPE`     |
   | `T_DPLYMNT_TEXT_GEN_PROPERTIES`     | `T_DEPLOYMENT_TEXT_GEN_PROP`       |
   | `T_EXTRNL_INFRMTN_EXTRNL_MODEL`     | `T_EXT_INFO_EXTERNAL_MODEL`        |
   | `T_EXTRNL_INFRMTN_EXTRNL_PROMPT`    | `T_EXT_INFO_EXTERNAL_PROMPT`       |
   | `T_EXTRNL_PRMPT_ADDTNL_INFRMTN1`    | `T_EXT_PRMPT_ADDTNL_INFO_ITEM`     |
   | `T_GSPTL_TRANSFORMATION_DATA`       | `T_GEOSPATIAL_TRANS_DATA`          |
   | `T_GSPTL_TRANSFORMATION_ENTITY`     | `T_GEOSPATIAL_TRANS_ENTITY`        |
   | `T_GSPTL_TRANSFORMATION_REQ`        | `T_GEOSPATIAL_TRANS_REQUEST`       |
   | `T_GSPTL_TRANSFORMATION_RESULTS`    | `T_GEOSPATIAL_TRANS_RESULTS`       |
   | `T_GSPTL_TRNSFRMTN_METADATA`        | `T_GEOSPATIAL_TRANS_METADATA`      |
   | `T_GSPTL_TRNSFRMTN_MTDT_FIELDS`     | `T_GSPTL_TRANS_METADATA_FLD`       |
   | `T_GSPTL_TRNSFRMTN_REQ_FIELDS`      | `T_GEOSPATIAL_TRANS_REQ_FIELDS`    |
   | `T_GSPTL_TRNSFRMTN_RESOURCE`        | `T_GEOSPATIAL_TRANS_RESOURCE`      |
   | `T_GSPTL_TRNSFRMTN_RESOURCES`       | `T_GEOSPATIAL_TRANS_RESOURCES`     |
   | `T_GSPTL_TRNSFRMTN_RESP_ENTITY`     | `T_GEOSPATIAL_TRANS_RESP_ENTITY`   |
   | `T_GSPTL_TRNSFRMTN_RESP_FIELDS`     | `T_GEOSPATIAL_TRANS_RESP_FIELDS`   |
   | `T_GSPTL_TRNSFRMTN_RSRC_ENTITY`     | `T_GSPTL_TRANS_RESRC_ENTITY`       |
   | `T_MDRTN_HAP_INPUT_PROPERTIES`      | `T_MODERATION_HAP_INPUT_PROP`      |
   | `T_MDRTN_PII_INPUT_PROPERTIES`      | `T_MODERATION_PII_INPUT_PROP`      |
   | `T_MDRTN_PRPRTS_WTHT_THRESHOLD`     | `T_MDRTN_PROP_WITHOUT_THRESHOLD`   |
   | `T_NOTEBOOK_RESOURCE_ENTITY_RT`     | `T_NOTEBOOK_RESRC_ENTITY_RT`       |
   | `T_NTBK_RESOURCE_ENTITY_ASSET`      | `T_NOTEBOOK_RESRC_ENTITY_ASSET`    |
   | `T_PRMPT_WTH_EXTRNL_MODEL_PARAM`    | `T_PROMPT_WITH_EXT_MODEL_PARAM`    |
   | `T_RSRC_SPC_PROJECT_METADATA`       | `T_RESRC_SPACE_PROJECT_METADATA`   |
   | `T_TRAIN_RSRC_COLLECTION_SYS`       | `T_TRAIN_RESRC_COLLECTION_SYS`     |
   | `T_TXT_CHT_MSSGS_TXT_CHT_MSSG_1`    | `T_TXT_CHT_MSG_TXT_CHT_MSG_ASS1`   |
   | `T_TXT_CHT_MSSGS_TXT_CHT_MSSG_2`    | `T_TXT_CHT_MSG_TXT_CHT_MSG_CNT1`   |
   | `T_TXT_CHT_MSSGS_TXT_CHT_MSSG_3`    | `T_TXT_CHT_MSG_TXT_CHAT_MSG_SYS`   |
   | `T_TXT_CHT_MSSGS_TXT_CHT_MSSG_4`    | `T_TXT_CHT_MSG_TXT_CHT_MSG_TOOL`   |
   | `T_TXT_CHT_RESULT_CHOICE_STREAM`    | `T_TEXT_CHAT_RES_CHOICE_STREAM`    |
   | `T_TXT_DTCTN_EVIDENCE_REFERENCE`    | `T_TEXT_DETECTION_EVIDENCE_REF`    |
   | `T_TXT_EXTRCTN_DATA_REFERENCE`      | `T_TEXT_EXTRACTION_DATA_REF`       |
   | `T_TXT_EXTRCTN_RESOURCE_ENTITY`     | `T_TEXT_EXTRACTION_RESRC_ENTITY`   |
   | `T_TXT_EXTRCTN_STP_TBLS_PRCSSNG`    | `T_TXT_EXTRACTION_STEP_TAB_PROC`   |
   | `T_TXT_GN_RESP_FLDS_RSLTS_ITEM`     | `T_TEXT_GEN_RESP_FLD_RES_ITEM`     |
   | `T_WX_PRMPT_SSSN_ENTRY_LST_RSL1`    | `T_WX_PRMPT_SSSN_ENTRY_LST_RES1`   |

### watsonx.ai Runtime (formerly: Watson Machine Learning)

 - A number of ABAP datatypes have been renamed:

   | Old name                            | New name                           |
   | :---                                | :---                               |
   | `T_DT_PRPRCSSNG_TRANSFORMATION`     | `T_DATA_PREPROCESSING_TRANS`       |
   | `T_INSTNC_RESOURCE_ENTITY_PLAN`     | `T_INSTANCE_RESRC_ENTITY_PLAN`     |
   | `T_JB_DCSN_OPTIMIZATION_RESULT`     | `T_JB_DECISION_OPTIMIZATION_RES`   |
   | `T_TRAIN_RESOURCE_ENTITY_REQ`       | `T_TRAIN_RESRC_ENTITY_REQUEST`     |
   | `T_TRAIN_RFRNC_HYPR_PRM_OPTMZT1`    | `T_TRAIN_REF_HYPR_PRM_OPTMZTN_1`   |
   | `T_TRAIN_RFRNC_HYPR_PRM_OPTMZTN`    | `T_TRAIN_REF_HYPR_PRM_OPTMZTN`     |

## New features by service

### watsonx.ai

 - Additional methods for category *Deployments*
   - New methods `Deployments_Text_Chat`, `Deployments_Text_Chat_Stream`

 - Support for new category *AI Services*
   - Methods `AI_Services_Create`, `AI_Services_List`, `AI_Services_Get`, `AI_Services_Update`, `AI_Services_Delete`, `AI_Services_Upload_Code`, `AI_Services_Download_Code`, `AI_Services_Create_Revisions`, `AI_Services_List_Revisions`

 - Support for new category *AutoAI RAG*
   - Methods `Create_AutoAI_Rags`, `List_AutoAI_Rags`, `Get_AutoAI_Rags`, `Delete_AutoAI_Rags`

 - Support for new category *Prompts*
   - Methods `Post_Prompt`, `Get_Prompt`, `Patch_Prompt`, `Delete_Prompt`, `Put_Prompt_Lock`, `Get_Prompt_Lock`, `Get_Prompt_Input`

     > **Note**
     > *Prompts* API operations use a different endpoint than the other
     > API operations
	 > (see [Endpoint URLs](https://cloud.ibm.com/apidocs/watsonx-ai#endpoint-url)).
     > If you use *Prompts* API operations with other API operations
     > in the same program, you need to create two separate instances
     > of the watsonx service wrapper ABAP class with the respective
     > endpoint URLs and use the instances accordingly in your
     > program (see also [Usage](README.md#usage))

 - Support for new category *Time Series*
   - Method `Time_Series_Forecast`

### watsonx.ai Runtime (formerly: Watson Machine Learning)

 - None.
