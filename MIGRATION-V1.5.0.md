# Upgrading to ABAP SDK version 1.5.0

**Note**: If migrating from a version less than v1.4.0, also see
[Upgrading to ABAP SDK version 1.4.0](https://github.com/IBM/abap-sdk-nwas-x/blob/1.4.0/MIGRATION-V1.4.0.md).

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

- Support for new category *Notebooks*
   - Methods `Notebooks_Create`, `Notebooks_Delete`, `Notebooks_List`, `Notebooks_Revert`, `Notebooks_Update`

- Support for new category *Notebook Versions*
   - Methods `Notebook_Versions_Create`, `Notebook_Versions_Delete`, `Notebook_Versions_Get`, `Notebook_Versions_List`

> **Note**  
> *Notebooks* and *Notebook Versions* API operations use a different
> endpoint than API operations of the other categories (see [Endpoint
> URLs](https://cloud.ibm.com/apidocs/watsonx-ai#endpoint-url)). If
> you use *Notebooks* and *Notebook Versions* API operations with API
> operations of the other categories in the same program, you need to
> create two separate instances of the watsonx service wrapper ABAP
> class with the respective endpoint URLs and use the instances
> accordingly in your program (see also [Usage](README.md#usage)).

### watsonx.ai Runtime

- None
