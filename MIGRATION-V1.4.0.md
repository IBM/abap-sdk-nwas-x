# Upgrading to ABAP SDK version 1.4.0

**Note**: If migrating from a version less than v1.3.0, also see
[Upgrading to ABAP SDK version 1.3.0](https://github.com/IBM/abap-sdk-nwas-x/blob/1.3.0/MIGRATION-V1.3.0.md).

<details>
  <summary>Table of Contents</summary>

- [Breaking changes by service](#breaking-changes-by-service)
- [New features by service](#new-features-by-service)
  - [watsonx.ai](#watsonxai)
  - [watsonx.ai Runtime](#watsonxai-runtime)

</details>

## Breaking changes by service

- None

## New features by service

### watsonx.ai

- Additional methods for category *Prompts*
  - New method `Post_Prompt_Chat_Item`

- Support for new category *Prompt Sessions*
   - Methods `Post_Prompt_Session`, `Patch_Prompt_Session`,
    `Get_Prompt_Session`, `Put_Prompt_Session_Lock`,
    `Get_Prompt_Session_Lock`, `Delete_Prompt_Session`,
    `Post_Prompt_Session_Entry`, `Get_Prompt_Session_Entries`,
    `Get_Prompt_Session_Entry`, `Delete_Prompt_Session_Entry`,
    `Pst_Prmpt_Sssn_Entry_Chat_Item`

> **Note**  
> *Prompts* and *Prompt Sessions* API operations use a different
> endpoint than the other API operations (see [Endpoint
> URLs](https://cloud.ibm.com/apidocs/watsonx-ai#endpoint-url)).  If
> you use *Prompts* API operations with other API operations in the
> same program, you need to create two separate instances of the
> watsonx service wrapper ABAP class with the respective endpoint URLs
> and use the instances accordingly in your program (see also
> [Usage](README.md#usage))

### watsonx.ai Runtime

- None.
