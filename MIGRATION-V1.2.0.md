# Upgrading to ABAP SDK version 1.2.0

Note: If migrating from a version less than v1.1.0, also see the
[v1.1.0 migration guide wiki](https://github.com/IBM/abap-sdk-nwas-x/blob/main/MIGRATION-V1.1.0.md).

<details>
  <summary>Table of Contents</summary>

- [Breaking changes by service](#breaking-changes-by-service)
- [New features by service](#new-features-by-service)
  - [watsonx.ai](#watsonxai)
- [Other changes](#other-changes)
  - [Renaming of service _Watson Machine Learning_](#renaming-of-service-watson-machine-learning)
</details>

## Breaking changes by service

- None.

## New features by service

### watsonx.ai

 - Support for new category *Text chat*
   - New methods `Text_Chat`, `Text_Chat_Stream`
     
 - Support for new category *Text extraction*
   - New methods `Text_Extraction`, `List_Text_Extractions`, `Text_Extraction_Get`, `Text_Extraction_Delete`
     
 - Support for new category *Text rerank*
   - New method `Text_Rerank`

## Other changes

### Renaming of service _Watson Machine Learning_

 - Service _Watson Machine Learning_ has been renamed to _watsonx.ai Runtime_.  
   The ABAP class name remains `ZCL_IBMX_WML_V4`.
