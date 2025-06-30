* Copyright 2019, 2025 IBM Corp. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
"! <p class="shorttext synchronized" lang="en">watsonx.ai</p>
"! No documentation available.<br/>
class ZCL_IBMX_WATSONX_AI_ML_V1 DEFINITION
  public
  inheriting from ZCL_IBMX_SERVICE_EXT
  create public .

public section.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Optional messages related to the resource.</p>
    begin of T_MESSAGE,
      "!   The level of the message, normally one of `debug`, `info` or `warning`.
      LEVEL type STRING,
      "!   The message.
      TEXT type STRING,
    end of T_MESSAGE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The target of the error.</p>
    begin of T_API_ERROR_TARGET,
      "!   The type of the problematic field.
      TYPE type STRING,
      "!   The name of the problematic field.
      NAME type STRING,
    end of T_API_ERROR_TARGET.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    An error message.</p>
    begin of T_API_ERROR,
      "!   A simple code that should convey the general sense of the error.
      CODE type STRING,
      "!   The message that describes the error.
      MESSAGE type STRING,
      "!   A reference to a more detailed explanation when available.
      MORE_INFO type STRING,
      "!   The target of the error.
      TARGET type T_API_ERROR_TARGET,
    end of T_API_ERROR.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The data returned when an error is encountered.</p>
    begin of T_API_ERROR_RESPONSE,
      "!   An identifier that can be used to trace the request.
      TRACE type STRING,
      "!   The list of errors.
      ERRORS type STANDARD TABLE OF T_API_ERROR WITH NON-UNIQUE DEFAULT KEY,
    end of T_API_ERROR_RESPONSE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    This field will not returned by fine tuning jobs created</p>
    "!     with InstructLab.<br/>
    "!    <br/>
    "!    The context for prompt tuning metrics.
    begin of T_PRMPT_TUNING_METRICS_CONTEXT,
      "!   The location where the prompt tuning metrics are stored.
      METRICS_LOCATION type STRING,
    end of T_PRMPT_TUNING_METRICS_CONTEXT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Provides extra information for this training stage in the</p>
    "!     context of auto-ml.
    begin of T_METRICS_CONTEXT,
      "!   This field will not returned by fine tuning jobs created with InstructLab.<br/>
      "!   <br/>
      "!   The deployment that created the metrics.
      DEPLOYMENT_ID type STRING,
      "!   This field will not returned by fine tuning jobs created with InstructLab.<br/>
      "!   <br/>
      "!   The context for prompt tuning metrics.
      PROMPT_TUNING type T_PRMPT_TUNING_METRICS_CONTEXT,
      "!   The locations of the fine tuning jobs information when it is created with
      "!    InstructLab.
      LOCATIONS type MAP,
    end of T_METRICS_CONTEXT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A metric.</p>
    begin of T_TRAINING_METRIC,
      "!   A timestamp for the metrics.
      TIMESTAMP type DATETIME,
      "!   The iteration number.
      ITERATION type INTEGER,
      "!   The metrics.
      ML_METRICS type MAP,
      "!   The metrics that can be returned by a fine tuning job created with InstructLab.
      FINE_TUNING_METRICS type JSONOBJECT,
      "!   Provides extra information for this training stage in the context of auto-ml.
      CONTEXT type T_METRICS_CONTEXT,
    end of T_TRAINING_METRIC.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Status of the training job.</p>
    begin of T_TRAINING_STATUS,
      "!   Date and Time in which current training state has started.
      RUNNING_AT type DATETIME,
      "!   Date and Time in which training had completed.
      COMPLETED_AT type DATETIME,
      "!   Current state of training.
      STATE type STRING,
      "!   Optional messages related to the resource.
      MESSAGE type T_MESSAGE,
      "!   Metrics that can be returned by an operation.
      METRICS type STANDARD TABLE OF T_TRAINING_METRIC WITH NON-UNIQUE DEFAULT KEY,
      "!   The data returned when an error is encountered.
      FAILURE type T_API_ERROR_RESPONSE,
    end of T_TRAINING_STATUS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The origin of a notebook from a source.</p>
    begin of T_NOTEBOOK_ORIGIN_FROM_SOURCE,
      "!   The orgin type of the notebook, either blank, file or url.
      TYPE type STRING,
      "!   The guid of the source file.
      GUID type STRING,
    end of T_NOTEBOOK_ORIGIN_FROM_SOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The model version (using semantic versioning) if set.</p>
      T_MODEL_VERSION type String.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The number of epochs is the number of complete passes</p>
    "!     through the training dataset. The quality depends on the number of epochs.
    begin of T_TRAINING_NUM_EPOCHS,
      "!   The default value.
      DEFAULT type INTEGER,
      "!   The minimum value.
      MIN type INTEGER,
      "!   The maximum value.
      MAX type INTEGER,
    end of T_TRAINING_NUM_EPOCHS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The description of the job.</p>
      T_RESOURCE_DESCRIPTION type String.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The limits that may be set per request.</p>
    begin of T_CONSUMPTIONS_LIMIT,
      "!   The hard limit on the call time for a request, if set.
      CALL_TIME type STRING,
      "!   The hard limit on the number of input tokens for a request, if set. A value of
      "!    zero will disable this feature.
      MAX_INPUT_TOKENS type INTEGER,
      "!   The hard limit on the number of output tokens for a request, if set. A value of
      "!    zero will disable this feature.
      MAX_OUTPUT_TOKENS type INTEGER,
    end of T_CONSUMPTIONS_LIMIT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The OCR text extraction step.</p>
    begin of T_TEXT_EXTRACTION_STEP_OCR,
      "!   Set of languages to be expected in the document. The language codes follow `ISO
      "!    639`. See the documentation for the currently supported languages.
      LANGUAGES_LIST type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
    end of T_TEXT_EXTRACTION_STEP_OCR.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The tables processing text extraction step.</p>
    begin of T_TXT_EXTRACTION_STEP_TAB_PROC,
      "!   Should tables be processed for text extraction.
      ENABLED type BOOLEAN,
    end of T_TXT_EXTRACTION_STEP_TAB_PROC.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The steps for the text extraction pipeline.</p><br/>
    "!    <br/>
    "!    Use `parameters` instead.
    begin of T_TEXT_EXTRACTION_STEPS,
      "!   The OCR text extraction step.
      OCR type T_TEXT_EXTRACTION_STEP_OCR,
      "!   The tables processing text extraction step.
      TABLES_PROCESSING type T_TXT_EXTRACTION_STEP_TAB_PROC,
    end of T_TEXT_EXTRACTION_STEPS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Initialization methods for a training.</p>
    begin of T_TRAINING_INIT_METHOD,
      "!   The supported initialization methods.
      SUPPORTED type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   The default value, which will be one of the values from the `supported` field.
      DEFAULT type STRING,
    end of T_TRAINING_INIT_METHOD.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The schema of the expected data, see</p><br/>
    "!    [datarecord-metadata-v2-schema](https://raw.githubusercontent.com/elyra-ai/pipel
    "!    ine-schemas/master/common-pipeline/datarecord-metadata/datarecord-metadata-v2-sc
    "!    hema.json) for the schema definition.
    begin of T_DATA_SCHEMA,
      "!   An id to identify a schema.
      ID type STRING,
      "!   A name for the schema.
      NAME type STRING,
      "!   The fields that describe the data schema.
      FIELDS type STANDARD TABLE OF JSONOBJECT WITH NON-UNIQUE DEFAULT KEY,
      "!   The type of the schema, can be ignored or set to `struct` or `DataFrame`.
      TYPE type STRING,
    end of T_DATA_SCHEMA.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A notebook version entity in a project.</p>
    begin of T_NTBK_VER_ENTITY_IN_PROJECT,
      "!   The guid of the versioned notebook.
      MASTER_NOTEBOOK_GUID type STRING,
      "!   The IUI of the user that has created the version.
      CREATED_BY_IUI type STRING,
      "!   The file reference in the corresponding COS.
      FILE_REFERENCE type STRING,
      "!   The revision id of the notebook.
      REV_ID type INTEGER,
      "!   The guid of the project.
      PROJECT_ID type STRING,
    end of T_NTBK_VER_ENTITY_IN_PROJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Properties that control the moderation on the text.</p>
    begin of T_TEXT_MODERATION,
      "!   Should this moderation be enabled on the text.<br/>
      "!   <br/>
      "!   <br/>
      "!   The default value is `true` which means that if the parent object exists but the
      "!    `enabled` field does not exist then this is considered to be enabled.
      ENABLED type BOOLEAN,
      "!   The threshold probability that this is a real match.
      THRESHOLD type FLOAT,
    end of T_TEXT_MODERATION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The properties specific to masking. If this object exists,</p>
    "!     even if it is empty, then masking will be applied.
    begin of T_MASK_PROPERTIES,
      "!   If this field is `true` then the entity value, that contains the text that was
      "!    masked, will also be removed from the output.
      REMOVE_ENTITY_VALUE type BOOLEAN,
    end of T_MASK_PROPERTIES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The properties specific to HAP.</p>
    begin of T_MODERATION_HAP_INPUT_PROP,
      "!   Properties that control the moderation on the text.
      INPUT type T_TEXT_MODERATION,
      "!   The properties specific to masking. If this object exists,<br/>
      "!   even if it is empty, then masking will be applied.
      MASK type T_MASK_PROPERTIES,
    end of T_MODERATION_HAP_INPUT_PROP.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The top tokens.</p>
    begin of T_TEXT_GEN_TOP_TOKEN_INFO,
      "!   The token text.
      TEXT type STRING,
      "!   The natural log of probability for the token.
      LOGPROB type NUMBER,
    end of T_TEXT_GEN_TOP_TOKEN_INFO.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A range of text.</p>
    begin of T_MODERATION_TEXT_RANGE,
      "!   The start index of the range.
      START type INTEGER,
      "!   The end index of the range. The end index is exclusive meaning that the
      "!    character at this index will not be included in the range.
      END type INTEGER,
    end of T_MODERATION_TEXT_RANGE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A specific moderation result.</p>
    begin of T_MODERATION_RESULT,
      "!   the probability that this is a real match.
      SCORE type FLOAT,
      "!   This defines if this was found in the input (`true`) or the output (`false`).
      INPUT type BOOLEAN,
      "!   A range of text.
      POSITION type T_MODERATION_TEXT_RANGE,
      "!   The entity that was identified by the moderation.
      ENTITY type STRING,
      "!   The text that was identified for this entity.<br/>
      "!   <br/>
      "!   This field may be removed if requested in the moderation request body.
      WORD type STRING,
    end of T_MODERATION_RESULT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The result of any detected moderations.</p>
    begin of T_MODERATION_RESULTS,
      "!   The HAP results.
      HAP type STANDARD TABLE OF T_MODERATION_RESULT WITH NON-UNIQUE DEFAULT KEY,
      "!   The PII results.
      PII type STANDARD TABLE OF T_MODERATION_RESULT WITH NON-UNIQUE DEFAULT KEY,
    end of T_MODERATION_RESULTS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The generated token.</p>
    begin of T_TEXT_GEN_TOKEN_INFO,
      "!   The token text.
      TEXT type STRING,
      "!   The natural log of probability for the token.
      LOGPROB type NUMBER,
      "!   The rank of the token relative to the other tokens.
      RANK type INTEGER,
      "!   The top tokens.
      TOP_TOKENS type STANDARD TABLE OF T_TEXT_GEN_TOP_TOKEN_INFO WITH NON-UNIQUE DEFAULT KEY,
    end of T_TEXT_GEN_TOKEN_INFO.
  types:
    "! No documentation available.
    begin of T_TEXT_GEN_RESP_FLD_RES_ITEM,
      "!   The text that was generated by the model.
      GENERATED_TEXT type STRING,
      "!   The reason why the call stopped, can be one of:<br/>
      "!   - not_finished - Possibly more tokens to be streamed.<br/>
      "!   - max_tokens - Maximum requested tokens reached.<br/>
      "!   - eos_token - End of sequence token encountered.<br/>
      "!   - cancelled - Request canceled by the client.<br/>
      "!   - time_limit - Time limit reached.<br/>
      "!   - stop_sequence - Stop sequence encountered.<br/>
      "!   - token_limit - Token limit reached.<br/>
      "!   - error - Error encountered.<br/>
      "!   <br/>
      "!   Note that these values will be lower-cased so test for values case insensitive.
      STOP_REASON type STRING,
      "!   The number of generated tokens.
      GENERATED_TOKEN_COUNT type INTEGER,
      "!   The number of input tokens consumed.
      INPUT_TOKEN_COUNT type INTEGER,
      "!   The seed used, if it exists.
      SEED type INTEGER,
      "!   The list of individual generated tokens. Extra token information is included
      "!    based on the other flags in the `return_options` of the request.
      GENERATED_TOKENS type STANDARD TABLE OF T_TEXT_GEN_TOKEN_INFO WITH NON-UNIQUE DEFAULT KEY,
      "!   The list of input tokens. Extra token information is included based on the other
      "!    flags in the `return_options` of the request, but for decoder-only models.
      INPUT_TOKENS type STANDARD TABLE OF T_TEXT_GEN_TOKEN_INFO WITH NON-UNIQUE DEFAULT KEY,
      "!   The result of any detected moderations.
      MODERATIONS type T_MODERATION_RESULTS,
    end of T_TEXT_GEN_RESP_FLD_RES_ITEM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A warning message.</p>
    begin of T_WARNING,
      "!   The message.
      MESSAGE type STRING,
      "!   An `id` associated with the message.
      ID type STRING,
      "!   A reference to a more detailed explanation when available.
      MORE_INFO type STRING,
      "!   Additional key-value pairs that depend on the specific warning.
      ADDITIONAL_PROPERTIES type JSONOBJECT,
    end of T_WARNING.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Optional details coming from the service and related to the</p>
    "!     API call or the associated resource.
    begin of T_SYSTEM_DETAILS,
      "!   Any warnings coming from the system.
      WARNINGS type STANDARD TABLE OF T_WARNING WITH NON-UNIQUE DEFAULT KEY,
    end of T_SYSTEM_DETAILS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    System details.</p>
    begin of T_TEXT_GEN_RESPONSE,
      "!   The `id` of the model for inference.
      MODEL_ID type STRING,
      "!   The model version (using semantic versioning) if set.
      MODEL_VERSION type STRING,
      "!   The time when the response was created in ISO 8601 format.
      CREATED_AT type DATETIME,
      "!   The generated tokens.
      RESULTS type STANDARD TABLE OF T_TEXT_GEN_RESP_FLD_RES_ITEM WITH NON-UNIQUE DEFAULT KEY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_TEXT_GEN_RESPONSE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The stats about deployments for a space.</p>
    begin of T_STATS,
      "!   An `id` associated with the space.
      SPACE_ID type STRING,
      "!   The total number of deployments created in a space including `online` and
      "!    `batch`.
      TOTAL_COUNT type NUMBER,
      "!   The number of online deployments created in a space.
      ONLINE_COUNT type NUMBER,
      "!   The number of batch deployments created in a space.
      BATCH_COUNT type NUMBER,
    end of T_STATS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Optional details provided by the service about statistics of</p>
    "!     the number of deployments created. The deployments that are counted will depend
    "!     on the request parameters.
    begin of T_DEPLOYMENT_SYSTEM_DETAILS,
      "!   Any warnings coming from the system.
      WARNINGS type STANDARD TABLE OF T_WARNING WITH NON-UNIQUE DEFAULT KEY,
      "!   The stats about deployments.
      STATS type STANDARD TABLE OF T_STATS WITH NON-UNIQUE DEFAULT KEY,
    end of T_DEPLOYMENT_SYSTEM_DETAILS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    System details including warnings.</p>
    begin of T_DEPLOYMENT_SYSTEM,
      "!   Optional details provided by the service about statistics of the number of
      "!    deployments created. The deployments that are counted will depend on the
      "!    request parameters.
      SYSTEM type T_DEPLOYMENT_SYSTEM_DETAILS,
    end of T_DEPLOYMENT_SYSTEM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The Synthetic Data Generation sample metrics.</p>
    begin of T_SYNTHETIC_DATA_GEN_SAMPLE,
      "!   The knowledge metric value.
      KNOWLEDGE type INTEGER,
      "!   The skills metric value.
      SKILLS type INTEGER,
      "!   The combined value of the metric values.
      TOTAL type INTEGER,
    end of T_SYNTHETIC_DATA_GEN_SAMPLE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The space that contains the resource. Either `space_id` or</p>
    "!     `project_id` has to be given.
      T_SPACE_ID type String.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The project that contains the resource. Either `space_id` or</p>
    "!     `project_id` has to be given.
      T_PROJECT_ID type String.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A notebook kernel.</p>
    begin of T_NOTEBOOK_KERNEL,
      "!   The display name of the environment kernel.
      DISPLAY_NAME type STRING,
      "!   The name of the environment kernel.
      NAME type STRING,
      "!   The language of the environment kernel.
      LANGUAGE type STRING,
    end of T_NOTEBOOK_KERNEL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Metadata of a notebook.</p>
    begin of T_NOTEBOOK_METADATA,
      "!   The name of the notebook.
      NAME type STRING,
      "!   A more verbose description.
      DESCRIPTION type STRING,
      "!   Asset type, always &quot;notebook&quot;.
      ASSET_TYPE type STRING,
      "!   Creation date, ms since epoch.
      CREATED type INTEGER,
      "!   Creation date, ISO format.
      CREATED_AT type STRING,
      "!   IAM ID of the asset&apos;s owner.
      OWNER_ID type STRING,
      "!   UUID of the asset&apos;s catalog.
      CATALOG_ID type STRING,
      "!   UUID of the asset.
      ASSET_ID type STRING,
    end of T_NOTEBOOK_METADATA.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The notebook origin.</p>
    begin of T_NOTEBOOK_ORIGIN,
      "!   The orgin type of the notebook, either blank, file or url.
      TYPE type STRING,
    end of T_NOTEBOOK_ORIGIN.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Definition part of a notebook entity.</p>
    begin of T_NOTEBOOK_ENTITY_DEFINITION,
      "!   A notebook kernel.
      KERNEL type T_NOTEBOOK_KERNEL,
      "!   The notebook origin.
      ORIGINATES_FROM type T_NOTEBOOK_ORIGIN,
    end of T_NOTEBOOK_ENTITY_DEFINITION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A notebook runtime.</p>
    begin of T_NOTEBOOK_RUNTIME,
      "!   The guid of the environment on which the notebook runs.
      ENVIRONMENT type STRING,
      "!   Spark monitoring enabled or not.
      SPARK_MONITORING_ENABLED type BOOLEAN,
    end of T_NOTEBOOK_RUNTIME.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Entity of a notebook.</p>
    begin of T_NOTEBOOK_ENTITY,
      "!   Definition part of a notebook entity.
      NOTEBOOK type T_NOTEBOOK_ENTITY_DEFINITION,
      "!   A notebook runtime.
      RUNTIME type T_NOTEBOOK_RUNTIME,
      "!   Full URI of the notebook.
      HREF type STRING,
    end of T_NOTEBOOK_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Notebook information as returned by a GET request.</p>
    begin of T_NOTEBOOK,
      "!   Metadata of a notebook.
      METADATA type T_NOTEBOOK_METADATA,
      "!   Entity of a notebook.
      ENTITY type T_NOTEBOOK_ENTITY,
    end of T_NOTEBOOK.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Payload for copying a notebook.</p>
    begin of T_NOTEBOOK_COPY_BODY,
      "!   The name of the new notebook.
      NAME type STRING,
      "!   The guid of the notebook to be copied.
      SOURCE_GUID type STRING,
    end of T_NOTEBOOK_COPY_BODY.
  types:
    "! No documentation available.
    begin of T_WX_PROMPT_INPUT_REQUEST,
      "!   Override input string that will be used to generate the response. The string can
      "!    contain template parameters.
      INPUT type STRING,
      "!   Supply only to replace placeholders. Object content must be key:value pairs
      "!    where the &apos;key&apos; is the parameter to replace and &apos;value&apos; is
      "!    the value to use.
      PROMPT_VARIABLES type MAP,
    end of T_WX_PROMPT_INPUT_REQUEST.
  types:
    "! No documentation available.
    begin of T_UTIL_AGNT_TL_STRCTRD_INPUT,
      "!   The name of the tool to be run.
      TOOL_NAME type STRING,
      "!   Input to be used when running tool that has an input_schema.
      INPUT type JSONOBJECT,
      "!   Optional configuration options that can be passed for some tools. This must
      "!    match the config schema for that tool.
      CONFIG type JSONOBJECT,
    end of T_UTIL_AGNT_TL_STRCTRD_INPUT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Contains a set of fields specific to each connection. See</p>
    "!     here for [details about specifying connections](#datareferences).
      T_DATA_CONNECTION type JSONOBJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A reference to data with an optional data schema. If</p>
    "!     necessary, it is possible to provide a data connection that contains just the
    "!     data schema.
    begin of T_DATA_CONNECTION_REFERENCE,
      "!   Optional item identification inside a collection.
      ID type STRING,
      "!   The data source type like `connection_asset` or `data_asset`. If the data
      "!    connection contains just a schema then this field is not required.
      TYPE type STRING,
      "!   Contains a set of fields specific to each connection.<br/>
      "!   See here for [details about specifying connections](#datareferences).
      CONNECTION type T_DATA_CONNECTION,
      "!   Contains a set of fields that describe the location of the data with respect to
      "!    the `connection`.
      LOCATION type MAP,
      "!   The schema of the expected data, see<br/>
      "!   [datarecord-metadata-v2-schema](https://raw.githubusercontent.com/elyra-ai/pipel
      "!   ine-schemas/master/common-pipeline/datarecord-metadata/datarecord-metadata-v2-sc
      "!   hema.json)<br/>
      "!   for the schema definition.
      SCHEMA type T_DATA_SCHEMA,
    end of T_DATA_CONNECTION_REFERENCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A reference to data.</p>
    begin of T_RESULTS_LOCATION,
      "!   Item identification inside a collection.
      ID type STRING,
      "!   The data source type like `connection_asset`, `container` (Service) or `fs`
      "!    (Software).
      TYPE type STRING,
      "!   Contains a set of fields specific to each connection.<br/>
      "!   See here for [details about specifying connections](#datareferences).
      CONNECTION type T_DATA_CONNECTION,
      "!   Contains a set of fields that describe the location of the data with respect to
      "!    the `connection`.
      LOCATION type MAP,
    end of T_RESULTS_LOCATION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The model id of the base model for this job.</p>
    begin of T_BASE_MODEL,
      "!   The model id of the base model.
      MODEL_ID type STRING,
    end of T_BASE_MODEL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Properties to control the prompt tuning.</p>
    begin of T_PROMPT_TUNING,
      "!   The model id of the base model for this job.
      BASE_MODEL type T_BASE_MODEL,
      "!   The task that is targeted for this model.
      TASK_ID type STRING,
      "!   Type of Peft (Parameter-Efficient Fine-Tuning) config to build.
      TUNING_TYPE type STRING,
      "!   Number of epochs to tune the prompt vectors, this affects the quality of the
      "!    trained model.
      NUM_EPOCHS type INTEGER,
      "!   Learning rate to be used while tuning prompt vectors.
      LEARNING_RATE type NUMBER,
      "!   Number of steps to be used for gradient accumulation. Gradient accumulation
      "!    refers to a method of collecting gradient for configured number of steps
      "!    instead of updating the model variables at every step and then applying the
      "!    update to model variables. This can be used as a tool to overcome smaller batch
      "!    size limitation. Often also referred in conjunction with &quot;effective batch
      "!    size&quot;.
      ACCUMULATE_STEPS type INTEGER,
      "!   Verbalizer template to be used for formatting data at train and inference time.
      "!    This template may use brackets to indicate where fields from the data model
      "!    must be rendered.
      VERBALIZER type STRING,
      "!   The batch size is a number of samples processed before the model is updated.
      BATCH_SIZE type INTEGER,
      "!   Maximum length of input tokens being considered.
      MAX_INPUT_TOKENS type INTEGER,
      "!   Maximum length of output tokens being predicted.
      MAX_OUTPUT_TOKENS type INTEGER,
      "!   The `text` method requires `init_text` to be set.
      INIT_METHOD type STRING,
      "!   Initialization text to be used if `init_method` is set to `text` otherwise this
      "!    will be ignored.
      INIT_TEXT type STRING,
    end of T_PROMPT_TUNING.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The `training_data_references` contain the training datasets</p>
    "!     and the<br/>
    "!    `results_reference` the connection where results will be stored.
    begin of T_TRAINING_RESOURCE_PROTOTYPE,
      "!   The name of the training.
      NAME type STRING,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   A description of the training.
      DESCRIPTION type STRING,
      "!   A list of tags for this resource.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   Properties to control the prompt tuning.
      PROMPT_TUNING type T_PROMPT_TUNING,
      "!   Training datasets.
      TRAINING_DATA_REFERENCES type STANDARD TABLE OF T_DATA_CONNECTION_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   If set to `true` then the result of the training, if successful, will be
      "!    uploaded to the repository as a model.
      AUTO_UPDATE_MODEL type BOOLEAN,
      "!   The training results. Normally this is specified as `type=container` (Service)
      "!    or `type=fs` (Software) which<br/>
      "!   means that it is stored in the space or project.
      RESULTS_REFERENCE type T_RESULTS_LOCATION,
    end of T_TRAINING_RESOURCE_PROTOTYPE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Runtime info returned with a notebook listing.</p>
    begin of T_NOTEBOOK_RESRC_ENTITY_RT,
      "!   If Spark monitoring is enabled.
      SPARK_MONITORING_ENABLED type BOOLEAN,
      "!   UUID of the environment of the notebook.
      ENVIRONMENT type STRING,
    end of T_NOTEBOOK_RESRC_ENTITY_RT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The function call.</p>
    begin of T_TEXT_CHAT_FUNCTION_CALL,
      "!   The name of the function.
      NAME type STRING,
      "!   The arguments to call the function with, as generated by the model in JSON
      "!    format.<br/>
      "!   <br/>
      "!   Note that the model does not always generate valid JSON, and may hallucinate
      "!    parameters not defined by your function schema. Validate the arguments in your
      "!    code before calling your function.
      ARGUMENTS type STRING,
    end of T_TEXT_CHAT_FUNCTION_CALL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The tool call.</p>
    begin of T_TEXT_CHAT_TOOL_CALL_STREAM,
      "!   The index of the tool call.
      INDEX type NUMBER,
      "!   The ID of the tool call.
      ID type STRING,
      "!   The type of the tool. Currently, only `function` is supported.
      TYPE type STRING,
      "!   The function call.
      FUNCTION type T_TEXT_CHAT_FUNCTION_CALL,
    end of T_TEXT_CHAT_TOOL_CALL_STREAM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Usage statistics for the completion request.</p>
    begin of T_TEXT_CHAT_USAGE,
      "!   Number of tokens in the generated completion.
      COMPLETION_TOKENS type INTEGER,
      "!   Number of tokens in the prompt.
      PROMPT_TOKENS type INTEGER,
      "!   Total number of tokens used in the request (prompt + completion).
      TOTAL_TOKENS type INTEGER,
    end of T_TEXT_CHAT_USAGE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A message result.</p>
    begin of T_TEXT_CHAT_RESULT_DELTA,
      "!   The role of the author of this message.
      ROLE type STRING,
      "!   The contents of the message.
      CONTENT type STRING,
      "!   The refusal message generated by the model.
      REFUSAL type STRING,
      "!   The tool calls generated by the model, such as function calls.
      TOOL_CALLS type STANDARD TABLE OF T_TEXT_CHAT_TOOL_CALL_STREAM WITH NON-UNIQUE DEFAULT KEY,
    end of T_TEXT_CHAT_RESULT_DELTA.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A tool related result.</p>
    begin of T_TEXT_CHAT_RES_CHOICE_STREAM,
      "!   The index of this result.
      INDEX type INTEGER,
      "!   A message result.
      DELTA type T_TEXT_CHAT_RESULT_DELTA,
      "!   The reason why the call stopped, can be one of:<br/>
      "!   - `stop` - The model hit a natural stop point or a provided stop sequence.<br/>
      "!   - `length` - The maximum number of tokens specified in the request was
      "!    reached.<br/>
      "!   - `tool_calls` - The model called a tool.<br/>
      "!   - `time_limit`` - Time limit reached.<br/>
      "!   - `cancelled`` - Request canceled by the client.<br/>
      "!   - `error`` - Error encountered.<br/>
      "!   - `null` - API response still in progress or incomplete.
      FINISH_REASON type STRING,
    end of T_TEXT_CHAT_RES_CHOICE_STREAM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    System details.</p>
    begin of T_TEXT_CHAT_STREAM_ITEM,
      "!   A unique identifier for the chat completion.
      ID type STRING,
      "!   The model used for the chat completion.
      MODEL_ID type STRING,
      "!   The model version (using semantic versioning) if set.
      MODEL_VERSION type STRING,
      "!   The Unix timestamp (in seconds) of when the chat completion was created.
      CREATED type INTEGER,
      "!   The time when the response was created in ISO 8601 format.
      CREATED_AT type DATETIME,
      "!   Usage statistics for the completion request.
      USAGE type T_TEXT_CHAT_USAGE,
      "!   A list of chat completion choices. Can be more than one if `n` is greater than
      "!    1.
      CHOICES type STANDARD TABLE OF T_TEXT_CHAT_RES_CHOICE_STREAM WITH NON-UNIQUE DEFAULT KEY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_TEXT_CHAT_STREAM_ITEM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A set of server sent events, each event contains a response</p>
    "!     for one or more tokens. The results will be an array of events of the form
    "!     `data: &#123;&lt;json event&gt;&#125;` where the schema of the individual `json
    "!     event` is described below.
      T_TEXT_CHAT_STREAM_RESPONSE type STANDARD TABLE OF T_TEXT_CHAT_STREAM_ITEM WITH NON-UNIQUE DEFAULT KEY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Set of languages to be expected in the document. The</p>
    "!     language codes follow `ISO 639`. See the documentation for the currently
    "!     supported languages.
      T_TXT_EXTRACTION_LANGUAGES_LST type TT_String.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The tokens that are inferred from the prompt.</p><br/>
    "!    <br/>
    "!    Note that the events are different between a request with moderation and a
    "!     request without moderations. A request with moderation will have events that
    "!     are on a sentence level and a request without moderations will have events that
    "!     are on a token level.
    begin of T_TEXT_GEN_RESPONSE_FIELDS,
      "!   The `id` of the model for inference.
      MODEL_ID type STRING,
      "!   The model version (using semantic versioning) if set.
      MODEL_VERSION type STRING,
      "!   The time when the response was created in ISO 8601 format.
      CREATED_AT type DATETIME,
      "!   The generated tokens.
      RESULTS type STANDARD TABLE OF T_TEXT_GEN_RESP_FLD_RES_ITEM WITH NON-UNIQUE DEFAULT KEY,
    end of T_TEXT_GEN_RESPONSE_FIELDS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of a user image content.</p>
    begin of T_TEXT_CHAT_USER_IMAGE_URL,
      "!   The url of the image. This must be a base64 encoded image.
      URL type STRING,
      "!   This parameter controls how the model processes the image and generates its
      "!    textual understanding. The `auto` setting which will look at the image input
      "!    size and decide if it should use the `low` or `high` setting.
      DETAIL type STRING,
    end of T_TEXT_CHAT_USER_IMAGE_URL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A software specification.</p>
    begin of T_SOFTWARE_SPEC_REL,
      "!   The id of the software specification.
      ID type STRING,
      "!   The revision of the software specification.
      REV type STRING,
      "!   The name of the software specification.
      NAME type STRING,
    end of T_SOFTWARE_SPEC_REL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The documentation of the AI service request body and</p>
    "!     response body.
    begin of T_AISERVICE_DOCUMENTATION,
      "!   The schema for a given content type. Each property defines the content type and
      "!    the sub-object is the JSON schema that describes the content.
      REQUEST type MAP,
      "!   The schema for a given content type. Each property defines the content type and
      "!    the sub-object is the JSON schema that describes the content.
      RESPONSE type MAP,
    end of T_AISERVICE_DOCUMENTATION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details of the AI service to be created.</p>
    begin of T_AISERVICE_RESOURCE_ENTITY,
      "!   A software specification.
      SOFTWARE_SPEC type T_SOFTWARE_SPEC_REL,
      "!   The type that allows the deployment service to know how to setup the code during
      "!    deployment.
      CODE_TYPE type STRING,
      "!   The documentation of the AI service request body and response body.
      DOCUMENTATION type T_AISERVICE_DOCUMENTATION,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   User defined properties specified as key-value pairs, which is propagated to the
      "!    deployment.
      TOOLING type JSONOBJECT,
    end of T_AISERVICE_RESOURCE_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Information related to the revision.</p>
    begin of T_RESOURCE_COMMIT_INFO,
      "!   The time when the revision was committed.
      COMMITTED_AT type DATETIME,
      "!   The message that was provided when the revision was created.
      COMMIT_MESSAGE type STRING,
    end of T_RESOURCE_COMMIT_INFO.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Common metadata for a resource where `project_id` or</p>
    "!     `space_id` must be present.
    begin of T_RESOURCE_META,
      "!   The id of the resource.
      ID type STRING,
      "!   The time when the resource was created.
      CREATED_AT type DATETIME,
      "!   The revision of the resource.
      REV type STRING,
      "!   The user id which created this resource.
      OWNER type STRING,
      "!   The time when the resource was last modified.
      MODIFIED_AT type DATETIME,
      "!   The id of the parent resource where applicable.
      PARENT_ID type STRING,
      "!   The name of the resource.
      NAME type STRING,
      "!   A description of the resource.
      DESCRIPTION type STRING,
      "!   A list of tags for this resource.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   Information related to the revision.
      COMMIT_INFO type T_RESOURCE_COMMIT_INFO,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
    end of T_RESOURCE_META.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The information for a flow.</p>
    begin of T_AISERVICE_RESOURCE,
      "!   Common metadata for a resource where `project_id` or `space_id` must be present.
      "!
      METADATA type T_RESOURCE_META,
      "!   The details of the AI service to be created.
      ENTITY type T_AISERVICE_RESOURCE_ENTITY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_AISERVICE_RESOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A reference to data.</p>
    begin of T_OBJECT_LOCATION,
      "!   The data source type.<br/>
      "!   <br/>
      "!   <br/>
      "!   The possible types will depend on the API and platform being used.
      TYPE type STRING,
      "!   Contains a set of fields that describe the location of the data with respect to
      "!    the `connection`.
      LOCATION type MAP,
      "!   Contains a set of fields specific to each connection.<br/>
      "!   See here for [details about specifying connections](#datareferences).
      CONNECTION type T_DATA_CONNECTION,
      "!   Item identification inside a collection, if appropriate.
      ID type STRING,
    end of T_OBJECT_LOCATION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The properties specific to HAP.</p>
    begin of T_MODERATION_HAP_PROPERTIES,
      "!   Properties that control the moderation on the text.
      INPUT type T_TEXT_MODERATION,
      "!   Properties that control the moderation on the text.
      OUTPUT type T_TEXT_MODERATION,
      "!   The properties specific to masking. If this object exists,<br/>
      "!   even if it is empty, then masking will be applied.
      MASK type T_MASK_PROPERTIES,
    end of T_MODERATION_HAP_PROPERTIES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Properties that control the moderation on the text.</p>
    begin of T_TXT_MDRTN_WITHOUT_THRESHOLD,
      "!   Should this moderation be enabled on the text.<br/>
      "!   <br/>
      "!   <br/>
      "!   The default value is `true` which means that if the parent object exists but the
      "!    `enabled` field does not exist then this is considered to be enabled.
      ENABLED type BOOLEAN,
    end of T_TXT_MDRTN_WITHOUT_THRESHOLD.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The properties specific to PII.</p>
    begin of T_MODERATION_PII_PROPERTIES,
      "!   Properties that control the moderation on the text.
      INPUT type T_TXT_MDRTN_WITHOUT_THRESHOLD,
      "!   Properties that control the moderation on the text.
      OUTPUT type T_TXT_MDRTN_WITHOUT_THRESHOLD,
      "!   The properties specific to masking. If this object exists,<br/>
      "!   even if it is empty, then masking will be applied.
      MASK type T_MASK_PROPERTIES,
    end of T_MODERATION_PII_PROPERTIES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    It can be used to exponentially increase the likelihood of</p>
    "!     the text generation terminating once a specified number of tokens have been
    "!     generated.
    begin of T_TEXT_GEN_LENGTH_PENALTY,
      "!   Represents the factor of exponential decay. Larger values correspond to more
      "!    aggressive decay.
      DECAY_FACTOR type NUMBER,
      "!   A number of generated tokens after which this should take effect.
      START_INDEX type INTEGER,
    end of T_TEXT_GEN_LENGTH_PENALTY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Properties that control what is returned.</p>
    begin of T_RETURN_OPTION_PROPERTIES,
      "!   Include input text in the `generated_text` field.
      INPUT_TEXT type BOOLEAN,
      "!   Include the list of individual generated tokens. Extra token information is
      "!    included based on the other flags below.
      GENERATED_TOKENS type BOOLEAN,
      "!   Include the list of input tokens. Extra token information is included based on
      "!    the other flags here, but only for decoder-only models.
      INPUT_TOKENS type BOOLEAN,
      "!   Include logprob (natural log of probability) for each returned token. Applicable
      "!    only if generated_tokens == true and/or input_tokens == true.
      TOKEN_LOGPROBS type BOOLEAN,
      "!   Include rank of each returned token. Applicable only if generated_tokens == true
      "!    and/or input_tokens == true.
      TOKEN_RANKS type BOOLEAN,
      "!   Include top n candidate tokens at the position of each returned token. The
      "!    maximum value permitted is 5, but more may be returned if there is a tie for
      "!    nth place. Applicable only if generated_tokens == true and/or input_tokens ==
      "!    true.
      TOP_N_TOKENS type INTEGER,
    end of T_RETURN_OPTION_PROPERTIES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The template properties if this request refers to a prompt</p>
    "!     template.
    begin of T_DEPLOYMENT_TEXT_GEN_PROP,
      "!   Represents the strategy used for picking the tokens during generation of the
      "!    output text.<br/>
      "!   <br/>
      "!   During text generation when parameter value is set to greedy, each successive
      "!    token corresponds to the highest probability token given the text that has
      "!    already been generated. This strategy can lead to repetitive results especially
      "!    for longer output sequences. The alternative sample strategy generates text by
      "!    picking subsequent tokens based on the probability distribution of possible
      "!    next tokens defined by (i.e., conditioned on) the already-generated text and
      "!    the top_k and top_p parameters described below. See this
      "!    [url](https://huggingface.co/blog/how-to-generate) for an informative article
      "!    about text generation.
      DECODING_METHOD type STRING,
      "!   It can be used to exponentially increase the likelihood of the text generation
      "!    terminating once a specified number of tokens have been generated.
      LENGTH_PENALTY type T_TEXT_GEN_LENGTH_PENALTY,
      "!   The maximum number of new tokens to be generated. The maximum supported value
      "!    for this field depends on the model being used.<br/>
      "!   <br/>
      "!   How the &quot;token&quot; is defined depends on the tokenizer and vocabulary
      "!    size, which in turn depends on the model. Often the tokens are a mix of full
      "!    words and sub-words. To learn more about tokenization, [see
      "!    here](https://huggingface.co/course/chapter2/4).<br/>
      "!   <br/>
      "!   Depending on the users plan, and on the model being used, there may be an
      "!    enforced maximum number of new tokens.
      MAX_NEW_TOKENS type INTEGER,
      "!   If stop sequences are given, they are ignored until minimum tokens are
      "!    generated.
      MIN_NEW_TOKENS type INTEGER,
      "!   Random number generator seed to use in sampling mode for experimental
      "!    repeatability.
      RANDOM_SEED type INTEGER,
      "!   Stop sequences are one or more strings which will cause the text generation to
      "!    stop if/when they are produced as part of the output. Stop sequences
      "!    encountered prior to the minimum number of tokens being generated will be
      "!    ignored.
      STOP_SEQUENCES type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   A value used to modify the next-token probabilities in sampling mode. Values
      "!    less than 1.0 sharpen the probability distribution, resulting in &quot;less
      "!    random&quot; output. Values greater than 1.0 flatten the probability
      "!    distribution, resulting in &quot;more random&quot; output. A value of 1.0 has
      "!    no effect.
      TEMPERATURE type NUMBER,
      "!   Time limit in milliseconds - if not completed within this time, generation will
      "!    stop. The text generated so far will be returned along with the TIME_LIMIT stop
      "!    reason.<br/>
      "!   <br/>
      "!   Depending on the users plan, and on the model being used, there may be an
      "!    enforced maximum time limit.
      TIME_LIMIT type INTEGER,
      "!   The number of highest probability vocabulary tokens to keep for top-k-filtering.
      "!    Only applies for sampling mode. When decoding_strategy is set to sample, only
      "!    the top_k most likely tokens are considered as candidates for the next
      "!    generated token.
      TOP_K type INTEGER,
      "!   Similar to top_k except the candidates to generate the next token are the most
      "!    likely tokens with probabilities that add up to at least top_p. Also known as
      "!    nucleus sampling. A value of 1.0 is equivalent to disabled.
      TOP_P type NUMBER,
      "!   Represents the penalty for penalizing tokens that have already been generated or
      "!    belong to the context. The value 1.0 means that there is no penalty.
      REPETITION_PENALTY type NUMBER,
      "!   Represents the maximum number of input tokens accepted. This can be used to
      "!    avoid requests failing due to input being longer than configured limits. If the
      "!    text is truncated, then it truncates the start of the input (on the left), so
      "!    the end of the input will remain the same. If this value exceeds the `maximum
      "!    sequence length` (refer to the documentation to find this value for the model)
      "!    then the call will fail if the total number of tokens exceeds the `maximum
      "!    sequence length`.
      TRUNCATE_INPUT_TOKENS type INTEGER,
      "!   Properties that control what is returned.
      RETURN_OPTIONS type T_RETURN_OPTION_PROPERTIES,
      "!   Pass `false` to omit matched stop sequences from the end of the output text. The
      "!    default is `true`, meaning that the output will end with the stop sequence text
      "!    when matched.
      INCLUDE_STOP_SEQUENCE type BOOLEAN,
      "!   Local typicality measures how similar the conditional probability of predicting
      "!    a target token next is to the expected conditional probability of predicting a
      "!    random token next, given the partial text already generated. If less than 1,
      "!    the smallest set of the most locally typical tokens with probabilities that add
      "!    up to typical_p or higher are kept for generation.
      TYPICAL_P type NUMBER,
      "!   The prompt variables.
      PROMPT_VARIABLES type MAP,
    end of T_DEPLOYMENT_TEXT_GEN_PROP.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The properties specific to Granite Guardian. This detector</p>
    "!     is in beta and may change.
    begin of T_MDRTN_GRANITE_GUARDIAN_PROP,
      "!   Properties that control the moderation on the text.
      INPUT type T_TEXT_MODERATION,
      "!   Properties that control the moderation on the text.
      OUTPUT type T_TEXT_MODERATION,
      "!   The properties specific to masking. If this object exists,<br/>
      "!   even if it is empty, then masking will be applied.
      MASK type T_MASK_PROPERTIES,
    end of T_MDRTN_GRANITE_GUARDIAN_PROP.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Properties that control the moderations, for usages such as</p>
    "!     `Hate and profanity` (HAP) and `Personal identifiable information` (PII)
    "!     filtering. This list can be extended with new types of moderations.
    begin of T_MODERATIONS,
      "!   The properties specific to HAP.
      HAP type T_MODERATION_HAP_PROPERTIES,
      "!   The properties specific to PII.
      PII type T_MODERATION_PII_PROPERTIES,
      "!   The properties specific to Granite Guardian. This detector is in beta and may
      "!    change.
      GRANITE_GUARDIAN type T_MDRTN_GRANITE_GUARDIAN_PROP,
      "!   If set, then only these ranges will be applied to the moderations. This is
      "!    useful in the case that certain parts of the input text have already been
      "!    checked.
      INPUT_RANGES type STANDARD TABLE OF T_MODERATION_TEXT_RANGE WITH NON-UNIQUE DEFAULT KEY,
    end of T_MODERATIONS.
  types:
    "! No documentation available.
    begin of T_DEPLOYMENT_TEXT_GEN,
      "!   The prompt to generate completions. Note: The method tokenizes the input
      "!    internally. It is recommended not to leave any trailing spaces.<br/>
      "!   <br/>
      "!   <br/>
      "!   This field is ignored if there is a prompt template.
      INPUT type STRING,
      "!   The template properties if this request refers to a prompt template.
      PARAMETERS type T_DEPLOYMENT_TEXT_GEN_PROP,
      "!   Properties that control the moderations, for usages such as `Hate and profanity`
      "!    (HAP) and `Personal identifiable information` (PII) filtering. This list can be
      "!    extended with new types of moderations.
      MODERATIONS type T_MODERATIONS,
    end of T_DEPLOYMENT_TEXT_GEN.
  types:
    "! No documentation available.
    begin of T_EXT_INFO_EXTERNAL_MODEL,
      "!   No documentation available.
      NAME type STRING,
      "!   No documentation available.
      URL type STRING,
    end of T_EXT_INFO_EXTERNAL_MODEL.
  types:
    "! No documentation available.
    begin of T_EXT_INFO_EXTERNAL_PROMPT,
      "!   No documentation available.
      URL type STRING,
      "!   No documentation available.
      ADDITIONAL_INFORMATION type STANDARD TABLE OF T_Array WITH NON-UNIQUE DEFAULT KEY,
    end of T_EXT_INFO_EXTERNAL_PROMPT.
  types:
    "! No documentation available.
    begin of T_EXTERNAL_INFORMATION,
      "!   No documentation available.
      EXTERNAL_PROMPT_ID type STRING,
      "!   No documentation available.
      EXTERNAL_MODEL_ID type STRING,
      "!   No documentation available.
      EXTERNAL_MODEL_PROVIDER type STRING,
      "!   No documentation available.
      EXTERNAL_PROMPT type T_EXT_INFO_EXTERNAL_PROMPT,
      "!   No documentation available.
      EXTERNAL_MODEL type T_EXT_INFO_EXTERNAL_MODEL,
    end of T_EXTERNAL_INFORMATION.
  types:
    "! No documentation available.
    begin of T_CHAT_ITEM,
      "!   No documentation available.
      TYPE type STRING,
      "!   No documentation available.
      CONTENT type STRING,
      "!   No documentation available.
      STATUS type STRING,
      "!   No documentation available.
      TIMESTAMP type INTEGER,
    end of T_CHAT_ITEM.
  types:
    "! No documentation available.
    begin of T_PROMPT_WITH_EXT_MODEL_PARAM,
      "!   No documentation available.
      DECODING_METHOD type STRING,
      "!   No documentation available.
      MAX_NEW_TOKENS type INTEGER,
      "!   No documentation available.
      MIN_NEW_TOKENS type INTEGER,
      "!   No documentation available.
      RANDOM_SEED type INTEGER,
      "!   No documentation available.
      STOP_SEQUENCES type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   No documentation available.
      TEMPERATURE type NUMBER,
      "!   No documentation available.
      TOP_K type NUMBER,
      "!   No documentation available.
      TOP_P type NUMBER,
      "!   No documentation available.
      REPETITION_PENALTY type NUMBER,
    end of T_PROMPT_WITH_EXT_MODEL_PARAM.
  types:
    "! No documentation available.
    begin of T_PROMPT_DATA,
      "!   No documentation available.
      INSTRUCTION type STRING,
      "!   No documentation available.
      INPUT_PREFIX type STRING,
      "!   No documentation available.
      OUTPUT_PREFIX type STRING,
      "!   No documentation available.
      EXAMPLES type STANDARD TABLE OF T_Array WITH NON-UNIQUE DEFAULT KEY,
    end of T_PROMPT_DATA.
  types:
    "! No documentation available.
    begin of T_PROMPT_WITH_EXTERNAL,
      "!   No documentation available.
      INPUT type STANDARD TABLE OF T_Array WITH NON-UNIQUE DEFAULT KEY,
      "!   No documentation available.
      MODEL_ID type STRING,
      "!   No documentation available.
      MODEL_PARAMETERS type T_PROMPT_WITH_EXT_MODEL_PARAM,
      "!   No documentation available.
      DATA type T_PROMPT_DATA,
      "!   No documentation available.
      SYSTEM_PROMPT type STRING,
      "!   No documentation available.
      CHAT_ITEMS type STANDARD TABLE OF T_CHAT_ITEM WITH NON-UNIQUE DEFAULT KEY,
      "!   No documentation available.
      EXTERNAL_INFORMATION type T_EXTERNAL_INFORMATION,
    end of T_PROMPT_WITH_EXTERNAL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Contains a set of fields specific to each connection.</p>
    begin of T_COS_DATA_LOCATION,
      "!   The name of the file. If multiple files are expected for the output then
      "!    the<br/>
      "!   `file_name` must specify a directory and the value must end with a trailing `/`.
      "!
      FILE_NAME type STRING,
      "!   Can be used to override the bucket name from the connection asset.
      BUCKET type STRING,
    end of T_COS_DATA_LOCATION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Contains a set of location fields specific to each data</p>
    "!     source.
    begin of T_COS_DATA_CONNECTION,
      "!   The id of the connection asset that contains the credentials required to access
      "!    the data.
      ID type STRING,
    end of T_COS_DATA_CONNECTION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A reference to data.</p>
    begin of T_TEXT_EXTRACTION_DATA_REF,
      "!   The data source type.
      TYPE type STRING,
      "!   Contains a set of location fields specific to each data source.
      CONNECTION type T_COS_DATA_CONNECTION,
      "!   Contains a set of fields specific to each connection.
      LOCATION type T_COS_DATA_LOCATION,
    end of T_TEXT_EXTRACTION_DATA_REF.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The properties that are part of a request that supports</p>
    "!     spaces and projects. Either `space_id` or `project_id` has to be provided and
    "!     is mandatory.
    begin of T_TEXT_EXTRACTION_REQUEST,
      "!   A reference to data.
      DOCUMENT_REFERENCE type T_TEXT_EXTRACTION_DATA_REF,
      "!   A reference to data.
      RESULTS_REFERENCE type T_TEXT_EXTRACTION_DATA_REF,
      "!   The steps for the text extraction pipeline.<br/>
      "!   <br/>
      "!   Use `parameters` instead.
      STEPS type T_TEXT_EXTRACTION_STEPS,
      "!   Set this as an empty object to specify `json` output.<br/>
      "!   <br/>
      "!   Use `parameters.requested_outputs` instead.
      ASSEMBLY_JSON type JSONOBJECT,
      "!   Set this as an empty object to specify `markdown` output.<br/>
      "!   <br/>
      "!   Use `parameters.requested_outputs` instead.
      ASSEMBLY_MD type JSONOBJECT,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
    end of T_TEXT_EXTRACTION_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Metrics that can be returned by an operation.</p>
      T_TRAINING_METRICS type STANDARD TABLE OF T_TRAINING_METRIC WITH NON-UNIQUE DEFAULT KEY.
  types:
    "! No documentation available.
      T_PROMPT_VARIABLE type JSONOBJECT.
  types:
    "! No documentation available.
      T_NOTEBOOK_VERSIONS_LST_RESP type JSONOBJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Contains a set of fields that describe the location of the</p>
    "!     data with respect to the `connection`.
    begin of T_OBJECT_LOC_GITHUB_LOCATION,
      "!   This is a vector of strings where each string will be the filepath of the .md
      "!    file stored in the user&apos;s github repository.
      FILEPATHS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   The hash of the git commit when the results were saved.
      COMMIT type STRING,
    end of T_OBJECT_LOC_GITHUB_LOCATION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A reference to data.</p>
    begin of T_OBJECT_LOCATION_GITHUB,
      "!   The data source type, for now only `github` is supported.
      TYPE type STRING,
      "!   Contains a set of fields that describe the location of the data with respect to
      "!    the `connection`.
      LOCATION type T_OBJECT_LOC_GITHUB_LOCATION,
    end of T_OBJECT_LOCATION_GITHUB.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A reference to data.</p>
    begin of T_DOC_EXTRACTION_OBJECT_LOC,
      "!   The data source type. This field must be set to `container`.
      TYPE type STRING,
      "!   Contains a set of fields that describe the location of the data with respect to
      "!    the `connection`.
      LOCATION type MAP,
    end of T_DOC_EXTRACTION_OBJECT_LOC.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details needed to create document extraction job.</p>
    begin of T_DOCUMENT_EXTRACTION_COMMON,
      "!   The name of the document.
      NAME type STRING,
      "!   The documents for text extraction.
      DOCUMENT_REFERENCES type STANDARD TABLE OF T_DOC_EXTRACTION_OBJECT_LOC WITH NON-UNIQUE DEFAULT KEY,
      "!   A reference to data.
      RESULTS_REFERENCE type T_OBJECT_LOCATION_GITHUB,
      "!   A list of tags for this resource.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
    end of T_DOCUMENT_EXTRACTION_COMMON.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Contains a set of fields that describe the location of the</p>
    "!     data with respect to the `connection`.
      T_DATA_LOCATION type MAP.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A service error message.</p>
    begin of T_SERVICE_ERROR,
      "!   A simple code that should convey the general sense of the error.
      CODE type STRING,
      "!   The message that describes the error.
      MESSAGE type STRING,
      "!   A URL to a more detailed explanation when available.
      MORE_INFO type STRING,
    end of T_SERVICE_ERROR.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The current status of the text extraction.</p>
    begin of T_TEXT_EXTRACTION_RESULTS,
      "!   The status of the request.
      STATUS type STRING,
      "!   The time when the request is successfully running on the processor.
      RUNNING_AT type DATETIME,
      "!   The time when the request completed or failed.
      COMPLETED_AT type DATETIME,
      "!   The number of pages that have been processed in the document. If the status is
      "!    `completed` then this is the number of pages that will be billed.
      NUMBER_PAGES_PROCESSED type INTEGER,
      "!   The total number of pages to be processed.
      TOTAL_PAGES type INTEGER,
      "!   A service error message.
      ERROR type T_SERVICE_ERROR,
    end of T_TEXT_EXTRACTION_RESULTS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The document details for the text extraction.</p>
    begin of T_TEXT_EXTRACTION_RESRC_ENTITY,
      "!   A reference to data.
      DOCUMENT_REFERENCE type T_TEXT_EXTRACTION_DATA_REF,
      "!   A reference to data.
      RESULTS_REFERENCE type T_TEXT_EXTRACTION_DATA_REF,
      "!   The steps for the text extraction pipeline.<br/>
      "!   <br/>
      "!   Use `parameters` instead.
      STEPS type T_TEXT_EXTRACTION_STEPS,
      "!   Set this as an empty object to specify `json` output.<br/>
      "!   <br/>
      "!   Use `parameters.requested_outputs` instead.
      ASSEMBLY_JSON type JSONOBJECT,
      "!   Set this as an empty object to specify `markdown` output.<br/>
      "!   <br/>
      "!   Use `parameters.requested_outputs` instead.
      ASSEMBLY_MD type JSONOBJECT,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   The current status of the text extraction.
      RESULTS type T_TEXT_EXTRACTION_RESULTS,
    end of T_TEXT_EXTRACTION_RESRC_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Common metadata for a resource where `project_id` or</p>
    "!     `space_id` must be present.
    begin of T_TEXT_EXTRACTION_METADATA,
      "!   The id of the resource.
      ID type STRING,
      "!   The time when the resource was created.
      CREATED_AT type DATETIME,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
    end of T_TEXT_EXTRACTION_METADATA.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The text extraction response.</p>
    begin of T_TEXT_EXTRACTION_RESPONSE,
      "!   Common metadata for a resource where `project_id` or `space_id` must be present.
      "!
      METADATA type T_TEXT_EXTRACTION_METADATA,
      "!   The document details for the text extraction.
      ENTITY type T_TEXT_EXTRACTION_RESRC_ENTITY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_TEXT_EXTRACTION_RESPONSE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The parameters for the forecast request.</p>
    begin of T_TSFORECAST_PARAMETERS,
      "!   The prediction length for the forecast. The service will return this many
      "!    periods beyond the last timestamp in the inference data payload. If specified,
      "!    `prediction_length` must be an integer &gt;=1 and no more than the model
      "!    default prediction length. When omitted the model default prediction_length
      "!    will be used.
      PREDICTION_LENGTH type INTEGER,
    end of T_TSFORECAST_PARAMETERS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Contains metadata about your timeseries data input.</p>
    begin of T_TSFORECAST_INPUT_SCHEMA,
      "!   A valid column in the data that should be treated as the timestamp. Although not
      "!    absolutely necessary, if using calendar dates  (simple integer time offsets are
      "!    also allowed), users should consider using a format such as ISO 8601 that
      "!    includes a UTC offset (e.g.,<br/>
      "!   &apos;2024-10-18T01:09:21.454746+00:00&apos;). This will avoid potential issues
      "!    such as duplicate dates appearing due to daylight savings change overs. There
      "!    are many date formats in existence and inferring the correct one can be a
      "!    challenge so please do consider adhering to ISO 8601.
      TIMESTAMP_COLUMN type STRING,
      "!   Columns that define a unique key for timeseries. This is similar to a compound
      "!    primary key in a database table.
      ID_COLUMNS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   A frequency indicator for the given timestamp_column. See
      "!    https://pandas.pydata.org/pandas-docs/stable/user_guide/timeseries.html#period-
      "!   aliases for a description of the allowed values. If not provided, we will
      "!    attempt to infer it from the data.
      FREQ type STRING,
      "!   An array of column headings which constitute the target variables in the data.
      "!    These are the data that will be forecasted.
      TARGET_COLUMNS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
    end of T_TSFORECAST_INPUT_SCHEMA.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Input necessary for performing inference. These inputs</p>
    "!     identify things like which model to use, the data payload you are passing to
    "!     the model, and other parameters which affect the behavior of the inference
    "!     operation.
    begin of T_TSFORECAST_REQUEST,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The model to be used for generating a forecast. You can get the list of models
      "!    by using<br/>
      "!   [Foundation Model
      "!    Specs](https://cloud.ibm.com/apidocs/watsonx-ai#list-foundation-model-specs)
      "!    with<br/>
      "!   `filters=function_time_series_forecast`.
      MODEL_ID type STRING,
      "!   The parameters for the forecast request.
      PARAMETERS type T_TSFORECAST_PARAMETERS,
      "!   A payload of data matching `schema`. We assume the following about your
      "!    data:<br/>
      "!     * All timeseries are of equal length and are uniform in nature (the time
      "!    difference between two successive rows is constant). This implies that there
      "!    are no missing rows of data;<br/>
      "!     * The data meet the minimum model-dependent historical context length
      "!    which<br/>
      "!     can be 512 or more rows per timeseries;<br/>
      "!   <br/>
      "!   Note that the example payloads shown are for illustration purposes only. An
      "!    actual payload would necessary be much larger to meet minimum model-specific
      "!    context lengths.
      DATA type JSONOBJECT,
      "!   Contains metadata about your timeseries data input.
      SCHEMA type T_TSFORECAST_INPUT_SCHEMA,
    end of T_TSFORECAST_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of a tool message.</p>
    begin of T_DPLYMNT_TXT_CHT_MSG_TXT_CHT3,
      "!   The role of the messages author.
      ROLE type STRING,
      "!   The contents of the tool message.
      CONTENT type STRING,
      "!   Tool call that this message is responding to.
      TOOL_CALL_ID type STRING,
    end of T_DPLYMNT_TXT_CHT_MSG_TXT_CHT3.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The chunking details for an AutoAI RAG pattern,.</p>
    begin of T_AUTO_AIRAGCHUNKING,
      "!   Text splitting method.
      METHOD type STRING,
      "!   The size (tokens) of the piece of text.
      CHUNK_SIZE type INTEGER,
      "!   Number of overlapping (across chunks) tokens. Must be less than `chunk_size`.
      CHUNK_OVERLAP type INTEGER,
    end of T_AUTO_AIRAGCHUNKING.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The constraint parameters for an AutoAI RAG run.</p>
    begin of T_AUTO_AIRAGCONSTRAINTS,
      "!   Chunking settings to be used.
      CHUNKING type STANDARD TABLE OF T_AUTO_AIRAGCHUNKING WITH NON-UNIQUE DEFAULT KEY,
      "!   The embedding models to try in index building step. Models with
      "!    &quot;autoai_rag&quot; function are supported (use Model Specs API, to retrieve
      "!    list of supported models). If not provided AutoAI selects top 2 performers.
      EMBEDDING_MODELS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   Retrieval methods to be used.
      RETRIEVAL_METHODS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   The foundation models to try in generation step. Models with
      "!    &quot;autoai_rag&quot; function are supported (use Model Specs API, to retrieve
      "!    list of supported models). If not provided AutoAI selects top 3 performers.
      FOUNDATION_MODELS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   The maximum number of RAG patterns to create.
      MAX_NUMBER_OF_RAG_PATTERNS type INTEGER,
    end of T_AUTO_AIRAGCONSTRAINTS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A notebook version entity.</p>
    begin of T_NOTEBOOK_VERSION_ENTITY,
      "!   The guid of the versioned notebook.
      MASTER_NOTEBOOK_GUID type STRING,
      "!   The IUI of the user that has created the version.
      CREATED_BY_IUI type STRING,
      "!   The file reference in the corresponding COS.
      FILE_REFERENCE type STRING,
      "!   The revision id of the notebook.
      REV_ID type INTEGER,
    end of T_NOTEBOOK_VERSION_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Payload for creating a notebook.</p>
    begin of T_NOTEBOOK_CREATE_BODY_GENERAL,
      "!   The name of the new notebook.
      NAME type STRING,
      "!   A more verbose description of the notebook.
      DESCRIPTION type STRING,
      "!   The reference to the file in the object storage.
      FILE_REFERENCE type STRING,
      "!   The notebook origin.
      ORIGINATES_FROM type T_NOTEBOOK_ORIGIN,
      "!   A notebook runtime.
      RUNTIME type T_NOTEBOOK_RUNTIME,
      "!   A notebook kernel.
      KERNEL type T_NOTEBOOK_KERNEL,
    end of T_NOTEBOOK_CREATE_BODY_GENERAL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The text extraction resource.</p>
    begin of T_TEXT_EXTRACTION_RESOURCE,
      "!   Common metadata for a resource where `project_id` or `space_id` must be present.
      "!
      METADATA type T_TEXT_EXTRACTION_METADATA,
      "!   The document details for the text extraction.
      ENTITY type T_TEXT_EXTRACTION_RESRC_ENTITY,
    end of T_TEXT_EXTRACTION_RESOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The Synthetic Data Generation location metrics.</p>
    begin of T_SYNTHETIC_DATA_GEN_LOCATIONS,
      "!   The path to the created Knowledge file.
      KNOWLEDGE type STRING,
      "!   The path to the created Skills file.
      SKILLS type STRING,
      "!   The path to the created Logs file.
      LOGS type STRING,
      "!   The path to the created Artifacts file.
      ARTIFACTS type STRING,
    end of T_SYNTHETIC_DATA_GEN_LOCATIONS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The Synthetic Data Generation metrics.</p>
    begin of T_SYNTHETIC_DATA_GEN_METRIC,
      "!   The Synthetic Data Generation sample metrics.
      SAMPLES type T_SYNTHETIC_DATA_GEN_SAMPLE,
    end of T_SYNTHETIC_DATA_GEN_METRIC.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The Synthetic Data Generation context.</p>
    begin of T_SYNTHETIC_DATA_GEN_CONTEXT,
      "!   The Synthetic Data Generation location metrics.
      SAMPLES type T_SYNTHETIC_DATA_GEN_LOCATIONS,
      "!   Contains a set of fields that describe the location of the data with respect to
      "!    the `connection`.
      LOCATIONS type MAP,
    end of T_SYNTHETIC_DATA_GEN_CONTEXT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    All the Synthetic Data Generation metrics.</p>
    begin of T_SYNTHETIC_DATA_GEN_METRICS,
      "!   The Synthetic Data Generation metrics.
      SYNTHETIC_DATA_GEN_METRICS type T_SYNTHETIC_DATA_GEN_METRIC,
      "!   The Synthetic Data Generation context.
      CONTEXT type T_SYNTHETIC_DATA_GEN_CONTEXT,
      "!   The timestamp when the metrics were gathered.
      TIMESTAMP type DATETIME,
    end of T_SYNTHETIC_DATA_GEN_METRICS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The metric for a given property.</p>
    begin of T_AUTO_AIRAGMETRIC,
      "!   The name of the metric.
      METRIC_NAME type STRING,
      "!   The mean value calculated over all records in the dataset.
      MEAN type NUMBER,
      "!   High confidence interval calculated over all records in the dataset.
      CI_HIGH type NUMBER,
      "!   Low confidence interval calculated over all records in the dataset.
      CI_LOW type NUMBER,
    end of T_AUTO_AIRAGMETRIC.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The AutoAI RAG metrics, this contains the list of calculated</p>
    "!     metrics on test data (provided in the request) and (optionally) synthetic data
    "!     autogenerated. Metric value is mean value calculated over all records in the
    "!     dataset.
    begin of T_AUTO_AIRAGMETRICS,
      "!   List of evaluation metrics.
      TEST_DATA type STANDARD TABLE OF T_AUTO_AIRAGMETRIC WITH NON-UNIQUE DEFAULT KEY,
    end of T_AUTO_AIRAGMETRICS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The retrieval details for an AutoAI RAG pattern,.</p>
    begin of T_AUTO_AIRAGRETRIEVAL,
      "!   Chunks retrieval method.
      METHOD type STRING,
      "!   The number of retrieved chunks.
      NUMBER_OF_CHUNKS type INTEGER,
      "!   The size of the window. Applies only to window based methods.
      WINDOW_SIZE type INTEGER,
    end of T_AUTO_AIRAGRETRIEVAL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The embeddings properties for an AutoAI RAG pattern.</p>
    begin of T_AUTO_AIRAGEMBEDDINGS,
      "!   Truncate strategy.
      TRUNCATE_STRATEGY type STRING,
      "!   Number of input tokens.
      TRUNCATE_INPUT_TOKENS type INTEGER,
      "!   The embedding model id.
      MODEL_ID type STRING,
    end of T_AUTO_AIRAGEMBEDDINGS.
  types:
    "! No documentation available.
      T_AUTO_AIRAGGENERATION_MODEL type JSONOBJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Properties that describe the AutoAI RAG vector store that</p>
    "!     contains the results.
    begin of T_AUTO_AIRAGVECTOR_STORE,
      "!   The vector database type.
      DATASOURCE_TYPE type STRING,
      "!   The database index name.
      INDEX_NAME type STRING,
      "!   The distance metric name.
      DISTANCE_METRIC type STRING,
      "!   The operation type (either insert or upsert).
      OPERATION type STRING,
      "!   The schema of the expected data, see<br/>
      "!   [datarecord-metadata-v2-schema](https://raw.githubusercontent.com/elyra-ai/pipel
      "!   ine-schemas/master/common-pipeline/datarecord-metadata/datarecord-metadata-v2-sc
      "!   hema.json)<br/>
      "!   for the schema definition.
      SCHEMA type T_DATA_SCHEMA,
    end of T_AUTO_AIRAGVECTOR_STORE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The RAG pattern configuration settings that were found</p>
    "!     during the optimization process.
    begin of T_AUTO_AIRAGSETTINGS,
      "!   Properties that describe the AutoAI RAG vector store that contains the results.
      VECTOR_STORE type T_AUTO_AIRAGVECTOR_STORE,
      "!   The chunking details for an AutoAI RAG pattern,.
      CHUNKING type T_AUTO_AIRAGCHUNKING,
      "!   The embeddings properties for an AutoAI RAG pattern.
      EMBEDDINGS type T_AUTO_AIRAGEMBEDDINGS,
      "!   The retrieval details for an AutoAI RAG pattern,.
      RETRIEVAL type T_AUTO_AIRAGRETRIEVAL,
      "!   No documentation available.
      GENERATION type T_AUTO_AIRAGGENERATION_MODEL,
    end of T_AUTO_AIRAGSETTINGS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The location of the different result files.</p>
    begin of T_AUTO_AIRAGRESULT_LOCATION,
      "!   The json file with questions, answers, retrieved contexts, correct answers and
      "!    metric scores.
      EVALUATION_RESULTS type STRING,
      "!   A Jupyter notebook with code required to build the index in the vector database.
      "!
      INDEXING_NOTEBOOK type STRING,
      "!   The Jupyter notebook with the python function code and steps required to store
      "!    and deploy the Q&A chain.
      INFERENCE_NOTEBOOK type STRING,
      "!   The retrieve & generation AI service code (python).
      INFERENCE_SERVICE_CODE type STRING,
      "!   The retrieve & generation AI service metadata.
      INFERENCE_SERVICE_METADATA type STRING,
    end of T_AUTO_AIRAGRESULT_LOCATION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Describes the elements and settings found during the</p>
    "!     optimization of the RAG pattern.
    begin of T_AUTO_AIRAGPATTERN,
      "!   The list of RAG Pattern nodes (steps).
      COMPOSITION_STEPS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   The duration of the optimization step in seconds.
      DURATION_SECONDS type INTEGER,
      "!   The location of the different result files.
      LOCATION type T_AUTO_AIRAGRESULT_LOCATION,
      "!   The RAG Pattern name.
      NAME type STRING,
      "!   The RAG pattern configuration settings that were found during the optimization
      "!    process.
      SETTINGS type T_AUTO_AIRAGSETTINGS,
    end of T_AUTO_AIRAGPATTERN.
  types:
    "! No documentation available.
    begin of T_AUTO_AIRAGCONTEXT,
      "!   Describes the elements and settings found during the optimization of the RAG
      "!    pattern.
      RAG_PATTERN type T_AUTO_AIRAGPATTERN,
      "!   The iteration of the optimization run in which the particular pattern has been
      "!    built.
      ITERATION type INTEGER,
      "!   Maximum number of possible parameter settings (search space cardinality).
      MAX_COMBINATIONS type INTEGER,
      "!   A software specification.
      SOFTWARE_SPEC type T_SOFTWARE_SPEC_REL,
    end of T_AUTO_AIRAGCONTEXT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The AutoAI RAG results.</p>
    begin of T_AUTO_AIRAGRESULTS,
      "!   The AutoAI RAG metrics, this contains the list of calculated metrics on test
      "!    data (provided in the request) and (optionally) synthetic data autogenerated.
      "!    Metric value is mean value calculated over all records in the dataset.
      METRICS type T_AUTO_AIRAGMETRICS,
      "!   No documentation available.
      CONTEXT type T_AUTO_AIRAGCONTEXT,
    end of T_AUTO_AIRAGRESULTS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The AutoAI RAG results.</p>
    begin of T_AUTO_AIRAGRESPONSE_RESULTS,
      "!   The list of results.
      RESULTS type STANDARD TABLE OF T_AUTO_AIRAGRESULTS WITH NON-UNIQUE DEFAULT KEY,
      "!   The timestamp when the results were created.
      TIMESTAMP type DATETIME,
    end of T_AUTO_AIRAGRESPONSE_RESULTS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The reference to the first item in the current page.</p>
    begin of T_PAGINATION_FIRST,
      "!   The uri of the first resource returned.
      HREF type STRING,
    end of T_PAGINATION_FIRST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A reference to the first item of the next page, if any.</p>
    begin of T_PAGINATION_NEXT,
      "!   The uri of the next set of resources.
      HREF type STRING,
    end of T_PAGINATION_NEXT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Information for paging when querying resources.</p>
    begin of T_PAGINATION,
      "!   The total number of resources. Computed explicitly only when
      "!    &apos;total_count=true&apos; query parameter is present. This is in order to
      "!    avoid performance penalties.
      TOTAL_COUNT type INTEGER,
      "!   The number of items to return in each page.
      LIMIT type INTEGER,
      "!   The reference to the first item in the current page.
      FIRST type T_PAGINATION_FIRST,
      "!   A reference to the first item of the next page, if any.
      NEXT type T_PAGINATION_NEXT,
    end of T_PAGINATION.
  types:
    "! No documentation available.
      T_WX_UTIL_AGENT_TOOLS_RUN_REQ type JSONOBJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of a user video content.</p>
    begin of T_TEXT_CHAT_USER_VIDEO_URL,
      "!   This must be a base64 encoded video.
      URL type STRING,
    end of T_TEXT_CHAT_USER_VIDEO_URL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of a user video content.</p>
    begin of T_TXT_CHT_USR_VIDEO_URLCONTENT,
      "!   The type of the user content. You can get the list of models supporting text,
      "!    image, audio, video by using<br/>
      "!   [Foundation Model
      "!    Specs](https://cloud.ibm.com/apidocs/watsonx-ai#list-foundation-model-specs)
      "!    with<br/>
      "!   `filters=function_text_chat`, `filters=function_image_chat`,
      "!    `filters=function_audio_chat`,<br/>
      "!   `filters=function_video_chat` respectively.
      TYPE type STRING,
      "!   The definition of a user video content.
      VIDEO_URL type T_TEXT_CHAT_USER_VIDEO_URL,
    end of T_TXT_CHT_USR_VIDEO_URLCONTENT.
  types:
    "! No documentation available.
    begin of T_RESULTS_REFERENCE_INPUT,
      "!   The training results. Normally this is specified as `type=container` (Service)
      "!    or `type=fs` (Software) which<br/>
      "!   means that it is stored in the space or project.
      RESULTS_REFERENCE type T_RESULTS_LOCATION,
    end of T_RESULTS_REFERENCE_INPUT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The name and number of GPUs used for the Fine Tuning job.</p>
    begin of T_GPU,
      "!   The number of GPUs used for the Fine Tuning job.
      NUM type NUMBER,
      "!   The name of the GPU(s) used for the Fine Tuning job. The GPU specified must be
      "!    available on the cluster.
      NAME type STRING,
    end of T_GPU.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    This field must not be set while creating a fine tuning job</p>
    "!     with InstructLab.<br/>
    "!    <br/>
    "!    The parameters for the job. Note that if `verbalizer` is provided then
    "!     `response_template` must also be provided (and vice versa).
    begin of T_FINE_TUNING_PARAMETERS,
      "!   The task that is targeted for this model.
      TASK_ID type STRING,
      "!   Number of updates steps to accumulate the gradients for, before performing a
      "!    backward/update pass.
      ACCUMULATE_STEPS type INTEGER,
      "!   The model id of the base model for this job.
      BASE_MODEL type T_BASE_MODEL,
      "!   Total number of training epochs to perform.
      NUM_EPOCHS type INTEGER,
      "!   The initial learning rate for AdamW optimizer.
      LEARNING_RATE type NUMBER,
      "!   The batch size per GPU/XPU/TPU/MPS/NPU core/CPU for training.
      BATCH_SIZE type INTEGER,
      "!   Maximum sequence length in terms of number of tokens. Any sequence beyond this
      "!    maximum length will be truncated.
      MAX_SEQ_LENGTH type INTEGER,
      "!   Separator for the prediction/response in the single sequence to train on
      "!    completions only.
      RESPONSE_TEMPLATE type STRING,
      "!   Verbalizer template to be used for formatting data at train and inference
      "!    time.<br/>
      "!   <br/>
      "!   This template may use brackets to indicate where fields from the data model must
      "!    be rendered.
      VERBALIZER type STRING,
      "!   The name and number of GPUs used for the Fine Tuning job.
      GPU type T_GPU,
      "!   Enabling gradient checkpointing reduces GPU memory required at the cost of
      "!    slowing training by approx 20%.
      GRADIENT_CHECKPOINTING type BOOLEAN,
    end of T_FINE_TUNING_PARAMETERS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Status of the training job.</p>
    begin of T_FINE_TUNING_ENTITY,
      "!   This field must not be set while creating a fine tuning job with
      "!    InstructLab.<br/>
      "!   <br/>
      "!   If set to `true` then the result of the training, if successful, will be
      "!    uploaded to the repository as a model.
      AUTO_UPDATE_MODEL type BOOLEAN,
      "!   This field must not be set while creating a fine tuning job with
      "!    InstructLab.<br/>
      "!   <br/>
      "!   The parameters for the job. Note that if `verbalizer` is provided<br/>
      "!   then `response_template` must also be provided (and vice versa).
      PARAMETERS type T_FINE_TUNING_PARAMETERS,
      "!   The `type` of Fine Tuning training. The `type` is set to `ilab` for InstructLab
      "!    training.
      TYPE type STRING,
      "!   The training datasets.
      TRAINING_DATA_REFERENCES type STANDARD TABLE OF T_OBJECT_LOCATION WITH NON-UNIQUE DEFAULT KEY,
      "!   This field must not be set while creating a fine tuning job with
      "!    InstructLab.<br/>
      "!   <br/>
      "!   The holdout/test datasets.
      TEST_DATA_REFERENCES type STANDARD TABLE OF T_OBJECT_LOCATION WITH NON-UNIQUE DEFAULT KEY,
      "!   The training results. Normally this is specified as `type=container` which<br/>
      "!   means that it is stored in the space or project.
      RESULTS_REFERENCE type T_OBJECT_LOCATION,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   Status of the training job.
      STATUS type T_TRAINING_STATUS,
    end of T_FINE_TUNING_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The response of a fine tuning job.</p>
    begin of T_FINE_TUNING_RESOURCE,
      "!   Common metadata for a resource where `project_id` or `space_id` must be present.
      "!
      METADATA type T_RESOURCE_META,
      "!   Status of the training job.
      ENTITY type T_FINE_TUNING_ENTITY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_FINE_TUNING_RESOURCE.
  types:
    "! No documentation available.
    begin of T_FINE_TUNING_RESOURCE_LIST,
      "!   No documentation available.
      RESOURCES type STANDARD TABLE OF T_FINE_TUNING_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
    end of T_FINE_TUNING_RESOURCE_LIST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Properties that control the model and response.</p>
    begin of T_AUTO_AIRAGMODEL_PARAMS,
      "!   Represents the strategy used for picking the tokens during generation of the
      "!    output text.<br/>
      "!   <br/>
      "!   During text generation when parameter value is set to greedy, each successive
      "!    token corresponds to the highest probability token given the text that has
      "!    already been generated. This strategy can lead to repetitive results especially
      "!    for longer output sequences. The alternative sample strategy generates text by
      "!    picking subsequent tokens based on the probability distribution of possible
      "!    next tokens defined by (i.e., conditioned on) the already-generated text and
      "!    the top_k and top_p parameters described below. See this
      "!    [url](https://huggingface.co/blog/how-to-generate) for an informative article
      "!    about text generation.
      DECODING_METHOD type STRING,
      "!   The maximum number of new tokens to be generated. The maximum supported value
      "!    for this field depends on the model being used.<br/>
      "!   <br/>
      "!   How the &quot;token&quot; is defined depends on the tokenizer and vocabulary
      "!    size, which in turn depends on the model. Often the tokens are a mix of full
      "!    words and sub-words. To learn more about tokenization, [see
      "!    here](https://huggingface.co/course/chapter2/4).<br/>
      "!   <br/>
      "!   Depending on the users plan, and on the model being used, there may be an
      "!    enforced maximum number of new tokens.
      MAX_NEW_TOKENS type INTEGER,
      "!   If stop sequences are given, they are ignored until minimum tokens are
      "!    generated.
      MIN_NEW_TOKENS type INTEGER,
      "!   This is the maximum allowed value for the number of tokens in the input prompt
      "!    plus the number of tokens in the output generated by the model.
      MAX_SEQUENCE_LENGTH type INTEGER,
    end of T_AUTO_AIRAGMODEL_PARAMS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Properties describing the custom foundation model.</p>
    begin of T_AT_ARGGNRTN_MDL_AT_ARGCSTM_1,
      "!   The custom foundation model deployment id.
      DEPLOYMENT_ID type STRING,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   Properties that control the model and response.
      PARAMETERS type T_AUTO_AIRAGMODEL_PARAMS,
      "!   The foundation model prompt template text (free form). Must contain variables:
      "!    `question` and `reference_documents`. `reference_documents` variable is a
      "!    placeholder for retrieved document(s) defined by context_template_text. If not
      "!    provided default one is used.
      PROMPT_TEMPLATE_TEXT type STRING,
      "!   The retrieved chunks template text (free form). Must contain variable:
      "!    `document` representing single document chunk retrieved. &gt; If not provided
      "!    default one is used.
      CONTEXT_TEMPLATE_TEXT type STRING,
      "!   Describes word to token ratio.
      WORD_TO_TOKEN_RATIO type NUMBER,
    end of T_AT_ARGGNRTN_MDL_AT_ARGCSTM_1.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of a tool message.</p>
    begin of T_TEXT_CHAT_MESSAGE_TOOL,
      "!   The role of the messages author.
      ROLE type STRING,
      "!   The contents of the tool message.
      CONTENT type STRING,
      "!   Tool call that this message is responding to.
      TOOL_CALL_ID type STRING,
    end of T_TEXT_CHAT_MESSAGE_TOOL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of a tool message.</p>
    begin of T_TXT_CHT_MSG_TXT_CHT_MSG_TOOL,
      "!   The role of the messages author.
      ROLE type STRING,
      "!   The contents of the tool message.
      CONTENT type STRING,
      "!   Tool call that this message is responding to.
      TOOL_CALL_ID type STRING,
    end of T_TXT_CHT_MSG_TXT_CHT_MSG_TOOL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The limits that are applied for the model, for all the</p>
    "!     plans.
    begin of T_MODEL_LIMITS,
      "!   This is the maximum allowed value for the number of tokens in the input prompt
      "!    plus the number of tokens in the output generated by the model.
      MAX_SEQUENCE_LENGTH type INTEGER,
      "!   This is the maximum number of records that can be accepted when training this
      "!    model.
      TRAINING_DATA_MAX_RECORDS type INTEGER,
    end of T_MODEL_LIMITS.
  types:
    "! No documentation available.
    begin of T_PROMPT_MODEL_PARAMETERS,
      "!   No documentation available.
      DECODING_METHOD type STRING,
      "!   No documentation available.
      MAX_NEW_TOKENS type INTEGER,
      "!   No documentation available.
      MIN_NEW_TOKENS type INTEGER,
      "!   No documentation available.
      RANDOM_SEED type INTEGER,
      "!   No documentation available.
      STOP_SEQUENCES type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   No documentation available.
      TEMPERATURE type NUMBER,
      "!   No documentation available.
      TOP_K type NUMBER,
      "!   No documentation available.
      TOP_P type NUMBER,
      "!   No documentation available.
      REPETITION_PENALTY type NUMBER,
    end of T_PROMPT_MODEL_PARAMETERS.
  types:
    "! No documentation available.
    begin of T_PROMPT,
      "!   No documentation available.
      INPUT type STANDARD TABLE OF T_Array WITH NON-UNIQUE DEFAULT KEY,
      "!   No documentation available.
      MODEL_ID type STRING,
      "!   No documentation available.
      MODEL_PARAMETERS type T_PROMPT_MODEL_PARAMETERS,
      "!   No documentation available.
      DATA type T_PROMPT_DATA,
      "!   No documentation available.
      SYSTEM_PROMPT type STRING,
      "!   No documentation available.
      CHAT_ITEMS type STANDARD TABLE OF T_CHAT_ITEM WITH NON-UNIQUE DEFAULT KEY,
    end of T_PROMPT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The specific fields for the geospatial transformation</p>
    "!     metadata fields.
    begin of T_GSPTL_TRANS_METADATA_FLD,
      "!   The space that contains the resource.
      SPACE_ID type STRING,
    end of T_GSPTL_TRANS_METADATA_FLD.
  types:
    "! No documentation available.
    begin of T_PROMPT_LOCK,
      "!   True if the prompt is currently locked.
      LOCKED type BOOLEAN,
      "!   Lock type: &apos;edit&apos; for working on prompts/templates or
      "!    &apos;governance&apos;. Can only be supplied in PUT /lock requests.
      LOCK_TYPE type STRING,
      "!   Locked by is computed by the server and shouldn&apos;t be passed.
      LOCKED_BY type STRING,
    end of T_PROMPT_LOCK.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The tier of the model, depending on the `tier` the billing</p>
    "!     will be different, refer to the plan for the details. Note that input tokens
    "!     and output tokens may be charged differently.
      T_FOUNDATION_MODEL_TIER type String.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    User defined properties specified as key-value pairs.</p>
      T_CUSTOM type JSONOBJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The optimization parameters for an AutoAI RAG run.</p>
    begin of T_AUTO_AIRAGOPTIMIZATION_PARAM,
      "!   The metric name(s) to be used for optimization.
      METRICS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
    end of T_AUTO_AIRAGOPTIMIZATION_PARAM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The status of a Synthetic Data Generation job.</p>
    begin of T_SYNTHETIC_DATA_GEN_STATUS,
      "!   The status of the job.
      STATE type STRING,
      "!   The computed metrics.
      METRICS type STANDARD TABLE OF T_SYNTHETIC_DATA_GEN_METRICS WITH NON-UNIQUE DEFAULT KEY,
      "!   The step the job is currently in.
      STEP type STRING,
      "!   The timestamp when the job completed.
      COMPLETED_AT type DATETIME,
      "!   The timestamp when the job completed.
      RUNNING_AT type DATETIME,
      "!   Contains a set of fields that describe the location of the data with respect to
      "!    the `connection`.
      LOCATIONS type MAP,
    end of T_SYNTHETIC_DATA_GEN_STATUS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The synthetic data generation job properties.</p>
    begin of T_SYNTHETIC_DATA_GEN_RESPONSE,
      "!   A reference to data.
      RESULTS_REFERENCE type T_OBJECT_LOCATION,
      "!   The status of a Synthetic Data Generation job.
      STATUS type T_SYNTHETIC_DATA_GEN_STATUS,
      "!   A reference to data.
      DATA_REFERENCE type T_OBJECT_LOCATION,
    end of T_SYNTHETIC_DATA_GEN_RESPONSE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The `id` of the model to be used for this request. Please</p>
    "!     refer to the [list of
    "!     models](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/fm-mod
    "!    els-embed.html?context=wx&audience=wdp).
      T_EMBEDDING_MODEL_ID type String.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Properties describing the foundation model.</p>
    begin of T_AT_ARGGNRTN_MDL_AT_ARGMDL,
      "!   The foundation model id.
      MODEL_ID type STRING,
      "!   Properties that control the model and response.
      PARAMETERS type T_AUTO_AIRAGMODEL_PARAMS,
      "!   The foundation model prompt template text (free form). Must contain variables:
      "!    `question` and `reference_documents`. `reference_documents` variable is a
      "!    placeholder for retrieved document(s) defined by context_template_text. If not
      "!    provided default one is used.
      PROMPT_TEMPLATE_TEXT type STRING,
      "!   The retrieved chunks template text (free form). Must contain variable:
      "!    `document` representing single document chunk retrieved. &gt; If not provided
      "!    default one is used.
      CONTEXT_TEMPLATE_TEXT type STRING,
      "!   Describes word to token ratio.
      WORD_TO_TOKEN_RATIO type NUMBER,
    end of T_AT_ARGGNRTN_MDL_AT_ARGMDL.
  types:
    "! No documentation available.
      T_DEPLOYMENT_TEXT_CHAT_MSG type JSONOBJECT.
  types:
    "! No documentation available.
      T_NOTEBOOK_VER_RETRIEVE_RESP type JSONOBJECT.
  types:
    "! No documentation available.
    begin of T_WX_PROMPT_POST_MODEL_VERSION,
      "!   User provided semantic version for tracking in IBM AI Factsheets.
      NUMBER type STRING,
      "!   User provived tag.
      TAG type STRING,
      "!   Description of the version.
      DESCRIPTION type STRING,
    end of T_WX_PROMPT_POST_MODEL_VERSION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The properties specific to `watsonx.ai` deployments.</p>
    begin of T_DEPLOYMENT_RESOURCE_ENTITY,
      "!   The base model that is required for this deployment if this is for a prompt
      "!    template or a prompt tune for an IBM foundation model.
      BASE_MODEL_ID type STRING,
    end of T_DEPLOYMENT_RESOURCE_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The fine tuning resource.</p>
    begin of T_FINE_TUNING_REQUEST,
      "!   The name of the job.
      NAME type STRING,
      "!   The description of the job.
      DESCRIPTION type STRING,
      "!   A list of tags for this resource.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   This field must not be set while creating a fine tuning job with
      "!    InstructLab.<br/>
      "!   <br/>
      "!   If set to `true` then the result of the training, if successful, will be
      "!    uploaded to the repository as a model.
      AUTO_UPDATE_MODEL type BOOLEAN,
      "!   This field must not be set while creating a fine tuning job with
      "!    InstructLab.<br/>
      "!   <br/>
      "!   The parameters for the job. Note that if `verbalizer` is provided<br/>
      "!   then `response_template` must also be provided (and vice versa).
      PARAMETERS type T_FINE_TUNING_PARAMETERS,
      "!   The `type` of Fine Tuning training. The `type` is set to `ilab` for InstructLab
      "!    training.
      TYPE type STRING,
      "!   The training datasets.
      TRAINING_DATA_REFERENCES type STANDARD TABLE OF T_OBJECT_LOCATION WITH NON-UNIQUE DEFAULT KEY,
      "!   This field must not be set while creating a fine tuning job with
      "!    InstructLab.<br/>
      "!   <br/>
      "!   The holdout/test datasets.
      TEST_DATA_REFERENCES type STANDARD TABLE OF T_OBJECT_LOCATION WITH NON-UNIQUE DEFAULT KEY,
      "!   The training results. Normally this is specified as `type=container` which<br/>
      "!   means that it is stored in the space or project.
      RESULTS_REFERENCE type T_OBJECT_LOCATION,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
    end of T_FINE_TUNING_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The target of the error.</p>
    begin of T_ERROR_TARGET,
      "!   The type of the problematic field.
      TYPE type STRING,
      "!   The name of the problematic field.
      NAME type STRING,
    end of T_ERROR_TARGET.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The parameters for text tokenization.</p>
    begin of T_TEXT_TOKENIZE_PARAMETERS,
      "!   If this is `true` then the actual tokens will also be returned in the response.
      RETURN_TOKENS type BOOLEAN,
    end of T_TEXT_TOKENIZE_PARAMETERS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The input text, this is only output if</p>
    "!     `parameters.return_options.inputs` is set to `true` in the request.
    begin of T_RERANK_INPUT_RESULT,
      "!   The input text.
      TEXT type STRING,
    end of T_RERANK_INPUT_RESULT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The ranking score for the input.</p>
    begin of T_RERANKED_RESULTS,
      "!   The index of the text from the input in the original request `inputs` array.
      INDEX type INTEGER,
      "!   The score of the input.
      SCORE type NUMBER,
      "!   The input text, this is only output if `parameters.return_options.inputs`<br/>
      "!   is set to `true` in the request.
      INPUT type T_RERANK_INPUT_RESULT,
    end of T_RERANKED_RESULTS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The ranked results.</p>
    begin of T_RERANK_RESPONSE_FIELDS,
      "!   The `id` of the model to be used for this request. Please refer to the [list of
      "!    models](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/fm-mod
      "!   els-embed.html?context=wx&audience=wdp).
      MODEL_ID type STRING,
      "!   The model version (using semantic versioning) if set.
      MODEL_VERSION type STRING,
      "!   The ranked results.
      RESULTS type STANDARD TABLE OF T_RERANKED_RESULTS WITH NON-UNIQUE DEFAULT KEY,
      "!   The time when the response was created in ISO 8601 format.
      CREATED_AT type DATETIME,
      "!   The number of input tokens that were consumed.
      INPUT_TOKEN_COUNT type INTEGER,
      "!   The rank query, if requested.
      QUERY type STRING,
    end of T_RERANK_RESPONSE_FIELDS.
  types:
    "! No documentation available.
    begin of T_WX_UTIL_AGENT_TOOLS_RUN_RESP,
      "!   The output from running the tool.
      OUTPUT type JSONOBJECT,
    end of T_WX_UTIL_AGENT_TOOLS_RUN_RESP.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details for the revision.</p>
    begin of T_REV_ENTITY_SPC_PROJECT_REQ,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   An optional commit message for the revision.
      COMMIT_MESSAGE type STRING,
    end of T_REV_ENTITY_SPC_PROJECT_REQ.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The similarity results.</p>
    begin of T_SIMILARITY_RESULT,
      "!   A similarity score between the source and target text.
      SCORE type NUMBER,
    end of T_SIMILARITY_RESULT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The similarity scores per source string.</p>
    begin of T_SIMILARITY_RESPONSE_FIELDS,
      "!   The `id` of the model to be used for this request. Please refer to the [list of
      "!    models](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/fm-mod
      "!   els-embed.html?context=wx&audience=wdp).
      MODEL_ID type STRING,
      "!   The similarity scores.
      RESULTS type STANDARD TABLE OF T_SIMILARITY_RESULT WITH NON-UNIQUE DEFAULT KEY,
      "!   The time when the response was created in ISO 8601 format.
      CREATED_AT type DATETIME,
      "!   The number of input tokens that were consumed.
      INPUT_TOKEN_COUNT type INTEGER,
    end of T_SIMILARITY_RESPONSE_FIELDS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Datatype to use for training of the underlying text</p>
    "!     generation model. If no value is provided, we pull from torch_dtype in config.
    "!     If an in memory resource is provided which does not match the specified data
    "!     type, the model underpinning the resource will be converted in place to the
    "!     correct torch dtype.
    begin of T_TRAINING_TORCH_DTYPE,
      "!   The datatype.
      DEFAULT type STRING,
    end of T_TRAINING_TORCH_DTYPE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details of an inference API.</p>
    begin of T_INFERENCE,
      "!   The inference URL.
      URL type STRING,
      "!   This is `true` if the inference API supports SSE streaming.
      SSE type BOOLEAN,
      "!   This is `true` if the inference API uses the `serving_name` that was defined in
      "!    this deployment.
      USES_SERVING_NAME type BOOLEAN,
    end of T_INFERENCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The tool call.</p>
    begin of T_TEXT_CHAT_TOOL_CALL,
      "!   The ID of the tool call.
      ID type STRING,
      "!   The type of the tool. Currently, only `function` is supported.
      TYPE type STRING,
      "!   The function call.
      FUNCTION type T_TEXT_CHAT_FUNCTION_CALL,
    end of T_TEXT_CHAT_TOOL_CALL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A message result.</p>
    begin of T_TEXT_CHAT_RESULT_MESSAGE,
      "!   The role of the author of this message.
      ROLE type STRING,
      "!   The contents of the message.
      CONTENT type STRING,
      "!   The refusal message generated by the model.
      REFUSAL type STRING,
      "!   The tool calls generated by the model, such as function calls.
      TOOL_CALLS type STANDARD TABLE OF T_TEXT_CHAT_TOOL_CALL WITH NON-UNIQUE DEFAULT KEY,
    end of T_TEXT_CHAT_RESULT_MESSAGE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A set of key-value pairs that are used to configure the</p>
    "!     deployment.
    begin of T_ONLINE_DEPLOYMENT_PARAMETERS,
      "!   The `serving_name` can be used in the inference URL in place of the
      "!    `deployment_id`.
      SERVING_NAME type STRING,
    end of T_ONLINE_DEPLOYMENT_PARAMETERS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The reason why the call stopped, can be one of:</p><br/>
    "!    - not_finished - Possibly more tokens to be streamed.<br/>
    "!    - max_tokens - Maximum requested tokens reached.<br/>
    "!    - eos_token - End of sequence token encountered.<br/>
    "!    - cancelled - Request canceled by the client.<br/>
    "!    - time_limit - Time limit reached.<br/>
    "!    - stop_sequence - Stop sequence encountered.<br/>
    "!    - token_limit - Token limit reached.<br/>
    "!    - error - Error encountered.<br/>
    "!    <br/>
    "!    Note that these values will be lower-cased so test for values case insensitive.
      T_TEXT_GEN_STOP_REASON type String.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The parameters to guide the generation.</p>
    begin of T_SDGUNSTRUCTURED_GEN_PARAM,
      "!   How many QnA pairs to generate.
      NUM_OUTPUTS_TO_GENERATE type NUMBER,
    end of T_SDGUNSTRUCTURED_GEN_PARAM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The location of the data.</p>
    begin of T_SDGOBJECT_LOCATION_LOCATION,
      "!   The file name of the data.
      PATH type STRING,
    end of T_SDGOBJECT_LOCATION_LOCATION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A reference to data.</p>
    begin of T_SDGOBJECT_LOCATION,
      "!   The data source type.
      TYPE type STRING,
      "!   The location of the data.
      LOCATION type T_SDGOBJECT_LOCATION_LOCATION,
    end of T_SDGOBJECT_LOCATION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details needed to create unstructured synthetic data</p>
    "!     generation job.<br/>
    "!    <br/>
    "!    The `seed_data_reference.type` must be `container` and the
    "!     `results_reference.type` must also be `container`.
    begin of T_SDGUNSTRUCTURED_GEN_ENTITY,
      "!   The pipeline type.
      PIPELINE type STRING,
      "!   A model from the list of certified models that support unstructured generation.
      "!    Refer to the product documentation to know the list of certified model IDs.
      MODEL_ID type STRING,
      "!   The parameters to guide the generation.
      PARAMETERS type T_SDGUNSTRUCTURED_GEN_PARAM,
      "!   A reference to data.
      SEED_DATA_REFERENCE type T_SDGOBJECT_LOCATION,
      "!   A reference to data.
      RESULTS_REFERENCE type T_SDGOBJECT_LOCATION,
    end of T_SDGUNSTRUCTURED_GEN_ENTITY.
  types:
    "! No documentation available.
    begin of T_SDGUNSTRUCTURED_GEN_RESP_JOB,
      "!   The details needed to create unstructured synthetic data generation job.<br/>
      "!   <br/>
      "!   The `seed_data_reference.type` must be `container` and the
      "!    `results_reference.type`<br/>
      "!   must also be `container`.
      CONFIGURATION type T_SDGUNSTRUCTURED_GEN_ENTITY,
    end of T_SDGUNSTRUCTURED_GEN_RESP_JOB.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The synthetic data generation job properties.</p>
    begin of T_SDGUNSTRUCTURED_GEN_RESPONSE,
      "!   No documentation available.
      JOB type T_SDGUNSTRUCTURED_GEN_RESP_JOB,
      "!   The id of the the resource.
      ASSET_ID type STRING,
    end of T_SDGUNSTRUCTURED_GEN_RESPONSE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The response from getting a specified synthetic data</p>
    "!     generation job.
    begin of T_SDGUNSTRUCTURED_GEN_RESOURCE,
      "!   Common metadata for a resource where `project_id` or `space_id` must be present.
      "!
      METADATA type T_RESOURCE_META,
      "!   The synthetic data generation job properties.
      ENTITY type T_SDGUNSTRUCTURED_GEN_RESPONSE,
    end of T_SDGUNSTRUCTURED_GEN_RESOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A reference to a resource.</p>
    begin of T_MODEL_REL,
      "!   The id of the referenced resource.
      ID type STRING,
      "!   The revision of the referenced resource.
      REV type STRING,
      "!   The resource key for this asset if it exists.
      RESOURCE_KEY type STRING,
    end of T_MODEL_REL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A reference to a resource.</p>
    begin of T_SIMPLE_REL,
      "!   The id of the referenced resource.
      ID type STRING,
    end of T_SIMPLE_REL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Specifies the current status, additional information about</p>
    "!     the deployment and any failure messages in case of deployment failures.
    begin of T_DEPLOYMENT_STATUS,
      "!   Specifies the current state of the deployment.
      STATE type STRING,
      "!   Optional messages related to the resource.
      MESSAGE type T_MESSAGE,
      "!   The data returned when an error is encountered.
      FAILURE type T_API_ERROR_RESPONSE,
      "!   The URLs that can be used to submit inference API requests. These URLs will
      "!    contain the<br/>
      "!   `deployment_id` and the `serving_name`, if the `serving_name` was set.
      INFERENCE type STANDARD TABLE OF T_INFERENCE WITH NON-UNIQUE DEFAULT KEY,
    end of T_DEPLOYMENT_STATUS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Indicates that this is an online deployment. An object has</p>
    "!     to be specified but can be empty. The `serving_name` can be provided in the
    "!     `online.parameters`.
    begin of T_ONLINE_DEPLOYMENT,
      "!   A set of key-value pairs that are used to configure the deployment.
      PARAMETERS type T_ONLINE_DEPLOYMENT_PARAMETERS,
    end of T_ONLINE_DEPLOYMENT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A hardware specification.</p>
    begin of T_HARDWARE_SPEC,
      "!   The id of the hardware specification.
      ID type STRING,
      "!   The revision of the hardware specification.
      REV type STRING,
      "!   The name of the hardware specification.
      NAME type STRING,
      "!   The number of nodes applied to a computation.
      NUM_NODES type INTEGER,
    end of T_HARDWARE_SPEC.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The requested hardware for deployment.</p>
    begin of T_HARDWARE_REQUEST,
      "!   The size of GPU requested for the deployment.
      SIZE type STRING,
      "!   The number of nodes for the GPU requested for deployment.
      NUM_NODES type NUMBER,
    end of T_HARDWARE_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of the deployment.</p>
    begin of T_DEPLOYMENT_ENTITY,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   A reference to a resource.
      PROMPT_TEMPLATE type T_SIMPLE_REL,
      "!   Indicates that this is an online deployment. An object has to be specified but
      "!    can be empty.<br/>
      "!   The `serving_name` can be provided in the `online.parameters`.
      ONLINE type T_ONLINE_DEPLOYMENT,
      "!   A hardware specification.
      HARDWARE_SPEC type T_HARDWARE_SPEC,
      "!   The requested hardware for deployment.
      HARDWARE_REQUEST type T_HARDWARE_REQUEST,
      "!   A reference to a resource.
      ASSET type T_MODEL_REL,
      "!   The base model that is required for this deployment if this is for a prompt
      "!    template or a prompt tune for an IBM foundation model.
      BASE_MODEL_ID type STRING,
      "!   The type of the deployed model. The possible values are the following:<br/>
      "!   <br/>
      "!   1. `prompt_tune` - when a prompt tuned model is deployed.<br/>
      "!   <br/>
      "!   2. `foundation_model` - when a prompt template is used on a pre-deployed IBM
      "!    provided model.<br/>
      "!   <br/>
      "!   3. `custom_foundation_model` - when a custom foundation model is deployed.<br/>
      "!   <br/>
      "!   4. `curated_foundation_model` - when a curated foundation model is deployed.
      DEPLOYED_ASSET_TYPE type STRING,
      "!   The verbalizer that was used to train this model if the deployment has
      "!    `deployed_asset_type` of `prompt_tune`.
      VERBALIZER type STRING,
      "!   Specifies the current status, additional information about the deployment<br/>
      "!   and any failure messages in case of deployment failures.
      STATUS type T_DEPLOYMENT_STATUS,
      "!   User defined properties specified as key-value pairs, which is propagated to the
      "!    deployment.
      TOOLING type JSONOBJECT,
    end of T_DEPLOYMENT_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A deployment resource.</p>
    begin of T_DEPLOYMENT_RESOURCE,
      "!   Common metadata for a resource where `project_id` or `space_id` must be present.
      "!
      METADATA type T_RESOURCE_META,
      "!   The definition of the deployment.
      ENTITY type T_DEPLOYMENT_ENTITY,
    end of T_DEPLOYMENT_RESOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The deployment resources.</p>
    begin of T_DEPLOYMENT_RESRC_COLLECTION,
      "!   The total number of resources. Computed explicitly only when
      "!    &apos;total_count=true&apos; query parameter is present. This is in order to
      "!    avoid performance penalties.
      TOTAL_COUNT type INTEGER,
      "!   The number of items to return in each page.
      LIMIT type INTEGER,
      "!   The reference to the first item in the current page.
      FIRST type T_PAGINATION_FIRST,
      "!   A reference to the first item of the next page, if any.
      NEXT type T_PAGINATION_NEXT,
      "!   A list of deployment resources.
      RESOURCES type STANDARD TABLE OF T_DEPLOYMENT_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
      "!   System details including warnings.
      SYSTEM type T_DEPLOYMENT_SYSTEM,
    end of T_DEPLOYMENT_RESRC_COLLECTION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The return options for text embeddings.</p>
    begin of T_EMBEDDING_RETURN_OPTIONS,
      "!   Include the `input` text in each of the `results` documents.
      INPUT_TEXT type BOOLEAN,
    end of T_EMBEDDING_RETURN_OPTIONS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The properties that are part of a request that supports</p>
    "!     spaces.
    begin of T_ENTITY_REQUEST_SPACE_BODY,
      "!   The space that contains the resource.
      SPACE_ID type STRING,
      "!   The name of the resource.
      NAME type STRING,
      "!   A description of the resource.
      DESCRIPTION type STRING,
      "!   A list of tags for this resource.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
    end of T_ENTITY_REQUEST_SPACE_BODY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The chat response format parameters.</p>
    begin of T_TEXT_CHAT_RESPONSE_FORMAT,
      "!   Used to enable JSON mode, which guarantees the message the model generates is
      "!    valid JSON.<br/>
      "!   <br/>
      "!   **Important:** when using JSON mode, you must also instruct the model to produce
      "!    JSON yourself via a system or user message. Without this, the model may
      "!    generate an unending stream of whitespace until the generation reaches the
      "!    token limit, resulting in a long-running and seemingly &quot;stuck&quot;
      "!    request. Also note that the message content may be partially cut off if
      "!    `finish_reason=&quot;length&quot;`, which indicates the generation exceeded
      "!    `max_tokens` or the conversation exceeded the max context length.
      TYPE type STRING,
    end of T_TEXT_CHAT_RESPONSE_FORMAT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The parameters specific to chat.</p>
    begin of T_TEXT_CHAT_PARAMETERS,
      "!   Positive values penalize new tokens based on their existing frequency in the
      "!    text so far, decreasing the model&apos;s likelihood to repeat the same line
      "!    verbatim.
      FREQUENCY_PENALTY type NUMBER,
      "!   Increasing or decreasing probability of tokens being selected during generation;
      "!    a positive bias makes a token more likely to appear, while a negative bias
      "!    makes it less likely.
      LOGIT_BIAS type JSONOBJECT,
      "!   Whether to return log probabilities of the output tokens or not. If true,
      "!    returns the log probabilities of each output token returned in the content of
      "!    message.
      LOGPROBS type BOOLEAN,
      "!   An integer specifying the number of most likely tokens to return at each token
      "!    position, each with an associated log probability. The option `logprobs` must
      "!    be set to `true` if this parameter is used.
      TOP_LOGPROBS type INTEGER,
      "!   The maximum number of tokens that can be generated in the chat completion. The
      "!    total length of input tokens and generated tokens is limited by the
      "!    model&apos;s context length.
      MAX_TOKENS type INTEGER,
      "!   How many chat completion choices to generate for each input message. Note that
      "!    you will be charged based on the number of generated tokens across all of the
      "!    choices. Keep n as 1 to minimize costs.
      N type INTEGER,
      "!   Positive values penalize new tokens based on whether they appear in the text so
      "!    far, increasing the model&apos;s likelihood to talk about new topics.
      PRESENCE_PENALTY type NUMBER,
      "!   The chat response format parameters.
      RESPONSE_FORMAT type T_TEXT_CHAT_RESPONSE_FORMAT,
      "!   Random number generator seed to use in sampling mode for experimental
      "!    repeatability.
      SEED type INTEGER,
      "!   Stop sequences are one or more strings which will cause the text generation to
      "!    stop if/when they are produced as part of the output. Stop sequences
      "!    encountered prior to the minimum number of tokens being generated will be
      "!    ignored.
      STOP type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   What sampling temperature to use,. Higher values like 0.8 will make the output
      "!    more random, while lower values like 0.2 will make it more focused and
      "!    deterministic.<br/>
      "!   <br/>
      "!   We generally recommend altering this or `top_p` but not both.
      TEMPERATURE type NUMBER,
      "!   An alternative to sampling with temperature, called nucleus sampling, where the
      "!    model considers the results of the tokens with top_p probability mass. So 0.1
      "!    means only the tokens comprising the top 10% probability mass are
      "!    considered.<br/>
      "!   <br/>
      "!   We generally recommend altering this or `temperature` but not both.
      TOP_P type NUMBER,
      "!   Time limit in milliseconds - if not completed within this time, generation will
      "!    stop. The text generated so far will be returned along with the `TIME_LIMIT``
      "!    stop reason. Depending on the users plan, and on the model being used, there
      "!    may be an enforced maximum time limit.
      TIME_LIMIT type INTEGER,
    end of T_TEXT_CHAT_PARAMETERS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The response from getting a specified synthetic data</p>
    "!     generation job.
    begin of T_SYNTHETIC_DATA_GEN_RESOURCE,
      "!   Common metadata for a resource where `project_id` or `space_id` must be present.
      "!
      METADATA type T_RESOURCE_META,
      "!   The synthetic data generation job properties.
      ENTITY type T_SYNTHETIC_DATA_GEN_RESPONSE,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_SYNTHETIC_DATA_GEN_RESOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A task that is covered by some of the foundation models that</p>
    "!     are supported in the service.
    begin of T_FOUNDATION_MODEL_TASK,
      "!   The id of the task.
      TASK_ID type STRING,
      "!   The label of the task.
      LABEL type STRING,
      "!   The description of the task.
      DESCRIPTION type STRING,
      "!   The rank of the task that is mainly for the UI.
      RANK type INTEGER,
    end of T_FOUNDATION_MODEL_TASK.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    System details.</p>
    begin of T_FOUNDATION_MODEL_TASKS,
      "!   The total number of resources.
      TOTAL_COUNT type INTEGER,
      "!   The number of items to return in each page.
      LIMIT type INTEGER,
      "!   The reference to the first item in the current page.
      FIRST type T_PAGINATION_FIRST,
      "!   A reference to the first item of the next page, if any.
      NEXT type T_PAGINATION_NEXT,
      "!   The supported foundation model tasks.
      RESOURCES type STANDARD TABLE OF T_FOUNDATION_MODEL_TASK WITH NON-UNIQUE DEFAULT KEY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_FOUNDATION_MODEL_TASKS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The project that contains the resource.</p>
      T_PROJECT_ID_ONLY type String.
  types:
    "! No documentation available.
    begin of T_WX_PROMPT_RESP_MODEL_VERSION,
      "!   User provided semantic version for tracking in IBM AI Factsheets.
      NUMBER type STRING,
      "!   User provived tag.
      TAG type STRING,
      "!   Description of the version.
      DESCRIPTION type STRING,
    end of T_WX_PROMPT_RESP_MODEL_VERSION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Notebook version metadata.</p>
    begin of T_NOTEBOOK_VERSION_METADATA,
      "!   The guid of the version.
      GUID type STRING,
      "!   The URL of the version.
      URL type STRING,
      "!   The creation timestamp in UTC millisecond since UNIX Epoch time.
      CREATED_AT type INTEGER,
    end of T_NOTEBOOK_VERSION_METADATA.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A notebook version in a project.</p>
    begin of T_NOTEBOOK_VERSION_IN_PROJECT,
      "!   Notebook version metadata.
      METADATA type T_NOTEBOOK_VERSION_METADATA,
      "!   A notebook version entity in a project.
      ENTITY type T_NTBK_VER_ENTITY_IN_PROJECT,
    end of T_NOTEBOOK_VERSION_IN_PROJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A list of notebook versions in a project.</p>
    begin of T_NTBK_VRSNS_LST_RESP_NTBK_VR1,
      "!   The number of items in the resources array.
      TOTAL_RESULTS type INTEGER,
      "!   An array of notebook versions.
      RESOURCES type STANDARD TABLE OF T_NOTEBOOK_VERSION_IN_PROJECT WITH NON-UNIQUE DEFAULT KEY,
    end of T_NTBK_VRSNS_LST_RESP_NTBK_VR1.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Number of steps to be used for gradient accumulation.</p>
    "!     Gradient accumulation refers to a method of collecting gradient for configured
    "!     number of steps instead of updating the model variables at every step and then
    "!     applying the update to model variables. This can be used as a tool to overcome
    "!     smaller batch size limitation. Often also referred in conjunction with
    "!     &quot;effective batch size&quot;.
    begin of T_TRAINING_ACCUMULATED_STEPS,
      "!   The default value.
      DEFAULT type INTEGER,
      "!   The minimum value.
      MIN type INTEGER,
      "!   The maximum value.
      MAX type INTEGER,
    end of T_TRAINING_ACCUMULATED_STEPS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Initialization text to be used if init_method is set to</p>
    "!     `text`, otherwise this will be ignored.
    begin of T_TRAINING_INIT_TEXT,
      "!   Initialization text.
      DEFAULT type STRING,
    end of T_TRAINING_INIT_TEXT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The batch size is a number of samples processed before the</p>
    "!     model is updated.
    begin of T_TRAINING_BATCH_SIZE,
      "!   The default value.
      DEFAULT type INTEGER,
      "!   The minimum value.
      MIN type INTEGER,
      "!   The maximum value.
      MAX type INTEGER,
    end of T_TRAINING_BATCH_SIZE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Verbalizer template to be used for formatting data at train</p>
    "!     and inference time. This template may use brackets to indicate where fields
    "!     from the data model TrainGenerationRecord must be rendered.
    begin of T_TRAINING_VERBALIZER,
      "!   The default verbalizer.
      DEFAULT type STRING,
    end of T_TRAINING_VERBALIZER.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Maximum length of input tokens being considered.</p>
    begin of T_TRAINING_MAX_INPUT_TOKENS,
      "!   The default value.
      DEFAULT type INTEGER,
      "!   The minimum value.
      MIN type INTEGER,
      "!   The maximum value.
      MAX type INTEGER,
    end of T_TRAINING_MAX_INPUT_TOKENS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Maximum length of output tokens being predicted.</p>
    begin of T_TRAINING_MAX_OUTPUT_TOKENS,
      "!   The default value.
      DEFAULT type INTEGER,
      "!   The minimum value.
      MIN type INTEGER,
      "!   The maximum value.
      MAX type INTEGER,
    end of T_TRAINING_MAX_OUTPUT_TOKENS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Learning rate to be used for training.</p>
    begin of T_TRAINING_LEARNING_RATE,
      "!   The default value.
      DEFAULT type NUMBER,
      "!   The minimum value.
      MIN type NUMBER,
      "!   The maximum value.
      MAX type NUMBER,
    end of T_TRAINING_LEARNING_RATE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Number of virtual tokens to be used for training. In prompt</p>
    "!     tuning we are essentially learning the embedded representations for soft
    "!     prompts, which are known as virtual tokens, via back propagation for a specific
    "!     task(s) while keeping the rest of the model fixed. `num_virtual_tokens` is the
    "!     number of dimensions for these virtual tokens.
    begin of T_TRAINING_NUM_VIRTUAL_TOKENS,
      "!   The possible values for the number of virtual tokens.
      SUPPORTED type STANDARD TABLE OF INTEGER WITH NON-UNIQUE DEFAULT KEY,
      "!   The default number of virtual tokens.
      DEFAULT type INTEGER,
    end of T_TRAINING_NUM_VIRTUAL_TOKENS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Training parameters for a given model.</p>
    begin of T_TRAINING_PARAMETERS,
      "!   Initialization methods for a training.
      INIT_METHOD type T_TRAINING_INIT_METHOD,
      "!   Initialization text to be used if init_method is set to `text`, otherwise this
      "!    will be ignored.
      INIT_TEXT type T_TRAINING_INIT_TEXT,
      "!   Number of virtual tokens to be used for training.<br/>
      "!   In prompt tuning we are essentially learning the embedded representations for
      "!    soft prompts,<br/>
      "!   which are known as virtual tokens, via back propagation for a specific task(s)
      "!    while keeping<br/>
      "!   the rest of the model fixed. `num_virtual_tokens` is the number of dimensions
      "!    for these virtual tokens.
      NUM_VIRTUAL_TOKENS type T_TRAINING_NUM_VIRTUAL_TOKENS,
      "!   The number of epochs is the number of complete passes through the training
      "!    dataset.<br/>
      "!   The quality depends on the number of epochs.
      NUM_EPOCHS type T_TRAINING_NUM_EPOCHS,
      "!   Verbalizer template to be used for formatting data at train and inference
      "!    time.<br/>
      "!   This template may use brackets to indicate where fields from the data model<br/>
      "!   TrainGenerationRecord must be rendered.
      VERBALIZER type T_TRAINING_VERBALIZER,
      "!   The batch size is a number of samples processed before the model is updated.
      BATCH_SIZE type T_TRAINING_BATCH_SIZE,
      "!   Maximum length of input tokens being considered.
      MAX_INPUT_TOKENS type T_TRAINING_MAX_INPUT_TOKENS,
      "!   Maximum length of output tokens being predicted.
      MAX_OUTPUT_TOKENS type T_TRAINING_MAX_OUTPUT_TOKENS,
      "!   Datatype to use for training of the underlying text generation model.<br/>
      "!   If no value is provided, we pull from torch_dtype in config.<br/>
      "!   If an in memory resource is provided which does not match the specified data
      "!    type,<br/>
      "!   the model underpinning the resource will be converted in place to the correct
      "!    torch dtype.
      TORCH_DTYPE type T_TRAINING_TORCH_DTYPE,
      "!   Number of steps to be used for gradient accumulation.<br/>
      "!   Gradient accumulation refers to a method of collecting gradient for configured
      "!    number of steps<br/>
      "!   instead of updating the model variables at every step and then applying the
      "!    update to model variables.<br/>
      "!   This can be used as a tool to overcome smaller batch size limitation.<br/>
      "!   Often also referred in conjunction with &quot;effective batch size&quot;.
      ACCUMULATE_STEPS type T_TRAINING_ACCUMULATED_STEPS,
      "!   Learning rate to be used for training.
      LEARNING_RATE type T_TRAINING_LEARNING_RATE,
    end of T_TRAINING_PARAMETERS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A minor or patch version for the model.</p>
    begin of T_FOUNDATION_MODEL_VERSION,
      "!   The version of the model. This must follow semantic versioning semantics.
      VERSION type STRING,
      "!   The date (ISO 8601 format YYYY-MM-DD) when this version first became available.
      AVAILABLE_DATE type DATE,
    end of T_FOUNDATION_MODEL_VERSION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The ratings for this task for this model.</p>
    begin of T_TASK_RATING,
      "!   A metric that indicates the cost expected to be incurred by the model&apos;s
      "!    support of an inference task, in terms of resource consumption and processing
      "!    time, on a scale of 1 to 5, where 5 is the least cost and 1 is the most cost. A
      "!    missing value means that the cost is not known.
      COST type INTEGER,
      "!   A metric that indicates the quality of the model&apos;s support of an inference
      "!    task, on a scale of 1 to 5, where 5 is the best support and 1 is poor support.
      "!    A missing value means that the quality is not known.
      QUALITY type INTEGER,
    end of T_TASK_RATING.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The lifecycle details.</p>
    begin of T_LIFE_CYCLE_STATE,
      "!   The possible lifecycle stages, in order, are described below:<br/>
      "!   <br/>
      "!   - `available`: this means that the model is available for use.<br/>
      "!   - `deprecated`: this means that the model is still available but the model will
      "!    be removed soon, so an alternative model should be used.<br/>
      "!   - `constricted`: this means that the model is still available for inferencing
      "!    but cannot be used for training or in a deployment. The model will be removed
      "!    soon so an alternative model should be used.<br/>
      "!   - `withdrawn`: this means that the model is no longer available, check the
      "!    `alternative_model_ids` to see what it can be replaced by.
      ID type STRING,
      "!   An optional label that may be used in the UI.
      LABEL type STRING,
      "!   The date (ISO 8601 format YYYY-MM-DD) when this lifecycle stage starts.
      START_DATE type DATE,
      "!   Alternative models, or model versions, that can be used instead of this model.
      ALTERNATIVE_MODEL_IDS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   A link to the documentation specifying details on the lifecycle plan for this
      "!    model.
      URL type STRING,
    end of T_LIFE_CYCLE_STATE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The attributes of the task for this model.</p>
    begin of T_TASK_DESCRIPTION,
      "!   The `id` of the task.
      ID type STRING,
      "!   The ratings for this task for this model.
      RATINGS type T_TASK_RATING,
      "!   The tags for a given task.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
    end of T_TASK_DESCRIPTION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Limits per plan that may be set per request.</p>
    begin of T_FOUNDATION_MODEL_LIMITS,
      "!   The limits that may be set per request.
      LITE type T_CONSUMPTIONS_LIMIT,
    end of T_FOUNDATION_MODEL_LIMITS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A supported foundation model.</p>
    begin of T_FOUNDATION_MODEL,
      "!   The id of the foundation model.
      MODEL_ID type STRING,
      "!   A short label that will be displayed in the UI.
      LABEL type STRING,
      "!   The provider of the model.
      PROVIDER type STRING,
      "!   The organization or person that tuned this model.
      TUNED_BY type STRING,
      "!   A short description of the model suitable for a title.
      SHORT_DESCRIPTION type STRING,
      "!   A longer description of the model, that may be used if no `description_url` is
      "!    provided.
      LONG_DESCRIPTION type STRING,
      "!   Limits per plan that may be set per request.
      LIMITS type T_FOUNDATION_MODEL_LIMITS,
      "!   Languages supported by the model.
      SUPPORTED_LANGUAGES type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   Deprecated: please use `tasks` instead.
      TASK_IDS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   The tasks that are supported by this model.
      TASKS type STANDARD TABLE OF T_TASK_DESCRIPTION WITH NON-UNIQUE DEFAULT KEY,
      "!   The tier of the model, depending on the `tier` the billing will be different,
      "!    refer to the plan for the details. Note that input tokens and output tokens may
      "!    be charged differently.
      INPUT_TIER type STRING,
      "!   The tier of the model, depending on the `tier` the billing will be different,
      "!    refer to the plan for the details. Note that input tokens and output tokens may
      "!    be charged differently.
      OUTPUT_TIER type STRING,
      "!   Specifies the provider of this model.
      SOURCE type STRING,
      "!   The minimum number of examples required for the model.
      MIN_SHOT_SIZE type INTEGER,
      "!   The number of parameters used for the model, it will accept `m` for million, `b`
      "!    for billion and `t` for trillion.
      NUMBER_PARAMS type STRING,
      "!   The limits that are applied for the model, for all the plans.
      MODEL_LIMITS type T_MODEL_LIMITS,
      "!   The information related to the lifecycle of this model.
      LIFECYCLE type STANDARD TABLE OF T_LIFE_CYCLE_STATE WITH NON-UNIQUE DEFAULT KEY,
      "!   Training parameters for a given model.
      TRAINING_PARAMETERS type T_TRAINING_PARAMETERS,
      "!   The information related to the minor versions of this model.
      VERSIONS type STANDARD TABLE OF T_FOUNDATION_MODEL_VERSION WITH NON-UNIQUE DEFAULT KEY,
      "!   If `true` then this model is only available in the `Tech Preview`.
      TECH_PREVIEW type BOOLEAN,
    end of T_FOUNDATION_MODEL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The prompt variables.</p>
      T_PROMPT_VARIABLES type MAP.
  types:
    "! No documentation available.
    begin of T_EXT_STR_SETTINGS_SCHEMA_FLD,
      "!   Field to use for finding the document name.
      DOCUMENT_NAME type STRING,
      "!   Field to use for the text in the document.
      TEXT type STRING,
      "!   Field to use for finding the document page number.
      PAGE_NUMBER type STRING,
      "!   The vector_query_field that contains the text_expansion query. Only applicable
      "!    for Elasticsearch.
      VECTOR_QUERY type STRING,
      "!   The optional field that contains a url for the document.
      DOCUMENT_URL type STRING,
    end of T_EXT_STR_SETTINGS_SCHEMA_FLD.
  types:
    "! No documentation available.
    begin of T_EXTERNAL_STORE_SETTINGS,
      "!   The number of text (or tokens) that are grouped together before converting into
      "!    a vector.
      CHUNK_SIZE type NUMBER,
      "!   The number of characters to overlap for chunking data.
      CHUNK_OVERLAP type NUMBER,
      "!   specifies how many tokens to sample.
      TOP_K type NUMBER,
      "!   No documentation available.
      SPLIT_PDF_PAGES type BOOLEAN,
      "!   No documentation available.
      RERANK type BOOLEAN,
      "!   No documentation available.
      EMBEDDING_MODEL_ID type STRING,
      "!   No documentation available.
      SCHEMA_FIELDS type T_EXT_STR_SETTINGS_SCHEMA_FLD,
    end of T_EXTERNAL_STORE_SETTINGS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of a user text content.</p>
    begin of T_TXT_CHT_USR_CNTNTS_TXT_CHT_1,
      "!   The type of the user content. You can get the list of models supporting text,
      "!    image, audio, video by using<br/>
      "!   [Foundation Model
      "!    Specs](https://cloud.ibm.com/apidocs/watsonx-ai#list-foundation-model-specs)
      "!    with<br/>
      "!   `filters=function_text_chat`, `filters=function_image_chat`,
      "!    `filters=function_audio_chat`,<br/>
      "!   `filters=function_video_chat` respectively.
      TYPE type STRING,
      "!   The text content.
      TEXT type STRING,
    end of T_TXT_CHT_USR_CNTNTS_TXT_CHT_1.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Asset API asset description returned with a notebook</p>
    "!     listing.
    begin of T_NOTEBOOK_RESRC_ENTITY_ASSET,
      "!   The UUID of the asset.
      ASSET_ID type STRING,
      "!   The asset type. Always &quot;notebook&quot;.
      ASSET_TYPE type STRING,
      "!   Timestamp of the creation date, ms since epoch.
      CREATED type INTEGER,
      "!   Date the asset was created, ISO format.
      CREATED_AT type STRING,
      "!   The asset catalog ID.
      CATALOG_ID type STRING,
      "!   The project the notebook belongs to.
      PROJECT_ID type STRING,
      "!   Version of the asset.
      VERSION type INTEGER,
      "!   The asset URL.
      HREF type STRING,
    end of T_NOTEBOOK_RESRC_ENTITY_ASSET.
  types:
    "! No documentation available.
    begin of T_EXT_PRMPT_ADDTNL_INFO_ITEM,
      "!   No documentation available.
      KEY type STRING,
    end of T_EXT_PRMPT_ADDTNL_INFO_ITEM.
  types:
    "! No documentation available.
      T_EXT_PROMPT_ADDITIONAL_INFO type STANDARD TABLE OF T_EXT_PRMPT_ADDTNL_INFO_ITEM WITH NON-UNIQUE DEFAULT KEY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The text that was detected.</p>
    begin of T_TEXT_DETECTION_CONTENT_ITEM,
      "!   The type of the detection identified.
      DETECTION_TYPE type STRING,
      "!   The detected string.
      DETECTION type STRING,
      "!   The threshold probability that this is a real match.
      SCORE type FLOAT,
      "!   The position in the content where the detected text starts.
      START type INTEGER,
      "!   The position in the content where the detected text ends.
      END type INTEGER,
    end of T_TEXT_DETECTION_CONTENT_ITEM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Status of the training job.</p>
    begin of T_TRAINING_STATUS_OUTPUT,
      "!   Status of the training job.
      STATUS type T_TRAINING_STATUS,
    end of T_TRAINING_STATUS_OUTPUT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of a system message.</p>
    begin of T_TXT_CHT_MSG_TXT_CHAT_MSG_SYS,
      "!   The role of the messages author.
      ROLE type STRING,
      "!   The contents of the system message.
      CONTENT type STRING,
      "!   An optional name for the participant. Provides the model information to
      "!    differentiate between participants of the same role.
      NAME type STRING,
    end of T_TXT_CHT_MSG_TXT_CHAT_MSG_SYS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The `id` of the model to be used for this request.</p>
      T_GEOSPATIAL_TRANS_MODEL_ID type String.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Optional details coming from the service and related to the</p>
    "!     API call or the associated resource.
    begin of T_TRAIN_RESRC_COLLECTION_SYS,
      "!   Any warnings coming from the system.
      WARNINGS type STANDARD TABLE OF T_WARNING WITH NON-UNIQUE DEFAULT KEY,
    end of T_TRAIN_RESRC_COLLECTION_SYS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    System details.</p>
    begin of T_SYSTEM,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_SYSTEM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of a user image content.</p>
    begin of T_TXT_CHT_USR_CNTNTS_TXT_CHT_2,
      "!   The type of the user content. You can get the list of models supporting text,
      "!    image, audio, video by using<br/>
      "!   [Foundation Model
      "!    Specs](https://cloud.ibm.com/apidocs/watsonx-ai#list-foundation-model-specs)
      "!    with<br/>
      "!   `filters=function_text_chat`, `filters=function_image_chat`,
      "!    `filters=function_audio_chat`,<br/>
      "!   `filters=function_video_chat` respectively.
      TYPE type STRING,
      "!   The definition of a user image content.
      IMAGE_URL type T_TEXT_CHAT_USER_IMAGE_URL,
    end of T_TXT_CHT_USR_CNTNTS_TXT_CHT_2.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Represents the maximum number of tokens accepted per</p>
    "!     input.<br/>
    "!    <br/>
    "!    This can be used to avoid requests failing due to input being longer than
    "!     configured limits. If the text is truncated, then it truncates the end of the
    "!     input (on the right), so the start of the input will remain the same.<br/>
    "!    <br/>
    "!    If this value exceeds the `maximum sequence length` (refer to the documentation
    "!     to find this value for the model) then the call will fail if the total number
    "!     of tokens exceeds the `maximum sequence length`.
      T_PRM_TRNCT_INPT_TKNS_FROM_END type Integer.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The space that contains the resource.</p>
      T_SPACE_ID_ONLY type String.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The metadata related to the attachment.</p>
    begin of T_AISERVICE_CONTENT_METADATA,
      "!   The content id for the attachment.
      ATTACHMENT_ID type STRING,
    end of T_AISERVICE_CONTENT_METADATA.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A data location of the input or output data.</p>
    begin of T_GEOSPATIAL_TRANS_DATA,
      "!   A signed url for the data in COS or elsewhere. This url will be used to download
      "!    if this is input, or upload if this is output.
      URL type STRING,
    end of T_GEOSPATIAL_TRANS_DATA.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The transformation results.</p>
    begin of T_GEOSPATIAL_TRANS_RESULTS,
      "!   The status of the transformation.
      STATUS type STRING,
      "!   The time when the job is successfully submitted to the processor.
      RUNNING_AT type DATETIME,
      "!   The time when the job completed or failed.
      COMPLETED_AT type DATETIME,
    end of T_GEOSPATIAL_TRANS_RESULTS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The transformation results.</p>
    begin of T_GEOSPATIAL_TRANS_RESP_ENTITY,
      "!   The `id` of the model to be used for this request.
      MODEL_ID type STRING,
      "!   The input text.
      INPUTS type STANDARD TABLE OF T_GEOSPATIAL_TRANS_DATA WITH NON-UNIQUE DEFAULT KEY,
      "!   A data location of the input or output data.
      OUTPUT type T_GEOSPATIAL_TRANS_DATA,
      "!   The transformation results.
      RESULTS type T_GEOSPATIAL_TRANS_RESULTS,
    end of T_GEOSPATIAL_TRANS_RESP_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Metadata of a notebook in a project.</p>
    begin of T_NOTEBOOK_METADATA_IN_PROJECT,
      "!   The name of the notebook.
      NAME type STRING,
      "!   A more verbose description.
      DESCRIPTION type STRING,
      "!   Asset type, always &quot;notebook&quot;.
      ASSET_TYPE type STRING,
      "!   Creation date, ms since epoch.
      CREATED type INTEGER,
      "!   Creation date, ISO format.
      CREATED_AT type STRING,
      "!   IAM ID of the asset&apos;s owner.
      OWNER_ID type STRING,
      "!   UUID of the asset&apos;s catalog.
      CATALOG_ID type STRING,
      "!   UUID of the asset.
      ASSET_ID type STRING,
      "!   UUID of the asset&apos;s project.
      PROJECT_ID type STRING,
    end of T_NOTEBOOK_METADATA_IN_PROJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Notebook information in a project as returned by a GET</p>
    "!     request.
    begin of T_NTBK_RVRT_RESP_NTBK_IN_PRJCT,
      "!   Metadata of a notebook in a project.
      METADATA type T_NOTEBOOK_METADATA_IN_PROJECT,
      "!   Entity of a notebook.
      ENTITY type T_NOTEBOOK_ENTITY,
    end of T_NTBK_RVRT_RESP_NTBK_IN_PRJCT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Status of the document extraction job.</p>
    begin of T_DOCUMENT_EXTRACTION_STATUS,
      "!   Current state of document extraction.
      STATE type STRING,
      "!   The time when the job completed or failed.
      COMPLETED_AT type DATETIME,
    end of T_DOCUMENT_EXTRACTION_STATUS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The document extraction job properties.</p>
    begin of T_DOCUMENT_EXTRACTION_RESPONSE,
      "!   The name of the document.
      NAME type STRING,
      "!   The documents for text extraction.
      DOCUMENT_REFERENCES type STANDARD TABLE OF T_DOC_EXTRACTION_OBJECT_LOC WITH NON-UNIQUE DEFAULT KEY,
      "!   A reference to data.
      RESULTS_REFERENCE type T_OBJECT_LOCATION_GITHUB,
      "!   A list of tags for this resource.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   Status of the document extraction job.
      STATUS type T_DOCUMENT_EXTRACTION_STATUS,
    end of T_DOCUMENT_EXTRACTION_RESPONSE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The response from getting a specified document extraction</p>
    "!     job.
    begin of T_DOCUMENT_EXTRACTION_RESOURCE,
      "!   Common metadata for a resource where `project_id` or `space_id` must be present.
      "!
      METADATA type T_RESOURCE_META,
      "!   The document extraction job properties.
      ENTITY type T_DOCUMENT_EXTRACTION_RESPONSE,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_DOCUMENT_EXTRACTION_RESOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The response of getting all document extraction jobs.</p>
    begin of T_DOC_EXTRACTION_RESOURCES,
      "!   The number of items to return in each page.
      LIMIT type INTEGER,
      "!   No documentation available.
      RESOURCES type STANDARD TABLE OF T_DOCUMENT_EXTRACTION_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
    end of T_DOC_EXTRACTION_RESOURCES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Metadata of notebook info returned in a listing.</p>
    begin of T_NOTEBOOK_RESOURCE_METADATA,
      "!   UUID of the notebook.
      GUID type STRING,
      "!   URL of the notebook.
      URL type STRING,
    end of T_NOTEBOOK_RESOURCE_METADATA.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Entity of notebook info returned in a listing.</p>
    begin of T_NOTEBOOK_RESOURCE_ENTITY,
      "!   Asset API asset description returned with a notebook listing.
      ASSET type T_NOTEBOOK_RESRC_ENTITY_ASSET,
      "!   Runtime info returned with a notebook listing.
      RUNTIME type T_NOTEBOOK_RESRC_ENTITY_RT,
    end of T_NOTEBOOK_RESOURCE_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Notebook info returned in a listing.</p>
    begin of T_NOTEBOOK_RESOURCE,
      "!   Metadata of notebook info returned in a listing.
      METADATA type T_NOTEBOOK_RESOURCE_METADATA,
      "!   Entity of notebook info returned in a listing.
      ENTITY type T_NOTEBOOK_RESOURCE_ENTITY,
    end of T_NOTEBOOK_RESOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A list of notebook info as returned by a list query.</p>
    begin of T_NOTEBOOKS_RESOURCE_LIST,
      "!   The number of items in the resources list.
      TOTAL_RESULTS type INTEGER,
      "!   An array of notebooks.
      RESOURCES type STANDARD TABLE OF T_NOTEBOOK_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
    end of T_NOTEBOOKS_RESOURCE_LIST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The time series forecast response.</p>
    begin of T_TSFORECAST_RESPONSE,
      "!   The model used to generate the forecast.
      MODEL_ID type STRING,
      "!   The time when the response was created in ISO 8601 format.
      CREATED_AT type DATETIME,
      "!   The list of prediction results. There will be a forecast for each time series in
      "!    the input data. The `prediction_length` field in the request specifies the
      "!    number of predictions in the results. The actual number of rows in the results
      "!    will be equal to the `prediction length` multiplied by the number of unique ids
      "!    in `id_columns`. The `timestamp_column` field in the request indicates the name
      "!    of the timestamp column in the results.
      RESULTS type STANDARD TABLE OF JSONOBJECT WITH NON-UNIQUE DEFAULT KEY,
      "!   The number of input data points (number of rows in `data` * number of input
      "!    columns in `data`).
      INPUT_DATA_POINTS type INTEGER,
      "!   The number of forecasted data points (`prediction_length` * number of
      "!    `target_columns` * number of unique ids in `id_columns`).
      OUTPUT_DATA_POINTS type INTEGER,
    end of T_TSFORECAST_RESPONSE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The inputs and outputs required to create a transformation</p>
    "!     for the given model.
    begin of T_GEOSPATIAL_TRANS_ENTITY,
      "!   The `id` of the model to be used for this request.
      MODEL_ID type STRING,
      "!   The input text.
      INPUTS type STANDARD TABLE OF T_GEOSPATIAL_TRANS_DATA WITH NON-UNIQUE DEFAULT KEY,
      "!   A data location of the input or output data.
      OUTPUT type T_GEOSPATIAL_TRANS_DATA,
    end of T_GEOSPATIAL_TRANS_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A set of server sent events, each event contains a response</p>
    "!     for one or more tokens. The results will be an array of events of the form
    "!     `data: &#123;&lt;json event&gt;&#125;` where the schema of the individual `json
    "!     event` is described below.
      T_TEXT_GEN_STREAM_RESPONSE type STANDARD TABLE OF T_TEXT_GEN_RESPONSE WITH NON-UNIQUE DEFAULT KEY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The text that was detected.</p>
    begin of T_TXT_DTCTN_CONTEXT_POSITION,
      "!   The position in the content where the detected text starts.
      START type INTEGER,
      "!   The position in the content where the detected text ends.
      END type INTEGER,
    end of T_TXT_DTCTN_CONTEXT_POSITION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The request fields that are not part of the returned entity.</p>
    begin of T_AUTO_AIRAGMETADATA,
      "!   The id of the resource.
      ID type STRING,
      "!   The time when the resource was created.
      CREATED_AT type DATETIME,
      "!   The name of the job.
      NAME type STRING,
      "!   The description of the job.
      DESCRIPTION type STRING,
      "!   A list of tags for this resource.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
    end of T_AUTO_AIRAGMETADATA.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Properties that control the model and response that are only</p>
    "!     supported in caikit.
    begin of T_TEXT_GEN_PARAMETERS2,
      "!   Represents the strategy used for picking the tokens during generation of the
      "!    output text.<br/>
      "!   <br/>
      "!   During text generation when parameter value is set to greedy, each successive
      "!    token corresponds to the highest probability token given the text that has
      "!    already been generated. This strategy can lead to repetitive results especially
      "!    for longer output sequences. The alternative sample strategy generates text by
      "!    picking subsequent tokens based on the probability distribution of possible
      "!    next tokens defined by (i.e., conditioned on) the already-generated text and
      "!    the top_k and top_p parameters described below. See this
      "!    [url](https://huggingface.co/blog/how-to-generate) for an informative article
      "!    about text generation.
      DECODING_METHOD type STRING,
      "!   It can be used to exponentially increase the likelihood of the text generation
      "!    terminating once a specified number of tokens have been generated.
      LENGTH_PENALTY type T_TEXT_GEN_LENGTH_PENALTY,
      "!   The maximum number of new tokens to be generated. The maximum supported value
      "!    for this field depends on the model being used.<br/>
      "!   <br/>
      "!   How the &quot;token&quot; is defined depends on the tokenizer and vocabulary
      "!    size, which in turn depends on the model. Often the tokens are a mix of full
      "!    words and sub-words. To learn more about tokenization, [see
      "!    here](https://huggingface.co/course/chapter2/4).<br/>
      "!   <br/>
      "!   Depending on the users plan, and on the model being used, there may be an
      "!    enforced maximum number of new tokens.
      MAX_NEW_TOKENS type INTEGER,
      "!   If stop sequences are given, they are ignored until minimum tokens are
      "!    generated.
      MIN_NEW_TOKENS type INTEGER,
      "!   Random number generator seed to use in sampling mode for experimental
      "!    repeatability.
      RANDOM_SEED type INTEGER,
      "!   Stop sequences are one or more strings which will cause the text generation to
      "!    stop if/when they are produced as part of the output. Stop sequences
      "!    encountered prior to the minimum number of tokens being generated will be
      "!    ignored.
      STOP_SEQUENCES type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   A value used to modify the next-token probabilities in sampling mode. Values
      "!    less than 1.0 sharpen the probability distribution, resulting in &quot;less
      "!    random&quot; output. Values greater than 1.0 flatten the probability
      "!    distribution, resulting in &quot;more random&quot; output. A value of 1.0 has
      "!    no effect.
      TEMPERATURE type NUMBER,
      "!   Time limit in milliseconds - if not completed within this time, generation will
      "!    stop. The text generated so far will be returned along with the TIME_LIMIT stop
      "!    reason.<br/>
      "!   <br/>
      "!   Depending on the users plan, and on the model being used, there may be an
      "!    enforced maximum time limit.
      TIME_LIMIT type INTEGER,
      "!   The number of highest probability vocabulary tokens to keep for top-k-filtering.
      "!    Only applies for sampling mode. When decoding_strategy is set to sample, only
      "!    the top_k most likely tokens are considered as candidates for the next
      "!    generated token.
      TOP_K type INTEGER,
      "!   Similar to top_k except the candidates to generate the next token are the most
      "!    likely tokens with probabilities that add up to at least top_p. Also known as
      "!    nucleus sampling. A value of 1.0 is equivalent to disabled.
      TOP_P type NUMBER,
      "!   Represents the penalty for penalizing tokens that have already been generated or
      "!    belong to the context. The value 1.0 means that there is no penalty.
      REPETITION_PENALTY type NUMBER,
      "!   Represents the maximum number of input tokens accepted. This can be used to
      "!    avoid requests failing due to input being longer than configured limits. If the
      "!    text is truncated, then it truncates the start of the input (on the left), so
      "!    the end of the input will remain the same. If this value exceeds the `maximum
      "!    sequence length` (refer to the documentation to find this value for the model)
      "!    then the call will fail if the total number of tokens exceeds the `maximum
      "!    sequence length`.
      TRUNCATE_INPUT_TOKENS type INTEGER,
      "!   Properties that control what is returned.
      RETURN_OPTIONS type T_RETURN_OPTION_PROPERTIES,
      "!   Pass `false` to omit matched stop sequences from the end of the output text. The
      "!    default is `true`, meaning that the output will end with the stop sequence text
      "!    when matched.
      INCLUDE_STOP_SEQUENCE type BOOLEAN,
      "!   Local typicality measures how similar the conditional probability of predicting
      "!    a target token next is to the expected conditional probability of predicting a
      "!    random token next, given the partial text already generated. If less than 1,
      "!    the smallest set of the most locally typical tokens with probabilities that add
      "!    up to typical_p or higher are kept for generation.
      TYPICAL_P type NUMBER,
    end of T_TEXT_GEN_PARAMETERS2.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Input necessary for performing inference. These inputs</p>
    "!     identify things like which model to use, the data payload you are passing to
    "!     the model, and other parameters which affect the behavior of the inference
    "!     operation.
    begin of T_TSFORECAST_RESOURCE,
      "!   The model to be used for generating a forecast. You can get the list of models
      "!    by using<br/>
      "!   [Foundation Model
      "!    Specs](https://cloud.ibm.com/apidocs/watsonx-ai#list-foundation-model-specs)
      "!    with<br/>
      "!   `filters=function_time_series_forecast`.
      MODEL_ID type STRING,
      "!   The parameters for the forecast request.
      PARAMETERS type T_TSFORECAST_PARAMETERS,
      "!   A payload of data matching `schema`. We assume the following about your
      "!    data:<br/>
      "!     * All timeseries are of equal length and are uniform in nature (the time
      "!    difference between two successive rows is constant). This implies that there
      "!    are no missing rows of data;<br/>
      "!     * The data meet the minimum model-dependent historical context length
      "!    which<br/>
      "!     can be 512 or more rows per timeseries;<br/>
      "!   <br/>
      "!   Note that the example payloads shown are for illustration purposes only. An
      "!    actual payload would necessary be much larger to meet minimum model-specific
      "!    context lengths.
      DATA type JSONOBJECT,
      "!   Contains metadata about your timeseries data input.
      SCHEMA type T_TSFORECAST_INPUT_SCHEMA,
    end of T_TSFORECAST_RESOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details of the AI service to be created.</p>
    begin of T_AISERVICE_ENTITY,
      "!   A software specification.
      SOFTWARE_SPEC type T_SOFTWARE_SPEC_REL,
      "!   The type that allows the deployment service to know how to setup the code during
      "!    deployment.
      CODE_TYPE type STRING,
      "!   The documentation of the AI service request body and response body.
      DOCUMENTATION type T_AISERVICE_DOCUMENTATION,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   User defined properties specified as key-value pairs, which is propagated to the
      "!    deployment.
      TOOLING type JSONOBJECT,
    end of T_AISERVICE_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The properties that are part of a request that supports</p>
    "!     spaces and projects. Either `space_id` or `project_id` has to be provided and
    "!     is mandatory.
    begin of T_ENTITY_REQ_SPC_PROJECT_ONLY,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
    end of T_ENTITY_REQ_SPC_PROJECT_ONLY.
  types:
    "! No documentation available.
    begin of T_WX_PROMPT_SESSION_ENTRY,
      "!   The prompt&apos;s id. This value cannot be set. It is returned in responses
      "!    only.
      ID type STRING,
      "!   Name used to display the prompt.
      NAME type STRING,
      "!   An optional description for the prompt.
      DESCRIPTION type STRING,
      "!   No documentation available.
      PROMPT_VARIABLES type MAP,
      "!   No documentation available.
      IS_TEMPLATE type BOOLEAN,
      "!   Time the prompt was created.
      CREATED_AT type INTEGER,
      "!   Input mode in use for the prompt.
      INPUT_MODE type STRING,
      "!   No documentation available.
      PROMPT type T_PROMPT,
    end of T_WX_PROMPT_SESSION_ENTRY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Properties describing the foundation model.</p>
    begin of T_AUTO_AIRAGMODEL,
      "!   The foundation model id.
      MODEL_ID type STRING,
      "!   Properties that control the model and response.
      PARAMETERS type T_AUTO_AIRAGMODEL_PARAMS,
      "!   The foundation model prompt template text (free form). Must contain variables:
      "!    `question` and `reference_documents`. `reference_documents` variable is a
      "!    placeholder for retrieved document(s) defined by context_template_text. If not
      "!    provided default one is used.
      PROMPT_TEMPLATE_TEXT type STRING,
      "!   The retrieved chunks template text (free form). Must contain variable:
      "!    `document` representing single document chunk retrieved. &gt; If not provided
      "!    default one is used.
      CONTEXT_TEMPLATE_TEXT type STRING,
      "!   Describes word to token ratio.
      WORD_TO_TOKEN_RATIO type NUMBER,
    end of T_AUTO_AIRAGMODEL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Status of the training job.</p>
    begin of T_AUTO_AIRAGSTATUS_OBJECT,
      "!   Date and Time in which current training state has started.
      RUNNING_AT type DATETIME,
      "!   Date and Time in which training had completed.
      COMPLETED_AT type DATETIME,
      "!   Current state of training.
      STATE type STRING,
      "!   Optional messages related to the resource.
      MESSAGE type T_MESSAGE,
      "!   The data returned when an error is encountered.
      FAILURE type T_API_ERROR_RESPONSE,
      "!   The step type.
      STEP type STRING,
    end of T_AUTO_AIRAGSTATUS_OBJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The parameters for an AutoAI RAG run.</p>
    begin of T_AUTO_AIRAGPARAMETERS,
      "!   The constraint parameters for an AutoAI RAG run.
      CONSTRAINTS type T_AUTO_AIRAGCONSTRAINTS,
      "!   The optimization parameters for an AutoAI RAG run.
      OPTIMIZATION type T_AUTO_AIRAGOPTIMIZATION_PARAM,
      "!   Request that the output logs are also stored as part of the result.
      OUTPUT_LOGS type BOOLEAN,
    end of T_AUTO_AIRAGPARAMETERS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A reference to data.</p>
    begin of T_AUTO_AIDATA_LOCATION,
      "!   The data source type like `connection_asset`, `data_asset` or `container`
      "!    (Service only).
      TYPE type STRING,
      "!   Contains a set of fields specific to each connection.<br/>
      "!   See here for [details about specifying connections](#datareferences).
      CONNECTION type T_DATA_CONNECTION,
      "!   Contains a set of fields that describe the location of the data with respect to
      "!    the `connection`.
      LOCATION type MAP,
    end of T_AUTO_AIDATA_LOCATION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A reference to connection.</p>
    begin of T_CONNECTION_ASSET,
      "!   The data source type `connection_asset`.
      TYPE type STRING,
      "!   Contains a set of fields specific to each connection.<br/>
      "!   See here for [details about specifying connections](#datareferences).
      CONNECTION type T_DATA_CONNECTION,
    end of T_CONNECTION_ASSET.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The status of an AutoAI RAG run.</p>
    begin of T_AUTO_AIRAGRESPONSE_ENTITY,
      "!   A hardware specification.
      HARDWARE_SPEC type T_HARDWARE_SPEC,
      "!   The parameters for an AutoAI RAG run.
      PARAMETERS type T_AUTO_AIRAGPARAMETERS,
      "!   A set of input data references.
      INPUT_DATA_REFERENCES type STANDARD TABLE OF T_AUTO_AIDATA_LOCATION WITH NON-UNIQUE DEFAULT KEY,
      "!   A set of test data references.
      TEST_DATA_REFERENCES type STANDARD TABLE OF T_AUTO_AIDATA_LOCATION WITH NON-UNIQUE DEFAULT KEY,
      "!   A set of vector store references. Milvus vector database is supported.
      VECTOR_STORE_REFERENCES type STANDARD TABLE OF T_CONNECTION_ASSET WITH NON-UNIQUE DEFAULT KEY,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   The list of results.
      RESULTS type STANDARD TABLE OF T_AUTO_AIRAGRESULTS WITH NON-UNIQUE DEFAULT KEY,
      "!   The timestamp when the results were created.
      TIMESTAMP type DATETIME,
      "!   The training results. Normally this is specified as `type=container` which means
      "!    that it is stored in the space or project. Note that the training will add some
      "!    fields that point to the training status, the model request and the
      "!    assets.<br/>
      "!   <br/>
      "!   The `model_request_path` is the request body that should be used when creating
      "!    the trained model in the API, if this model is to be deployed. If
      "!    `auto_update_model` was set to `true` then this file is not needed.
      RESULTS_REFERENCE type T_OBJECT_LOCATION,
      "!   Status of the training job.
      STATUS type T_AUTO_AIRAGSTATUS_OBJECT,
    end of T_AUTO_AIRAGRESPONSE_ENTITY.
  types:
    "! No documentation available.
    begin of T_WX_UTIL_AGNT_TLS_RN_REQ_UTI1,
      "!   The name of the tool to be run.
      TOOL_NAME type STRING,
      "!   Input to be used when running tool that has no input_schema.
      INPUT type STRING,
      "!   Optional configuration options that can be passed for some tools. This must
      "!    match the config schema for that tool.
      CONFIG type JSONOBJECT,
    end of T_WX_UTIL_AGNT_TLS_RN_REQ_UTI1.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A list of notebook versions in a project.</p>
    begin of T_NTBK_VERSIONS_LST_IN_PROJECT,
      "!   The number of items in the resources array.
      TOTAL_RESULTS type INTEGER,
      "!   An array of notebook versions.
      RESOURCES type STANDARD TABLE OF T_NOTEBOOK_VERSION_IN_PROJECT WITH NON-UNIQUE DEFAULT KEY,
    end of T_NTBK_VERSIONS_LST_IN_PROJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    This model represents an individual patch operation to be</p>
    "!     performed on a JSON document, as defined by RFC 6902.
    begin of T_JSON_PATCH_OPERATION,
      "!   The operation to be performed.
      OP type STRING,
      "!   The JSON Pointer that identifies the field that is the target of the operation.
      PATH type STRING,
      "!   The JSON Pointer that identifies the field that is the source of the operation.
      FROM type STRING,
      "!   The value to be used within the operation.
      VALUE type JSONOBJECT,
    end of T_JSON_PATCH_OPERATION.
  types:
    "! No documentation available.
    begin of T_TEXT_GEN_RESULT_FIELDS,
      "!   The number of generated tokens.
      GENERATED_TOKEN_COUNT type INTEGER,
      "!   The number of input tokens consumed.
      INPUT_TOKEN_COUNT type INTEGER,
      "!   The seed used, if it exists.
      SEED type INTEGER,
      "!   The list of individual generated tokens. Extra token information is included
      "!    based on the other flags in the `return_options` of the request.
      GENERATED_TOKENS type STANDARD TABLE OF T_TEXT_GEN_TOKEN_INFO WITH NON-UNIQUE DEFAULT KEY,
      "!   The list of input tokens. Extra token information is included based on the other
      "!    flags in the `return_options` of the request, but for decoder-only models.
      INPUT_TOKENS type STANDARD TABLE OF T_TEXT_GEN_TOKEN_INFO WITH NON-UNIQUE DEFAULT KEY,
      "!   The result of any detected moderations.
      MODERATIONS type T_MODERATION_RESULTS,
    end of T_TEXT_GEN_RESULT_FIELDS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The properties for the moderation. Each type of moderation</p>
    "!     may have additional properties that are specific to that moderation.
    begin of T_MDRTN_PROP_WITHOUT_THRESHOLD,
      "!   Properties that control the moderation on the text.
      INPUT type T_TXT_MDRTN_WITHOUT_THRESHOLD,
      "!   Properties that control the moderation on the text.
      OUTPUT type T_TXT_MDRTN_WITHOUT_THRESHOLD,
    end of T_MDRTN_PROP_WITHOUT_THRESHOLD.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Payload for a notebook update request.</p>
    begin of T_NOTEBOOK_UPDATE_BODY,
      "!   The guid of the environment on which the notebook runs.
      ENVIRONMENT type STRING,
      "!   Spark monitoring enabled or not.
      SPARK_MONITORING_ENABLED type BOOLEAN,
      "!   A notebook kernel.
      KERNEL type T_NOTEBOOK_KERNEL,
    end of T_NOTEBOOK_UPDATE_BODY.
  types:
    "! No documentation available.
    begin of T_WX_PROMPT_POST,
      "!   Name used to display the prompt.
      NAME type STRING,
      "!   An optional description for the prompt.
      DESCRIPTION type STRING,
      "!   Time the prompt was created.
      CREATED_AT type INTEGER,
      "!   No documentation available.
      TASK_IDS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   No documentation available.
      LOCK type T_PROMPT_LOCK,
      "!   No documentation available.
      MODEL_VERSION type T_WX_PROMPT_POST_MODEL_VERSION,
      "!   No documentation available.
      PROMPT_VARIABLES type MAP,
      "!   Input mode in use for the prompt.
      INPUT_MODE type STRING,
      "!   No documentation available.
      PROMPT type T_PROMPT_WITH_EXTERNAL,
    end of T_WX_PROMPT_POST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The result of tokenizing the input string.</p>
    begin of T_TEXT_TOKENIZE_RESULT,
      "!   The number of tokens in the input string.
      TOKEN_COUNT type INTEGER,
      "!   The input string broken up into the tokens, if requested.
      TOKENS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
    end of T_TEXT_TOKENIZE_RESULT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The tokenization result.</p>
    begin of T_TEXT_TOKENIZE_RESPONSE,
      "!   The `id` of the model to be used for this request. Please refer to the [list of
      "!    models](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/fm-mod
      "!   els.html?context=wx).
      MODEL_ID type STRING,
      "!   The result of tokenizing the input string.
      RESULT type T_TEXT_TOKENIZE_RESULT,
    end of T_TEXT_TOKENIZE_RESPONSE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Properties describing the custom foundation model.</p>
    begin of T_AUTO_AIRAGCUSTOM_MODEL,
      "!   The custom foundation model deployment id.
      DEPLOYMENT_ID type STRING,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   Properties that control the model and response.
      PARAMETERS type T_AUTO_AIRAGMODEL_PARAMS,
      "!   The foundation model prompt template text (free form). Must contain variables:
      "!    `question` and `reference_documents`. `reference_documents` variable is a
      "!    placeholder for retrieved document(s) defined by context_template_text. If not
      "!    provided default one is used.
      PROMPT_TEMPLATE_TEXT type STRING,
      "!   The retrieved chunks template text (free form). Must contain variable:
      "!    `document` representing single document chunk retrieved. &gt; If not provided
      "!    default one is used.
      CONTEXT_TEMPLATE_TEXT type STRING,
      "!   Describes word to token ratio.
      WORD_TO_TOKEN_RATIO type NUMBER,
    end of T_AUTO_AIRAGCUSTOM_MODEL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Properties that control the model and response.</p>
    begin of T_TEXT_GEN_PARAMETERS,
      "!   Represents the strategy used for picking the tokens during generation of the
      "!    output text.<br/>
      "!   <br/>
      "!   During text generation when parameter value is set to greedy, each successive
      "!    token corresponds to the highest probability token given the text that has
      "!    already been generated. This strategy can lead to repetitive results especially
      "!    for longer output sequences. The alternative sample strategy generates text by
      "!    picking subsequent tokens based on the probability distribution of possible
      "!    next tokens defined by (i.e., conditioned on) the already-generated text and
      "!    the top_k and top_p parameters described below. See this
      "!    [url](https://huggingface.co/blog/how-to-generate) for an informative article
      "!    about text generation.
      DECODING_METHOD type STRING,
      "!   It can be used to exponentially increase the likelihood of the text generation
      "!    terminating once a specified number of tokens have been generated.
      LENGTH_PENALTY type T_TEXT_GEN_LENGTH_PENALTY,
      "!   The maximum number of new tokens to be generated. The maximum supported value
      "!    for this field depends on the model being used.<br/>
      "!   <br/>
      "!   How the &quot;token&quot; is defined depends on the tokenizer and vocabulary
      "!    size, which in turn depends on the model. Often the tokens are a mix of full
      "!    words and sub-words. To learn more about tokenization, [see
      "!    here](https://huggingface.co/course/chapter2/4).<br/>
      "!   <br/>
      "!   Depending on the users plan, and on the model being used, there may be an
      "!    enforced maximum number of new tokens.
      MAX_NEW_TOKENS type INTEGER,
      "!   If stop sequences are given, they are ignored until minimum tokens are
      "!    generated.
      MIN_NEW_TOKENS type INTEGER,
      "!   Random number generator seed to use in sampling mode for experimental
      "!    repeatability.
      RANDOM_SEED type INTEGER,
      "!   Stop sequences are one or more strings which will cause the text generation to
      "!    stop if/when they are produced as part of the output. Stop sequences
      "!    encountered prior to the minimum number of tokens being generated will be
      "!    ignored.
      STOP_SEQUENCES type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   A value used to modify the next-token probabilities in sampling mode. Values
      "!    less than 1.0 sharpen the probability distribution, resulting in &quot;less
      "!    random&quot; output. Values greater than 1.0 flatten the probability
      "!    distribution, resulting in &quot;more random&quot; output. A value of 1.0 has
      "!    no effect.
      TEMPERATURE type NUMBER,
      "!   Time limit in milliseconds - if not completed within this time, generation will
      "!    stop. The text generated so far will be returned along with the TIME_LIMIT stop
      "!    reason.<br/>
      "!   <br/>
      "!   Depending on the users plan, and on the model being used, there may be an
      "!    enforced maximum time limit.
      TIME_LIMIT type INTEGER,
      "!   The number of highest probability vocabulary tokens to keep for top-k-filtering.
      "!    Only applies for sampling mode. When decoding_strategy is set to sample, only
      "!    the top_k most likely tokens are considered as candidates for the next
      "!    generated token.
      TOP_K type INTEGER,
      "!   Similar to top_k except the candidates to generate the next token are the most
      "!    likely tokens with probabilities that add up to at least top_p. Also known as
      "!    nucleus sampling. A value of 1.0 is equivalent to disabled.
      TOP_P type NUMBER,
      "!   Represents the penalty for penalizing tokens that have already been generated or
      "!    belong to the context. The value 1.0 means that there is no penalty.
      REPETITION_PENALTY type NUMBER,
      "!   Represents the maximum number of input tokens accepted. This can be used to
      "!    avoid requests failing due to input being longer than configured limits. If the
      "!    text is truncated, then it truncates the start of the input (on the left), so
      "!    the end of the input will remain the same. If this value exceeds the `maximum
      "!    sequence length` (refer to the documentation to find this value for the model)
      "!    then the call will fail if the total number of tokens exceeds the `maximum
      "!    sequence length`.
      TRUNCATE_INPUT_TOKENS type INTEGER,
      "!   Properties that control what is returned.
      RETURN_OPTIONS type T_RETURN_OPTION_PROPERTIES,
      "!   Pass `false` to omit matched stop sequences from the end of the output text. The
      "!    default is `true`, meaning that the output will end with the stop sequence text
      "!    when matched.
      INCLUDE_STOP_SEQUENCE type BOOLEAN,
    end of T_TEXT_GEN_PARAMETERS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A prompt to be used to infer the next tokens. Each request</p>
    "!     expects a `project_id` or a `space_id`, and the `project` or `space` must have
    "!     an associated WML instance that will be used for limits and billing (if a paid
    "!     plan).
    begin of T_TEXT_GEN_REQUEST,
      "!   The prompt to generate completions. Note: The method tokenizes the input
      "!    internally. It is recommended not to leave any trailing spaces.
      INPUT type STRING,
      "!   The `id` of the model to be used for this request. Please refer to the [list of
      "!    models](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/fm-mod
      "!   els.html?context=wx).
      MODEL_ID type STRING,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   Properties that control the model and response.
      PARAMETERS type T_TEXT_GEN_PARAMETERS,
      "!   Properties that control the moderations, for usages such as `Hate and profanity`
      "!    (HAP) and `Personal identifiable information` (PII) filtering. This list can be
      "!    extended with new types of moderations.
      MODERATIONS type T_MODERATIONS,
    end of T_TEXT_GEN_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    System details.</p>
    begin of T_FOUNDATION_MODELS,
      "!   The total number of resources.
      TOTAL_COUNT type INTEGER,
      "!   The number of items to return in each page.
      LIMIT type INTEGER,
      "!   The reference to the first item in the current page.
      FIRST type T_PAGINATION_FIRST,
      "!   A reference to the first item of the next page, if any.
      NEXT type T_PAGINATION_NEXT,
      "!   The supported foundation models.
      RESOURCES type STANDARD TABLE OF T_FOUNDATION_MODEL WITH NON-UNIQUE DEFAULT KEY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_FOUNDATION_MODELS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details for a given evidence.</p>
    begin of T_TXT_DTCTN_EVIDENCE_OBJECT,
      "!   The name for the evidence.
      NAME type STRING,
      "!   The value for the evidence.
      VALUE type STRING,
      "!   The threshold probability that this is a real match.
      SCORE type FLOAT,
    end of T_TXT_DTCTN_EVIDENCE_OBJECT.
  types:
    "! No documentation available.
    begin of T_WX_PROMPT_PATCH_MODEL_VER,
      "!   User provided semantic version for tracking in IBM AI Factsheets.
      NUMBER type STRING,
      "!   User provived tag.
      TAG type STRING,
      "!   Description of the version.
      DESCRIPTION type STRING,
    end of T_WX_PROMPT_PATCH_MODEL_VER.
  types:
    "! No documentation available.
    begin of T_WX_PROMPT_PATCH,
      "!   The prompt&apos;s id. This value cannot be set. It is returned in responses
      "!    only.
      ID type STRING,
      "!   Name used to display the prompt.
      NAME type STRING,
      "!   An optional description for the prompt.
      DESCRIPTION type STRING,
      "!   No documentation available.
      TASK_IDS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   No documentation available.
      GOVERNANCE_TRACKED type BOOLEAN,
      "!   No documentation available.
      MODEL_VERSION type T_WX_PROMPT_PATCH_MODEL_VER,
      "!   No documentation available.
      PROMPT_VARIABLES type MAP,
      "!   Input mode in use for the prompt.
      INPUT_MODE type STRING,
      "!   No documentation available.
      PROMPT type T_PROMPT,
    end of T_WX_PROMPT_PATCH.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    An optional name for the participant. Provides the model</p>
    "!     information to differentiate between participants of the same role.
      T_TEXT_CHAT_MESSAGE_FIELD_NAME type String.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    System details.</p>
    begin of T_FINE_TUNING_RESOURCES,
      "!   The total number of resources. Computed explicitly only when
      "!    &apos;total_count=true&apos; query parameter is present. This is in order to
      "!    avoid performance penalties.
      TOTAL_COUNT type INTEGER,
      "!   The number of items to return in each page.
      LIMIT type INTEGER,
      "!   The reference to the first item in the current page.
      FIRST type T_PAGINATION_FIRST,
      "!   A reference to the first item of the next page, if any.
      NEXT type T_PAGINATION_NEXT,
      "!   No documentation available.
      RESOURCES type STANDARD TABLE OF T_FINE_TUNING_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_FINE_TUNING_RESOURCES.
  types:
    "! No documentation available.
      T_PROMPT_VARIABLE_STRING type String.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A reference to a resource.</p>
    begin of T_REL,
      "!   The id of the referenced resource.
      ID type STRING,
      "!   The revision of the referenced resource.
      REV type STRING,
    end of T_REL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The field that identifies the asset.</p>
    begin of T_ASSET_REF,
      "!   A reference to a resource.
      ASSET type T_REL,
    end of T_ASSET_REF.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The base definition of a text chat message.</p>
    begin of T_TEXT_CHAT_MESSAGE,
      "!   The role of the messages author.
      ROLE type STRING,
    end of T_TEXT_CHAT_MESSAGE.
  types:
    "! No documentation available.
      T_NOTEBOOK_CREATE_RESPONSE type JSONOBJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Properties that control the model and response that are only</p>
    "!     supported in caikit.
    begin of T_CAI_KIT_TEXT_GEN_PROPERTIES,
      "!   Local typicality measures how similar the conditional probability of predicting
      "!    a target token next is to the expected conditional probability of predicting a
      "!    random token next, given the partial text already generated. If less than 1,
      "!    the smallest set of the most locally typical tokens with probabilities that add
      "!    up to typical_p or higher are kept for generation.
      TYPICAL_P type NUMBER,
    end of T_CAI_KIT_TEXT_GEN_PROPERTIES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The parameters specific to chat.</p>
    begin of T_TEXT_CHAT_PARAMETER_FUNCTION,
      "!   The name of the function.
      NAME type STRING,
      "!   A description of what the function does, used by the model to choose when and
      "!    how to call the function.
      DESCRIPTION type STRING,
      "!   The parameters the functions accepts, described as a JSON Schema object. See the
      "!    [JSON Schema
      "!    reference](https://json-schema.org/learn/getting-started-step-by-step) for
      "!    documentation about the format.<br/>
      "!   <br/>
      "!   Omitting parameters defines a function with an empty parameter list.
      PARAMETERS type JSONOBJECT,
    end of T_TEXT_CHAT_PARAMETER_FUNCTION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The chat tool parameters.</p>
    begin of T_TEXT_CHAT_PARAMETER_TOOLS,
      "!   The tool type.
      TYPE type STRING,
      "!   The parameters specific to chat.
      FUNCTION type T_TEXT_CHAT_PARAMETER_FUNCTION,
    end of T_TEXT_CHAT_PARAMETER_TOOLS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Array of patch operations as defined in RFC 6902.</p>
      T_JSON_PATCH type STANDARD TABLE OF T_JSON_PATCH_OPERATION WITH NON-UNIQUE DEFAULT KEY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A chat completion choices.</p>
    begin of T_TEXT_CHAT_RESP_FIELDS_STREAM,
      "!   A list of chat completion choices. Can be more than one if `n` is greater than
      "!    1.
      CHOICES type STANDARD TABLE OF T_TEXT_CHAT_RES_CHOICE_STREAM WITH NON-UNIQUE DEFAULT KEY,
    end of T_TEXT_CHAT_RESP_FIELDS_STREAM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The fine tuning resource.</p>
    begin of T_FINE_TUNING_RESOURCE_ENTITY,
      "!   This field must not be set while creating a fine tuning job with
      "!    InstructLab.<br/>
      "!   <br/>
      "!   If set to `true` then the result of the training, if successful, will be
      "!    uploaded to the repository as a model.
      AUTO_UPDATE_MODEL type BOOLEAN,
      "!   This field must not be set while creating a fine tuning job with
      "!    InstructLab.<br/>
      "!   <br/>
      "!   The parameters for the job. Note that if `verbalizer` is provided<br/>
      "!   then `response_template` must also be provided (and vice versa).
      PARAMETERS type T_FINE_TUNING_PARAMETERS,
      "!   The `type` of Fine Tuning training. The `type` is set to `ilab` for InstructLab
      "!    training.
      TYPE type STRING,
      "!   The training datasets.
      TRAINING_DATA_REFERENCES type STANDARD TABLE OF T_OBJECT_LOCATION WITH NON-UNIQUE DEFAULT KEY,
      "!   This field must not be set while creating a fine tuning job with
      "!    InstructLab.<br/>
      "!   <br/>
      "!   The holdout/test datasets.
      TEST_DATA_REFERENCES type STANDARD TABLE OF T_OBJECT_LOCATION WITH NON-UNIQUE DEFAULT KEY,
      "!   The training results. Normally this is specified as `type=container` which<br/>
      "!   means that it is stored in the space or project.
      RESULTS_REFERENCE type T_OBJECT_LOCATION,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
    end of T_FINE_TUNING_RESOURCE_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The text input to the model.</p>
      T_TEXT_INPUT type String.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Information for paging when querying resources.</p>
    begin of T_PAGINATION_TC,
      "!   The total number of resources.
      TOTAL_COUNT type INTEGER,
      "!   The number of items to return in each page.
      LIMIT type INTEGER,
      "!   The reference to the first item in the current page.
      FIRST type T_PAGINATION_FIRST,
      "!   A reference to the first item of the next page, if any.
      NEXT type T_PAGINATION_NEXT,
    end of T_PAGINATION_TC.
  types:
    "! No documentation available.
    begin of T_TRAIN_RESOURCE_ENTITY_COMMON,
      "!   Properties to control the prompt tuning.
      PROMPT_TUNING type T_PROMPT_TUNING,
      "!   Training datasets.
      TRAINING_DATA_REFERENCES type STANDARD TABLE OF T_DATA_CONNECTION_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   If set to `true` then the result of the training, if successful, will be
      "!    uploaded to the repository as a model.
      AUTO_UPDATE_MODEL type BOOLEAN,
    end of T_TRAIN_RESOURCE_ENTITY_COMMON.
  types:
    "! No documentation available.
    begin of T_GEOSPATIAL_TRANS_REQ_FIELDS,
      "!   The space that contains the resource.
      SPACE_ID type STRING,
    end of T_GEOSPATIAL_TRANS_REQ_FIELDS.
  types:
    "! No documentation available.
    begin of T_WX_PROMPT_RESPONSE,
      "!   The prompt&apos;s id. This value cannot be set. It is returned in responses
      "!    only.
      ID type STRING,
      "!   Name used to display the prompt.
      NAME type STRING,
      "!   An optional description for the prompt.
      DESCRIPTION type STRING,
      "!   Time the prompt was created.
      CREATED_AT type INTEGER,
      "!   The ID of the original prompt creator.
      CREATED_BY type STRING,
      "!   Time the prompt was updated.
      LAST_UPDATED_AT type INTEGER,
      "!   The ID of the last user that modifed the prompt.
      LAST_UPDATED_BY type STRING,
      "!   No documentation available.
      TASK_IDS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   No documentation available.
      GOVERNANCE_TRACKED type BOOLEAN,
      "!   No documentation available.
      LOCK type T_PROMPT_LOCK,
      "!   Input mode in use for the prompt.
      INPUT_MODE type STRING,
      "!   No documentation available.
      MODEL_VERSION type T_WX_PROMPT_RESP_MODEL_VERSION,
      "!   No documentation available.
      PROMPT_VARIABLES type MAP,
      "!   No documentation available.
      IS_TEMPLATE type BOOLEAN,
      "!   No documentation available.
      RESOURCE_KEY type STRING,
      "!   No documentation available.
      PROMPT type T_PROMPT_WITH_EXTERNAL,
    end of T_WX_PROMPT_RESPONSE.
  types:
    "! No documentation available.
      T_NOTEBOOK_REVERT_RESPONSE type JSONOBJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Payload for a notebook list request.</p>
    begin of T_NOTEBOOK_LIST_BODY,
      "!   The list of notebooks whose details will be retrieved.
      NOTEBOOKS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
    end of T_NOTEBOOK_LIST_BODY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Payload for creating a notebook in a project.</p>
    begin of T_NOTEBOOK_CRE_BODY_IN_PROJECT,
      "!   The name of the new notebook.
      NAME type STRING,
      "!   A more verbose description of the notebook.
      DESCRIPTION type STRING,
      "!   The reference to the file in the object storage.
      FILE_REFERENCE type STRING,
      "!   The notebook origin.
      ORIGINATES_FROM type T_NOTEBOOK_ORIGIN,
      "!   A notebook runtime.
      RUNTIME type T_NOTEBOOK_RUNTIME,
      "!   A notebook kernel.
      KERNEL type T_NOTEBOOK_KERNEL,
      "!   The guid of the project in which to create the notebook.
      PROJECT type STRING,
    end of T_NOTEBOOK_CRE_BODY_IN_PROJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Definition part of a notebook entity copied from a source.</p>
    begin of T_NOTEBOOK_ENTITY_DEF_FOR_COPY,
      "!   A notebook kernel.
      KERNEL type T_NOTEBOOK_KERNEL,
      "!   The origin of a notebook from a source.
      ORIGINATES_FROM type T_NOTEBOOK_ORIGIN_FROM_SOURCE,
    end of T_NOTEBOOK_ENTITY_DEF_FOR_COPY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Entity of a notebook copied from a source.</p>
    begin of T_NOTEBOOK_ENTITY_FOR_COPY,
      "!   Definition part of a notebook entity copied from a source.
      NOTEBOOK type T_NOTEBOOK_ENTITY_DEF_FOR_COPY,
      "!   A notebook runtime.
      RUNTIME type T_NOTEBOOK_RUNTIME,
      "!   Full URI of the notebook.
      HREF type STRING,
    end of T_NOTEBOOK_ENTITY_FOR_COPY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Information of a copied notebook as returned by a GET</p>
    "!     request.
    begin of T_NOTEBOOK_FOR_COPY,
      "!   Metadata of a notebook in a project.
      METADATA type T_NOTEBOOK_METADATA_IN_PROJECT,
      "!   Entity of a notebook copied from a source.
      ENTITY type T_NOTEBOOK_ENTITY_FOR_COPY,
    end of T_NOTEBOOK_FOR_COPY.
  types:
    "! No documentation available.
    begin of T_GET_PROMPT_INPUT_RESPONSE,
      "!   The prompt&apos;s input string used for inferences.
      INPUT type STRING,
    end of T_GET_PROMPT_INPUT_RESPONSE.
  types:
    "! No documentation available.
    begin of T_UTILITY_AGENT_TOOL,
      "!   Name of the tool.
      NAME type STRING,
      "!   A plain text description of what the tool is used for.
      DESCRIPTION type STRING,
      "!   The precise instruction to agent LLMs and should be treated as part of the
      "!    system prompt. If not provided, `description` can be used in it&apos;s place.
      AGENT_DESCRIPTION type STRING,
      "!   The JSON schema of the input that is provided when running the tool if
      "!    applicable.
      INPUT_SCHEMA type JSONOBJECT,
      "!   The JSON schema of the config that can be provided when running the tool if
      "!    applicable.
      CONFIG_SCHEMA type JSONOBJECT,
    end of T_UTILITY_AGENT_TOOL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of a user text content.</p>
    begin of T_TEXT_CHAT_USER_TEXT_CONTENT,
      "!   The type of the user content. You can get the list of models supporting text,
      "!    image, audio, video by using<br/>
      "!   [Foundation Model
      "!    Specs](https://cloud.ibm.com/apidocs/watsonx-ai#list-foundation-model-specs)
      "!    with<br/>
      "!   `filters=function_text_chat`, `filters=function_image_chat`,
      "!    `filters=function_audio_chat`,<br/>
      "!   `filters=function_video_chat` respectively.
      TYPE type STRING,
      "!   The text content.
      TEXT type STRING,
    end of T_TEXT_CHAT_USER_TEXT_CONTENT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The time when the response was created in ISO 8601 format.</p>
      T_CREATED_AT type DATETIME.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The id of the foundation model. If not provided AutoAI</p>
    "!     auto-selects 3 top rated models.
      T_AUTO_AIRAGFOUNDATION_MODELS type String.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The metrics that can be returned by a fine tuning job</p>
    "!     created with InstructLab.
      T_FINE_TUNING_TRAINING_METRICS type JSONOBJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The status of a Taxonomy job.</p>
    begin of T_TAXONOMY_STATUS,
      "!   The status of the job.
      STATE type STRING,
      "!   The timestamp when the job completed.
      COMPLETED_AT type STRING,
      "!   Date and Time in which current training state has started.
      RUNNING_AT type STRING,
    end of T_TAXONOMY_STATUS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The Taxonomy entity.</p><br/>
    "!    <br/>
    "!    <br/>
    "!    The `data_reference.type` will be `github` and the `results_reference.type` will
    "!     be set to `taxonomy_asset`.
    begin of T_TAXONOMY_RESPONSE,
      "!   A reference to data.
      RESULTS_REFERENCE type T_OBJECT_LOCATION,
      "!   The status of a Taxonomy job.
      STATUS type T_TAXONOMY_STATUS,
      "!   A reference to data.
      DATA_REFERENCE type T_OBJECT_LOCATION,
    end of T_TAXONOMY_RESPONSE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The response fields from a Taxonomy request.</p>
    begin of T_TAXONOMY_RESOURCE,
      "!   Common metadata for a resource where `project_id` or `space_id` must be present.
      "!
      METADATA type T_RESOURCE_META,
      "!   The Taxonomy entity.<br/>
      "!   <br/>
      "!   <br/>
      "!   The `data_reference.type` will be `github` and the `results_reference.type` will
      "!    be set to `taxonomy_asset`.
      ENTITY type T_TAXONOMY_RESPONSE,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_TAXONOMY_RESOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Child evidence.</p>
    begin of T_TXT_DETECTION_CHILD_EVIDENCE,
      "!   The name for the evidence.
      NAME type STRING,
      "!   The value for the evidence.
      VALUE type STRING,
      "!   The threshold probability that this is a real match.
      SCORE type FLOAT,
      "!   The child evidence details.
      EVIDENCE type STANDARD TABLE OF T_TXT_DTCTN_EVIDENCE_OBJECT WITH NON-UNIQUE DEFAULT KEY,
    end of T_TXT_DETECTION_CHILD_EVIDENCE.
  types:
    "! No documentation available.
    begin of T_COMMIT,
      "!   The hash of the git commit when the results were saved.
      COMMIT type STRING,
    end of T_COMMIT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    An error object.</p>
    begin of T_ERROR,
      "!   The code describing the error.
      CODE type STRING,
      "!   The detailed information about the error.
      MESSAGE type STRING,
      "!   The target of the error.
      TARGET type T_ERROR_TARGET,
    end of T_ERROR.
  types:
    "! No documentation available.
    begin of T_WX_PRMPT_SSSN_ENTRY_LST_RES1,
      "!   The prompt entry&apos;s ID.
      ID type STRING,
      "!   The prompt entry&apos;s name.
      NAME type STRING,
      "!   The prompt entry&apos;s description.
      DESCRIPTION type STRING,
      "!   The prompt entry&apos;s create time in millis.
      CREATED_AT type INTEGER,
    end of T_WX_PRMPT_SSSN_ENTRY_LST_RES1.
  types:
    "! No documentation available.
    begin of T_WX_PROMPT_SESSION_ENTRY_LIST,
      "!   No documentation available.
      RESULTS type STANDARD TABLE OF T_WX_PRMPT_SSSN_ENTRY_LST_RES1 WITH NON-UNIQUE DEFAULT KEY,
      "!   No documentation available.
      BOOKMARK type STRING,
    end of T_WX_PROMPT_SESSION_ENTRY_LIST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Common metadata for a simple resource.</p>
    begin of T_RESOURCE_META_SIMPLE,
      "!   The id of the resource.
      ID type STRING,
      "!   The time when the resource was created.
      CREATED_AT type DATETIME,
    end of T_RESOURCE_META_SIMPLE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The training details required when creating the job.</p>
    begin of T_TRAINING_RESOURCE_DETAILS,
      "!   The name of the training.
      NAME type STRING,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   A description of the training.
      DESCRIPTION type STRING,
      "!   A list of tags for this resource.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
    end of T_TRAINING_RESOURCE_DETAILS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The properties specific to HAP.</p>
    begin of T_HAP_PROPERTIES,
      "!   The properties specific to masking. If this object exists,<br/>
      "!   even if it is empty, then masking will be applied.
      MASK type T_MASK_PROPERTIES,
    end of T_HAP_PROPERTIES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The input string to tokenize along with the associated model</p>
    "!     id and any parameters. One of `space_id` or `project_id` must be provided.
    begin of T_TEXT_TOKENIZE_REQUEST,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   The `id` of the model to be used for this request. Please refer to the [list of
      "!    models](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/fm-mod
      "!   els.html?context=wx).
      MODEL_ID type STRING,
      "!   The input string to tokenize.
      INPUT type STRING,
      "!   The parameters for text tokenization.
      PARAMETERS type T_TEXT_TOKENIZE_PARAMETERS,
    end of T_TEXT_TOKENIZE_REQUEST.
  types:
    "! No documentation available.
      T_TEXT_CHAT_USER_CONTENTS type JSONOBJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of a user message.</p>
    begin of T_TEXT_CHAT_MESSAGE_USER,
      "!   The role of the messages author.
      ROLE type STRING,
      "!   No documentation available.
      CONTENT type STANDARD TABLE OF T_TEXT_CHAT_USER_CONTENTS WITH NON-UNIQUE DEFAULT KEY,
      "!   An optional name for the participant. Provides the model information to
      "!    differentiate between participants of the same role.
      NAME type STRING,
    end of T_TEXT_CHAT_MESSAGE_USER.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The properties that are part of a request that supports</p>
    "!     spaces and projects. Either `space_id` or `project_id` has to be provided and
    "!     is mandatory.
    begin of T_DOCUMENT_EXTRACTION_REQUEST,
      "!   The name of the document.
      NAME type STRING,
      "!   The documents for text extraction.
      DOCUMENT_REFERENCES type STANDARD TABLE OF T_DOC_EXTRACTION_OBJECT_LOC WITH NON-UNIQUE DEFAULT KEY,
      "!   A reference to data.
      RESULTS_REFERENCE type T_OBJECT_LOCATION_GITHUB,
      "!   A list of tags for this resource.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
    end of T_DOCUMENT_EXTRACTION_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The named function.</p>
    begin of T_TEXT_CHAT_TOOL_FUNCTION,
      "!   The name of the function.
      NAME type STRING,
    end of T_TEXT_CHAT_TOOL_FUNCTION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details of the AI service to be created.</p>
    begin of T_AISERVICE_REQUEST,
      "!   The space that contains the resource.
      SPACE_ID type STRING,
      "!   The name of the resource.
      NAME type STRING,
      "!   A description of the resource.
      DESCRIPTION type STRING,
      "!   A list of tags for this resource.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   A software specification.
      SOFTWARE_SPEC type T_SOFTWARE_SPEC_REL,
      "!   The type that allows the deployment service to know how to setup the code during
      "!    deployment.
      CODE_TYPE type STRING,
      "!   The documentation of the AI service request body and response body.
      DOCUMENTATION type T_AISERVICE_DOCUMENTATION,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   User defined properties specified as key-value pairs, which is propagated to the
      "!    deployment.
      TOOLING type JSONOBJECT,
    end of T_AISERVICE_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Detection details.</p>
    begin of T_TXT_DETECTION_DETECTION_ITEM,
      "!   The type of the detection identified.
      DETECTION_TYPE type STRING,
      "!   The detected string.
      DETECTION type STRING,
      "!   The threshold probability that this is a real match.
      SCORE type FLOAT,
    end of T_TXT_DETECTION_DETECTION_ITEM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The input text, this is only output if</p>
    "!     `parameters.return_options.input_text` is set to `true` in the request.
    begin of T_EMBEDDING_INPUT_RESULT,
      "!   The input text.
      TEXT type STRING,
    end of T_EMBEDDING_INPUT_RESULT.
  types:
    "! No documentation available.
    begin of T_UTIL_AGNT_TL_UNSTRCTRD_INPUT,
      "!   The name of the tool to be run.
      TOOL_NAME type STRING,
      "!   Input to be used when running tool that has no input_schema.
      INPUT type STRING,
      "!   Optional configuration options that can be passed for some tools. This must
      "!    match the config schema for that tool.
      CONFIG type JSONOBJECT,
    end of T_UTIL_AGNT_TL_UNSTRCTRD_INPUT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details needed to create unstructured synthetic data</p>
    "!     generation job.<br/>
    "!    <br/>
    "!    The `seed_data_reference.type` must be `container` and the
    "!     `results_reference.type` must also be `container`.
    begin of T_SDGUNSTRUCTURED_GEN_REQUEST,
      "!   The name of the resource.
      NAME type STRING,
      "!   A description of the resource.
      DESCRIPTION type STRING,
      "!   The project that contains the resource.
      PROJECT_ID type STRING,
      "!   The pipeline type.
      PIPELINE type STRING,
      "!   A model from the list of certified models that support unstructured generation.
      "!    Refer to the product documentation to know the list of certified model IDs.
      MODEL_ID type STRING,
      "!   The parameters to guide the generation.
      PARAMETERS type T_SDGUNSTRUCTURED_GEN_PARAM,
      "!   A reference to data.
      SEED_DATA_REFERENCE type T_SDGOBJECT_LOCATION,
      "!   A reference to data.
      RESULTS_REFERENCE type T_SDGOBJECT_LOCATION,
    end of T_SDGUNSTRUCTURED_GEN_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The embedding values for a text string. The `input` field is</p>
    "!     only set if the corresponding `return_option` is set.
    begin of T_EMBEDDING,
      "!   The input text, this is only output if
      "!    `parameters.return_options.input_text`<br/>
      "!   is set to `true` in the request.
      INPUT type T_EMBEDDING_INPUT_RESULT,
      "!   The embedding values.
      EMBEDDING type STANDARD TABLE OF NUMBER WITH NON-UNIQUE DEFAULT KEY,
    end of T_EMBEDDING.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The embeddings per input.</p>
    begin of T_EMBEDDINGS_RESPONSE_FIELDS,
      "!   The `id` of the model to be used for this request. Please refer to the [list of
      "!    models](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/fm-mod
      "!   els-embed.html?context=wx&audience=wdp).
      MODEL_ID type STRING,
      "!   The embedding values for a given text.
      RESULTS type STANDARD TABLE OF T_EMBEDDING WITH NON-UNIQUE DEFAULT KEY,
      "!   The time when the response was created in ISO 8601 format.
      CREATED_AT type DATETIME,
      "!   The number of input tokens that were consumed.
      INPUT_TOKEN_COUNT type INTEGER,
    end of T_EMBEDDINGS_RESPONSE_FIELDS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Parameters for text embedding requests.</p>
    begin of T_EMBEDDING_PARAMETERS,
      "!   Represents the maximum number of tokens accepted per input.<br/>
      "!   <br/>
      "!   This can be used to avoid requests failing due to input being longer than
      "!    configured limits. If the text is truncated, then it truncates the end of the
      "!    input (on the right), so the start of the input will remain the same.<br/>
      "!   <br/>
      "!   If this value exceeds the `maximum sequence length` (refer to the documentation
      "!    to find this value for the model) then the call will fail if the total number
      "!    of tokens exceeds the `maximum sequence length`.
      TRUNCATE_INPUT_TOKENS type INTEGER,
      "!   The return options for text embeddings.
      RETURN_OPTIONS type T_EMBEDDING_RETURN_OPTIONS,
    end of T_EMBEDDING_PARAMETERS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of an assistant message.</p>
    begin of T_DPLYMNT_TXT_CHT_MSG_TXT_CHT1,
      "!   The role of the messages author.
      ROLE type STRING,
      "!   The contents of the assistant message. Required unless `tool_calls` is
      "!    specified.
      CONTENT type STRING,
      "!   An optional name for the participant. Provides the model information to
      "!    differentiate between participants of the same role.
      NAME type STRING,
      "!   The refusal message by the assistant.
      REFUSAL type STRING,
      "!   The tool calls generated by the model, such as function calls.
      TOOL_CALLS type STANDARD TABLE OF T_TEXT_CHAT_TOOL_CALL WITH NON-UNIQUE DEFAULT KEY,
    end of T_DPLYMNT_TXT_CHT_MSG_TXT_CHT1.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The specific fields for the geospatial transformation</p>
    "!     metadata fields.
    begin of T_GEOSPATIAL_TRANS_METADATA,
      "!   The id of the resource.
      ID type STRING,
      "!   The time when the resource was created.
      CREATED_AT type DATETIME,
      "!   The space that contains the resource.
      SPACE_ID type STRING,
    end of T_GEOSPATIAL_TRANS_METADATA.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The deployment request entity (this description is not</p>
    "!     used).
    begin of T_DEPLOYMENT_RESRC_PROTOTYPE,
      "!   The name of the resource.
      NAME type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   A description of the resource.
      DESCRIPTION type STRING,
      "!   A list of tags for this resource.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   A reference to a resource.
      PROMPT_TEMPLATE type T_SIMPLE_REL,
      "!   Indicates that this is an online deployment. An object has to be specified but
      "!    can be empty.<br/>
      "!   The `serving_name` can be provided in the `online.parameters`.
      ONLINE type T_ONLINE_DEPLOYMENT,
      "!   A hardware specification.
      HARDWARE_SPEC type T_HARDWARE_SPEC,
      "!   The requested hardware for deployment.
      HARDWARE_REQUEST type T_HARDWARE_REQUEST,
      "!   A reference to a resource.
      ASSET type T_REL,
      "!   The base model that is required for this deployment if this is for a prompt
      "!    template or a prompt tune for an IBM foundation model.
      BASE_MODEL_ID type STRING,
    end of T_DEPLOYMENT_RESRC_PROTOTYPE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A JSON schema, see the [JSON Schema</p>
    "!     reference](https://json-schema.org/learn/getting-started-step-by-step) for
    "!     documentation about the format.
      T_JSONCONTENT_SCHEMA type JSONOBJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The field that identifies the asset.</p>
    begin of T_MODEL_ASSET_REF,
      "!   A reference to a resource.
      ASSET type T_MODEL_REL,
    end of T_MODEL_ASSET_REF.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The schema for a given content type. Each property defines</p>
    "!     the content type and the sub-object is the JSON schema that describes the
    "!     content.
      T_JSONCONTENT_DEFINITION type MAP.
  types:
    "! No documentation available.
    begin of T_TRAIN_RESRC_MODEL_ID_OUTPUT,
      "!   This may be set to the model that was created from the results of this training.
      "!    Using the option `auto_update_model` will cause this field to get set.
      MODEL_ID type STRING,
    end of T_TRAIN_RESRC_MODEL_ID_OUTPUT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of a user message.</p>
    begin of T_TXT_CHT_MSG_TXT_CHAT_MSG_USR,
      "!   The role of the messages author.
      ROLE type STRING,
      "!   No documentation available.
      CONTENT type STANDARD TABLE OF T_TEXT_CHAT_USER_CONTENTS WITH NON-UNIQUE DEFAULT KEY,
      "!   An optional name for the participant. Provides the model information to
      "!    differentiate between participants of the same role.
      NAME type STRING,
    end of T_TXT_CHT_MSG_TXT_CHAT_MSG_USR.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A notebook version in a project.</p>
    begin of T_NTBK_VER_CRE_RESP_NTBK_VER_1,
      "!   Notebook version metadata.
      METADATA type T_NOTEBOOK_VERSION_METADATA,
      "!   A notebook version entity in a project.
      ENTITY type T_NTBK_VER_ENTITY_IN_PROJECT,
    end of T_NTBK_VER_CRE_RESP_NTBK_VER_1.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Notebook information in a project as returned by a GET</p>
    "!     request.
    begin of T_NOTEBOOK_IN_PROJECT,
      "!   Metadata of a notebook in a project.
      METADATA type T_NOTEBOOK_METADATA_IN_PROJECT,
      "!   Entity of a notebook.
      ENTITY type T_NOTEBOOK_ENTITY,
    end of T_NOTEBOOK_IN_PROJECT.
  types:
    "! No documentation available.
    begin of T_WX_UTIL_AGENT_TOOLS_RESPONSE,
      "!   No documentation available.
      RESOURCES type STANDARD TABLE OF T_UTILITY_AGENT_TOOL WITH NON-UNIQUE DEFAULT KEY,
    end of T_WX_UTIL_AGENT_TOOLS_RESPONSE.
  types:
    "! No documentation available.
    begin of T_PAGINATION_BASE,
      "!   Computed explicitly only when &apos;total_count=true&apos; query parameter is
      "!    present. This is in order to avoid performance penalties.
      TOTAL_COUNT type INTEGER,
      "!   The number of items to return in each page.
      LIMIT type INTEGER,
      "!   The reference to the first item in the current page.
      FIRST type T_PAGINATION_FIRST,
      "!   A reference to the first item of the next page, if any.
      NEXT type T_PAGINATION_NEXT,
    end of T_PAGINATION_BASE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A tool related result.</p>
    begin of T_TEXT_CHAT_RESULT_CHOICE,
      "!   The index of this result.
      INDEX type INTEGER,
      "!   A message result.
      MESSAGE type T_TEXT_CHAT_RESULT_MESSAGE,
      "!   The reason why the call stopped, can be one of:<br/>
      "!   - `stop` - The model hit a natural stop point or a provided stop sequence.<br/>
      "!   - `length` - The maximum number of tokens specified in the request was
      "!    reached.<br/>
      "!   - `tool_calls` - The model called a tool.<br/>
      "!   - `time_limit`` - Time limit reached.<br/>
      "!   - `cancelled`` - Request canceled by the client.<br/>
      "!   - `error`` - Error encountered.<br/>
      "!   - `null` - API response still in progress or incomplete.
      FINISH_REASON type STRING,
    end of T_TEXT_CHAT_RESULT_CHOICE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The response of getting all synthetic data generation jobs.</p>
    begin of T_SYNTHETIC_DATA_GEN_RESOURCES,
      "!   The number of items to return in each page.
      LIMIT type INTEGER,
      "!   No documentation available.
      RESOURCES type STANDARD TABLE OF T_SYNTHETIC_DATA_GEN_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
    end of T_SYNTHETIC_DATA_GEN_RESOURCES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The reason why the call stopped, can be one of:</p><br/>
    "!    - `stop` - The model hit a natural stop point or a provided stop sequence.<br/>
    "!    - `length` - The maximum number of tokens specified in the request was
    "!     reached.<br/>
    "!    - `tool_calls` - The model called a tool.<br/>
    "!    - `time_limit`` - Time limit reached.<br/>
    "!    - `cancelled`` - Request canceled by the client.<br/>
    "!    - `error`` - Error encountered.<br/>
    "!    - `null` - API response still in progress or incomplete.
      T_TEXT_CHAT_FINISH_REASON type String.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The text input for a given model to be used to generate the</p>
    "!     embeddings.
    begin of T_EMBEDDINGS_REQUEST,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   The `id` of the model to be used for this request. Please refer to the [list of
      "!    models](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/fm-mod
      "!   els-embed.html?context=wx&audience=wdp).
      MODEL_ID type STRING,
      "!   The input text.
      INPUTS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   Parameters for text embedding requests.
      PARAMETERS type T_EMBEDDING_PARAMETERS,
    end of T_EMBEDDINGS_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The return options for text reranking.</p>
    begin of T_RERANK_RETURN_OPTIONS,
      "!   Just show the top `n` results if set.
      TOP_N type INTEGER,
      "!   If `true` then the inputs will be returned in the response.
      INPUTS type BOOLEAN,
      "!   If `true` then the queries will be returned in the response.
      QUERY type BOOLEAN,
    end of T_RERANK_RETURN_OPTIONS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The input text.</p>
    begin of T_RERANK_INPUT,
      "!   The input text.
      TEXT type STRING,
    end of T_RERANK_INPUT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The properties used for reranking.</p>
    begin of T_RERANK_PARAMETERS,
      "!   Represents the maximum number of tokens accepted per input.<br/>
      "!   <br/>
      "!   This can be used to avoid requests failing due to input being longer than
      "!    configured limits. If the text is truncated, then it truncates the end of the
      "!    input (on the right), so the start of the input will remain the same.<br/>
      "!   <br/>
      "!   If this value exceeds the `maximum sequence length` (refer to the documentation
      "!    to find this value for the model) then the call will fail if the total number
      "!    of tokens exceeds the `maximum sequence length`.
      TRUNCATE_INPUT_TOKENS type INTEGER,
      "!   The return options for text reranking.
      RETURN_OPTIONS type T_RERANK_RETURN_OPTIONS,
    end of T_RERANK_PARAMETERS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The request to rerank texts.</p>
    begin of T_RERANK_REQUEST,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   The `id` of the model to be used for this request. Please refer to the [list of
      "!    models](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/fm-mod
      "!   els-embed.html?context=wx&audience=wdp).
      MODEL_ID type STRING,
      "!   The rank input strings.
      INPUTS type STANDARD TABLE OF T_RERANK_INPUT WITH NON-UNIQUE DEFAULT KEY,
      "!   The rank query.
      QUERY type STRING,
      "!   The properties used for reranking.
      PARAMETERS type T_RERANK_PARAMETERS,
    end of T_RERANK_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of a user message.</p>
    begin of T_DPLYMNT_TXT_CHT_MSG_TXT_CHT4,
      "!   The role of the messages author.
      ROLE type STRING,
      "!   No documentation available.
      CONTENT type STANDARD TABLE OF T_TEXT_CHAT_USER_CONTENTS WITH NON-UNIQUE DEFAULT KEY,
      "!   An optional name for the participant. Provides the model information to
      "!    differentiate between participants of the same role.
      NAME type STRING,
    end of T_DPLYMNT_TXT_CHT_MSG_TXT_CHT4.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The base definition of a text chat user content.</p>
    begin of T_TEXT_CHAT_USER_CONTENT,
      "!   The type of the user content. You can get the list of models supporting text,
      "!    image, audio, video by using<br/>
      "!   [Foundation Model
      "!    Specs](https://cloud.ibm.com/apidocs/watsonx-ai#list-foundation-model-specs)
      "!    with<br/>
      "!   `filters=function_text_chat`, `filters=function_image_chat`,
      "!    `filters=function_audio_chat`,<br/>
      "!   `filters=function_video_chat` respectively.
      TYPE type STRING,
    end of T_TEXT_CHAT_USER_CONTENT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Common platform parameters for creating an unstructured</p>
    "!     synthetic data generation job.
    begin of T_SDGNSTRCTRD_GEN_BASE_ENTITY,
      "!   The name of the resource.
      NAME type STRING,
      "!   A description of the resource.
      DESCRIPTION type STRING,
      "!   The project that contains the resource.
      PROJECT_ID type STRING,
    end of T_SDGNSTRCTRD_GEN_BASE_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Payload for a request to revert to a specific notebook</p>
    "!     version.
    begin of T_NOTEBOOK_REVERT_BODY,
      "!   The guid of the notebook version.
      SOURCE type STRING,
    end of T_NOTEBOOK_REVERT_BODY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The transformation results.</p>
    begin of T_GEOSPATIAL_TRANS_RESP_FIELDS,
      "!   The transformation results.
      RESULTS type T_GEOSPATIAL_TRANS_RESULTS,
    end of T_GEOSPATIAL_TRANS_RESP_FIELDS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The response of an AutoAI RAG run.</p>
    begin of T_AUTO_AIRAGRESPONSE,
      "!   The request fields that are not part of the returned entity.
      METADATA type T_AUTO_AIRAGMETADATA,
      "!   The status of an AutoAI RAG run.
      ENTITY type T_AUTO_AIRAGRESPONSE_ENTITY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_AUTO_AIRAGRESPONSE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A paginated list of training definitions.</p>
    begin of T_AUTO_RAGRESULT_RESOURCES,
      "!   The total number of resources. Computed explicitly only when
      "!    &apos;total_count=true&apos; query parameter is present. This is in order to
      "!    avoid performance penalties.
      TOTAL_COUNT type INTEGER,
      "!   The number of items to return in each page.
      LIMIT type INTEGER,
      "!   The reference to the first item in the current page.
      FIRST type T_PAGINATION_FIRST,
      "!   A reference to the first item of the next page, if any.
      NEXT type T_PAGINATION_NEXT,
      "!   A list of training definitions.
      RESOURCES type STANDARD TABLE OF T_AUTO_AIRAGRESPONSE WITH NON-UNIQUE DEFAULT KEY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_AUTO_RAGRESULT_RESOURCES.
  types:
    "! No documentation available.
    begin of T_WX_UTIL_AGNT_TLS_RN_REQ_UTI2,
      "!   The name of the tool to be run.
      TOOL_NAME type STRING,
      "!   Input to be used when running tool that has an input_schema.
      INPUT type JSONOBJECT,
      "!   Optional configuration options that can be passed for some tools. This must
      "!    match the config schema for that tool.
      CONFIG type JSONOBJECT,
    end of T_WX_UTIL_AGNT_TLS_RN_REQ_UTI2.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of a user image content.</p>
    begin of T_TEXT_CHAT_USR_IMG_URLCONTENT,
      "!   The type of the user content. You can get the list of models supporting text,
      "!    image, audio, video by using<br/>
      "!   [Foundation Model
      "!    Specs](https://cloud.ibm.com/apidocs/watsonx-ai#list-foundation-model-specs)
      "!    with<br/>
      "!   `filters=function_text_chat`, `filters=function_image_chat`,
      "!    `filters=function_audio_chat`,<br/>
      "!   `filters=function_video_chat` respectively.
      TYPE type STRING,
      "!   The definition of a user image content.
      IMAGE_URL type T_TEXT_CHAT_USER_IMAGE_URL,
    end of T_TEXT_CHAT_USR_IMG_URLCONTENT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The inputs and outputs required to create a transformation</p>
    "!     for the given model.
    begin of T_GEOSPATIAL_TRANS_REQUEST,
      "!   The `id` of the model to be used for this request.
      MODEL_ID type STRING,
      "!   The input text.
      INPUTS type STANDARD TABLE OF T_GEOSPATIAL_TRANS_DATA WITH NON-UNIQUE DEFAULT KEY,
      "!   A data location of the input or output data.
      OUTPUT type T_GEOSPATIAL_TRANS_DATA,
      "!   The space that contains the resource.
      SPACE_ID type STRING,
    end of T_GEOSPATIAL_TRANS_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Optional configuration options that can be passed for some</p>
    "!     tools. This must match the config schema for that tool.
      T_TOOL_CONFIG type JSONOBJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Specifying a particular tool via `&#123;&quot;type&quot;:</p>
    "!     &quot;function&quot;, &quot;function&quot;: &#123;&quot;name&quot;:
    "!     &quot;my_function&quot;&#125;&#125;` forces the model to call that tool.
    "!     Specify either `tool_choice_option` to allow the model to pick or `tool_choice`
    "!     to force the model to call a tool.
    begin of T_TEXT_CHAT_TOOL_CHOICE_TOOL,
      "!   The tool type.
      TYPE type STRING,
      "!   The named function.
      FUNCTION type T_TEXT_CHAT_TOOL_FUNCTION,
    end of T_TEXT_CHAT_TOOL_CHOICE_TOOL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The properties specific to PII.</p>
    begin of T_MODERATION_PII_INPUT_PROP,
      "!   Properties that control the moderation on the text.
      INPUT type T_TEXT_MODERATION,
      "!   The properties specific to masking. If this object exists,<br/>
      "!   even if it is empty, then masking will be applied.
      MASK type T_MASK_PROPERTIES,
    end of T_MODERATION_PII_INPUT_PROP.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The properties specific to Granite Guardian. This detector</p>
    "!     is in beta and may change.
    begin of T_GRANITE_GUARDIAN_PROPERTIES,
      "!   The properties specific to masking. If this object exists,<br/>
      "!   even if it is empty, then masking will be applied.
      MASK type T_MASK_PROPERTIES,
    end of T_GRANITE_GUARDIAN_PROPERTIES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Notebook information in a project as returned by a GET</p>
    "!     request.
    begin of T_NTBK_CRE_RESP_NTBK_IN_PRJCT,
      "!   Metadata of a notebook in a project.
      METADATA type T_NOTEBOOK_METADATA_IN_PROJECT,
      "!   Entity of a notebook.
      ENTITY type T_NOTEBOOK_ENTITY,
    end of T_NTBK_CRE_RESP_NTBK_IN_PRJCT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The supported foundation models.</p>
      T_FOUNDATION_MODELS_ARRAY type STANDARD TABLE OF T_FOUNDATION_MODEL WITH NON-UNIQUE DEFAULT KEY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The common fields that can be patched. This is a helper for</p>
    "!     `cpdctl`.
    begin of T_COMMON_PATCH_REQUEST_HELPER,
      "!   A list of tags for this resource.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   The name of the resource.
      NAME type STRING,
      "!   A description of the resource.
      DESCRIPTION type STRING,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
    end of T_COMMON_PATCH_REQUEST_HELPER.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Detection evidence.</p>
    begin of T_TEXT_DETECTION_CONTEXT_ITEM,
      "!   The type of the detection identified.
      DETECTION_TYPE type STRING,
      "!   The detected string.
      DETECTION type STRING,
      "!   The threshold probability that this is a real match.
      SCORE type FLOAT,
      "!   The evidence details.
      EVIDENCE type STANDARD TABLE OF T_TXT_DETECTION_CHILD_EVIDENCE WITH NON-UNIQUE DEFAULT KEY,
    end of T_TEXT_DETECTION_CONTEXT_ITEM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details needed to create synthetic data generation</p>
    "!     job.<br/>
    "!    <br/>
    "!    The `data_reference.type` must be `taxonomy_asset` and the
    "!     `results_reference.type` will normally be something like `connection_asset` or
    "!     `data_asset`.
    begin of T_SYNTHETIC_DATA_GEN_REQUEST,
      "!   The name of the data.<br/>
      "!   <br/>
      "!   The value must be a lowercase alphanumeric value but it can also have
      "!    non-consecutive dashes (-) and underscores (_). The value must start and end
      "!    with an alphanumeric character.
      NAME type STRING,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   A reference to data.
      DATA_REFERENCE type T_OBJECT_LOCATION,
      "!   A reference to data.
      RESULTS_REFERENCE type T_OBJECT_LOCATION,
    end of T_SYNTHETIC_DATA_GEN_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Represents the maximum number of input tokens accepted. This</p>
    "!     can be used to avoid requests failing due to input being longer than configured
    "!     limits. If the text is truncated, then it truncates the start of the input (on
    "!     the left), so the end of the input will remain the same. If this value exceeds
    "!     the `maximum sequence length` (refer to the documentation to find this value
    "!     for the model) then the call will fail if the total number of tokens exceeds
    "!     the `maximum sequence length`.
      T_PRM_TRNCT_INPT_TKNS_FRM_STRT type Integer.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The name of the job.</p>
      T_RESOURCE_NAME type String.
  types:
    "! No documentation available.
      T_TEXT_CHAT_MESSAGES type JSONOBJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The request entity for an AutoAI RAG run.</p>
    begin of T_AUTO_AIRAGREQUEST_ENTITY,
      "!   A hardware specification.
      HARDWARE_SPEC type T_HARDWARE_SPEC,
      "!   The parameters for an AutoAI RAG run.
      PARAMETERS type T_AUTO_AIRAGPARAMETERS,
      "!   A set of input data references.
      INPUT_DATA_REFERENCES type STANDARD TABLE OF T_AUTO_AIDATA_LOCATION WITH NON-UNIQUE DEFAULT KEY,
      "!   A set of test data references.
      TEST_DATA_REFERENCES type STANDARD TABLE OF T_AUTO_AIDATA_LOCATION WITH NON-UNIQUE DEFAULT KEY,
      "!   A set of vector store references. Milvus vector database is supported.
      VECTOR_STORE_REFERENCES type STANDARD TABLE OF T_CONNECTION_ASSET WITH NON-UNIQUE DEFAULT KEY,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
    end of T_AUTO_AIRAGREQUEST_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Status of the training job.</p>
    begin of T_TRAINING_RESOURCE_ENTITY,
      "!   Properties to control the prompt tuning.
      PROMPT_TUNING type T_PROMPT_TUNING,
      "!   Training datasets.
      TRAINING_DATA_REFERENCES type STANDARD TABLE OF T_DATA_CONNECTION_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   If set to `true` then the result of the training, if successful, will be
      "!    uploaded to the repository as a model.
      AUTO_UPDATE_MODEL type BOOLEAN,
      "!   The training results. Normally this is specified as `type=container` which means
      "!    that it is stored in the space or project. Note that the training will add some
      "!    fields that point to the training status, the model request and the
      "!    assets.<br/>
      "!   <br/>
      "!   The `model_request_path` is the request body that should be used when creating
      "!    the trained model in the API, if this model is to be deployed. If
      "!    `auto_update_model` was set to `true` then this file is not needed.
      RESULTS_REFERENCE type T_OBJECT_LOCATION,
      "!   Status of the training job.
      STATUS type T_TRAINING_STATUS,
      "!   This may be set to the model that was created from the results of this training.
      "!    Using the option `auto_update_model` will cause this field to get set.
      MODEL_ID type STRING,
    end of T_TRAINING_RESOURCE_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Training resource.</p>
    begin of T_TRAINING_RESOURCE,
      "!   Common metadata for a resource where `project_id` or `space_id` must be present.
      "!
      METADATA type T_RESOURCE_META,
      "!   Status of the training job.
      ENTITY type T_TRAINING_RESOURCE_ENTITY,
    end of T_TRAINING_RESOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Information for paging when querying resources.</p>
    begin of T_TRAINING_RESOURCE_COLLECTION,
      "!   The total number of resources. Computed explicitly only when
      "!    &apos;total_count=true&apos; query parameter is present. This is in order to
      "!    avoid performance penalties.
      TOTAL_COUNT type INTEGER,
      "!   The number of items to return in each page.
      LIMIT type INTEGER,
      "!   The reference to the first item in the current page.
      FIRST type T_PAGINATION_FIRST,
      "!   A reference to the first item of the next page, if any.
      NEXT type T_PAGINATION_NEXT,
      "!   The training resources.
      RESOURCES type STANDARD TABLE OF T_TRAINING_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_TRAIN_RESRC_COLLECTION_SYS,
    end of T_TRAINING_RESOURCE_COLLECTION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The properties specific to PII.</p>
    begin of T_PII_PROPERTIES,
      "!   The properties specific to masking. If this object exists,<br/>
      "!   even if it is empty, then masking will be applied.
      MASK type T_MASK_PROPERTIES,
    end of T_PII_PROPERTIES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A notebook version in a project.</p>
    begin of T_NTBK_VER_RTRV_RESP_NTBK_VER1,
      "!   Notebook version metadata.
      METADATA type T_NOTEBOOK_VERSION_METADATA,
      "!   A notebook version entity in a project.
      ENTITY type T_NTBK_VER_ENTITY_IN_PROJECT,
    end of T_NTBK_VER_RTRV_RESP_NTBK_VER1.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The supported foundation model tasks.</p>
      T_FOUNDATION_MODEL_TASKS_ARRAY type STANDARD TABLE OF T_FOUNDATION_MODEL_TASK WITH NON-UNIQUE DEFAULT KEY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Common metadata for a resource.</p>
    begin of T_RESOURCE_META_BASE,
      "!   The revision of the resource.
      REV type STRING,
      "!   The user id which created this resource.
      OWNER type STRING,
      "!   The time when the resource was last modified.
      MODIFIED_AT type DATETIME,
      "!   The id of the parent resource where applicable.
      PARENT_ID type STRING,
      "!   The name of the resource.
      NAME type STRING,
      "!   A description of the resource.
      DESCRIPTION type STRING,
      "!   A list of tags for this resource.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   Information related to the revision.
      COMMIT_INFO type T_RESOURCE_COMMIT_INFO,
    end of T_RESOURCE_META_BASE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The properties for the moderation. Each type of moderation</p>
    "!     may have additional properties that are specific to that moderation.
    begin of T_MODERATION_PROPERTIES,
      "!   Properties that control the moderation on the text.
      INPUT type T_TEXT_MODERATION,
      "!   Properties that control the moderation on the text.
      OUTPUT type T_TEXT_MODERATION,
    end of T_MODERATION_PROPERTIES.
  types:
    "! No documentation available.
      T_NOTEBOOK_VER_CREATE_RESPONSE type JSONOBJECT.
  types:
    "! No documentation available.
    begin of T_TEXT_GEN_RESULT,
      "!   The text that was generated by the model.
      GENERATED_TEXT type STRING,
      "!   The reason why the call stopped, can be one of:<br/>
      "!   - not_finished - Possibly more tokens to be streamed.<br/>
      "!   - max_tokens - Maximum requested tokens reached.<br/>
      "!   - eos_token - End of sequence token encountered.<br/>
      "!   - cancelled - Request canceled by the client.<br/>
      "!   - time_limit - Time limit reached.<br/>
      "!   - stop_sequence - Stop sequence encountered.<br/>
      "!   - token_limit - Token limit reached.<br/>
      "!   - error - Error encountered.<br/>
      "!   <br/>
      "!   Note that these values will be lower-cased so test for values case insensitive.
      STOP_REASON type STRING,
    end of T_TEXT_GEN_RESULT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of a control message.</p>
    begin of T_TEXT_CHAT_MESSAGE_CONTROL,
      "!   The role of the messages author.
      ROLE type STRING,
      "!   The contents of the control message. Depending on the model, an example would be
      "!    &quot;thinking&quot; for Granite reasoning models.
      CONTENT type STRING,
      "!   An optional name for the participant. Provides the model information to
      "!    differentiate between participants of the same role.
      NAME type STRING,
    end of T_TEXT_CHAT_MESSAGE_CONTROL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The number of input tokens that were consumed.</p>
      T_INPUT_TOKEN_COUNT type Integer.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Prediction results.</p>
      T_TSFORECAST_RESULTS type JSONOBJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The properties for the moderation. Each type of moderation</p>
    "!     may have additional properties that are specific to that moderation.
    begin of T_MODERATION_INPUT_PROPERTIES,
      "!   Properties that control the moderation on the text.
      INPUT type T_TEXT_MODERATION,
    end of T_MODERATION_INPUT_PROPERTIES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of a control message.</p>
    begin of T_DPLYMNT_TXT_CHT_MSG_TXT_CHT2,
      "!   The role of the messages author.
      ROLE type STRING,
      "!   The contents of the control message. Depending on the model, an example would be
      "!    &quot;thinking&quot; for Granite reasoning models.
      CONTENT type STRING,
      "!   An optional name for the participant. Provides the model information to
      "!    differentiate between participants of the same role.
      NAME type STRING,
    end of T_DPLYMNT_TXT_CHT_MSG_TXT_CHT2.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The threshold probability that this is a real match.</p>
      T_TEXT_DETECTION_SCORE type Float.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of a system message.</p>
    begin of T_TEXT_CHAT_MESSAGE_SYSTEM,
      "!   The role of the messages author.
      ROLE type STRING,
      "!   The contents of the system message.
      CONTENT type STRING,
      "!   An optional name for the participant. Provides the model information to
      "!    differentiate between participants of the same role.
      NAME type STRING,
    end of T_TEXT_CHAT_MESSAGE_SYSTEM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    System details.</p>
    begin of T_EMBEDDINGS_RESPONSE,
      "!   The `id` of the model to be used for this request. Please refer to the [list of
      "!    models](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/fm-mod
      "!   els-embed.html?context=wx&audience=wdp).
      MODEL_ID type STRING,
      "!   The embedding values for a given text.
      RESULTS type STANDARD TABLE OF T_EMBEDDING WITH NON-UNIQUE DEFAULT KEY,
      "!   The time when the response was created in ISO 8601 format.
      CREATED_AT type DATETIME,
      "!   The number of input tokens that were consumed.
      INPUT_TOKEN_COUNT type INTEGER,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_EMBEDDINGS_RESPONSE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The template properties if this request refers to a prompt</p>
    "!     template.
    begin of T_PROMPT_TEMPLATE_VARIABLES,
      "!   The prompt variables.
      PROMPT_VARIABLES type MAP,
    end of T_PROMPT_TEMPLATE_VARIABLES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of an assistant message.</p>
    begin of T_TXT_CHT_MSG_TXT_CHT_MSG_ASS1,
      "!   The role of the messages author.
      ROLE type STRING,
      "!   The contents of the assistant message. Required unless `tool_calls` is
      "!    specified.
      CONTENT type STRING,
      "!   An optional name for the participant. Provides the model information to
      "!    differentiate between participants of the same role.
      NAME type STRING,
      "!   The refusal message by the assistant.
      REFUSAL type STRING,
      "!   The tool calls generated by the model, such as function calls.
      TOOL_CALLS type STANDARD TABLE OF T_TEXT_CHAT_TOOL_CALL WITH NON-UNIQUE DEFAULT KEY,
    end of T_TXT_CHT_MSG_TXT_CHT_MSG_ASS1.
  types:
    "! No documentation available.
    begin of T_IN_MEMORY_SETTINGS,
      "!   The number of text (or tokens) that are grouped together before converting into
      "!    a vector.
      CHUNK_SIZE type NUMBER,
      "!   The number of characters to overlap for chunking data.
      CHUNK_OVERLAP type NUMBER,
      "!   specifies how many tokens to sample.
      TOP_K type NUMBER,
      "!   No documentation available.
      SPLIT_PDF_PAGES type BOOLEAN,
      "!   No documentation available.
      RERANK type BOOLEAN,
      "!   No documentation available.
      EMBEDDING_MODEL_ID type STRING,
    end of T_IN_MEMORY_SETTINGS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A chat completion choices.</p>
    begin of T_TEXT_CHAT_RESPONSE_FIELDS,
      "!   A list of chat completion choices. Can be more than one if `n` is greater than
      "!    1.
      CHOICES type STANDARD TABLE OF T_TEXT_CHAT_RESULT_CHOICE WITH NON-UNIQUE DEFAULT KEY,
    end of T_TEXT_CHAT_RESPONSE_FIELDS.
  types:
    "! No documentation available.
    begin of T_WX_PROMPT_SESSION,
      "!   The prompt session&apos;s id. This value cannot be set. It is returned in
      "!    responses only.
      ID type STRING,
      "!   Name used to display the prompt session.
      NAME type STRING,
      "!   An optional description for the prompt session.
      DESCRIPTION type STRING,
      "!   Time the session was created.
      CREATED_AT type INTEGER,
      "!   The ID of the original session creator.
      CREATED_BY type STRING,
      "!   Time the session was updated.
      LAST_UPDATED_AT type INTEGER,
      "!   The ID of the last user that modifed the session.
      LAST_UPDATED_BY type STRING,
      "!   No documentation available.
      LOCK type T_PROMPT_LOCK,
      "!   No documentation available.
      PROMPTS type STANDARD TABLE OF T_WX_PROMPT_SESSION_ENTRY WITH NON-UNIQUE DEFAULT KEY,
    end of T_WX_PROMPT_SESSION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Common metadata for a resource where `project_id` or</p>
    "!     `space_id` must be present.
    begin of T_RESRC_SPACE_PROJECT_METADATA,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
    end of T_RESRC_SPACE_PROJECT_METADATA.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Detection evidence.</p>
    begin of T_TEXT_DETECTION_EVIDENCE_REF,
      "!   The evidence details.
      EVIDENCE type STANDARD TABLE OF T_TXT_DETECTION_CHILD_EVIDENCE WITH NON-UNIQUE DEFAULT KEY,
    end of T_TEXT_DETECTION_EVIDENCE_REF.
  types:
    "! No documentation available.
    begin of T_FILE_PATHS,
      "!   This is a vector of strings where each string will be the filepath of the .md
      "!    file stored in the user&apos;s github repository.
      FILEPATHS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
    end of T_FILE_PATHS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The request fields that are not part of the returned entity.</p>
    begin of T_RESOURCE_REQUEST_FIELDS,
      "!   The name of the job.
      NAME type STRING,
      "!   The description of the job.
      DESCRIPTION type STRING,
      "!   A list of tags for this resource.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
    end of T_RESOURCE_REQUEST_FIELDS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Information of a copied notebook as returned by a GET</p>
    "!     request.
    begin of T_NTBK_CRE_RESP_NTBK_FOR_COPY,
      "!   Metadata of a notebook in a project.
      METADATA type T_NOTEBOOK_METADATA_IN_PROJECT,
      "!   Entity of a notebook copied from a source.
      ENTITY type T_NOTEBOOK_ENTITY_FOR_COPY,
    end of T_NTBK_CRE_RESP_NTBK_FOR_COPY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The inputs and outputs required to create a transformation</p>
    "!     for the given model.
    begin of T_GSPTL_TRANS_RESRC_ENTITY,
      "!   The `id` of the model to be used for this request.
      MODEL_ID type STRING,
      "!   The input text.
      INPUTS type STANDARD TABLE OF T_GEOSPATIAL_TRANS_DATA WITH NON-UNIQUE DEFAULT KEY,
      "!   A data location of the input or output data.
      OUTPUT type T_GEOSPATIAL_TRANS_DATA,
      "!   The transformation results.
      RESULTS type T_GEOSPATIAL_TRANS_RESULTS,
    end of T_GSPTL_TRANS_RESRC_ENTITY.
  types:
    "! No documentation available.
    begin of T_DEPLOYMENT_TEXT_CHAT,
      "!   The messages for this chat session. You cannot specify `system` `role` in the
      "!    messages. Depending on the model, the `content` of `system` `role` may be from
      "!    `system_prompt` of the prompt template, and will be automatically inserted into
      "!    `messages`.<br/>
      "!   <br/>
      "!   As an example, depending on the model, if `system_prompt` of a prompt template
      "!    is &quot;You are Granite Chat, an AI language model developed by IBM. You are a
      "!    cautious assistant. You carefully follow instructions. You are helpful and
      "!    harmless and you follow ethical guidelines and promote positive
      "!    behavior.&quot;, a message with `system` `role` having `content` the same as
      "!    `system_prompt` is inserted.
      MESSAGES type STANDARD TABLE OF T_DEPLOYMENT_TEXT_CHAT_MSG WITH NON-UNIQUE DEFAULT KEY,
      "!   If specified, `context` will be inserted into `messages`. Depending on the
      "!    model, `context` may be inserted into the `content` with `system` `role`; or
      "!    into the `content` of the last message of `user` `role`.<br/>
      "!   <br/>
      "!   <br/>
      "!   In the example, `context` &quot;Today is Wednesday&quot; is inserted as
      "!    such<br/>
      "!   `content` of `user` becomes &quot;Today is Wednesday. Who are you and which day
      "!    is tomorrow?&quot;.
      CONTEXT type STRING,
    end of T_DEPLOYMENT_TEXT_CHAT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The properties that are part of a request that supports</p>
    "!     spaces and projects. Either `space_id` or `project_id` has to be provided and
    "!     is mandatory.
    begin of T_ENTITY_REQ_SPC_PROJECT_BODY,
      "!   The name of the resource.
      NAME type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   A description of the resource.
      DESCRIPTION type STRING,
      "!   A list of tags for this resource.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
    end of T_ENTITY_REQ_SPC_PROJECT_BODY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A chat completion.</p>
    begin of T_TEXT_CHAT_RESP_FIELDS_SHARED,
      "!   A unique identifier for the chat completion.
      ID type STRING,
      "!   The model used for the chat completion.
      MODEL_ID type STRING,
      "!   The model version (using semantic versioning) if set.
      MODEL_VERSION type STRING,
      "!   The Unix timestamp (in seconds) of when the chat completion was created.
      CREATED type INTEGER,
      "!   The time when the response was created in ISO 8601 format.
      CREATED_AT type DATETIME,
      "!   Usage statistics for the completion request.
      USAGE type T_TEXT_CHAT_USAGE,
    end of T_TEXT_CHAT_RESP_FIELDS_SHARED.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A prompt to be used to infer the next tokens. Each request</p>
    "!     expects a `project_id` or a `space_id`, and the `project` or `space` must have
    "!     an associated WML instance that will be used for limits and billing (if a paid
    "!     plan).
    begin of T_TEXT_GEN_COMMON,
      "!   The prompt to generate completions. Note: The method tokenizes the input
      "!    internally. It is recommended not to leave any trailing spaces.
      INPUT type STRING,
    end of T_TEXT_GEN_COMMON.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of a control message.</p>
    begin of T_TXT_CHT_MSG_TXT_CHT_MSG_CNT1,
      "!   The role of the messages author.
      ROLE type STRING,
      "!   The contents of the control message. Depending on the model, an example would be
      "!    &quot;thinking&quot; for Granite reasoning models.
      CONTENT type STRING,
      "!   An optional name for the participant. Provides the model information to
      "!    differentiate between participants of the same role.
      NAME type STRING,
    end of T_TXT_CHT_MSG_TXT_CHT_MSG_CNT1.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The geospatial transformation resource.</p>
    begin of T_GEOSPATIAL_TRANS_RESOURCE,
      "!   The specific fields for the geospatial transformation metadata fields.
      METADATA type T_GEOSPATIAL_TRANS_METADATA,
      "!   The inputs and outputs required to create a transformation for the given model.
      ENTITY type T_GSPTL_TRANS_RESRC_ENTITY,
    end of T_GEOSPATIAL_TRANS_RESOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A paginated list of resources.</p>
    begin of T_GEOSPATIAL_TRANS_RESOURCES,
      "!   The total number of resources. Computed explicitly only when
      "!    &apos;total_count=true&apos; query parameter is present. This is in order to
      "!    avoid performance penalties.
      TOTAL_COUNT type INTEGER,
      "!   The number of items to return in each page.
      LIMIT type INTEGER,
      "!   The reference to the first item in the current page.
      FIRST type T_PAGINATION_FIRST,
      "!   A reference to the first item of the next page, if any.
      NEXT type T_PAGINATION_NEXT,
      "!   A list of resources.
      RESOURCES type STANDARD TABLE OF T_GEOSPATIAL_TRANS_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_GEOSPATIAL_TRANS_RESOURCES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The request fields to create Taxonomy job.</p><br/>
    "!    <br/>
    "!    <br/>
    "!    The `data_reference.type` must be set to `github`.
    begin of T_TAXONOMY_REQUEST,
      "!   The name of the document.
      NAME type STRING,
      "!   The description of the Taxonomy job.
      DESCRIPTION type STRING,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   A reference to data.
      DATA_REFERENCE type T_OBJECT_LOCATION,
    end of T_TAXONOMY_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    An error response.</p>
    begin of T_ERROR_RESPONSE,
      "!   The trace ID used in logs.
      TRACE type STRING,
      "!   The error objects.
      ERRORS type STANDARD TABLE OF T_ERROR WITH NON-UNIQUE DEFAULT KEY,
    end of T_ERROR_RESPONSE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    User defined properties specified as key-value pairs, which</p>
    "!     is propagated to the deployment.
      T_TOOLING type JSONOBJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The common fields between a request and the response.</p>
    begin of T_DEPLOYMENT_ENTITY_COMMON,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   A reference to a resource.
      PROMPT_TEMPLATE type T_SIMPLE_REL,
      "!   Indicates that this is an online deployment. An object has to be specified but
      "!    can be empty.<br/>
      "!   The `serving_name` can be provided in the `online.parameters`.
      ONLINE type T_ONLINE_DEPLOYMENT,
      "!   A hardware specification.
      HARDWARE_SPEC type T_HARDWARE_SPEC,
      "!   The requested hardware for deployment.
      HARDWARE_REQUEST type T_HARDWARE_REQUEST,
    end of T_DEPLOYMENT_ENTITY_COMMON.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    System details.</p>
    begin of T_RERANK_RESPONSE,
      "!   The `id` of the model to be used for this request. Please refer to the [list of
      "!    models](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/fm-mod
      "!   els-embed.html?context=wx&audience=wdp).
      MODEL_ID type STRING,
      "!   The model version (using semantic versioning) if set.
      MODEL_VERSION type STRING,
      "!   The ranked results.
      RESULTS type STANDARD TABLE OF T_RERANKED_RESULTS WITH NON-UNIQUE DEFAULT KEY,
      "!   The time when the response was created in ISO 8601 format.
      CREATED_AT type DATETIME,
      "!   The number of input tokens that were consumed.
      INPUT_TOKEN_COUNT type INTEGER,
      "!   The rank query, if requested.
      QUERY type STRING,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_RERANK_RESPONSE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The tool type.</p>
      T_TEXT_CHAT_PROPERTY_TOOL type String.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The document details for the text extraction.</p>
    begin of T_TEXT_EXTRACTION_ENTITY,
      "!   A reference to data.
      DOCUMENT_REFERENCE type T_TEXT_EXTRACTION_DATA_REF,
      "!   A reference to data.
      RESULTS_REFERENCE type T_TEXT_EXTRACTION_DATA_REF,
      "!   The steps for the text extraction pipeline.<br/>
      "!   <br/>
      "!   Use `parameters` instead.
      STEPS type T_TEXT_EXTRACTION_STEPS,
      "!   Set this as an empty object to specify `json` output.<br/>
      "!   <br/>
      "!   Use `parameters.requested_outputs` instead.
      ASSEMBLY_JSON type JSONOBJECT,
      "!   Set this as an empty object to specify `markdown` output.<br/>
      "!   <br/>
      "!   Use `parameters.requested_outputs` instead.
      ASSEMBLY_MD type JSONOBJECT,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
    end of T_TEXT_EXTRACTION_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The rank query.</p>
      T_RERANK_QUERY type String.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The request entity for an AutoAI RAG run.</p>
    begin of T_AUTO_AIRAGREQUEST,
      "!   The name of the job.
      NAME type STRING,
      "!   The description of the job.
      DESCRIPTION type STRING,
      "!   A list of tags for this resource.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   A hardware specification.
      HARDWARE_SPEC type T_HARDWARE_SPEC,
      "!   The parameters for an AutoAI RAG run.
      PARAMETERS type T_AUTO_AIRAGPARAMETERS,
      "!   A set of input data references.
      INPUT_DATA_REFERENCES type STANDARD TABLE OF T_AUTO_AIDATA_LOCATION WITH NON-UNIQUE DEFAULT KEY,
      "!   A set of test data references.
      TEST_DATA_REFERENCES type STANDARD TABLE OF T_AUTO_AIDATA_LOCATION WITH NON-UNIQUE DEFAULT KEY,
      "!   A set of vector store references. Milvus vector database is supported.
      VECTOR_STORE_REFERENCES type STANDARD TABLE OF T_CONNECTION_ASSET WITH NON-UNIQUE DEFAULT KEY,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   The training results. Normally this is specified as `type=container` (Service)
      "!    or `type=fs` (Software) which<br/>
      "!   means that it is stored in the space or project.
      RESULTS_REFERENCE type T_RESULTS_LOCATION,
    end of T_AUTO_AIRAGREQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A paginated list of AI services.</p>
    begin of T_AISERVICE_RESOURCES,
      "!   The total number of resources. Computed explicitly only when
      "!    &apos;total_count=true&apos; query parameter is present. This is in order to
      "!    avoid performance penalties.
      TOTAL_COUNT type INTEGER,
      "!   The number of items to return in each page.
      LIMIT type INTEGER,
      "!   The reference to the first item in the current page.
      FIRST type T_PAGINATION_FIRST,
      "!   A reference to the first item of the next page, if any.
      NEXT type T_PAGINATION_NEXT,
      "!   A list of AI services.
      RESOURCES type STANDARD TABLE OF T_AISERVICE_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_AISERVICE_RESOURCES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    System details.</p>
    begin of T_TEXT_CHAT_RESPONSE,
      "!   A unique identifier for the chat completion.
      ID type STRING,
      "!   The model used for the chat completion.
      MODEL_ID type STRING,
      "!   The model version (using semantic versioning) if set.
      MODEL_VERSION type STRING,
      "!   The Unix timestamp (in seconds) of when the chat completion was created.
      CREATED type INTEGER,
      "!   The time when the response was created in ISO 8601 format.
      CREATED_AT type DATETIME,
      "!   Usage statistics for the completion request.
      USAGE type T_TEXT_CHAT_USAGE,
      "!   A list of chat completion choices. Can be more than one if `n` is greater than
      "!    1.
      CHOICES type STANDARD TABLE OF T_TEXT_CHAT_RESULT_CHOICE WITH NON-UNIQUE DEFAULT KEY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_TEXT_CHAT_RESPONSE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The common fields that can be patched. This is a helper for</p>
    "!     `cpdctl`.
    begin of T_DEPLOYMENT_RESOURCE_PATCH,
      "!   A list of tags for this resource.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   The name of the resource.
      NAME type STRING,
      "!   A description of the resource.
      DESCRIPTION type STRING,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   A reference to a resource.
      ASSET type T_REL,
    end of T_DEPLOYMENT_RESOURCE_PATCH.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of an assistant message.</p>
    begin of T_TEXT_CHAT_MESSAGE_ASSISTANT,
      "!   The role of the messages author.
      ROLE type STRING,
      "!   The contents of the assistant message. Required unless `tool_calls` is
      "!    specified.
      CONTENT type STRING,
      "!   An optional name for the participant. Provides the model information to
      "!    differentiate between participants of the same role.
      NAME type STRING,
      "!   The refusal message by the assistant.
      REFUSAL type STRING,
      "!   The tool calls generated by the model, such as function calls.
      TOOL_CALLS type STANDARD TABLE OF T_TEXT_CHAT_TOOL_CALL WITH NON-UNIQUE DEFAULT KEY,
    end of T_TEXT_CHAT_MESSAGE_ASSISTANT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Using `auto` means the model can pick between generating a</p>
    "!     message or calling one or more tools. Specify either `tool_choice_option` to
    "!     allow the model to pick or `tool_choice` to force the model to call a tool.
      T_TEXT_CHAT_TOOL_CHOICE_OPTION type String.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of a user video content.</p>
    begin of T_TXT_CHT_USR_CNTNTS_TXT_CHT_3,
      "!   The type of the user content. You can get the list of models supporting text,
      "!    image, audio, video by using<br/>
      "!   [Foundation Model
      "!    Specs](https://cloud.ibm.com/apidocs/watsonx-ai#list-foundation-model-specs)
      "!    with<br/>
      "!   `filters=function_text_chat`, `filters=function_image_chat`,
      "!    `filters=function_audio_chat`,<br/>
      "!   `filters=function_video_chat` respectively.
      TYPE type STRING,
      "!   The definition of a user video content.
      VIDEO_URL type T_TEXT_CHAT_USER_VIDEO_URL,
    end of T_TXT_CHT_USR_CNTNTS_TXT_CHT_3.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A list of tags for this resource.</p>
      T_TAGS type TT_String.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The list of Taxonomy jobs in specified project or space.</p>
    begin of T_TAXONOMY_RESOURCES,
      "!   The number of items to return in each page.
      LIMIT type INTEGER,
      "!   The Taxonomy jobs in a project or space.
      RESOURCES type STANDARD TABLE OF T_TAXONOMY_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
    end of T_TAXONOMY_RESOURCES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A paginated list of resources.</p>
    begin of T_TEXT_EXTRACTION_RESOURCES,
      "!   The total number of resources. Computed explicitly only when
      "!    &apos;total_count=true&apos; query parameter is present. This is in order to
      "!    avoid performance penalties.
      TOTAL_COUNT type INTEGER,
      "!   The number of items to return in each page.
      LIMIT type INTEGER,
      "!   The reference to the first item in the current page.
      FIRST type T_PAGINATION_FIRST,
      "!   A reference to the first item of the next page, if any.
      NEXT type T_PAGINATION_NEXT,
      "!   A list of resources.
      RESOURCES type STANDARD TABLE OF T_TEXT_EXTRACTION_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_TEXT_EXTRACTION_RESOURCES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The status of an AutoAI RAG run.</p>
    begin of T_AUTO_AIRAGSTATUS,
      "!   Status of the training job.
      STATUS type T_AUTO_AIRAGSTATUS_OBJECT,
    end of T_AUTO_AIRAGSTATUS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The parameters specific to chat.</p>
    begin of T_TEXT_CHAT_REQUEST,
      "!   The model to use for the chat completion.<br/>
      "!   <br/>
      "!   Please refer to the [list of
      "!    models](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/fm-mod
      "!   els.html?context=wx).
      MODEL_ID type STRING,
      "!   The messages for this chat session.
      MESSAGES type STANDARD TABLE OF T_TEXT_CHAT_MESSAGES WITH NON-UNIQUE DEFAULT KEY,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   Tool functions that can be called with the response.
      TOOLS type STANDARD TABLE OF T_TEXT_CHAT_PARAMETER_TOOLS WITH NON-UNIQUE DEFAULT KEY,
      "!   Using `auto` means the model can pick between generating a message or calling
      "!    one or more tools. Specify either `tool_choice_option` to allow the model to
      "!    pick or `tool_choice` to force the model to call a tool.
      TOOL_CHOICE_OPTION type STRING,
      "!   Specifying a particular tool via `&#123;&quot;type&quot;: &quot;function&quot;,
      "!    &quot;function&quot;: &#123;&quot;name&quot;:
      "!    &quot;my_function&quot;&#125;&#125;` forces the model to call that tool.<br/>
      "!   Specify either `tool_choice_option` to allow the model to pick or `tool_choice`
      "!    to force the model to call a tool.
      TOOL_CHOICE type T_TEXT_CHAT_TOOL_CHOICE_TOOL,
      "!   Positive values penalize new tokens based on their existing frequency in the
      "!    text so far, decreasing the model&apos;s likelihood to repeat the same line
      "!    verbatim.
      FREQUENCY_PENALTY type NUMBER,
      "!   Increasing or decreasing probability of tokens being selected during generation;
      "!    a positive bias makes a token more likely to appear, while a negative bias
      "!    makes it less likely.
      LOGIT_BIAS type JSONOBJECT,
      "!   Whether to return log probabilities of the output tokens or not. If true,
      "!    returns the log probabilities of each output token returned in the content of
      "!    message.
      LOGPROBS type BOOLEAN,
      "!   An integer specifying the number of most likely tokens to return at each token
      "!    position, each with an associated log probability. The option `logprobs` must
      "!    be set to `true` if this parameter is used.
      TOP_LOGPROBS type INTEGER,
      "!   The maximum number of tokens that can be generated in the chat completion. The
      "!    total length of input tokens and generated tokens is limited by the
      "!    model&apos;s context length.
      MAX_TOKENS type INTEGER,
      "!   How many chat completion choices to generate for each input message. Note that
      "!    you will be charged based on the number of generated tokens across all of the
      "!    choices. Keep n as 1 to minimize costs.
      N type INTEGER,
      "!   Positive values penalize new tokens based on whether they appear in the text so
      "!    far, increasing the model&apos;s likelihood to talk about new topics.
      PRESENCE_PENALTY type NUMBER,
      "!   The chat response format parameters.
      RESPONSE_FORMAT type T_TEXT_CHAT_RESPONSE_FORMAT,
      "!   Random number generator seed to use in sampling mode for experimental
      "!    repeatability.
      SEED type INTEGER,
      "!   Stop sequences are one or more strings which will cause the text generation to
      "!    stop if/when they are produced as part of the output. Stop sequences
      "!    encountered prior to the minimum number of tokens being generated will be
      "!    ignored.
      STOP type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   What sampling temperature to use,. Higher values like 0.8 will make the output
      "!    more random, while lower values like 0.2 will make it more focused and
      "!    deterministic.<br/>
      "!   <br/>
      "!   We generally recommend altering this or `top_p` but not both.
      TEMPERATURE type NUMBER,
      "!   An alternative to sampling with temperature, called nucleus sampling, where the
      "!    model considers the results of the tokens with top_p probability mass. So 0.1
      "!    means only the tokens comprising the top 10% probability mass are
      "!    considered.<br/>
      "!   <br/>
      "!   We generally recommend altering this or `temperature` but not both.
      TOP_P type NUMBER,
      "!   Time limit in milliseconds - if not completed within this time, generation will
      "!    stop. The text generated so far will be returned along with the `TIME_LIMIT``
      "!    stop reason. Depending on the users plan, and on the model being used, there
      "!    may be an enforced maximum time limit.
      TIME_LIMIT type INTEGER,
    end of T_TEXT_CHAT_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The metrics.</p>
      T_TRAINING_MLMETRICS type MAP.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    System details.</p>
    begin of T_SIMILARITY_RESPONSE,
      "!   The `id` of the model to be used for this request. Please refer to the [list of
      "!    models](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/fm-mod
      "!   els-embed.html?context=wx&audience=wdp).
      MODEL_ID type STRING,
      "!   The similarity scores.
      RESULTS type STANDARD TABLE OF T_SIMILARITY_RESULT WITH NON-UNIQUE DEFAULT KEY,
      "!   The time when the response was created in ISO 8601 format.
      CREATED_AT type DATETIME,
      "!   The number of input tokens that were consumed.
      INPUT_TOKEN_COUNT type INTEGER,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_SIMILARITY_RESPONSE.
  types:
    "! No documentation available.
    begin of T_RESULTS_REFERENCE_OUTPUT,
      "!   The training results. Normally this is specified as `type=container` which means
      "!    that it is stored in the space or project. Note that the training will add some
      "!    fields that point to the training status, the model request and the
      "!    assets.<br/>
      "!   <br/>
      "!   The `model_request_path` is the request body that should be used when creating
      "!    the trained model in the API, if this model is to be deployed. If
      "!    `auto_update_model` was set to `true` then this file is not needed.
      RESULTS_REFERENCE type T_OBJECT_LOCATION,
    end of T_RESULTS_REFERENCE_OUTPUT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!   Array parameter type for method AI_SERVICES_UPDATE</p>
    TT_JSON_PATCH_OPERATION type STANDARD TABLE OF T_JSON_PATCH_OPERATION WITH NON-UNIQUE DEFAULT KEY.

constants:
  "! <p class="shorttext synchronized" lang="en">List of required fields per type.</p>
  begin of C_REQUIRED_FIELDS,
    T_MESSAGE type string value '|',
    T_API_ERROR_TARGET type string value '|TYPE|NAME|',
    T_API_ERROR type string value '|CODE|MESSAGE|',
    T_API_ERROR_RESPONSE type string value '|TRACE|ERRORS|',
    T_PRMPT_TUNING_METRICS_CONTEXT type string value '|',
    T_METRICS_CONTEXT type string value '|',
    T_TRAINING_METRIC type string value '|',
    T_TRAINING_STATUS type string value '|STATE|',
    T_NOTEBOOK_ORIGIN_FROM_SOURCE type string value '|',
    T_TRAINING_NUM_EPOCHS type string value '|',
    T_CONSUMPTIONS_LIMIT type string value '|',
    T_TEXT_EXTRACTION_STEP_OCR type string value '|',
    T_TXT_EXTRACTION_STEP_TAB_PROC type string value '|',
    T_TEXT_EXTRACTION_STEPS type string value '|',
    T_TRAINING_INIT_METHOD type string value '|',
    T_DATA_SCHEMA type string value '|ID|FIELDS|',
    T_NTBK_VER_ENTITY_IN_PROJECT type string value '|PROJECT_ID|',
    T_TEXT_MODERATION type string value '|',
    T_MASK_PROPERTIES type string value '|',
    T_MODERATION_HAP_INPUT_PROP type string value '|',
    T_TEXT_GEN_TOP_TOKEN_INFO type string value '|',
    T_MODERATION_TEXT_RANGE type string value '|START|END|',
    T_MODERATION_RESULT type string value '|SCORE|INPUT|POSITION|ENTITY|',
    T_MODERATION_RESULTS type string value '|',
    T_TEXT_GEN_TOKEN_INFO type string value '|',
    T_TEXT_GEN_RESP_FLD_RES_ITEM type string value '|GENERATED_TEXT|STOP_REASON|',
    T_WARNING type string value '|MESSAGE|',
    T_SYSTEM_DETAILS type string value '|',
    T_TEXT_GEN_RESPONSE type string value '|MODEL_ID|CREATED_AT|RESULTS|',
    T_STATS type string value '|',
    T_DEPLOYMENT_SYSTEM_DETAILS type string value '|',
    T_DEPLOYMENT_SYSTEM type string value '|',
    T_SYNTHETIC_DATA_GEN_SAMPLE type string value '|',
    T_NOTEBOOK_KERNEL type string value '|',
    T_NOTEBOOK_METADATA type string value '|',
    T_NOTEBOOK_ORIGIN type string value '|',
    T_NOTEBOOK_ENTITY_DEFINITION type string value '|',
    T_NOTEBOOK_RUNTIME type string value '|ENVIRONMENT|',
    T_NOTEBOOK_ENTITY type string value '|',
    T_NOTEBOOK type string value '|',
    T_NOTEBOOK_COPY_BODY type string value '|NAME|SOURCE_GUID|',
    T_WX_PROMPT_INPUT_REQUEST type string value '|',
    T_UTIL_AGNT_TL_STRCTRD_INPUT type string value '|INPUT|',
    T_DATA_CONNECTION_REFERENCE type string value '|TYPE|',
    T_RESULTS_LOCATION type string value '|TYPE|LOCATION|',
    T_BASE_MODEL type string value '|',
    T_PROMPT_TUNING type string value '|TASK_ID|',
    T_TRAINING_RESOURCE_PROTOTYPE type string value '|NAME|RESULTS_REFERENCE|',
    T_NOTEBOOK_RESRC_ENTITY_RT type string value '|',
    T_TEXT_CHAT_FUNCTION_CALL type string value '|NAME|ARGUMENTS|',
    T_TEXT_CHAT_TOOL_CALL_STREAM type string value '|INDEX|FUNCTION|',
    T_TEXT_CHAT_USAGE type string value '|',
    T_TEXT_CHAT_RESULT_DELTA type string value '|ROLE|',
    T_TEXT_CHAT_RES_CHOICE_STREAM type string value '|',
    T_TEXT_CHAT_STREAM_ITEM type string value '|ID|MODEL_ID|CREATED|CHOICES|',
    T_TEXT_GEN_RESPONSE_FIELDS type string value '|MODEL_ID|CREATED_AT|RESULTS|',
    T_TEXT_CHAT_USER_IMAGE_URL type string value '|URL|',
    T_SOFTWARE_SPEC_REL type string value '|',
    T_AISERVICE_DOCUMENTATION type string value '|',
    T_AISERVICE_RESOURCE_ENTITY type string value '|SOFTWARE_SPEC|',
    T_RESOURCE_COMMIT_INFO type string value '|COMMITTED_AT|',
    T_RESOURCE_META type string value '|ID|CREATED_AT|',
    T_AISERVICE_RESOURCE type string value '|METADATA|ENTITY|',
    T_OBJECT_LOCATION type string value '|TYPE|LOCATION|',
    T_MODERATION_HAP_PROPERTIES type string value '|',
    T_TXT_MDRTN_WITHOUT_THRESHOLD type string value '|',
    T_MODERATION_PII_PROPERTIES type string value '|',
    T_TEXT_GEN_LENGTH_PENALTY type string value '|',
    T_RETURN_OPTION_PROPERTIES type string value '|',
    T_DEPLOYMENT_TEXT_GEN_PROP type string value '|',
    T_MDRTN_GRANITE_GUARDIAN_PROP type string value '|',
    T_MODERATIONS type string value '|',
    T_DEPLOYMENT_TEXT_GEN type string value '|',
    T_EXT_INFO_EXTERNAL_MODEL type string value '|NAME|URL|',
    T_EXT_INFO_EXTERNAL_PROMPT type string value '|URL|',
    T_EXTERNAL_INFORMATION type string value '|EXTERNAL_PROMPT_ID|EXTERNAL_MODEL_ID|EXTERNAL_MODEL_PROVIDER|',
    T_CHAT_ITEM type string value '|',
    T_PROMPT_WITH_EXT_MODEL_PARAM type string value '|',
    T_PROMPT_DATA type string value '|',
    T_PROMPT_WITH_EXTERNAL type string value '|MODEL_ID|DATA|',
    T_COS_DATA_LOCATION type string value '|FILE_NAME|',
    T_COS_DATA_CONNECTION type string value '|ID|',
    T_TEXT_EXTRACTION_DATA_REF type string value '|TYPE|',
    T_TEXT_EXTRACTION_REQUEST type string value '|DOCUMENT_REFERENCE|RESULTS_REFERENCE|',
    T_OBJECT_LOC_GITHUB_LOCATION type string value '|',
    T_OBJECT_LOCATION_GITHUB type string value '|TYPE|LOCATION|',
    T_DOC_EXTRACTION_OBJECT_LOC type string value '|TYPE|LOCATION|',
    T_DOCUMENT_EXTRACTION_COMMON type string value '|NAME|DOCUMENT_REFERENCES|RESULTS_REFERENCE|',
    T_SERVICE_ERROR type string value '|CODE|MESSAGE|',
    T_TEXT_EXTRACTION_RESULTS type string value '|STATUS|NUMBER_PAGES_PROCESSED|',
    T_TEXT_EXTRACTION_RESRC_ENTITY type string value '|DOCUMENT_REFERENCE|RESULTS_REFERENCE|RESULTS|',
    T_TEXT_EXTRACTION_METADATA type string value '|ID|CREATED_AT|',
    T_TEXT_EXTRACTION_RESPONSE type string value '|',
    T_TSFORECAST_PARAMETERS type string value '|',
    T_TSFORECAST_INPUT_SCHEMA type string value '|TIMESTAMP_COLUMN|',
    T_TSFORECAST_REQUEST type string value '|MODEL_ID|DATA|SCHEMA|',
    T_DPLYMNT_TXT_CHT_MSG_TXT_CHT3 type string value '|ROLE|CONTENT|TOOL_CALL_ID|',
    T_AUTO_AIRAGCHUNKING type string value '|METHOD|CHUNK_SIZE|CHUNK_OVERLAP|',
    T_AUTO_AIRAGCONSTRAINTS type string value '|',
    T_NOTEBOOK_VERSION_ENTITY type string value '|',
    T_NOTEBOOK_CREATE_BODY_GENERAL type string value '|NAME|FILE_REFERENCE|RUNTIME|',
    T_TEXT_EXTRACTION_RESOURCE type string value '|',
    T_SYNTHETIC_DATA_GEN_LOCATIONS type string value '|',
    T_SYNTHETIC_DATA_GEN_METRIC type string value '|',
    T_SYNTHETIC_DATA_GEN_CONTEXT type string value '|',
    T_SYNTHETIC_DATA_GEN_METRICS type string value '|',
    T_AUTO_AIRAGMETRIC type string value '|',
    T_AUTO_AIRAGMETRICS type string value '|TEST_DATA|',
    T_AUTO_AIRAGRETRIEVAL type string value '|METHOD|',
    T_AUTO_AIRAGEMBEDDINGS type string value '|',
    T_AUTO_AIRAGVECTOR_STORE type string value '|',
    T_AUTO_AIRAGSETTINGS type string value '|',
    T_AUTO_AIRAGRESULT_LOCATION type string value '|',
    T_AUTO_AIRAGPATTERN type string value '|',
    T_AUTO_AIRAGCONTEXT type string value '|',
    T_AUTO_AIRAGRESULTS type string value '|',
    T_AUTO_AIRAGRESPONSE_RESULTS type string value '|RESULTS|TIMESTAMP|',
    T_PAGINATION_FIRST type string value '|HREF|',
    T_PAGINATION_NEXT type string value '|HREF|',
    T_PAGINATION type string value '|LIMIT|FIRST|',
    T_TEXT_CHAT_USER_VIDEO_URL type string value '|URL|',
    T_TXT_CHT_USR_VIDEO_URLCONTENT type string value '|TYPE|VIDEO_URL|',
    T_RESULTS_REFERENCE_INPUT type string value '|RESULTS_REFERENCE|',
    T_GPU type string value '|',
    T_FINE_TUNING_PARAMETERS type string value '|BASE_MODEL|',
    T_FINE_TUNING_ENTITY type string value '|TRAINING_DATA_REFERENCES|RESULTS_REFERENCE|STATUS|',
    T_FINE_TUNING_RESOURCE type string value '|',
    T_FINE_TUNING_RESOURCE_LIST type string value '|',
    T_AUTO_AIRAGMODEL_PARAMS type string value '|',
    T_AT_ARGGNRTN_MDL_AT_ARGCSTM_1 type string value '|DEPLOYMENT_ID|',
    T_TEXT_CHAT_MESSAGE_TOOL type string value '|ROLE|CONTENT|TOOL_CALL_ID|',
    T_TXT_CHT_MSG_TXT_CHT_MSG_TOOL type string value '|ROLE|CONTENT|TOOL_CALL_ID|',
    T_MODEL_LIMITS type string value '|',
    T_PROMPT_MODEL_PARAMETERS type string value '|',
    T_PROMPT type string value '|MODEL_ID|DATA|',
    T_GSPTL_TRANS_METADATA_FLD type string value '|SPACE_ID|',
    T_PROMPT_LOCK type string value '|LOCKED|',
    T_AUTO_AIRAGOPTIMIZATION_PARAM type string value '|METRICS|',
    T_SYNTHETIC_DATA_GEN_STATUS type string value '|STATE|',
    T_SYNTHETIC_DATA_GEN_RESPONSE type string value '|',
    T_AT_ARGGNRTN_MDL_AT_ARGMDL type string value '|MODEL_ID|',
    T_WX_PROMPT_POST_MODEL_VERSION type string value '|',
    T_DEPLOYMENT_RESOURCE_ENTITY type string value '|',
    T_FINE_TUNING_REQUEST type string value '|NAME|TRAINING_DATA_REFERENCES|RESULTS_REFERENCE|',
    T_ERROR_TARGET type string value '|TYPE|NAME|',
    T_TEXT_TOKENIZE_PARAMETERS type string value '|',
    T_RERANK_INPUT_RESULT type string value '|TEXT|',
    T_RERANKED_RESULTS type string value '|INDEX|SCORE|',
    T_RERANK_RESPONSE_FIELDS type string value '|MODEL_ID|RESULTS|CREATED_AT|INPUT_TOKEN_COUNT|',
    T_WX_UTIL_AGENT_TOOLS_RUN_RESP type string value '|OUTPUT|',
    T_REV_ENTITY_SPC_PROJECT_REQ type string value '|',
    T_SIMILARITY_RESULT type string value '|SCORE|',
    T_SIMILARITY_RESPONSE_FIELDS type string value '|MODEL_ID|RESULTS|CREATED_AT|INPUT_TOKEN_COUNT|',
    T_TRAINING_TORCH_DTYPE type string value '|',
    T_INFERENCE type string value '|URL|',
    T_TEXT_CHAT_TOOL_CALL type string value '|ID|TYPE|FUNCTION|',
    T_TEXT_CHAT_RESULT_MESSAGE type string value '|ROLE|',
    T_ONLINE_DEPLOYMENT_PARAMETERS type string value '|',
    T_SDGUNSTRUCTURED_GEN_PARAM type string value '|',
    T_SDGOBJECT_LOCATION_LOCATION type string value '|',
    T_SDGOBJECT_LOCATION type string value '|TYPE|LOCATION|',
    T_SDGUNSTRUCTURED_GEN_ENTITY type string value '|PIPELINE|SEED_DATA_REFERENCE|RESULTS_REFERENCE|',
    T_SDGUNSTRUCTURED_GEN_RESP_JOB type string value '|',
    T_SDGUNSTRUCTURED_GEN_RESPONSE type string value '|',
    T_SDGUNSTRUCTURED_GEN_RESOURCE type string value '|',
    T_MODEL_REL type string value '|ID|',
    T_SIMPLE_REL type string value '|ID|',
    T_DEPLOYMENT_STATUS type string value '|',
    T_ONLINE_DEPLOYMENT type string value '|',
    T_HARDWARE_SPEC type string value '|',
    T_HARDWARE_REQUEST type string value '|',
    T_DEPLOYMENT_ENTITY type string value '|ONLINE|',
    T_DEPLOYMENT_RESOURCE type string value '|',
    T_DEPLOYMENT_RESRC_COLLECTION type string value '|LIMIT|FIRST|',
    T_EMBEDDING_RETURN_OPTIONS type string value '|',
    T_ENTITY_REQUEST_SPACE_BODY type string value '|SPACE_ID|NAME|',
    T_TEXT_CHAT_RESPONSE_FORMAT type string value '|TYPE|',
    T_TEXT_CHAT_PARAMETERS type string value '|',
    T_SYNTHETIC_DATA_GEN_RESOURCE type string value '|',
    T_FOUNDATION_MODEL_TASK type string value '|TASK_ID|LABEL|RANK|',
    T_FOUNDATION_MODEL_TASKS type string value '|LIMIT|FIRST|',
    T_WX_PROMPT_RESP_MODEL_VERSION type string value '|',
    T_NOTEBOOK_VERSION_METADATA type string value '|',
    T_NOTEBOOK_VERSION_IN_PROJECT type string value '|',
    T_NTBK_VRSNS_LST_RESP_NTBK_VR1 type string value '|TOTAL_RESULTS|RESOURCES|',
    T_TRAINING_ACCUMULATED_STEPS type string value '|',
    T_TRAINING_INIT_TEXT type string value '|',
    T_TRAINING_BATCH_SIZE type string value '|',
    T_TRAINING_VERBALIZER type string value '|',
    T_TRAINING_MAX_INPUT_TOKENS type string value '|',
    T_TRAINING_MAX_OUTPUT_TOKENS type string value '|',
    T_TRAINING_LEARNING_RATE type string value '|',
    T_TRAINING_NUM_VIRTUAL_TOKENS type string value '|',
    T_TRAINING_PARAMETERS type string value '|',
    T_FOUNDATION_MODEL_VERSION type string value '|',
    T_TASK_RATING type string value '|',
    T_LIFE_CYCLE_STATE type string value '|ID|',
    T_TASK_DESCRIPTION type string value '|ID|',
    T_FOUNDATION_MODEL_LIMITS type string value '|',
    T_FOUNDATION_MODEL type string value '|MODEL_ID|LABEL|PROVIDER|SHORT_DESCRIPTION|INPUT_TIER|OUTPUT_TIER|SOURCE|NUMBER_PARAMS|',
    T_EXT_STR_SETTINGS_SCHEMA_FLD type string value '|',
    T_EXTERNAL_STORE_SETTINGS type string value '|',
    T_TXT_CHT_USR_CNTNTS_TXT_CHT_1 type string value '|TYPE|TEXT|',
    T_NOTEBOOK_RESRC_ENTITY_ASSET type string value '|',
    T_EXT_PRMPT_ADDTNL_INFO_ITEM type string value '|',
    T_TEXT_DETECTION_CONTENT_ITEM type string value '|DETECTION_TYPE|DETECTION|SCORE|START|END|',
    T_TRAINING_STATUS_OUTPUT type string value '|STATUS|',
    T_TXT_CHT_MSG_TXT_CHAT_MSG_SYS type string value '|ROLE|CONTENT|',
    T_TRAIN_RESRC_COLLECTION_SYS type string value '|',
    T_SYSTEM type string value '|',
    T_TXT_CHT_USR_CNTNTS_TXT_CHT_2 type string value '|TYPE|IMAGE_URL|',
    T_AISERVICE_CONTENT_METADATA type string value '|ATTACHMENT_ID|',
    T_GEOSPATIAL_TRANS_DATA type string value '|',
    T_GEOSPATIAL_TRANS_RESULTS type string value '|',
    T_GEOSPATIAL_TRANS_RESP_ENTITY type string value '|MODEL_ID|INPUTS|OUTPUT|RESULTS|',
    T_NOTEBOOK_METADATA_IN_PROJECT type string value '|PROJECT_ID|',
    T_NTBK_RVRT_RESP_NTBK_IN_PRJCT type string value '|',
    T_DOCUMENT_EXTRACTION_STATUS type string value '|STATE|',
    T_DOCUMENT_EXTRACTION_RESPONSE type string value '|NAME|DOCUMENT_REFERENCES|RESULTS_REFERENCE|',
    T_DOCUMENT_EXTRACTION_RESOURCE type string value '|',
    T_DOC_EXTRACTION_RESOURCES type string value '|LIMIT|',
    T_NOTEBOOK_RESOURCE_METADATA type string value '|',
    T_NOTEBOOK_RESOURCE_ENTITY type string value '|',
    T_NOTEBOOK_RESOURCE type string value '|',
    T_NOTEBOOKS_RESOURCE_LIST type string value '|TOTAL_RESULTS|RESOURCES|',
    T_TSFORECAST_RESPONSE type string value '|',
    T_GEOSPATIAL_TRANS_ENTITY type string value '|MODEL_ID|INPUTS|OUTPUT|',
    T_TXT_DTCTN_CONTEXT_POSITION type string value '|START|END|',
    T_AUTO_AIRAGMETADATA type string value '|ID|CREATED_AT|NAME|',
    T_TEXT_GEN_PARAMETERS2 type string value '|',
    T_TSFORECAST_RESOURCE type string value '|MODEL_ID|DATA|SCHEMA|',
    T_AISERVICE_ENTITY type string value '|SOFTWARE_SPEC|',
    T_ENTITY_REQ_SPC_PROJECT_ONLY type string value '|',
    T_WX_PROMPT_SESSION_ENTRY type string value '|NAME|CREATED_AT|PROMPT|',
    T_AUTO_AIRAGMODEL type string value '|MODEL_ID|',
    T_AUTO_AIRAGSTATUS_OBJECT type string value '|STATE|',
    T_AUTO_AIRAGPARAMETERS type string value '|',
    T_AUTO_AIDATA_LOCATION type string value '|TYPE|LOCATION|',
    T_CONNECTION_ASSET type string value '|TYPE|CONNECTION|',
    T_AUTO_AIRAGRESPONSE_ENTITY type string value '|HARDWARE_SPEC|INPUT_DATA_REFERENCES|TEST_DATA_REFERENCES|RESULTS|TIMESTAMP|RESULTS_REFERENCE|STATUS|',
    T_WX_UTIL_AGNT_TLS_RN_REQ_UTI1 type string value '|INPUT|',
    T_NTBK_VERSIONS_LST_IN_PROJECT type string value '|TOTAL_RESULTS|RESOURCES|',
    T_JSON_PATCH_OPERATION type string value '|OP|PATH|',
    T_TEXT_GEN_RESULT_FIELDS type string value '|',
    T_MDRTN_PROP_WITHOUT_THRESHOLD type string value '|',
    T_NOTEBOOK_UPDATE_BODY type string value '|',
    T_WX_PROMPT_POST type string value '|NAME|PROMPT|',
    T_TEXT_TOKENIZE_RESULT type string value '|TOKEN_COUNT|',
    T_TEXT_TOKENIZE_RESPONSE type string value '|MODEL_ID|RESULT|',
    T_AUTO_AIRAGCUSTOM_MODEL type string value '|DEPLOYMENT_ID|',
    T_TEXT_GEN_PARAMETERS type string value '|',
    T_TEXT_GEN_REQUEST type string value '|INPUT|MODEL_ID|',
    T_FOUNDATION_MODELS type string value '|LIMIT|FIRST|',
    T_TXT_DTCTN_EVIDENCE_OBJECT type string value '|NAME|VALUE|SCORE|',
    T_WX_PROMPT_PATCH_MODEL_VER type string value '|',
    T_WX_PROMPT_PATCH type string value '|NAME|PROMPT|',
    T_FINE_TUNING_RESOURCES type string value '|LIMIT|FIRST|',
    T_REL type string value '|ID|',
    T_ASSET_REF type string value '|',
    T_TEXT_CHAT_MESSAGE type string value '|ROLE|',
    T_CAI_KIT_TEXT_GEN_PROPERTIES type string value '|',
    T_TEXT_CHAT_PARAMETER_FUNCTION type string value '|NAME|',
    T_TEXT_CHAT_PARAMETER_TOOLS type string value '|TYPE|',
    T_TEXT_CHAT_RESP_FIELDS_STREAM type string value '|CHOICES|',
    T_FINE_TUNING_RESOURCE_ENTITY type string value '|TRAINING_DATA_REFERENCES|RESULTS_REFERENCE|',
    T_PAGINATION_TC type string value '|LIMIT|FIRST|',
    T_TRAIN_RESOURCE_ENTITY_COMMON type string value '|',
    T_GEOSPATIAL_TRANS_REQ_FIELDS type string value '|SPACE_ID|',
    T_WX_PROMPT_RESPONSE type string value '|NAME|PROMPT|',
    T_NOTEBOOK_LIST_BODY type string value '|',
    T_NOTEBOOK_CRE_BODY_IN_PROJECT type string value '|NAME|FILE_REFERENCE|RUNTIME|PROJECT|',
    T_NOTEBOOK_ENTITY_DEF_FOR_COPY type string value '|',
    T_NOTEBOOK_ENTITY_FOR_COPY type string value '|',
    T_NOTEBOOK_FOR_COPY type string value '|',
    T_GET_PROMPT_INPUT_RESPONSE type string value '|',
    T_UTILITY_AGENT_TOOL type string value '|NAME|DESCRIPTION|',
    T_TEXT_CHAT_USER_TEXT_CONTENT type string value '|TYPE|TEXT|',
    T_TAXONOMY_STATUS type string value '|',
    T_TAXONOMY_RESPONSE type string value '|',
    T_TAXONOMY_RESOURCE type string value '|',
    T_TXT_DETECTION_CHILD_EVIDENCE type string value '|NAME|VALUE|SCORE|',
    T_COMMIT type string value '|',
    T_ERROR type string value '|CODE|MESSAGE|',
    T_WX_PRMPT_SSSN_ENTRY_LST_RES1 type string value '|',
    T_WX_PROMPT_SESSION_ENTRY_LIST type string value '|',
    T_RESOURCE_META_SIMPLE type string value '|ID|CREATED_AT|',
    T_TRAINING_RESOURCE_DETAILS type string value '|NAME|',
    T_HAP_PROPERTIES type string value '|',
    T_TEXT_TOKENIZE_REQUEST type string value '|MODEL_ID|INPUT|',
    T_TEXT_CHAT_MESSAGE_USER type string value '|ROLE|CONTENT|',
    T_DOCUMENT_EXTRACTION_REQUEST type string value '|NAME|DOCUMENT_REFERENCES|RESULTS_REFERENCE|',
    T_TEXT_CHAT_TOOL_FUNCTION type string value '|NAME|',
    T_AISERVICE_REQUEST type string value '|SPACE_ID|NAME|SOFTWARE_SPEC|',
    T_TXT_DETECTION_DETECTION_ITEM type string value '|DETECTION_TYPE|DETECTION|SCORE|',
    T_EMBEDDING_INPUT_RESULT type string value '|TEXT|',
    T_UTIL_AGNT_TL_UNSTRCTRD_INPUT type string value '|INPUT|',
    T_SDGUNSTRUCTURED_GEN_REQUEST type string value '|NAME|PROJECT_ID|PIPELINE|SEED_DATA_REFERENCE|RESULTS_REFERENCE|',
    T_EMBEDDING type string value '|EMBEDDING|',
    T_EMBEDDINGS_RESPONSE_FIELDS type string value '|MODEL_ID|RESULTS|CREATED_AT|INPUT_TOKEN_COUNT|',
    T_EMBEDDING_PARAMETERS type string value '|',
    T_DPLYMNT_TXT_CHT_MSG_TXT_CHT1 type string value '|ROLE|',
    T_GEOSPATIAL_TRANS_METADATA type string value '|ID|CREATED_AT|SPACE_ID|',
    T_DEPLOYMENT_RESRC_PROTOTYPE type string value '|NAME|ONLINE|',
    T_MODEL_ASSET_REF type string value '|',
    T_TRAIN_RESRC_MODEL_ID_OUTPUT type string value '|',
    T_TXT_CHT_MSG_TXT_CHAT_MSG_USR type string value '|ROLE|CONTENT|',
    T_NTBK_VER_CRE_RESP_NTBK_VER_1 type string value '|',
    T_NOTEBOOK_IN_PROJECT type string value '|',
    T_WX_UTIL_AGENT_TOOLS_RESPONSE type string value '|RESOURCES|',
    T_PAGINATION_BASE type string value '|LIMIT|FIRST|',
    T_TEXT_CHAT_RESULT_CHOICE type string value '|',
    T_SYNTHETIC_DATA_GEN_RESOURCES type string value '|LIMIT|',
    T_EMBEDDINGS_REQUEST type string value '|MODEL_ID|INPUTS|',
    T_RERANK_RETURN_OPTIONS type string value '|',
    T_RERANK_INPUT type string value '|TEXT|',
    T_RERANK_PARAMETERS type string value '|',
    T_RERANK_REQUEST type string value '|MODEL_ID|INPUTS|QUERY|',
    T_DPLYMNT_TXT_CHT_MSG_TXT_CHT4 type string value '|ROLE|CONTENT|',
    T_TEXT_CHAT_USER_CONTENT type string value '|TYPE|',
    T_SDGNSTRCTRD_GEN_BASE_ENTITY type string value '|NAME|PROJECT_ID|',
    T_NOTEBOOK_REVERT_BODY type string value '|SOURCE|',
    T_GEOSPATIAL_TRANS_RESP_FIELDS type string value '|RESULTS|',
    T_AUTO_AIRAGRESPONSE type string value '|',
    T_AUTO_RAGRESULT_RESOURCES type string value '|LIMIT|FIRST|',
    T_WX_UTIL_AGNT_TLS_RN_REQ_UTI2 type string value '|INPUT|',
    T_TEXT_CHAT_USR_IMG_URLCONTENT type string value '|TYPE|IMAGE_URL|',
    T_GEOSPATIAL_TRANS_REQUEST type string value '|MODEL_ID|INPUTS|OUTPUT|SPACE_ID|',
    T_TEXT_CHAT_TOOL_CHOICE_TOOL type string value '|TYPE|FUNCTION|',
    T_MODERATION_PII_INPUT_PROP type string value '|',
    T_GRANITE_GUARDIAN_PROPERTIES type string value '|',
    T_NTBK_CRE_RESP_NTBK_IN_PRJCT type string value '|',
    T_COMMON_PATCH_REQUEST_HELPER type string value '|',
    T_TEXT_DETECTION_CONTEXT_ITEM type string value '|DETECTION_TYPE|DETECTION|SCORE|EVIDENCE|',
    T_SYNTHETIC_DATA_GEN_REQUEST type string value '|NAME|',
    T_AUTO_AIRAGREQUEST_ENTITY type string value '|HARDWARE_SPEC|INPUT_DATA_REFERENCES|TEST_DATA_REFERENCES|',
    T_TRAINING_RESOURCE_ENTITY type string value '|RESULTS_REFERENCE|STATUS|',
    T_TRAINING_RESOURCE type string value '|',
    T_TRAINING_RESOURCE_COLLECTION type string value '|LIMIT|FIRST|',
    T_PII_PROPERTIES type string value '|',
    T_NTBK_VER_RTRV_RESP_NTBK_VER1 type string value '|',
    T_RESOURCE_META_BASE type string value '|',
    T_MODERATION_PROPERTIES type string value '|',
    T_TEXT_GEN_RESULT type string value '|GENERATED_TEXT|STOP_REASON|',
    T_TEXT_CHAT_MESSAGE_CONTROL type string value '|ROLE|CONTENT|',
    T_MODERATION_INPUT_PROPERTIES type string value '|',
    T_DPLYMNT_TXT_CHT_MSG_TXT_CHT2 type string value '|ROLE|CONTENT|',
    T_TEXT_CHAT_MESSAGE_SYSTEM type string value '|ROLE|CONTENT|',
    T_EMBEDDINGS_RESPONSE type string value '|MODEL_ID|RESULTS|CREATED_AT|INPUT_TOKEN_COUNT|',
    T_PROMPT_TEMPLATE_VARIABLES type string value '|',
    T_TXT_CHT_MSG_TXT_CHT_MSG_ASS1 type string value '|ROLE|',
    T_IN_MEMORY_SETTINGS type string value '|',
    T_TEXT_CHAT_RESPONSE_FIELDS type string value '|CHOICES|',
    T_WX_PROMPT_SESSION type string value '|NAME|',
    T_RESRC_SPACE_PROJECT_METADATA type string value '|',
    T_TEXT_DETECTION_EVIDENCE_REF type string value '|EVIDENCE|',
    T_FILE_PATHS type string value '|',
    T_RESOURCE_REQUEST_FIELDS type string value '|NAME|',
    T_NTBK_CRE_RESP_NTBK_FOR_COPY type string value '|',
    T_GSPTL_TRANS_RESRC_ENTITY type string value '|MODEL_ID|INPUTS|OUTPUT|',
    T_DEPLOYMENT_TEXT_CHAT type string value '|MESSAGES|',
    T_ENTITY_REQ_SPC_PROJECT_BODY type string value '|NAME|',
    T_TEXT_CHAT_RESP_FIELDS_SHARED type string value '|ID|MODEL_ID|CREATED|',
    T_TEXT_GEN_COMMON type string value '|INPUT|',
    T_TXT_CHT_MSG_TXT_CHT_MSG_CNT1 type string value '|ROLE|CONTENT|',
    T_GEOSPATIAL_TRANS_RESOURCE type string value '|',
    T_GEOSPATIAL_TRANS_RESOURCES type string value '|LIMIT|FIRST|',
    T_TAXONOMY_REQUEST type string value '|NAME|',
    T_ERROR_RESPONSE type string value '|TRACE|ERRORS|',
    T_DEPLOYMENT_ENTITY_COMMON type string value '|ONLINE|',
    T_RERANK_RESPONSE type string value '|MODEL_ID|RESULTS|CREATED_AT|INPUT_TOKEN_COUNT|',
    T_TEXT_EXTRACTION_ENTITY type string value '|DOCUMENT_REFERENCE|RESULTS_REFERENCE|',
    T_AUTO_AIRAGREQUEST type string value '|NAME|HARDWARE_SPEC|INPUT_DATA_REFERENCES|TEST_DATA_REFERENCES|RESULTS_REFERENCE|',
    T_AISERVICE_RESOURCES type string value '|LIMIT|FIRST|',
    T_TEXT_CHAT_RESPONSE type string value '|ID|MODEL_ID|CREATED|CHOICES|',
    T_DEPLOYMENT_RESOURCE_PATCH type string value '|',
    T_TEXT_CHAT_MESSAGE_ASSISTANT type string value '|ROLE|',
    T_TXT_CHT_USR_CNTNTS_TXT_CHT_3 type string value '|TYPE|VIDEO_URL|',
    T_TAXONOMY_RESOURCES type string value '|LIMIT|',
    T_TEXT_EXTRACTION_RESOURCES type string value '|LIMIT|FIRST|',
    T_AUTO_AIRAGSTATUS type string value '|STATUS|',
    T_TEXT_CHAT_REQUEST type string value '|MODEL_ID|MESSAGES|',
    T_SIMILARITY_RESPONSE type string value '|MODEL_ID|RESULTS|CREATED_AT|INPUT_TOKEN_COUNT|',
    T_RESULTS_REFERENCE_OUTPUT type string value '|RESULTS_REFERENCE|',
    __DUMMY type string value SPACE,
  end of C_REQUIRED_FIELDS .

constants:
  "! <p class="shorttext synchronized" lang="en">Map ABAP identifiers to service identifiers.</p>
  begin of C_ABAPNAME_DICTIONARY,
     TAGS type string value 'tags',
     NAME type string value 'name',
     DESCRIPTION type string value 'description',
     CUSTOM type string value 'custom',
     INNER type string value 'inner',
     ASSET type string value 'asset',
     INPUT type string value 'input',
     DECAY_FACTOR type string value 'decay_factor',
     START_INDEX type string value 'start_index',
     INPUT_TEXT type string value 'input_text',
     GENERATED_TOKENS type string value 'generated_tokens',
     INPUT_TOKENS type string value 'input_tokens',
     TOKEN_LOGPROBS type string value 'token_logprobs',
     TOKEN_RANKS type string value 'token_ranks',
     TOP_N_TOKENS type string value 'top_n_tokens',
     DECODING_METHOD type string value 'decoding_method',
     LENGTH_PENALTY type string value 'length_penalty',
     MAX_NEW_TOKENS type string value 'max_new_tokens',
     MIN_NEW_TOKENS type string value 'min_new_tokens',
     RANDOM_SEED type string value 'random_seed',
     STOP_SEQUENCES type string value 'stop_sequences',
     TEMPERATURE type string value 'temperature',
     TIME_LIMIT type string value 'time_limit',
     TOP_K type string value 'top_k',
     TOP_P type string value 'top_p',
     REPETITION_PENALTY type string value 'repetition_penalty',
     TRUNCATE_INPUT_TOKENS type string value 'truncate_input_tokens',
     RETURN_OPTIONS type string value 'return_options',
     INCLUDE_STOP_SEQUENCE type string value 'include_stop_sequence',
     ENABLED type string value 'enabled',
     THRESHOLD type string value 'threshold',
     OUTPUT type string value 'output',
     REMOVE_ENTITY_VALUE type string value 'remove_entity_value',
     MASK type string value 'mask',
     START type string value 'start',
     END type string value 'end',
     HAP type string value 'hap',
     PII type string value 'pii',
     GRANITE_GUARDIAN type string value 'granite_guardian',
     INPUT_RANGES type string value 'input_ranges',
     MODEL_ID type string value 'model_id',
     SPACE_ID type string value 'space_id',
     PROJECT_ID type string value 'project_id',
     PARAMETERS type string value 'parameters',
     MODERATIONS type string value 'moderations',
     GENERATED_TEXT type string value 'generated_text',
     STOP_REASON type string value 'stop_reason',
     TEXT type string value 'text',
     LOGPROB type string value 'logprob',
     RANK type string value 'rank',
     TOP_TOKENS type string value 'top_tokens',
     SCORE type string value 'score',
     POSITION type string value 'position',
     ENTITY type string value 'entity',
     WORD type string value 'word',
     GENERATED_TOKEN_COUNT type string value 'generated_token_count',
     INPUT_TOKEN_COUNT type string value 'input_token_count',
     SEED type string value 'seed',
     MODEL_VERSION type string value 'model_version',
     CREATED_AT type string value 'created_at',
     RESULTS type string value 'results',
     MESSAGE type string value 'message',
     ID type string value 'id',
     MORE_INFO type string value 'more_info',
     ADDITIONAL_PROPERTIES type string value 'additional_properties',
     WARNINGS type string value 'warnings',
     SYSTEM type string value 'system',
     TYPE type string value 'type',
     CODE type string value 'code',
     TARGET type string value 'target',
     TRACE type string value 'trace',
     ERRORS type string value 'errors',
     RETURN_TOKENS type string value 'return_tokens',
     TOKEN_COUNT type string value 'token_count',
     TOKENS type string value 'tokens',
     RESULT type string value 'result',
     HREF type string value 'href',
     TOTAL_COUNT type string value 'total_count',
     LIMIT type string value 'limit',
     FIRST type string value 'first',
     NEXT type string value 'next',
     CALL_TIME type string value 'call_time',
     MAX_INPUT_TOKENS type string value 'max_input_tokens',
     MAX_OUTPUT_TOKENS type string value 'max_output_tokens',
     LITE type string value 'lite',
     COST type string value 'cost',
     QUALITY type string value 'quality',
     RATINGS type string value 'ratings',
     MAX_SEQUENCE_LENGTH type string value 'max_sequence_length',
     TRAINING_DATA_MAX_RECORDS type string value 'training_data_max_records',
     LABEL type string value 'label',
     START_DATE type string value 'start_date',
     ALTERNATIVE_MODEL_IDS type string value 'alternative_model_ids',
     URL type string value 'url',
     SUPPORTED type string value 'supported',
     DEFAULT type string value 'default',
     MIN type string value 'min',
     MAX type string value 'max',
     INIT_METHOD type string value 'init_method',
     INIT_TEXT type string value 'init_text',
     NUM_VIRTUAL_TOKENS type string value 'num_virtual_tokens',
     NUM_EPOCHS type string value 'num_epochs',
     VERBALIZER type string value 'verbalizer',
     BATCH_SIZE type string value 'batch_size',
     TORCH_DTYPE type string value 'torch_dtype',
     ACCUMULATE_STEPS type string value 'accumulate_steps',
     LEARNING_RATE type string value 'learning_rate',
     VERSION type string value 'version',
     AVAILABLE_DATE type string value 'available_date',
     PROVIDER type string value 'provider',
     TUNED_BY type string value 'tuned_by',
     SHORT_DESCRIPTION type string value 'short_description',
     LONG_DESCRIPTION type string value 'long_description',
     LIMITS type string value 'limits',
     SUPPORTED_LANGUAGES type string value 'supported_languages',
     TASK_IDS type string value 'task_ids',
     TASKS type string value 'tasks',
     INPUT_TIER type string value 'input_tier',
     OUTPUT_TIER type string value 'output_tier',
     SOURCE type string value 'source',
     MIN_SHOT_SIZE type string value 'min_shot_size',
     NUMBER_PARAMS type string value 'number_params',
     MODEL_LIMITS type string value 'model_limits',
     LIFECYCLE type string value 'lifecycle',
     TRAINING_PARAMETERS type string value 'training_parameters',
     VERSIONS type string value 'versions',
     TECH_PREVIEW type string value 'tech_preview',
     RESOURCES type string value 'resources',
     TASK_ID type string value 'task_id',
     COMMITTED_AT type string value 'committed_at',
     COMMIT_MESSAGE type string value 'commit_message',
     REV type string value 'rev',
     OWNER type string value 'owner',
     MODIFIED_AT type string value 'modified_at',
     PARENT_ID type string value 'parent_id',
     COMMIT_INFO type string value 'commit_info',
     SERVING_NAME type string value 'serving_name',
     NUM_NODES type string value 'num_nodes',
     SIZE type string value 'size',
     PROMPT_TEMPLATE type string value 'prompt_template',
     ONLINE type string value 'online',
     HARDWARE_SPEC type string value 'hardware_spec',
     HARDWARE_REQUEST type string value 'hardware_request',
     RESOURCE_KEY type string value 'resource_key',
     BASE_MODEL_ID type string value 'base_model_id',
     LEVEL type string value 'level',
     SSE type string value 'sse',
     USES_SERVING_NAME type string value 'uses_serving_name',
     STATE type string value 'state',
     FAILURE type string value 'failure',
     INFERENCE type string value 'inference',
     DEPLOYED_ASSET_TYPE type string value 'deployed_asset_type',
     STATUS type string value 'status',
     TOOLING type string value 'tooling',
     METADATA type string value 'metadata',
     ONLINE_COUNT type string value 'online_count',
     BATCH_COUNT type string value 'batch_count',
     STATS type string value 'stats',
     OP type string value 'op',
     PATH type string value 'path',
     FROM type string value 'from',
     VALUE type string value 'value',
     TYPICAL_P type string value 'typical_p',
     PROMPT_VARIABLES type string value 'prompt_variables',
     ROLE type string value 'role',
     ARGUMENTS type string value 'arguments',
     FUNCTION type string value 'function',
     CONTENT type string value 'content',
     REFUSAL type string value 'refusal',
     TOOL_CALLS type string value 'tool_calls',
     TOOL_CALL_ID type string value 'tool_call_id',
     DETAIL type string value 'detail',
     IMAGE_URL type string value 'image_url',
     VIDEO_URL type string value 'video_url',
     MESSAGES type string value 'messages',
     CONTEXT type string value 'context',
     COMPLETION_TOKENS type string value 'completion_tokens',
     PROMPT_TOKENS type string value 'prompt_tokens',
     TOTAL_TOKENS type string value 'total_tokens',
     CREATED type string value 'created',
     USAGE type string value 'usage',
     INDEX type string value 'index',
     FINISH_REASON type string value 'finish_reason',
     CHOICES type string value 'choices',
     DELTA type string value 'delta',
     BASE_MODEL type string value 'base_model',
     TUNING_TYPE type string value 'tuning_type',
     FIELDS type string value 'fields',
     CONNECTION type string value 'connection',
     LOCATION type string value 'location',
     SCHEMA type string value 'schema',
     PROMPT_TUNING type string value 'prompt_tuning',
     TRAINING_DATA_REFERENCES type string value 'training_data_references',
     AUTO_UPDATE_MODEL type string value 'auto_update_model',
     RESULTS_REFERENCE type string value 'results_reference',
     METRICS_LOCATION type string value 'metrics_location',
     DEPLOYMENT_ID type string value 'deployment_id',
     LOCATIONS type string value 'locations',
     TIMESTAMP type string value 'timestamp',
     ITERATION type string value 'iteration',
     ML_METRICS type string value 'ml_metrics',
     FINE_TUNING_METRICS type string value 'fine_tuning_metrics',
     RUNNING_AT type string value 'running_at',
     COMPLETED_AT type string value 'completed_at',
     METRICS type string value 'metrics',
     INPUTS type string value 'inputs',
     EMBEDDING type string value 'embedding',
     TOP_N type string value 'top_n',
     QUERY type string value 'query',
     METHOD type string value 'method',
     CHUNK_SIZE type string value 'chunk_size',
     CHUNK_OVERLAP type string value 'chunk_overlap',
     NUMBER_OF_CHUNKS type string value 'number_of_chunks',
     WINDOW_SIZE type string value 'window_size',
     PROMPT_TEMPLATE_TEXT type string value 'prompt_template_text',
     CONTEXT_TEMPLATE_TEXT type string value 'context_template_text',
     WORD_TO_TOKEN_RATIO type string value 'word_to_token_ratio',
     CHUNKING type string value 'chunking',
     EMBEDDING_MODELS type string value 'embedding_models',
     RETRIEVAL_METHODS type string value 'retrieval_methods',
     FOUNDATION_MODELS type string value 'foundation_models',
     MAX_NUMBER_OF_RAG_PATTERNS type string value 'max_number_of_rag_patterns',
     CONSTRAINTS type string value 'constraints',
     OPTIMIZATION type string value 'optimization',
     OUTPUT_LOGS type string value 'output_logs',
     INPUT_DATA_REFERENCES type string value 'input_data_references',
     TEST_DATA_REFERENCES type string value 'test_data_references',
     VECTOR_STORE_REFERENCES type string value 'vector_store_references',
     METRIC_NAME type string value 'metric_name',
     MEAN type string value 'mean',
     CI_HIGH type string value 'ci_high',
     CI_LOW type string value 'ci_low',
     TEST_DATA type string value 'test_data',
     EVALUATION_RESULTS type string value 'evaluation_results',
     INDEXING_NOTEBOOK type string value 'indexing_notebook',
     INFERENCE_NOTEBOOK type string value 'inference_notebook',
     INFERENCE_SERVICE_CODE type string value 'inference_service_code',
     INFERENCE_SERVICE_METADATA type string value 'inference_service_metadata',
     DATASOURCE_TYPE type string value 'datasource_type',
     INDEX_NAME type string value 'index_name',
     DISTANCE_METRIC type string value 'distance_metric',
     OPERATION type string value 'operation',
     TRUNCATE_STRATEGY type string value 'truncate_strategy',
     VECTOR_STORE type string value 'vector_store',
     EMBEDDINGS type string value 'embeddings',
     RETRIEVAL type string value 'retrieval',
     GENERATION type string value 'generation',
     COMPOSITION_STEPS type string value 'composition_steps',
     DURATION_SECONDS type string value 'duration_seconds',
     SETTINGS type string value 'settings',
     RAG_PATTERN type string value 'rag_pattern',
     MAX_COMBINATIONS type string value 'max_combinations',
     SOFTWARE_SPEC type string value 'software_spec',
     STEP type string value 'step',
     NUM type string value 'num',
     MAX_SEQ_LENGTH type string value 'max_seq_length',
     RESPONSE_TEMPLATE type string value 'response_template',
     GPU type string value 'gpu',
     GRADIENT_CHECKPOINTING type string value 'gradient_checkpointing',
     FILE_NAME type string value 'file_name',
     BUCKET type string value 'bucket',
     LANGUAGES_LIST type string value 'languages_list',
     OCR type string value 'ocr',
     TABLES_PROCESSING type string value 'tables_processing',
     DOCUMENT_REFERENCE type string value 'document_reference',
     STEPS type string value 'steps',
     ASSEMBLY_JSON type string value 'assembly_json',
     ASSEMBLY_MD type string value 'assembly_md',
     NUMBER_PAGES_PROCESSED type string value 'number_pages_processed',
     TOTAL_PAGES type string value 'total_pages',
     ERROR type string value 'error',
     FREQUENCY_PENALTY type string value 'frequency_penalty',
     LOGIT_BIAS type string value 'logit_bias',
     LOGPROBS type string value 'logprobs',
     TOP_LOGPROBS type string value 'top_logprobs',
     MAX_TOKENS type string value 'max_tokens',
     N type string value 'n',
     PRESENCE_PENALTY type string value 'presence_penalty',
     RESPONSE_FORMAT type string value 'response_format',
     STOP type string value 'stop',
     TOOLS type string value 'tools',
     TOOL_CHOICE_OPTION type string value 'tool_choice_option',
     TOOL_CHOICE type string value 'tool_choice',
     REQUEST type string value 'request',
     RESPONSE type string value 'response',
     CODE_TYPE type string value 'code_type',
     DOCUMENTATION type string value 'documentation',
     ATTACHMENT_ID type string value 'attachment_id',
     DETECTION_TYPE type string value 'detection_type',
     DETECTION type string value 'detection',
     EVIDENCE type string value 'evidence',
     PREDICTION_LENGTH type string value 'prediction_length',
     TIMESTAMP_COLUMN type string value 'timestamp_column',
     ID_COLUMNS type string value 'id_columns',
     FREQ type string value 'freq',
     TARGET_COLUMNS type string value 'target_columns',
     DATA type string value 'data',
     INPUT_DATA_POINTS type string value 'input_data_points',
     OUTPUT_DATA_POINTS type string value 'output_data_points',
     FILEPATHS type string value 'filepaths',
     COMMIT type string value 'commit',
     DOCUMENT_REFERENCES type string value 'document_references',
     KNOWLEDGE type string value 'knowledge',
     SKILLS type string value 'skills',
     TOTAL type string value 'total',
     SAMPLES type string value 'samples',
     LOGS type string value 'logs',
     ARTIFACTS type string value 'artifacts',
     SYNTHETIC_DATA_GEN_METRICS type string value 'synthetic_data_generation_metrics',
     DATA_REFERENCE type string value 'data_reference',
     NUM_OUTPUTS_TO_GENERATE type string value 'num_outputs_to_generate',
     PIPELINE type string value 'pipeline',
     SEED_DATA_REFERENCE type string value 'seed_data_reference',
     JOB type string value 'job',
     ASSET_ID type string value 'asset_id',
     CREATED_BY type string value 'created_by',
     LAST_UPDATED_AT type string value 'last_updated_at',
     LAST_UPDATED_BY type string value 'last_updated_by',
     GOVERNANCE_TRACKED type string value 'governance_tracked',
     LOCK type string value 'lock',
     INPUT_MODE type string value 'input_mode',
     IS_TEMPLATE type string value 'is_template',
     PROMPT type string value 'prompt',
     PROMPTS type string value 'prompts',
     BOOKMARK type string value 'bookmark',
     MODEL_PARAMETERS type string value 'model_parameters',
     SYSTEM_PROMPT type string value 'system_prompt',
     CHAT_ITEMS type string value 'chat_items',
     EXTERNAL_INFORMATION type string value 'external_information',
     EXTERNAL_PROMPT_ID type string value 'external_prompt_id',
     EXTERNAL_MODEL_ID type string value 'external_model_id',
     EXTERNAL_MODEL_PROVIDER type string value 'external_model_provider',
     EXTERNAL_PROMPT type string value 'external_prompt',
     EXTERNAL_MODEL type string value 'external_model',
     INSTRUCTION type string value 'instruction',
     INPUT_PREFIX type string value 'input_prefix',
     OUTPUT_PREFIX type string value 'output_prefix',
     EXAMPLES type string value 'examples',
     LOCKED type string value 'locked',
     LOCK_TYPE type string value 'lock_type',
     LOCKED_BY type string value 'locked_by',
     SPLIT_PDF_PAGES type string value 'split_pdf_pages',
     RERANK type string value 'rerank',
     EMBEDDING_MODEL_ID type string value 'embedding_model_id',
     SCHEMA_FIELDS type string value 'schema_fields',
     TOTAL_RESULTS type string value 'total_results',
     ASSET_TYPE type string value 'asset_type',
     OWNER_ID type string value 'owner_id',
     CATALOG_ID type string value 'catalog_id',
     NOTEBOOK type string value 'notebook',
     RUNTIME type string value 'runtime',
     KERNEL type string value 'kernel',
     ORIGINATES_FROM type string value 'originates_from',
     GUID type string value 'guid',
     SPARK_MONITORING_ENABLED type string value 'spark_monitoring_enabled',
     ENVIRONMENT type string value 'environment',
     FILE_REFERENCE type string value 'file_reference',
     PROJECT type string value 'project',
     SOURCE_GUID type string value 'source_guid',
     DISPLAY_NAME type string value 'display_name',
     LANGUAGE type string value 'language',
     NOTEBOOKS type string value 'notebooks',
     MASTER_NOTEBOOK_GUID type string value 'master_notebook_guid',
     CREATED_BY_IUI type string value 'created_by_iui',
     REV_ID type string value 'rev_id',
     AGENT_DESCRIPTION type string value 'agent_description',
     INPUT_SCHEMA type string value 'input_schema',
     CONFIG_SCHEMA type string value 'config_schema',
     TOOL_NAME type string value 'tool_name',
     CONFIG type string value 'config',
     ADDITIONAL_INFORMATION type string value 'additional_information',
     DOCUMENT_NAME type string value 'document_name',
     PAGE_NUMBER type string value 'page_number',
     VECTOR_QUERY type string value 'vector_query',
     DOCUMENT_URL type string value 'document_url',
     NUMBER type string value 'number',
     TAG type string value 'tag',
     KEY type string value 'key',
     CONFIGURATION type string value 'configuration',
  end of C_ABAPNAME_DICTIONARY .


  methods GET_APPNAME
    redefinition .
  methods GET_REQUEST_PROP
    redefinition .
  methods GET_SDK_VERSION_DATE
    redefinition .


    "! <p class="shorttext synchronized" lang="en">Create a new AI service</p>
    "!   Create a new AI service with the given payload. A AI service is some code that
    "!    can be deployed as a deployment.<br/>
    "!
    "!
    "! @parameter I_AISERVICEREQUEST |
    "!   Payload for creating the AI service. Either `space_id` or `project_id` has to be
    "!    provided and is mandatory.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_AISERVICE_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods AI_SERVICES_CREATE
    importing
      !I_AISERVICEREQUEST type T_AISERVICE_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_AISERVICE_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the AI services</p>
    "!   Retrieve the AI services for the specified space or project.<br/>
    "!
    "!
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_START |
    "!   Token required for token-based pagination. This token cannot be determined by
    "!    end user. It is generated by the service and it is set in the href available in
    "!    the `next` field.
    "! @parameter I_LIMIT |
    "!   How many resources should be returned. By default limit is 100. Max limit
    "!    allowed is 200.
    "! @parameter I_TAG_VALUE |
    "!   Return only the resources with the given tag values, separated by `or` or `and`
    "!    to support multiple tags.
    "! @parameter I_SEARCH |
    "!   Returns only resources that match this search string. The path to the field must
    "!    be the complete path to the field, and this field must be one of the indexed
    "!    fields for this resource type. Note that the search string must be URL encoded.
    "!
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_AISERVICE_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods AI_SERVICES_LIST
    importing
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_TAG_VALUE type STRING optional
      !I_SEARCH type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_AISERVICE_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the AI service</p>
    "!   Retrieve the AI service with the specified identifier. If `rev` query parameter
    "!    is provided,<br/>
    "!   `rev=latest` will fetch the latest revision. A call with
    "!    `rev=&#123;revision_number&#125;` will fetch the given revision_number record.
    "!    Either `space_id` or `project_id` has to be provided and is mandatory.<br/>
    "!
    "!
    "! @parameter I_ID |
    "!   AI service identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_REV |
    "!   The revision number of the resource.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_AISERVICE_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods AI_SERVICES_GET
    importing
      !I_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_REV type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_AISERVICE_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Update the AI service</p>
    "!   Update the AI service with the provided patch data.<br/>
    "!   The following fields can be patched:<br/>
    "!   - `/tags`<br/>
    "!   - `/name`<br/>
    "!   - `/description`<br/>
    "!   - `/custom`<br/>
    "!
    "!
    "! @parameter I_ID |
    "!   AI service identifier.
    "! @parameter I_JSON_PATCH |
    "!   Input For Patch. This is the patch body which corresponds to the JavaScript
    "!    Object Notation (JSON) Patch standard (RFC 6902).
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_AISERVICE_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods AI_SERVICES_UPDATE
    importing
      !I_ID type STRING
      !I_JSON_PATCH type TT_JSON_PATCH_OPERATION
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_AISERVICE_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Delete the AI service</p>
    "!   Delete the AI service with the specified identifier. This will delete all
    "!    revisions of this flow as well. For each revision all attachments will also be
    "!    deleted.<br/>
    "!
    "!
    "! @parameter I_ID |
    "!   AI service identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods AI_SERVICES_DELETE
    importing
      !I_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Upload the AI service code</p>
    "!   Upload the flow code. AI services expect a zip file that contains the code files
    "!    that make up the flow.<br/>
    "!
    "!
    "! @parameter I_ID |
    "!   AI service identifier.
    "! @parameter I_UPLOAD_CODE |
    "!   A gzip file containing code files.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_AISERVICE_CONTENT_METADATA
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods AI_SERVICES_UPLOAD_CODE
    importing
      !I_ID type STRING
      !I_UPLOAD_CODE type FILE
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_contenttype type string default 'application/gzip'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_AISERVICE_CONTENT_METADATA
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Download the AI service code</p>
    "!   Download the AI service code.<br/>
    "!   It is possible to download the `code` for a given revision of the `flow`.<br/>
    "!   AI services expect a zip file that contains the code files that make up the
    "!    flow.<br/>
    "!
    "!
    "! @parameter I_ID |
    "!   AI service identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_REV |
    "!   The revision number of the resource.
    "! @parameter E_RESPONSE |
    "!   Service return value of type FILE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods AI_SERVICES_DOWNLOAD_CODE
    importing
      !I_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_REV type STRING optional
      !I_accept      type string default 'application/zip'
    exporting
      !E_RESPONSE type FILE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Create a new AI service revision</p>
    "!   Create a new AI service revision.<br/>
    "!   The current metadata and content for<br/>
    "!   `id` will be taken and a new revision created.<br/>
    "!   Either `space_id` or `project_id` has to be provided and is mandatory.<br/>
    "!
    "!
    "! @parameter I_ID |
    "!   AI service identifier.
    "! @parameter I_RVSNNTTYSPCPRJCTRQST |
    "!   No documentation available.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_AISERVICE_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods AI_SERVICES_CREATE_REVISION
    importing
      !I_ID type STRING
      !I_RVSNNTTYSPCPRJCTRQST type T_REV_ENTITY_SPC_PROJECT_REQ
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_AISERVICE_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the AI service revisions</p>
    "!   Retrieve the AI service revisions.<br/>
    "!
    "!
    "! @parameter I_ID |
    "!   AI service identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_START |
    "!   Token required for token-based pagination. This token cannot be determined by
    "!    end user. It is generated by the service and it is set in the href available in
    "!    the `next` field.
    "! @parameter I_LIMIT |
    "!   How many resources should be returned. By default limit is 100. Max limit
    "!    allowed is 200.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_AISERVICE_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods AI_SERVICES_LIST_REVISIONS
    importing
      !I_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_AISERVICE_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .

    "! <p class="shorttext synchronized" lang="en">Create a new AutoAI RAG run</p>
    "!   Create a new AutoAI RAG that will find the best RAG pattern from the data that
    "!    is provided in the request.<br/>
    "!
    "!
    "! @parameter I_AUTOAIRAGREQUEST |
    "!   The details of the AutoAI RAG run with the data used to find the best RAG
    "!    patterns.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_AUTO_AIRAGRESPONSE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods CREATE_AUTOAI_RAGS
    importing
      !I_AUTOAIRAGREQUEST type T_AUTO_AIRAGREQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_AUTO_AIRAGRESPONSE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the AutoAI RAG runs</p>
    "!   Retrieve the list of AutoAI RAG requests for the specified space or
    "!    project.<br/>
    "!   <br/>
    "!   This operation does not save the history, any requests that were deleted or
    "!    purged<br/>
    "!   will not appear in this list.<br/>
    "!
    "!
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_START |
    "!   Token required for token-based pagination. This token cannot be determined by
    "!    end user. It is generated by the service and it is set in the href available in
    "!    the `next` field.
    "! @parameter I_LIMIT |
    "!   How many resources should be returned. By default limit is 100. Max limit
    "!    allowed is 200.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_AUTO_RAGRESULT_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods LIST_AUTOAI_RAGS
    importing
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_AUTO_RAGRESULT_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Get an AutoAI RAG run</p>
    "!   Get the results of an AutoAI RAG run, or details if the job failed.<br/>
    "!
    "!
    "! @parameter I_ID |
    "!   The `id` is the identifier that was returned in the `metadata.id` field of the
    "!    request.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_AUTO_AIRAGRESPONSE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods GET_AUTOAI_RAGS
    importing
      !I_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_AUTO_AIRAGRESPONSE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Cancel or delete an AutoAI RAG run</p>
    "!   Cancel or delete the specified AutoAI RAG run, once deleted all trace of the run
    "!    job is gone.<br/>
    "!
    "!
    "! @parameter I_ID |
    "!   The `id` is the identifier that was returned in the `metadata.id` field of the
    "!    request.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_HARD_DELETE |
    "!   Set to true in order to also delete the job or request metadata.
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DELETE_AUTOAI_RAGS
    importing
      !I_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_HARD_DELETE type BOOLEAN optional
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .

    "! <p class="shorttext synchronized" lang="en">Create a new watsonx.ai deployment</p>
    "!   Create a new deployment, currently the only supported type is `online`.<br/>
    "!   <br/>
    "!   If this is a deployment for a prompt tune then the `asset` object must
    "!    exist<br/>
    "!   and the `id` must be the `id` of the `model` that was created after the<br/>
    "!   prompt training.<br/>
    "!   <br/>
    "!   If this is a deployment for a prompt template then the `prompt_template`<br/>
    "!   object should<br/>
    "!   exist and the `id` must be the `id` of the prompt template to be deployed.<br/>
    "!
    "!
    "! @parameter I_DEPLOYMENTRESOURCEPROTOTYPE |
    "!   The deployment request entity.<br/>
    "!   <br/>
    "!   The following important fields are described for each use case: 1. Prompt
    "!    template:<br/>
    "!      - `base_model_id`: **required**<br/>
    "!      - `promt_template.id`: **required**<br/>
    "!      - `online`: **required**<br/>
    "!      - `hardware_spec`: **forbidden**<br/>
    "!      - `hardware_request`: **forbidden**<br/>
    "!      - response `deployed_asset_type`: `foundation_model` 1. Prompt tune:<br/>
    "!      - `asset.id`: **required**<br/>
    "!      - `online`: **required**<br/>
    "!      - `hardware_spec`: **forbidden**<br/>
    "!      - `hardware_request`: **forbidden**<br/>
    "!      - `base_model_id`: **forbidden**<br/>
    "!      - response `deployed_asset_type`: `prompt_tune` 1. Custom foundation
    "!    model:<br/>
    "!      - `asset.id`: **required**<br/>
    "!      - `online`: **required**<br/>
    "!      - `online.parameters.foundation_model`: **optional**<br/>
    "!      - `hardware_spec`: **forbidden**<br/>
    "!      - `hardware_request`: **required**<br/>
    "!      - `base_model_id`: **forbidden**<br/>
    "!      - `base_deployment_id`: **forbidden**<br/>
    "!      - response `deployed_asset_type`: `custom_foundation_model` 1. Deploy on
    "!    Demand model:<br/>
    "!      - `asset.id`: **required**<br/>
    "!      - `online`: **required**<br/>
    "!      - `online.parameters.foundation_model`: **forbidden**<br/>
    "!      - `hardware_spec`: **forbidden**<br/>
    "!      - `hardware_request`: **forbidden**<br/>
    "!      - `base_model_id`: **forbidden**<br/>
    "!      - `base_deployment_id`: **forbidden**<br/>
    "!      - `space_id`: **required**<br/>
    "!      - `project_id`: **forbidden**<br/>
    "!      - response `deployed_asset_type`: `curated_foundation_model`.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_DEPLOYMENT_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods CREATE_DEPLOYMENT
    importing
      !I_DEPLOYMENTRESOURCEPROTOTYPE type T_DEPLOYMENT_RESRC_PROTOTYPE
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_DEPLOYMENT_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the deployments</p>
    "!   Retrieve the list of deployments for the specified space or project.<br/>
    "!
    "!
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_SERVING_NAME |
    "!   Retrieves the deployment, if any, that contains this `serving_name`.
    "! @parameter I_TAG_VALUE |
    "!   Retrieves only the resources with the given tag value.
    "! @parameter I_ASSET_ID |
    "!   Retrieves only the resources with the given asset_id, asset_id would be the
    "!    model id.
    "! @parameter I_PROMPT_TEMPLATE_ID |
    "!   Retrieves only the resources with the given prompt_template_id.
    "! @parameter I_NAME |
    "!   Retrieves only the resources with the given name.
    "! @parameter I_TYPE |
    "!   Retrieves the resources filtered with the given type. There are the deployment
    "!    types as well as an additional<br/>
    "!   `prompt_template` if the deployment type includes a prompt template.<br/>
    "!   <br/>
    "!   The supported deployment types are (see the description for
    "!    `deployed_asset_type` in the deployment entity):<br/>
    "!   <br/>
    "!   1. `prompt_tune` - when a prompt tuned model is deployed. 2. `foundation_model`
    "!    - when a prompt template is used on a pre-deployed IBM provided model. 3.
    "!    `custom_foundation_model` - when a custom foundation model is deployed.<br/>
    "!   <br/>
    "!   These can be combined with the flag `prompt_template` like this:<br/>
    "!   <br/>
    "!   1. `type=prompt_tune` - return all prompt tuned model deployments. 2.
    "!    `type=prompt_tune and prompt_template` - return all prompt tuned model
    "!    deployments with a prompt template. 3. `type=foundation_model` - return all
    "!    prompt template deployments. 4. `type=foundation_model and prompt_template` -
    "!    return all prompt template deployments - this is the same as the previous query
    "!    because a `foundation_model` can only exist with a prompt template. 5.
    "!    `type=prompt_template` - return all deployments with a prompt template.
    "! @parameter I_STATE |
    "!   Retrieves the resources filtered by state. Allowed values are `initializing`,
    "!    `updating`, `ready` and `failed`.
    "! @parameter I_CONFLICT |
    "!   Returns whether `serving_name` is available for use or not. This query parameter
    "!    cannot be combined with any other parameter except for `serving_name`.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_DEPLOYMENT_RESRC_COLLECTION
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods LIST_DEPLOYMENTS
    importing
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_SERVING_NAME type STRING optional
      !I_TAG_VALUE type STRING optional
      !I_ASSET_ID type STRING optional
      !I_PROMPT_TEMPLATE_ID type STRING optional
      !I_NAME type STRING optional
      !I_TYPE type STRING optional
      !I_STATE type STRING optional
      !I_CONFLICT type BOOLEAN default c_boolean_false
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_DEPLOYMENT_RESRC_COLLECTION
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the deployment details</p>
    "!   Retrieve the deployment details with the specified identifier.<br/>
    "!
    "!
    "! @parameter I_DEPLOYMENT_ID |
    "!   The deployment id.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_DEPLOYMENT_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENTS_GET
    importing
      !I_DEPLOYMENT_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_DEPLOYMENT_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Update the deployment metadata</p>
    "!   Update the deployment metadata.<br/>
    "!   The following parameters of deployment metadata are supported for the patch
    "!    operation.<br/>
    "!   <br/>
    "!   - `/name`<br/>
    "!   - `/description`<br/>
    "!   - `/tags`<br/>
    "!   - `/custom`<br/>
    "!   - `/online/parameters`<br/>
    "!   - `/asset` - `replace` only<br/>
    "!   - `/prompt_template` - `replace` only<br/>
    "!   - `/hardware_spec`<br/>
    "!   - `/hardware_request`<br/>
    "!   - `/base_model_id` - `replace` only (applicable only to prompt template
    "!    deployments referring to IBM base foundation models) <br/>
    "!   <br/>
    "!   The PATCH operation with path specified as `/online/parameters` can be used to
    "!    update the `serving_name`.<br/>
    "!
    "!
    "! @parameter I_DEPLOYMENT_ID |
    "!   The deployment id.
    "! @parameter I_JSON_PATCH |
    "!   The json patch.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_DEPLOYMENT_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENTS_UPDATE
    importing
      !I_DEPLOYMENT_ID type STRING
      !I_JSON_PATCH type TT_JSON_PATCH_OPERATION
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_contenttype type string default 'application/json-patch+json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_DEPLOYMENT_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Delete the deployment</p>
    "!   Delete the deployment with the specified identifier.<br/>
    "!
    "!
    "! @parameter I_DEPLOYMENT_ID |
    "!   The deployment id.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENTS_DELETE
    importing
      !I_DEPLOYMENT_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Infer text</p>
    "!   Infer the next tokens for a given deployed model with a set of parameters.<br/>
    "!   If a `serving_name` is used then it must match the `serving_name` that is
    "!    returned in the `inference` section when the deployment was created.<br/>
    "!   <br/>
    "!   ### Return options<br/>
    "!   <br/>
    "!   Note that there is currently a limitation in this operation when using
    "!    `return_options`,<br/>
    "!   for input only `input_text` will be returned if requested,<br/>
    "!   for output the `input_tokens` and `generated_tokens` will not be returned.<br/>
    "!
    "!
    "! @parameter I_ID_OR_NAME |
    "!   The `id_or_name` can be either the `deployment_id` that identifies the
    "!    deployment or a `serving_name` that allows a predefined URL to be used to post
    "!    a prediction.<br/>
    "!   <br/>
    "!   The WML instance that is associated with the deployment will be used for limits
    "!    and billing (if a paid plan).
    "! @parameter I_BODY |
    "!   From a given prompt, infer the next tokens.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_TEXT_GEN_RESPONSE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENTS_TEXT_GENERATION
    importing
      !I_ID_OR_NAME type STRING
      !I_BODY type T_DEPLOYMENT_TEXT_GEN
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_TEXT_GEN_RESPONSE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Infer text event stream</p>
    "!   Infer the next tokens for a given deployed model with a set of parameters.<br/>
    "!   This operation will return the output tokens as a stream of events.<br/>
    "!   If a `serving_name` is used then it must match the `serving_name` that is
    "!    returned in the `inference` section when the deployment was created.<br/>
    "!   <br/>
    "!   ### Return options<br/>
    "!   <br/>
    "!   Note that there is currently a limitation in this operation when using
    "!    `return_options`,<br/>
    "!   for input only `input_text` will be returned if requested,<br/>
    "!   for output the `input_tokens` and `generated_tokens` will not be returned, also
    "!    the<br/>
    "!   `rank` and `top_tokens` will not be returned.<br/>
    "!
    "!
    "! @parameter I_ID_OR_NAME |
    "!   The `id_or_name` can be either the `deployment_id` that identifies the
    "!    deployment or a `serving_name` that allows a predefined URL to be used to post
    "!    a prediction.<br/>
    "!   <br/>
    "!   The WML instance that is associated with the deployment will be used for limits
    "!    and billing (if a paid plan).
    "! @parameter I_BODY |
    "!   From a given prompt, infer the next tokens in a server-sent events (SSE) stream.
    "!
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_Array
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENTS_TEXT_GEN_STREAM
    importing
      !I_ID_OR_NAME type STRING
      !I_BODY type T_DEPLOYMENT_TEXT_GEN
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'text/event-stream'
    exporting
      !E_RESPONSE type T_Array
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Infer text chat</p>
    "!   Infer the next chat message for a given deployment. The deployment must
    "!    reference a prompt template which has `input_mode` set to `chat`. The model to
    "!    the chat request will be from the deployment `base_model_id`. Parameters to the
    "!    chat request will be from the prompt template `model_parameters`. Related
    "!    guides:
    "!    [Deployment](https://cloud.ibm.com/apidocs/watsonx-ai#create-deployment),
    "!    [Prompt template](https://cloud.ibm.com/apidocs/watsonx-ai#post-prompt), [Text
    "!    chat](https://cloud.ibm.com/apidocs/watsonx-ai#text-chat).<br/>
    "!   <br/>
    "!   If a `serving_name` is used then it must match the `serving_name` that is
    "!    returned in the `inference` section when the deployment was created.<br/>
    "!
    "!
    "! @parameter I_ID_OR_NAME |
    "!   The `id_or_name` can be either the `deployment_id` that identifies the
    "!    deployment or a `serving_name` that allows a predefined URL to be used to post
    "!    a prediction. The deployment must reference a prompt template with `input_mode`
    "!    `chat`.<br/>
    "!   <br/>
    "!   The WML instance that is associated with the deployment will be used for limits
    "!    and billing (if a paid plan).
    "! @parameter I_BODY |
    "!   From a given prompt, infer the next chat message.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_TEXT_CHAT_RESPONSE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENTS_TEXT_CHAT
    importing
      !I_ID_OR_NAME type STRING
      !I_BODY type T_DEPLOYMENT_TEXT_CHAT
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_TEXT_CHAT_RESPONSE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Infer text chat event stream</p>
    "!   Infer the next chat message for a given deployment. This operation will return
    "!    the output tokens as a stream of events. The deployment must reference a prompt
    "!    template which has `input_mode` set to `chat`. The model to the chat request
    "!    will be from the deployment `base_model_id`. Parameters to the chat request
    "!    will be from the prompt template `model_parameters`. Related guides:
    "!    [Deployment](https://cloud.ibm.com/apidocs/watsonx-ai#create-deployment),
    "!    [Prompt template](https://cloud.ibm.com/apidocs/watsonx-ai#post-prompt), [Text
    "!    chat](https://cloud.ibm.com/apidocs/watsonx-ai#text-chat).<br/>
    "!   <br/>
    "!   If a `serving_name` is used then it must match the `serving_name` that is
    "!    returned in the `inference` section when the deployment was created.<br/>
    "!
    "!
    "! @parameter I_ID_OR_NAME |
    "!   The `id_or_name` can be either the `deployment_id` that identifies the
    "!    deployment or a `serving_name` that allows a predefined URL to be used to post
    "!    a prediction. The deployment must reference a prompt template with `input_mode`
    "!    `chat`.<br/>
    "!   <br/>
    "!   The WML instance that is associated with the deployment will be used for limits
    "!    and billing (if a paid plan).
    "! @parameter I_BODY |
    "!   From a given prompt, infer the next chat message in a server-sent events (SSE)
    "!    stream.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_Array
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENTS_TEXT_CHAT_STREAM
    importing
      !I_ID_OR_NAME type STRING
      !I_BODY type T_DEPLOYMENT_TEXT_CHAT
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'text/event-stream'
    exporting
      !E_RESPONSE type T_Array
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .

    "! <p class="shorttext synchronized" lang="en">List the available foundation models</p>
    "!   Retrieve the list of deployed foundation models.<br/>
    "!
    "!
    "! @parameter I_START |
    "!   Token required for token-based pagination. This token cannot be determined by
    "!    end user. It is generated by the service and it is set in the href available in
    "!    the `next` field.
    "! @parameter I_LIMIT |
    "!   How many resources should be returned. By default limit is 100. Max limit
    "!    allowed is 200.
    "! @parameter I_FILTERS |
    "!   A set of filters to specify the list of models, filters are described as the
    "!    `pattern` shown below.<br/>
    "!   ```text<br/>
    "!    pattern: tfilter[,tfilter][:(or|and)]<br/>
    "!    tfilter: filter | !filter<br/>
    "!      filter: Requires existence of the filter.<br/>
    "!      !filter: Requires absence of the filter.<br/>
    "!    filter: one of<br/>
    "!      modelid_*:     Filters by model id.<br/>
    "!                     Namely, select a model with a specific model id.<br/>
    "!      provider_*:    Filters by provider.<br/>
    "!                     Namely, select all models with a specific provider.<br/>
    "!      source_*:      Filters by source.<br/>
    "!                     Namely, select all models with a specific source.<br/>
    "!      input_tier_*:  Filters by input tier.<br/>
    "!                     Namely, select all models with a specific input tier.<br/>
    "!      output_tier_*: Filters by output tier.<br/>
    "!                     Namely, select all models with a specific output tier.<br/>
    "!      tier_*:        Filters by tier.<br/>
    "!                     Namely, select all models with a specific input or output
    "!    tier.<br/>
    "!      task_*:        Filters by task id.<br/>
    "!                     Namely, select all models that support a specific task
    "!    id.<br/>
    "!      lifecycle_*:   Filters by lifecycle state.<br/>
    "!                     Namely, select all models that are currently in the specified
    "!    lifecycle state.<br/>
    "!      function_*:    Filters by function. <br/>
    "!                     Namely, select all models that support a specific
    "!    function.<br/>
    "!   ```.
    "! @parameter I_TECH_PREVIEW |
    "!   See all the `Tech Preview` models if entitled.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_FOUNDATION_MODELS
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods LIST_FOUNDATION_MODEL_SPECS
    importing
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_FILTERS type STRING optional
      !I_TECH_PREVIEW type BOOLEAN default c_boolean_false
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_FOUNDATION_MODELS
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">List the supported tasks</p>
    "!   Retrieve the list of tasks that are supported by the foundation models.<br/>
    "!
    "!
    "! @parameter I_START |
    "!   Token required for token-based pagination. This token cannot be determined by
    "!    end user. It is generated by the service and it is set in the href available in
    "!    the `next` field.
    "! @parameter I_LIMIT |
    "!   How many resources should be returned. By default limit is 100. Max limit
    "!    allowed is 200.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_FOUNDATION_MODEL_TASKS
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods LIST_FOUNDATION_MODEL_TASKS
    importing
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_FOUNDATION_MODEL_TASKS
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .

    "! <p class="shorttext synchronized" lang="en">Create a new prompt / prompt template</p>
    "!   This creates a new prompt with the provided parameters.
    "!
    "! @parameter I_PROJECT_ID |
    "!   [REQUIRED] Specifies the project ID as the target. One target must be supplied
    "!    per request.
    "! @parameter I_WXPROMPTPOST |
    "!   No documentation available.
    "! @parameter I_SPACE_ID |
    "!   [REQUIRED] Specifies the space ID as the target. One target must be supplied per
    "!    request.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_WX_PROMPT_RESPONSE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods POST_PROMPT
    importing
      !I_PROJECT_ID type STRING
      !I_WXPROMPTPOST type T_WX_PROMPT_POST
      !I_SPACE_ID type STRING optional
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_WX_PROMPT_RESPONSE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Get a prompt</p>
    "!   This retrieves a prompt / prompt template with the given id.
    "!
    "! @parameter I_PROJECT_ID |
    "!   [REQUIRED] Specifies the project ID as the target. One target must be supplied
    "!    per request.
    "! @parameter I_PROMPT_ID |
    "!   Prompt ID.
    "! @parameter I_SPACE_ID |
    "!   [REQUIRED] Specifies the space ID as the target. One target must be supplied per
    "!    request.
    "! @parameter I_RESTRICT_MODEL_PARAMETERS |
    "!   Only return a set of model parameters compatiable with inferencing.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_WX_PROMPT_RESPONSE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods GET_PROMPT
    importing
      !I_PROJECT_ID type STRING
      !I_PROMPT_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_RESTRICT_MODEL_PARAMETERS type STRING default 'true'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_WX_PROMPT_RESPONSE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Update a prompt</p>
    "!   This updates a prompt / prompt template with the given id.
    "!
    "! @parameter I_PROJECT_ID |
    "!   [REQUIRED] Specifies the project ID as the target. One target must be supplied
    "!    per request.
    "! @parameter I_PROMPT_ID |
    "!   Prompt ID.
    "! @parameter I_WXPROMPTPATCH |
    "!   No documentation available.
    "! @parameter I_SPACE_ID |
    "!   [REQUIRED] Specifies the space ID as the target. One target must be supplied per
    "!    request.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_WX_PROMPT_RESPONSE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods PATCH_PROMPT
    importing
      !I_PROJECT_ID type STRING
      !I_PROMPT_ID type STRING
      !I_WXPROMPTPATCH type T_WX_PROMPT_PATCH
      !I_SPACE_ID type STRING optional
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_WX_PROMPT_RESPONSE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Delete a prompt</p>
    "!   This deletes a prompt / prompt template with the given id.
    "!
    "! @parameter I_PROJECT_ID |
    "!   [REQUIRED] Specifies the project ID as the target. One target must be supplied
    "!    per request.
    "! @parameter I_PROMPT_ID |
    "!   Prompt ID.
    "! @parameter I_SPACE_ID |
    "!   [REQUIRED] Specifies the space ID as the target. One target must be supplied per
    "!    request.
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DELETE_PROMPT
    importing
      !I_PROJECT_ID type STRING
      !I_PROMPT_ID type STRING
      !I_SPACE_ID type STRING optional
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Prompt lock modifications</p>
    "!   Modifies the current locked state of a prompt.
    "!
    "! @parameter I_PROMPT_ID |
    "!   Prompt ID.
    "! @parameter I_PROJECT_ID |
    "!   [REQUIRED] Specifies the project ID as the target. One target must be supplied
    "!    per request.
    "! @parameter I_PROMPTLOCK |
    "!   No documentation available.
    "! @parameter I_SPACE_ID |
    "!   [REQUIRED] Specifies the space ID as the target. One target must be supplied per
    "!    request.
    "! @parameter I_FORCE |
    "!   Override a lock if it is currently taken.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_PROMPT_LOCK
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods PUT_PROMPT_LOCK
    importing
      !I_PROMPT_ID type STRING
      !I_PROJECT_ID type STRING
      !I_PROMPTLOCK type T_PROMPT_LOCK
      !I_SPACE_ID type STRING optional
      !I_FORCE type BOOLEAN optional
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_PROMPT_LOCK
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Get current prompt lock status</p>
    "!   Retrieves the current locked state of a prompt.
    "!
    "! @parameter I_PROMPT_ID |
    "!   Prompt ID.
    "! @parameter I_PROJECT_ID |
    "!   [REQUIRED] Specifies the project ID as the target. One target must be supplied
    "!    per request.
    "! @parameter I_SPACE_ID |
    "!   [REQUIRED] Specifies the space ID as the target. One target must be supplied per
    "!    request.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_PROMPT_LOCK
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods GET_PROMPT_LOCK
    importing
      !I_PROMPT_ID type STRING
      !I_PROJECT_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_PROMPT_LOCK
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Get the inference input string for a given prompt</p>
    "!   Computes the inference input string based on state of a prompt. Optionally
    "!    replaces template params
    "!
    "! @parameter I_PROMPT_ID |
    "!   Prompt ID.
    "! @parameter I_PROJECT_ID |
    "!   [REQUIRED] Specifies the project ID as the target. One target must be supplied
    "!    per request.
    "! @parameter I_WXPROMPTINPUTREQUEST |
    "!   No documentation available.
    "! @parameter I_SPACE_ID |
    "!   [REQUIRED] Specifies the space ID as the target. One target must be supplied per
    "!    request.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_GET_PROMPT_INPUT_RESPONSE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods GET_PROMPT_INPUT
    importing
      !I_PROMPT_ID type STRING
      !I_PROJECT_ID type STRING
      !I_WXPROMPTINPUTREQUEST type T_WX_PROMPT_INPUT_REQUEST optional
      !I_SPACE_ID type STRING optional
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_GET_PROMPT_INPUT_RESPONSE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .

    "! <p class="shorttext synchronized" lang="en">Infer text</p>
    "!   Infer the next tokens for a given deployed model with a set of parameters.<br/>
    "!
    "!
    "! @parameter I_TEXTCHATREQUEST |
    "!   From a given prompt, infer the next tokens.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_TEXT_CHAT_RESPONSE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TEXT_CHAT
    importing
      !I_TEXTCHATREQUEST type T_TEXT_CHAT_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_TEXT_CHAT_RESPONSE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Infer text event stream</p>
    "!   Infer the next tokens for a given deployed model with a set of parameters.<br/>
    "!   This operation will return the output tokens as a stream of events.<br/>
    "!
    "!
    "! @parameter I_TEXTCHATREQUEST |
    "!   From a given prompt, infer the next tokens in a server-sent events (SSE) stream.
    "!
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_Array
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TEXT_CHAT_STREAM
    importing
      !I_TEXTCHATREQUEST type T_TEXT_CHAT_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'text/event-stream'
    exporting
      !E_RESPONSE type T_Array
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .

    "! <p class="shorttext synchronized" lang="en">Generate embeddings</p>
    "!   Generate embeddings from text input.<br/>
    "!   <br/>
    "!   See the
    "!    [documentation](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-dat
    "!   a/fm-embed-overview.html?context=wx&audience=wdp)<br/>
    "!   for a description of text embeddings.<br/>
    "!
    "!
    "! @parameter I_EMBEDDINGSREQUEST |
    "!   The text input for a given model to be used to generate the embeddings.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_EMBEDDINGS_RESPONSE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TEXT_EMBEDDINGS
    importing
      !I_EMBEDDINGSREQUEST type T_EMBEDDINGS_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_EMBEDDINGS_RESPONSE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .

    "! <p class="shorttext synchronized" lang="en">Start a text extraction request</p>
    "!   Start a request to extract text and metadata from documents.<br/>
    "!   <br/>
    "!   See the
    "!    [documentation](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-dat
    "!   a/fm-api-text-extraction.html?context=wx&audience=wdp) for a description of text
    "!    extraction.<br/>
    "!
    "!
    "! @parameter I_TEXTEXTRACTIONREQUEST |
    "!   The input for the text extraction request.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_TEXT_EXTRACTION_RESPONSE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TEXT_EXTRACTION
    importing
      !I_TEXTEXTRACTIONREQUEST type T_TEXT_EXTRACTION_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_TEXT_EXTRACTION_RESPONSE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the text extraction requests</p>
    "!   Retrieve the list of text extraction requests for the specified space or
    "!    project.<br/>
    "!   <br/>
    "!   This operation does not save the history, any requests that were deleted or
    "!    purged<br/>
    "!   will not appear in this list.<br/>
    "!
    "!
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_START |
    "!   Token required for token-based pagination. This token cannot be determined by
    "!    end user. It is generated by the service and it is set in the href available in
    "!    the `next` field.
    "! @parameter I_LIMIT |
    "!   How many resources should be returned. By default limit is 100. Max limit
    "!    allowed is 200.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_TEXT_EXTRACTION_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods LIST_TEXT_EXTRACTIONS
    importing
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_TEXT_EXTRACTION_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Get the results of the request</p>
    "!   Retrieve the text extraction request with the specified identifier.<br/>
    "!   <br/>
    "!   Note that there is a retention period of 2 days. If this retention<br/>
    "!   period is exceeded then the request will be deleted and the results<br/>
    "!   no longer available. In this case this operation will return `404`.<br/>
    "!
    "!
    "! @parameter I_ID |
    "!   The identifier of the extraction request.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_TEXT_EXTRACTION_RESPONSE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TEXT_EXTRACTION_GET
    importing
      !I_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_TEXT_EXTRACTION_RESPONSE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Delete the request</p>
    "!   Cancel the specified text extraction request and delete any associated
    "!    results.<br/>
    "!
    "!
    "! @parameter I_ID |
    "!   The identifier of the extraction request.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_HARD_DELETE |
    "!   Set to true in order to also delete the job or request metadata.
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TEXT_EXTRACTION_DELETE
    importing
      !I_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_HARD_DELETE type BOOLEAN optional
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .

    "! <p class="shorttext synchronized" lang="en">Infer text</p>
    "!   Infer the next tokens for a given deployed model with a set of parameters.<br/>
    "!
    "!
    "! @parameter I_TEXTGENREQUEST |
    "!   From a given prompt, infer the next tokens.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_TEXT_GEN_RESPONSE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TEXT_GENERATION
    importing
      !I_TEXTGENREQUEST type T_TEXT_GEN_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_TEXT_GEN_RESPONSE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Infer text event stream</p>
    "!   Infer the next tokens for a given deployed model with a set of parameters.<br/>
    "!   This operation will return the output tokens as a stream of events.<br/>
    "!
    "!
    "! @parameter I_TEXTGENREQUEST |
    "!   From a given prompt, infer the next tokens in a server-sent events (SSE) stream.
    "!
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_Array
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TEXT_GENERATION_STREAM
    importing
      !I_TEXTGENREQUEST type T_TEXT_GEN_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'text/event-stream'
    exporting
      !E_RESPONSE type T_Array
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .

    "! <p class="shorttext synchronized" lang="en">Generate rerank</p>
    "!   Rerank texts based on some queries.<br/>
    "!
    "!
    "! @parameter I_RERANKREQUEST |
    "!   The input texts and the queries for reranking.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_RERANK_RESPONSE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TEXT_RERANK
    importing
      !I_RERANKREQUEST type T_RERANK_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_RERANK_RESPONSE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .

    "! <p class="shorttext synchronized" lang="en">Text tokenization</p>
    "!   The text tokenize operation allows you to check the conversion of provided input
    "!    to tokens for a given model.<br/>
    "!   It splits text into words or sub-words, which then are converted to ids through
    "!    a look-up table (vocabulary).<br/>
    "!   Tokenization allows the model to have a reasonable vocabulary size.<br/>
    "!
    "!
    "! @parameter I_TEXTTOKENIZEREQUEST |
    "!   The input string to tokenize.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_TEXT_TOKENIZE_RESPONSE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TEXT_TOKENIZATION
    importing
      !I_TEXTTOKENIZEREQUEST type T_TEXT_TOKENIZE_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_TEXT_TOKENIZE_RESPONSE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .

    "! <p class="shorttext synchronized" lang="en">Time series forecast</p>
    "!   Generate forecasts, or predictions for future time points, given historical time
    "!    series data.<br/>
    "!
    "!
    "! @parameter I_TSFORECASTREQUEST |
    "!   The forecast request.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_TSFORECAST_RESPONSE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TIME_SERIES_FORECAST
    importing
      !I_TSFORECASTREQUEST type T_TSFORECAST_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_TSFORECAST_RESPONSE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .

    "! <p class="shorttext synchronized" lang="en">Create a new watsonx.ai training</p>
    "!   Create a new watsonx.ai training in a project or a space.<br/>
    "!   <br/>
    "!   The details of the base model and parameters for the training<br/>
    "!   must be provided in the `prompt_tuning` object.<br/>
    "!   <br/>
    "!   <br/>
    "!   In order to deploy the tuned model you need to follow the following steps:<br/>
    "!   <br/>
    "!     1. Create a WML model asset, in a space or a project,<br/>
    "!        by providing the `request.json` as shown below:<br/>
    "!          ```<br/>
    "!          curl -X POST
    "!    &quot;https://&#123;cpd_cluster&#125;/ml/v4/models?version=2024-01-29&quot;
    "!    \<br/>
    "!            -H &quot;Authorization: Bearer &lt;replace with your token&gt;&quot;
    "!    \<br/>
    "!            -H &quot;content-type: application/json&quot; \<br/>
    "!            --data &apos;&#123;<br/>
    "!               &quot;name&quot;: &quot;replace_with_a_meaningful_name&quot;,<br/>
    "!               &quot;space_id&quot;: &quot;replace_with_your_space_id&quot;,<br/>
    "!               &quot;type&quot;: &quot;prompt_tune_1.0&quot;,<br/>
    "!               &quot;software_spec&quot;: &#123;<br/>
    "!                 &quot;name&quot;: &quot;watsonx-textgen-fm-1.0&quot;<br/>
    "!               &#125;,<br/>
    "!               &quot;metrics&quot;: [ from the training job ],<br/>
    "!               &quot;training&quot;: &#123;<br/>
    "!                 &quot;id&quot;:
    "!    &quot;05859469-b25b-420e-aefe-4a5cb6b595eb&quot;,<br/>
    "!                 &quot;base_model&quot;: &#123;<br/>
    "!                   &quot;model_id&quot;: &quot;google/flan-t5-xl&quot;<br/>
    "!                 &#125;,<br/>
    "!                 &quot;task_id&quot;: &quot;generation&quot;,<br/>
    "!                 &quot;verbalizer&quot;: &quot;Input: &#123;&#123;input&#125;&#125;
    "!    Output:&quot;<br/>
    "!               &#125;,<br/>
    "!               &quot;training_data_references&quot;: [<br/>
    "!                 &#123;<br/>
    "!                   &quot;connection&quot;: &#123;<br/>
    "!                     &quot;id&quot;:
    "!    &quot;20933468-7e8a-4706-bc90-f0a09332b263&quot;<br/>
    "!                   &#125;,<br/>
    "!                   &quot;id&quot;: &quot;file_to_tune1.json&quot;,<br/>
    "!                   &quot;location&quot;: &#123;<br/>
    "!                     &quot;bucket&quot;:
    "!    &quot;wxproject-donotdelete-pr-xeyivy0rx3vrbl&quot;,<br/>
    "!                     &quot;path&quot;: &quot;file_to_tune1.json&quot;<br/>
    "!                   &#125;,<br/>
    "!                   &quot;type&quot;: &quot;connection_asset&quot;<br/>
    "!                 &#125;<br/>
    "!               ]<br/>
    "!             &#125;&apos;<br/>
    "!          ```<br/>
    "!   <br/>
    "!   <br/>
    "!          **Notes:**<br/>
    "!   <br/>
    "!          1. If you used the training request field `auto_update_model: true`<br/>
    "!          then you can skip this step as the model will have been saved at<br/>
    "!          the end of the training job.<br/>
    "!          1. Rather than creating the payload for the model you can use the<br/>
    "!             generated `request.json` that was stored in the
    "!    `results_reference`<br/>
    "!             field, look for the path in the field<br/>
    "!             `entity.results_reference.location.model_request_path`.<br/>
    "!          1. The model `type` must be `prompt_tune_1.0`.<br/>
    "!          1. The software spec name must be `watsonx-textgen-fm-1.0`.<br/>
    "!   <br/>
    "!     1. Create a tuned model deployment as described in the<br/>
    "!        [create deployment documentation](#create-deployment).<br/>
    "!
    "!
    "! @parameter I_TRAININGRESOURCEPROTOTYPE |
    "!   No documentation available.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_TRAINING_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TRAININGS_CREATE
    importing
      !I_TRAININGRESOURCEPROTOTYPE type T_TRAINING_RESOURCE_PROTOTYPE
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_TRAINING_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the list of trainings</p>
    "!   Retrieve the list of trainings for the specified space or project.<br/>
    "!
    "!
    "! @parameter I_START |
    "!   Token required for token-based pagination. This token cannot be determined by
    "!    end user. It is generated by the service and it is set in the href available in
    "!    the `next` field.
    "! @parameter I_LIMIT |
    "!   How many resources should be returned. By default limit is 100. Max limit
    "!    allowed is 200.
    "! @parameter I_TOTAL_COUNT |
    "!   Compute the total count. May have performance impact.
    "! @parameter I_TAG_VALUE |
    "!   Return only the resources with the given tag value.
    "! @parameter I_STATE |
    "!   Filter based on on the training job state.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_TRAINING_RESOURCE_COLLECTION
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TRAININGS_LIST
    importing
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_TOTAL_COUNT type BOOLEAN optional
      !I_TAG_VALUE type STRING optional
      !I_STATE type STRING optional
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_TRAINING_RESOURCE_COLLECTION
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the training</p>
    "!   Retrieve the training with the specified identifier.<br/>
    "!
    "!
    "! @parameter I_TRAINING_ID |
    "!   The training identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_TRAINING_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TRAININGS_GET
    importing
      !I_TRAINING_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_TRAINING_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Cancel or delete the training</p>
    "!   Cancel or delete the specified training, once deleted all trace of the job is
    "!    gone.<br/>
    "!
    "!
    "! @parameter I_TRAINING_ID |
    "!   The training identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_HARD_DELETE |
    "!   Set to true in order to also delete the job or request metadata.
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TRAININGS_DELETE
    importing
      !I_TRAINING_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_HARD_DELETE type BOOLEAN optional
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .


protected section.

private section.

ENDCLASS.

class ZCL_IBMX_WATSONX_AI_ML_V1 IMPLEMENTATION.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->GET_APPNAME
* +-------------------------------------------------------------------------------------------------+
* | [<-()] E_APPNAME                      TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method GET_APPNAME.

    e_appname = 'watsonx.ai'  ##NO_TEXT.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_IBMX_WATSONX_AI_ML_V1->GET_REQUEST_PROP
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_AUTH_METHOD                  TYPE        STRING (default =C_DEFAULT)
* | [<-()] E_REQUEST_PROP                 TYPE        TS_REQUEST_PROP
* +--------------------------------------------------------------------------------------</SIGNATURE>
method GET_REQUEST_PROP.

  data:
    lv_auth_method type string  ##NEEDED.

  e_request_prop = super->get_request_prop( i_auth_method = i_auth_method ).

  lv_auth_method = i_auth_method.
  if lv_auth_method eq c_default.
    lv_auth_method = 'Bearer'  ##NO_TEXT.
  endif.
  if lv_auth_method is initial.
    e_request_prop-auth_basic      = c_boolean_false.
    e_request_prop-auth_oauth      = c_boolean_false.
    e_request_prop-auth_apikey     = c_boolean_false.
  elseif lv_auth_method eq 'Bearer'  ##NO_TEXT.
    e_request_prop-auth_name       = 'Bearer'  ##NO_TEXT.
    e_request_prop-auth_type       = 'http'  ##NO_TEXT.
    e_request_prop-auth_oauth      = c_boolean_true.
  elseif lv_auth_method eq 'ZenApiKey'.
    e_request_prop-auth_name       = lv_auth_method.
    e_request_prop-auth_type       = lv_auth_method.
    e_request_prop-auth_oauth      = c_boolean_false.
    e_request_prop-auth_header     = c_boolean_true.
  else.
  endif.

  e_request_prop-url-protocol    = 'https'  ##NO_TEXT.
  e_request_prop-url-host        = 'us-south.ml.cloud.ibm.com'  ##NO_TEXT.
  e_request_prop-url-path_base   = ''.

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->GET_SDK_VERSION_DATE
* +-------------------------------------------------------------------------------------------------+
* | [<-()] E_SDK_VERSION_DATE             TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_sdk_version_date.

    e_sdk_version_date = '20250625'.

  endmethod.



* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->AI_SERVICES_CREATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_AISERVICEREQUEST        TYPE T_AISERVICE_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_AISERVICE_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method AI_SERVICES_CREATE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/ai_services'.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).






    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_AISERVICEREQUEST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_AISERVICEREQUEST to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_AISERVICEREQUEST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'AIServiceRequest' i_value = i_AISERVICEREQUEST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_AISERVICEREQUEST to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP POST request
    lo_response = HTTP_POST( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->AI_SERVICES_LIST
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_TAG_VALUE        TYPE STRING (optional)
* | [--->] I_SEARCH        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_AISERVICE_RESOURCES
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method AI_SERVICES_LIST.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/ai_services'.

    " standard headers
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PROJECT_ID is supplied.
    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_START is supplied.
    lv_queryparam = escape( val = i_START format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `start`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_LIMIT is supplied.
    lv_queryparam = i_LIMIT.
    add_query_parameter(
      exporting
        i_parameter  = `limit`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_TAG_VALUE is supplied.
    lv_queryparam = escape( val = i_TAG_VALUE format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `tag.value`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_SEARCH is supplied.
    lv_queryparam = escape( val = i_SEARCH format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `search`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.






    " execute HTTP GET request
    lo_response = HTTP_GET( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->AI_SERVICES_GET
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_REV        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_AISERVICE_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method AI_SERVICES_GET.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/ai_services/{id}'.
    replace all occurrences of `{id}` in ls_request_prop-url-path with i_ID ignoring case.

    " standard headers
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PROJECT_ID is supplied.
    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_REV is supplied.
    lv_queryparam = escape( val = i_REV format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `rev`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.






    " execute HTTP GET request
    lo_response = HTTP_GET( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->AI_SERVICES_UPDATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_ID        TYPE STRING
* | [--->] I_JSON_PATCH        TYPE TT_JSON_PATCH_OPERATION
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_AISERVICE_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method AI_SERVICES_UPDATE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/ai_services/{id}'.
    replace all occurrences of `{id}` in ls_request_prop-url-path with i_ID ignoring case.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PROJECT_ID is supplied.
    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.




    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_JSON_PATCH ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_JSON_PATCH to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_JSON_PATCH i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'json-patch' i_value = i_JSON_PATCH ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_JSON_PATCH to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP PATCH request
    lo_response = HTTP_PATCH( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->AI_SERVICES_DELETE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method AI_SERVICES_DELETE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/ai_services/{id}'.
    replace all occurrences of `{id}` in ls_request_prop-url-path with i_ID ignoring case.

    " standard headers
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PROJECT_ID is supplied.
    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.






    " execute HTTP DELETE request
    lo_response = HTTP_DELETE( i_request_prop = ls_request_prop ).



endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->AI_SERVICES_UPLOAD_CODE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_ID        TYPE STRING
* | [--->] I_UPLOAD_CODE        TYPE FILE
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_contenttype       TYPE string (default ='application/gzip')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_AISERVICE_CONTENT_METADATA
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method AI_SERVICES_UPLOAD_CODE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/ai_services/{id}/code'.
    replace all occurrences of `{id}` in ls_request_prop-url-path with i_ID ignoring case.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PROJECT_ID is supplied.
    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.




    " process body parameters
    ls_request_prop-body_bin = i_UPLOAD_CODE.

    " execute HTTP PUT request
    lo_response = HTTP_PUT( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->AI_SERVICES_DOWNLOAD_CODE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_REV        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/zip')
* | [<---] E_RESPONSE                    TYPE        FILE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method AI_SERVICES_DOWNLOAD_CODE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/ai_services/{id}/code'.
    replace all occurrences of `{id}` in ls_request_prop-url-path with i_ID ignoring case.

    " standard headers
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PROJECT_ID is supplied.
    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_REV is supplied.
    lv_queryparam = escape( val = i_REV format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `rev`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.






    " execute HTTP GET request
    lo_response = HTTP_GET( i_request_prop = ls_request_prop ).


    " retrieve file data
    e_response = get_response_binary( lo_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->AI_SERVICES_CREATE_REVISION
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_ID        TYPE STRING
* | [--->] I_RVSNNTTYSPCPRJCTRQST        TYPE T_REV_ENTITY_SPC_PROJECT_REQ
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_AISERVICE_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method AI_SERVICES_CREATE_REVISION.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/ai_services/{id}/revisions'.
    replace all occurrences of `{id}` in ls_request_prop-url-path with i_ID ignoring case.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).






    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_RVSNNTTYSPCPRJCTRQST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_RVSNNTTYSPCPRJCTRQST to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_RVSNNTTYSPCPRJCTRQST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'RevisionEntitySpaceProjectRequest' i_value = i_RVSNNTTYSPCPRJCTRQST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_RVSNNTTYSPCPRJCTRQST to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP POST request
    lo_response = HTTP_POST( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->AI_SERVICES_LIST_REVISIONS
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_AISERVICE_RESOURCES
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method AI_SERVICES_LIST_REVISIONS.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/ai_services/{id}/revisions'.
    replace all occurrences of `{id}` in ls_request_prop-url-path with i_ID ignoring case.

    " standard headers
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PROJECT_ID is supplied.
    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_START is supplied.
    lv_queryparam = escape( val = i_START format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `start`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_LIMIT is supplied.
    lv_queryparam = i_LIMIT.
    add_query_parameter(
      exporting
        i_parameter  = `limit`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.






    " execute HTTP GET request
    lo_response = HTTP_GET( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->CREATE_AUTOAI_RAGS
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_AUTOAIRAGREQUEST        TYPE T_AUTO_AIRAGREQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_AUTO_AIRAGRESPONSE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method CREATE_AUTOAI_RAGS.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v1/autoai/rags'.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).






    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_AUTOAIRAGREQUEST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_AUTOAIRAGREQUEST to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_AUTOAIRAGREQUEST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'AutoAIRAGRequest' i_value = i_AUTOAIRAGREQUEST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_AUTOAIRAGREQUEST to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP POST request
    lo_response = HTTP_POST( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->LIST_AUTOAI_RAGS
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_AUTO_RAGRESULT_RESOURCES
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method LIST_AUTOAI_RAGS.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v1/autoai/rags'.

    " standard headers
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PROJECT_ID is supplied.
    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_START is supplied.
    lv_queryparam = escape( val = i_START format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `start`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_LIMIT is supplied.
    lv_queryparam = i_LIMIT.
    add_query_parameter(
      exporting
        i_parameter  = `limit`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.






    " execute HTTP GET request
    lo_response = HTTP_GET( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->GET_AUTOAI_RAGS
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_AUTO_AIRAGRESPONSE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method GET_AUTOAI_RAGS.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v1/autoai/rags/{id}'.
    replace all occurrences of `{id}` in ls_request_prop-url-path with i_ID ignoring case.

    " standard headers
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PROJECT_ID is supplied.
    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.






    " execute HTTP GET request
    lo_response = HTTP_GET( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->DELETE_AUTOAI_RAGS
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_HARD_DELETE        TYPE BOOLEAN (optional)
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DELETE_AUTOAI_RAGS.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v1/autoai/rags/{id}'.
    replace all occurrences of `{id}` in ls_request_prop-url-path with i_ID ignoring case.

    " standard headers
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PROJECT_ID is supplied.
    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_HARD_DELETE is supplied.
    lv_queryparam = i_HARD_DELETE.
    add_query_parameter(
      exporting
        i_parameter  = `hard_delete`
        i_value      = lv_queryparam
        i_is_boolean = c_boolean_true
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.






    " execute HTTP DELETE request
    lo_response = HTTP_DELETE( i_request_prop = ls_request_prop ).



endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->CREATE_DEPLOYMENT
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_DEPLOYMENTRESOURCEPROTOTYPE        TYPE T_DEPLOYMENT_RESRC_PROTOTYPE
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_DEPLOYMENT_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method CREATE_DEPLOYMENT.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/deployments'.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).






    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_DEPLOYMENTRESOURCEPROTOTYPE ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_DEPLOYMENTRESOURCEPROTOTYPE to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_DEPLOYMENTRESOURCEPROTOTYPE i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'DeploymentResourcePrototype' i_value = i_DEPLOYMENTRESOURCEPROTOTYPE ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_DEPLOYMENTRESOURCEPROTOTYPE to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP POST request
    lo_response = HTTP_POST( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->LIST_DEPLOYMENTS
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_SERVING_NAME        TYPE STRING (optional)
* | [--->] I_TAG_VALUE        TYPE STRING (optional)
* | [--->] I_ASSET_ID        TYPE STRING (optional)
* | [--->] I_PROMPT_TEMPLATE_ID        TYPE STRING (optional)
* | [--->] I_NAME        TYPE STRING (optional)
* | [--->] I_TYPE        TYPE STRING (optional)
* | [--->] I_STATE        TYPE STRING (optional)
* | [--->] I_CONFLICT        TYPE BOOLEAN (default =c_boolean_false)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_DEPLOYMENT_RESRC_COLLECTION
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method LIST_DEPLOYMENTS.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/deployments'.

    " standard headers
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PROJECT_ID is supplied.
    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_SERVING_NAME is supplied.
    lv_queryparam = escape( val = i_SERVING_NAME format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `serving_name`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_TAG_VALUE is supplied.
    lv_queryparam = escape( val = i_TAG_VALUE format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `tag.value`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_ASSET_ID is supplied.
    lv_queryparam = escape( val = i_ASSET_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `asset_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PROMPT_TEMPLATE_ID is supplied.
    lv_queryparam = escape( val = i_PROMPT_TEMPLATE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `prompt_template_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_NAME is supplied.
    lv_queryparam = escape( val = i_NAME format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `name`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_TYPE is supplied.
    lv_queryparam = escape( val = i_TYPE format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `type`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_STATE is supplied.
    lv_queryparam = escape( val = i_STATE format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `state`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_CONFLICT is supplied.
    lv_queryparam = i_CONFLICT.
    add_query_parameter(
      exporting
        i_parameter  = `conflict`
        i_value      = lv_queryparam
        i_is_boolean = c_boolean_true
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.






    " execute HTTP GET request
    lo_response = HTTP_GET( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->DEPLOYMENTS_GET
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_DEPLOYMENT_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_DEPLOYMENT_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DEPLOYMENTS_GET.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/deployments/{deployment_id}'.
    replace all occurrences of `{deployment_id}` in ls_request_prop-url-path with i_DEPLOYMENT_ID ignoring case.

    " standard headers
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PROJECT_ID is supplied.
    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.






    " execute HTTP GET request
    lo_response = HTTP_GET( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->DEPLOYMENTS_UPDATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_DEPLOYMENT_ID        TYPE STRING
* | [--->] I_JSON_PATCH        TYPE TT_JSON_PATCH_OPERATION
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_contenttype       TYPE string (default ='application/json-patch+json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_DEPLOYMENT_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DEPLOYMENTS_UPDATE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/deployments/{deployment_id}'.
    replace all occurrences of `{deployment_id}` in ls_request_prop-url-path with i_DEPLOYMENT_ID ignoring case.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PROJECT_ID is supplied.
    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.




    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_JSON_PATCH ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_JSON_PATCH to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_JSON_PATCH i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'json-patch' i_value = i_JSON_PATCH ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_JSON_PATCH to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP PATCH request
    lo_response = HTTP_PATCH( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->DEPLOYMENTS_DELETE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_DEPLOYMENT_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DEPLOYMENTS_DELETE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/deployments/{deployment_id}'.
    replace all occurrences of `{deployment_id}` in ls_request_prop-url-path with i_DEPLOYMENT_ID ignoring case.

    " standard headers
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PROJECT_ID is supplied.
    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.






    " execute HTTP DELETE request
    lo_response = HTTP_DELETE( i_request_prop = ls_request_prop ).



endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->DEPLOYMENTS_TEXT_GENERATION
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_ID_OR_NAME        TYPE STRING
* | [--->] I_BODY        TYPE T_DEPLOYMENT_TEXT_GEN
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_TEXT_GEN_RESPONSE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DEPLOYMENTS_TEXT_GENERATION.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v1/deployments/{id_or_name}/text/generation'.
    replace all occurrences of `{id_or_name}` in ls_request_prop-url-path with i_ID_OR_NAME ignoring case.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).






    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_BODY ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_BODY to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_BODY i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'body' i_value = i_BODY ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_BODY to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP POST request
    lo_response = HTTP_POST( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->DEPLOYMENTS_TEXT_GEN_STREAM
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_ID_OR_NAME        TYPE STRING
* | [--->] I_BODY        TYPE T_DEPLOYMENT_TEXT_GEN
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='text/event-stream')
* | [<---] E_RESPONSE                    TYPE        T_Array
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DEPLOYMENTS_TEXT_GEN_STREAM.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v1/deployments/{id_or_name}/text/generation_stream'.
    replace all occurrences of `{id_or_name}` in ls_request_prop-url-path with i_ID_OR_NAME ignoring case.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).






    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_BODY ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_BODY to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_BODY i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'body' i_value = i_BODY ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_BODY to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP POST request
    lo_response = HTTP_POST( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->DEPLOYMENTS_TEXT_CHAT
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_ID_OR_NAME        TYPE STRING
* | [--->] I_BODY        TYPE T_DEPLOYMENT_TEXT_CHAT
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_TEXT_CHAT_RESPONSE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DEPLOYMENTS_TEXT_CHAT.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v1/deployments/{id_or_name}/text/chat'.
    replace all occurrences of `{id_or_name}` in ls_request_prop-url-path with i_ID_OR_NAME ignoring case.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).






    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_BODY ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_BODY to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_BODY i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'body' i_value = i_BODY ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_BODY to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP POST request
    lo_response = HTTP_POST( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->DEPLOYMENTS_TEXT_CHAT_STREAM
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_ID_OR_NAME        TYPE STRING
* | [--->] I_BODY        TYPE T_DEPLOYMENT_TEXT_CHAT
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='text/event-stream')
* | [<---] E_RESPONSE                    TYPE        T_Array
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DEPLOYMENTS_TEXT_CHAT_STREAM.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v1/deployments/{id_or_name}/text/chat_stream'.
    replace all occurrences of `{id_or_name}` in ls_request_prop-url-path with i_ID_OR_NAME ignoring case.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).






    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_BODY ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_BODY to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_BODY i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'body' i_value = i_BODY ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_BODY to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP POST request
    lo_response = HTTP_POST( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->LIST_FOUNDATION_MODEL_SPECS
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_FILTERS        TYPE STRING (optional)
* | [--->] I_TECH_PREVIEW        TYPE BOOLEAN (default =c_boolean_false)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_FOUNDATION_MODELS
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method LIST_FOUNDATION_MODEL_SPECS.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v1/foundation_model_specs'.

    " standard headers
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_START is supplied.
    lv_queryparam = escape( val = i_START format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `start`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_LIMIT is supplied.
    lv_queryparam = i_LIMIT.
    add_query_parameter(
      exporting
        i_parameter  = `limit`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_FILTERS is supplied.
    lv_queryparam = escape( val = i_FILTERS format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `filters`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_TECH_PREVIEW is supplied.
    lv_queryparam = i_TECH_PREVIEW.
    add_query_parameter(
      exporting
        i_parameter  = `tech_preview`
        i_value      = lv_queryparam
        i_is_boolean = c_boolean_true
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.






    " execute HTTP GET request
    lo_response = HTTP_GET( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->LIST_FOUNDATION_MODEL_TASKS
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_FOUNDATION_MODEL_TASKS
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method LIST_FOUNDATION_MODEL_TASKS.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v1/foundation_model_tasks'.

    " standard headers
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_START is supplied.
    lv_queryparam = escape( val = i_START format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `start`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_LIMIT is supplied.
    lv_queryparam = i_LIMIT.
    add_query_parameter(
      exporting
        i_parameter  = `limit`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.






    " execute HTTP GET request
    lo_response = HTTP_GET( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->POST_PROMPT
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_PROJECT_ID        TYPE STRING
* | [--->] I_WXPROMPTPOST        TYPE T_WX_PROMPT_POST
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_WX_PROMPT_RESPONSE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method POST_PROMPT.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/v1/prompts'.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.




    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_WXPROMPTPOST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_WXPROMPTPOST to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_WXPROMPTPOST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'WxPromptPost' i_value = i_WXPROMPTPOST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_WXPROMPTPOST to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP POST request
    lo_response = HTTP_POST( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->GET_PROMPT
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_PROJECT_ID        TYPE STRING
* | [--->] I_PROMPT_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_RESTRICT_MODEL_PARAMETERS        TYPE STRING (default ='true')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_WX_PROMPT_RESPONSE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method GET_PROMPT.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/v1/prompts/{prompt_id}'.
    replace all occurrences of `{prompt_id}` in ls_request_prop-url-path with i_PROMPT_ID ignoring case.

    " standard headers
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_RESTRICT_MODEL_PARAMETERS is supplied.
    lv_queryparam = escape( val = i_RESTRICT_MODEL_PARAMETERS format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `restrict_model_parameters`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.






    " execute HTTP GET request
    lo_response = HTTP_GET( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->PATCH_PROMPT
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_PROJECT_ID        TYPE STRING
* | [--->] I_PROMPT_ID        TYPE STRING
* | [--->] I_WXPROMPTPATCH        TYPE T_WX_PROMPT_PATCH
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_WX_PROMPT_RESPONSE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method PATCH_PROMPT.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/v1/prompts/{prompt_id}'.
    replace all occurrences of `{prompt_id}` in ls_request_prop-url-path with i_PROMPT_ID ignoring case.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.




    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_WXPROMPTPATCH ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_WXPROMPTPATCH to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_WXPROMPTPATCH i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'WxPromptPatch' i_value = i_WXPROMPTPATCH ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_WXPROMPTPATCH to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP PATCH request
    lo_response = HTTP_PATCH( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->DELETE_PROMPT
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_PROJECT_ID        TYPE STRING
* | [--->] I_PROMPT_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DELETE_PROMPT.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/v1/prompts/{prompt_id}'.
    replace all occurrences of `{prompt_id}` in ls_request_prop-url-path with i_PROMPT_ID ignoring case.

    " standard headers
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.






    " execute HTTP DELETE request
    lo_response = HTTP_DELETE( i_request_prop = ls_request_prop ).



endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->PUT_PROMPT_LOCK
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_PROMPT_ID        TYPE STRING
* | [--->] I_PROJECT_ID        TYPE STRING
* | [--->] I_PROMPTLOCK        TYPE T_PROMPT_LOCK
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_FORCE        TYPE BOOLEAN (optional)
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_PROMPT_LOCK
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method PUT_PROMPT_LOCK.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/v1/prompts/{prompt_id}/lock'.
    replace all occurrences of `{prompt_id}` in ls_request_prop-url-path with i_PROMPT_ID ignoring case.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_FORCE is supplied.
    lv_queryparam = i_FORCE.
    add_query_parameter(
      exporting
        i_parameter  = `force`
        i_value      = lv_queryparam
        i_is_boolean = c_boolean_true
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.




    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_PROMPTLOCK ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_PROMPTLOCK to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_PROMPTLOCK i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'PromptLock' i_value = i_PROMPTLOCK ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_PROMPTLOCK to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP PUT request
    lo_response = HTTP_PUT( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->GET_PROMPT_LOCK
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_PROMPT_ID        TYPE STRING
* | [--->] I_PROJECT_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_PROMPT_LOCK
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method GET_PROMPT_LOCK.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/v1/prompts/{prompt_id}/lock'.
    replace all occurrences of `{prompt_id}` in ls_request_prop-url-path with i_PROMPT_ID ignoring case.

    " standard headers
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.






    " execute HTTP GET request
    lo_response = HTTP_GET( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->GET_PROMPT_INPUT
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_PROMPT_ID        TYPE STRING
* | [--->] I_PROJECT_ID        TYPE STRING
* | [--->] I_WXPROMPTINPUTREQUEST        TYPE T_WX_PROMPT_INPUT_REQUEST (optional)
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_GET_PROMPT_INPUT_RESPONSE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method GET_PROMPT_INPUT.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/v1/prompts/{prompt_id}/input'.
    replace all occurrences of `{prompt_id}` in ls_request_prop-url-path with i_PROMPT_ID ignoring case.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.




    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    if not i_WXPROMPTINPUTREQUEST is initial.
    lv_datatype = get_datatype( i_WXPROMPTINPUTREQUEST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_WXPROMPTINPUTREQUEST to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_WXPROMPTINPUTREQUEST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'WxPromptInputRequest' i_value = i_WXPROMPTINPUTREQUEST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_WXPROMPTINPUTREQUEST to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP POST request
    lo_response = HTTP_POST( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->TEXT_CHAT
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_TEXTCHATREQUEST        TYPE T_TEXT_CHAT_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_TEXT_CHAT_RESPONSE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method TEXT_CHAT.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v1/text/chat'.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).






    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_TEXTCHATREQUEST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_TEXTCHATREQUEST to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_TEXTCHATREQUEST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'TextChatRequest' i_value = i_TEXTCHATREQUEST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_TEXTCHATREQUEST to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP POST request
    lo_response = HTTP_POST( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->TEXT_CHAT_STREAM
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_TEXTCHATREQUEST        TYPE T_TEXT_CHAT_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='text/event-stream')
* | [<---] E_RESPONSE                    TYPE        T_Array
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method TEXT_CHAT_STREAM.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v1/text/chat_stream'.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).






    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_TEXTCHATREQUEST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_TEXTCHATREQUEST to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_TEXTCHATREQUEST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'TextChatRequest' i_value = i_TEXTCHATREQUEST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_TEXTCHATREQUEST to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP POST request
    lo_response = HTTP_POST( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->TEXT_EMBEDDINGS
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_EMBEDDINGSREQUEST        TYPE T_EMBEDDINGS_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_EMBEDDINGS_RESPONSE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method TEXT_EMBEDDINGS.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v1/text/embeddings'.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).






    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_EMBEDDINGSREQUEST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_EMBEDDINGSREQUEST to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_EMBEDDINGSREQUEST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'EmbeddingsRequest' i_value = i_EMBEDDINGSREQUEST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_EMBEDDINGSREQUEST to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP POST request
    lo_response = HTTP_POST( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->TEXT_EXTRACTION
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_TEXTEXTRACTIONREQUEST        TYPE T_TEXT_EXTRACTION_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_TEXT_EXTRACTION_RESPONSE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method TEXT_EXTRACTION.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v1/text/extractions'.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).






    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_TEXTEXTRACTIONREQUEST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_TEXTEXTRACTIONREQUEST to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_TEXTEXTRACTIONREQUEST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'TextExtractionRequest' i_value = i_TEXTEXTRACTIONREQUEST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_TEXTEXTRACTIONREQUEST to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP POST request
    lo_response = HTTP_POST( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->LIST_TEXT_EXTRACTIONS
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_TEXT_EXTRACTION_RESOURCES
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method LIST_TEXT_EXTRACTIONS.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v1/text/extractions'.

    " standard headers
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PROJECT_ID is supplied.
    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_START is supplied.
    lv_queryparam = escape( val = i_START format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `start`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_LIMIT is supplied.
    lv_queryparam = i_LIMIT.
    add_query_parameter(
      exporting
        i_parameter  = `limit`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.






    " execute HTTP GET request
    lo_response = HTTP_GET( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->TEXT_EXTRACTION_GET
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_TEXT_EXTRACTION_RESPONSE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method TEXT_EXTRACTION_GET.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v1/text/extractions/{id}'.
    replace all occurrences of `{id}` in ls_request_prop-url-path with i_ID ignoring case.

    " standard headers
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PROJECT_ID is supplied.
    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.






    " execute HTTP GET request
    lo_response = HTTP_GET( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->TEXT_EXTRACTION_DELETE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_HARD_DELETE        TYPE BOOLEAN (optional)
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method TEXT_EXTRACTION_DELETE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v1/text/extractions/{id}'.
    replace all occurrences of `{id}` in ls_request_prop-url-path with i_ID ignoring case.

    " standard headers
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PROJECT_ID is supplied.
    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_HARD_DELETE is supplied.
    lv_queryparam = i_HARD_DELETE.
    add_query_parameter(
      exporting
        i_parameter  = `hard_delete`
        i_value      = lv_queryparam
        i_is_boolean = c_boolean_true
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.






    " execute HTTP DELETE request
    lo_response = HTTP_DELETE( i_request_prop = ls_request_prop ).



endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->TEXT_GENERATION
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_TEXTGENREQUEST        TYPE T_TEXT_GEN_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_TEXT_GEN_RESPONSE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method TEXT_GENERATION.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v1/text/generation'.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).






    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_TEXTGENREQUEST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_TEXTGENREQUEST to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_TEXTGENREQUEST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'TextGenRequest' i_value = i_TEXTGENREQUEST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_TEXTGENREQUEST to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP POST request
    lo_response = HTTP_POST( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->TEXT_GENERATION_STREAM
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_TEXTGENREQUEST        TYPE T_TEXT_GEN_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='text/event-stream')
* | [<---] E_RESPONSE                    TYPE        T_Array
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method TEXT_GENERATION_STREAM.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v1/text/generation_stream'.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).






    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_TEXTGENREQUEST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_TEXTGENREQUEST to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_TEXTGENREQUEST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'TextGenRequest' i_value = i_TEXTGENREQUEST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_TEXTGENREQUEST to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP POST request
    lo_response = HTTP_POST( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->TEXT_RERANK
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_RERANKREQUEST        TYPE T_RERANK_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_RERANK_RESPONSE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method TEXT_RERANK.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v1/text/rerank'.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).






    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_RERANKREQUEST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_RERANKREQUEST to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_RERANKREQUEST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'RerankRequest' i_value = i_RERANKREQUEST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_RERANKREQUEST to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP POST request
    lo_response = HTTP_POST( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->TEXT_TOKENIZATION
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_TEXTTOKENIZEREQUEST        TYPE T_TEXT_TOKENIZE_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_TEXT_TOKENIZE_RESPONSE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method TEXT_TOKENIZATION.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v1/text/tokenization'.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).






    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_TEXTTOKENIZEREQUEST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_TEXTTOKENIZEREQUEST to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_TEXTTOKENIZEREQUEST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'TextTokenizeRequest' i_value = i_TEXTTOKENIZEREQUEST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_TEXTTOKENIZEREQUEST to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP POST request
    lo_response = HTTP_POST( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->TIME_SERIES_FORECAST
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_TSFORECASTREQUEST        TYPE T_TSFORECAST_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_TSFORECAST_RESPONSE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method TIME_SERIES_FORECAST.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v1/time_series/forecast'.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).






    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_TSFORECASTREQUEST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_TSFORECASTREQUEST to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_TSFORECASTREQUEST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'TSForecastRequest' i_value = i_TSFORECASTREQUEST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_TSFORECASTREQUEST to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP POST request
    lo_response = HTTP_POST( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->TRAININGS_CREATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_TRAININGRESOURCEPROTOTYPE        TYPE T_TRAINING_RESOURCE_PROTOTYPE
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_TRAINING_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method TRAININGS_CREATE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/trainings'.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).






    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_TRAININGRESOURCEPROTOTYPE ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_TRAININGRESOURCEPROTOTYPE to <lv_text>.
      if ls_request_prop-header_content_type cp '*json' or ls_request_prop-header_content_type cp 'text*'.
        ls_request_prop-body = CAST string( <lv_text> )->*.
      else.
        ls_request_prop-body_bin = CAST xstring( <lv_text> )->*.
      endif.
    else.
      if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
         lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab or
         ls_request_prop-header_content_type cp '*json*'.
        if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-struct_deep or
           lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-itab.
          lv_bodyparam = abap_to_json( i_value = i_TRAININGRESOURCEPROTOTYPE i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'TrainingResourcePrototype' i_value = i_TRAININGRESOURCEPROTOTYPE ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_TRAININGRESOURCEPROTOTYPE to <lv_text>.
        lv_bodyparam = <lv_text>.
        concatenate lv_body lv_bodyparam into lv_body.
      endif.
      if ls_request_prop-header_content_type cp '*json*'.
        if lv_body is initial.
          lv_body = '{}'.
        elseif lv_body(1) ne '{' and lv_body(1) ne '['.
          lv_body = `{` && lv_body && `}`.
        endif.
      endif.

      if ls_request_prop-header_content_type cp '*charset=utf-8*'.
        ls_request_prop-body_bin = convert_string_to_utf8( i_string = lv_body ).
        "replace all occurrences of regex ';\s*charset=utf-8' in ls_request_prop-header_content_type with '' ignoring case.
        find_regex(
          exporting
            i_regex = ';\s*charset=utf-8'
            i_with = ''
            i_ignoring_case = 'X'
          changing
            c_in = ls_request_prop-header_content_type ).
      else.
        ls_request_prop-body = lv_body.
      endif.
    endif.


    " execute HTTP POST request
    lo_response = HTTP_POST( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->TRAININGS_LIST
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_TOTAL_COUNT        TYPE BOOLEAN (optional)
* | [--->] I_TAG_VALUE        TYPE STRING (optional)
* | [--->] I_STATE        TYPE STRING (optional)
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_TRAINING_RESOURCE_COLLECTION
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method TRAININGS_LIST.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/trainings'.

    " standard headers
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_START is supplied.
    lv_queryparam = escape( val = i_START format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `start`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_LIMIT is supplied.
    lv_queryparam = i_LIMIT.
    add_query_parameter(
      exporting
        i_parameter  = `limit`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_TOTAL_COUNT is supplied.
    lv_queryparam = i_TOTAL_COUNT.
    add_query_parameter(
      exporting
        i_parameter  = `total_count`
        i_value      = lv_queryparam
        i_is_boolean = c_boolean_true
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_TAG_VALUE is supplied.
    lv_queryparam = escape( val = i_TAG_VALUE format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `tag.value`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_STATE is supplied.
    lv_queryparam = escape( val = i_STATE format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `state`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PROJECT_ID is supplied.
    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.






    " execute HTTP GET request
    lo_response = HTTP_GET( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->TRAININGS_GET
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_TRAINING_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_TRAINING_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method TRAININGS_GET.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/trainings/{training_id}'.
    replace all occurrences of `{training_id}` in ls_request_prop-url-path with i_TRAINING_ID ignoring case.

    " standard headers
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PROJECT_ID is supplied.
    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.






    " execute HTTP GET request
    lo_response = HTTP_GET( i_request_prop = ls_request_prop ).


    " retrieve JSON data
    lv_json = get_response_string( lo_response ).
    parse_json(
      exporting
        i_json       = lv_json
        i_dictionary = c_abapname_dictionary
      changing
        c_abap       = e_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->TRAININGS_DELETE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_TRAINING_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_HARD_DELETE        TYPE BOOLEAN (optional)
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method TRAININGS_DELETE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/trainings/{training_id}'.
    replace all occurrences of `{training_id}` in ls_request_prop-url-path with i_TRAINING_ID ignoring case.

    " standard headers
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_SPACE_ID is supplied.
    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PROJECT_ID is supplied.
    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_HARD_DELETE is supplied.
    lv_queryparam = i_HARD_DELETE.
    add_query_parameter(
      exporting
        i_parameter  = `hard_delete`
        i_value      = lv_queryparam
        i_is_boolean = c_boolean_true
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.






    " execute HTTP DELETE request
    lo_response = HTTP_DELETE( i_request_prop = ls_request_prop ).



endmethod.


ENDCLASS.
