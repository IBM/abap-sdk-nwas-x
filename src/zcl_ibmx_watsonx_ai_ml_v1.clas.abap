* Copyright 2019, 2024 IBM Corp. All Rights Reserved.
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
    "!    The context for prompt tuning metrics.</p>
    begin of T_PRMPT_TUNING_METRICS_CONTEXT,
      "!   The location where the prompt tuning metrics are stored.
      METRICS_LOCATION type STRING,
    end of T_PRMPT_TUNING_METRICS_CONTEXT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Provides extra information for this training stage in the</p>
    "!     context of auto-ml.
    begin of T_METRICS_CONTEXT,
      "!   The deployment that created the metrics.
      DEPLOYMENT_ID type STRING,
      "!   The context for prompt tuning metrics.
      PROMPT_TUNING type T_PRMPT_TUNING_METRICS_CONTEXT,
    end of T_METRICS_CONTEXT.
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
    "!    A metric.</p>
    begin of T_TRAINING_METRIC,
      "!   A timestamp for the metrics.
      TIMESTAMP type DATETIME,
      "!   The iteration number.
      ITERATION type INTEGER,
      "!   The metrics.
      ML_METRICS type MAP,
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
    begin of T_MDRTN_HAP_INPUT_PROPERTIES,
      "!   Properties that control the moderation on the text.
      INPUT type T_TEXT_MODERATION,
      "!   The properties specific to masking. If this object exists,<br/>
      "!   even if it is empty, then masking will be applied.
      MASK type T_MASK_PROPERTIES,
    end of T_MDRTN_HAP_INPUT_PROPERTIES.
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
    begin of T_TEXT_GEN_RESULT,
      "!   The text that was generated by the model.
      GENERATED_TEXT type STRING,
      "!   The number of generated tokens.
      GENERATED_TOKEN_COUNT type INTEGER,
      "!   The number of input tokens consumed.
      INPUT_TOKEN_COUNT type INTEGER,
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
    end of T_TEXT_GEN_RESULT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    System details.</p>
    begin of T_TEXT_GEN_RESPONSE,
      "!   The `id` of the model for inference.
      MODEL_ID type STRING,
      "!   The model version (using semantic versioning) if set.
      MODEL_VERSION type STRING,
      "!   The time when the response was created.
      CREATED_AT type DATETIME,
      "!   The generated tokens.
      RESULTS type STANDARD TABLE OF T_TEXT_GEN_RESULT WITH NON-UNIQUE DEFAULT KEY,
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
    "!    The target of the error.</p>
    begin of T_ERROR_TARGET,
      "!   The type of the problematic field.
      TYPE type STRING,
      "!   The name of the problematic field.
      NAME type STRING,
    end of T_ERROR_TARGET.
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
    "!    A notebook runtime.</p>
    begin of T_NOTEBOOK_RUNTIME,
      "!   The guid of the environment on which the notebook runs.
      ENVIRONMENT type STRING,
      "!   Spark monitoring enabled or not.
      SPARK_MONITORING_ENABLED type BOOLEAN,
    end of T_NOTEBOOK_RUNTIME.
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
    "! No documentation available.
    begin of T_WX_PRMPT_SSSN_ENTRY_LST_RSL1,
      "!   The prompt entry&apos;s ID.
      ID type STRING,
      "!   The prompt entry&apos;s name.
      NAME type STRING,
      "!   The prompt entry&apos;s description.
      DESCRIPTION type STRING,
      "!   The prompt entry&apos;s create time in millis.
      CREATED_AT type INTEGER,
    end of T_WX_PRMPT_SSSN_ENTRY_LST_RSL1.
  types:
    "! No documentation available.
    begin of T_WX_PROMPT_SESSION_ENTRY_LIST,
      "!   No documentation available.
      RESULTS type STANDARD TABLE OF T_WX_PRMPT_SSSN_ENTRY_LST_RSL1 WITH NON-UNIQUE DEFAULT KEY,
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
    "!    Payload for copying a notebook.</p>
    begin of T_NOTEBOOK_COPY_BODY,
      "!   The name of the new notebook.
      NAME type STRING,
      "!   The guid of the notebook to be copied.
      SOURCE_GUID type STRING,
    end of T_NOTEBOOK_COPY_BODY.
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
    "! No documentation available.
    begin of T_WX_PROMPT_INPUT_REQUEST,
      "!   Override input string that will be used to generate the response. The string can
      "!    contain template parameters.
      INPUT type STRING,
      "!   Supply only to replace placeholders. Object content must be key:value pairs
      "!    where the &apos;key&apos; is the parameter to replace and &apos;value&apos; is
      "!    the value to use.
      PROMPT_VARIABLE type MAP,
    end of T_WX_PROMPT_INPUT_REQUEST.
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
    "!    Contains a set of fields specific to each connection. See</p>
    "!     here for [details about specifying connections](#datareferences).
      T_DATA_CONNECTION type JSONOBJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A reference to data.</p>
    begin of T_OBJECT_LOCATION,
      "!   Item identification inside a collection.
      ID type STRING,
      "!   The data source type like `connection_asset` or `data_asset`.
      TYPE type STRING,
      "!   Contains a set of fields specific to each connection.<br/>
      "!   See here for [details about specifying connections](#datareferences).
      CONNECTION type T_DATA_CONNECTION,
      "!   Contains a set of fields that describe the location of the data with respect to
      "!    the `connection`.
      LOCATION type MAP,
    end of T_OBJECT_LOCATION.
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
      "!   The training results. Normally this is specified as `type=container` which<br/>
      "!   means that it is stored in the space or project.
      RESULTS_REFERENCE type T_OBJECT_LOCATION,
    end of T_TRAINING_RESOURCE_PROTOTYPE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The parameters for text tokenization.</p>
    begin of T_TEXT_TOKENIZE_PARAMETERS,
      "!   If this is `true` then the actual tokens will also be returned in the response.
      RETURN_TOKENS type BOOLEAN,
    end of T_TEXT_TOKENIZE_PARAMETERS.
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
    "! <p class="shorttext synchronized" lang="en">
    "!    Runtime info returned with a notebook listing.</p>
    begin of T_NOTEBOOK_RESOURCE_ENTITY_RT,
      "!   If Spark monitoring is enabled.
      SPARK_MONITORING_ENABLED type BOOLEAN,
      "!   UUID of the environment of the notebook.
      ENVIRONMENT type STRING,
    end of T_NOTEBOOK_RESOURCE_ENTITY_RT.
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
      "!   The time when the response was created.
      CREATED_AT type DATETIME,
      "!   The generated tokens.
      RESULTS type STANDARD TABLE OF T_TEXT_GEN_RESULT WITH NON-UNIQUE DEFAULT KEY,
    end of T_TEXT_GEN_RESPONSE_FIELDS.
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
    "!    The properties specific to PII.</p>
    begin of T_MODERATION_PII_PROPERTIES,
      "!   Properties that control the moderation on the text.
      INPUT type T_TEXT_MODERATION,
      "!   Properties that control the moderation on the text.
      OUTPUT type T_TEXT_MODERATION,
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
    "!    The template properties if this request refers to a prompt</p>
    "!     template.
    begin of T_DPLYMNT_TEXT_GEN_PROPERTIES,
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
      "!    sequence length`. Zero means don&apos;t truncate.
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
    end of T_DPLYMNT_TEXT_GEN_PROPERTIES.
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
      PARAMETERS type T_DPLYMNT_TEXT_GEN_PROPERTIES,
      "!   Properties that control the moderations, for usages such as `Hate and profanity`
      "!    (HAP) and `Personal identifiable information` (PII) filtering. This list can be
      "!    extended with new types of moderations.
      MODERATIONS type T_MODERATIONS,
    end of T_DEPLOYMENT_TEXT_GEN.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The embedding values for a text string. The `input` field is</p>
    "!     only set if the corresponding `return_option` is set.
    begin of T_EMBEDDING,
      "!   The text input to the model.
      INPUT type STRING,
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
      "!   The time when the response was created.
      CREATED_AT type DATETIME,
      "!   The number of input tokens that were consumed.
      INPUT_TOKEN_COUNT type INTEGER,
    end of T_EMBEDDINGS_RESPONSE_FIELDS.
  types:
    "! No documentation available.
    begin of T_EXTRNL_INFRMTN_EXTRNL_MODEL,
      "!   No documentation available.
      NAME type STRING,
      "!   No documentation available.
      URL type STRING,
    end of T_EXTRNL_INFRMTN_EXTRNL_MODEL.
  types:
    "! No documentation available.
    begin of T_EXTRNL_INFRMTN_EXTRNL_PROMPT,
      "!   No documentation available.
      URL type STRING,
      "!   No documentation available.
      ADDITIONAL_INFORMATION type STANDARD TABLE OF T_Array WITH NON-UNIQUE DEFAULT KEY,
    end of T_EXTRNL_INFRMTN_EXTRNL_PROMPT.
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
      EXTERNAL_PROMPT type T_EXTRNL_INFRMTN_EXTRNL_PROMPT,
      "!   No documentation available.
      EXTERNAL_MODEL type T_EXTRNL_INFRMTN_EXTRNL_MODEL,
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
    begin of T_PRMPT_WTH_EXTRNL_MODEL_PARAM,
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
    end of T_PRMPT_WTH_EXTRNL_MODEL_PARAM.
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
      MODEL_PARAMETERS type T_PRMPT_WTH_EXTRNL_MODEL_PARAM,
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
    "!    A reference to a resource.</p>
    begin of T_SIMPLE_REL,
      "!   The id of the referenced resource.
      ID type STRING,
    end of T_SIMPLE_REL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The return options for text embeddings.</p>
    begin of T_EMBEDDING_RETURN_OPTIONS,
      "!   Include the `input` text in each of the `results` documents.
      INPUT_TEXT type BOOLEAN,
    end of T_EMBEDDING_RETURN_OPTIONS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Parameters for text embedding requests.</p>
    begin of T_EMBEDDING_PARAMETERS,
      "!   Represents the maximum number of input tokens accepted. This can be used to
      "!    avoid requests failing due to input being longer than configured limits. If the
      "!    text is truncated, then it truncates the end of the input (on the right), so
      "!    the start of the input will remain the same. If this value exceeds the `maximum
      "!    sequence length` (refer to the documentation to find this value for the model)
      "!    then the call will fail if the total number of tokens exceeds the `maximum
      "!    sequence length`. Zero means don&apos;t truncate.
      TRUNCATE_INPUT_TOKENS type INTEGER,
      "!   The return options for text embeddings.
      RETURN_OPTIONS type T_EMBEDDING_RETURN_OPTIONS,
    end of T_EMBEDDING_PARAMETERS.
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
      T_DATA_LOCATION type MAP.
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
    "!    A reference to a resource.</p>
    begin of T_REL,
      "!   The id of the referenced resource.
      ID type STRING,
      "!   The revision of the referenced resource.
      REV type STRING,
    end of T_REL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The deployment request entity (this description is not</p>
    "!     used).
    begin of T_DPLYMNT_RESOURCE_PROTOTYPE,
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
      ASSET type T_REL,
      "!   A reference to a resource.
      PROMPT_TEMPLATE type T_SIMPLE_REL,
      "!   Indicates that this is an online deployment. An object has to be specified but
      "!    can be empty.<br/>
      "!   The `serving_name` can be provided in the `online.parameters`.
      ONLINE type T_ONLINE_DEPLOYMENT,
      "!   A hardware specification.
      HARDWARE_SPEC type T_HARDWARE_SPEC,
      "!   The base model that is required for this deployment if this is for a prompt
      "!    template or a prompt tune for an IBM foundation model.
      BASE_MODEL_ID type STRING,
    end of T_DPLYMNT_RESOURCE_PROTOTYPE.
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
    "! No documentation available.
    begin of T_RESULTS_REFERENCE_INPUT,
      "!   The training results. Normally this is specified as `type=container` which<br/>
      "!   means that it is stored in the space or project.
      RESULTS_REFERENCE type T_OBJECT_LOCATION,
    end of T_RESULTS_REFERENCE_INPUT.
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
    "!    A notebook version in a project.</p>
    begin of T_NTBK_VER_CRE_RESP_NTBK_VER_1,
      "!   Notebook version metadata.
      METADATA type T_NOTEBOOK_VERSION_METADATA,
      "!   A notebook version entity in a project.
      ENTITY type T_NTBK_VER_ENTITY_IN_PROJECT,
    end of T_NTBK_VER_CRE_RESP_NTBK_VER_1.
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
    begin of T_NOTEBOOK_IN_PROJECT,
      "!   Metadata of a notebook in a project.
      METADATA type T_NOTEBOOK_METADATA_IN_PROJECT,
      "!   Entity of a notebook.
      ENTITY type T_NOTEBOOK_ENTITY,
    end of T_NOTEBOOK_IN_PROJECT.
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
    "!    The `id` of the model to be used for this request. Please</p>
    "!     refer to the [list of
    "!     models](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/fm-mod
    "!    els-embed.html?context=wx&audience=wdp).
      T_EMBEDDING_MODEL_ID type String.
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
    "! No documentation available.
      T_NOTEBOOK_VER_RETRIEVE_RESP type JSONOBJECT.
  types:
    "! No documentation available.
    begin of T_WX_PROMPT_POST_MODEL_VERSION,
      "!   User provided semvar version for tracking in IBM AI Factsheets.
      NUMBER type STRING,
      "!   User provived tag.
      TAG type STRING,
      "!   Description of the version.
      DESCRIPTION type STRING,
    end of T_WX_PROMPT_POST_MODEL_VERSION.
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
    "!    The properties specific to `watsonx.ai` deployments.</p>
    begin of T_DEPLOYMENT_RESOURCE_ENTITY,
      "!   The base model that is required for this deployment if this is for a prompt
      "!    template or a prompt tune for an IBM foundation model.
      BASE_MODEL_ID type STRING,
    end of T_DEPLOYMENT_RESOURCE_ENTITY.
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
    "!    A text to rank.</p>
    begin of T_RERANK_INPUT,
      "!   The text to rank.
      TEXT type STRING,
    end of T_RERANK_INPUT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The ranking score for the input.</p>
    begin of T_RERANKED_RESULTS,
      "!   A text to rank.
      INPUT type T_RERANK_INPUT,
      "!   The score of the input.
      SCORE type NUMBER,
    end of T_RERANKED_RESULTS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The ranked results.</p>
    begin of T_RERANK_RESPONSE_FIELDS,
      "!   The `id` of the model to be used for this request. Please refer to the [list of
      "!    models](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/fm-mod
      "!   els-embed.html?context=wx&audience=wdp).
      MODEL_ID type STRING,
      "!   The rank query.
      QUERY type STRING,
      "!   The ranked results.
      RESULTS type STANDARD TABLE OF T_RERANKED_RESULTS WITH NON-UNIQUE DEFAULT KEY,
      "!   The time when the response was created.
      CREATED_AT type DATETIME,
      "!   The number of input tokens that were consumed.
      INPUT_TOKEN_COUNT type INTEGER,
    end of T_RERANK_RESPONSE_FIELDS.
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
      "!   The time when the response was created.
      CREATED_AT type DATETIME,
      "!   The number of input tokens that were consumed.
      INPUT_TOKEN_COUNT type INTEGER,
    end of T_SIMILARITY_RESPONSE_FIELDS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The properties specific to PII.</p>
    begin of T_MDRTN_PII_INPUT_PROPERTIES,
      "!   Properties that control the moderation on the text.
      INPUT type T_TEXT_MODERATION,
      "!   The properties specific to masking. If this object exists,<br/>
      "!   even if it is empty, then masking will be applied.
      MASK type T_MASK_PROPERTIES,
    end of T_MDRTN_PII_INPUT_PROPERTIES.
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
    "!    The definition of the deployment.</p>
    begin of T_DEPLOYMENT_ENTITY,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   A reference to a resource.
      ASSET type T_REL,
      "!   A reference to a resource.
      PROMPT_TEMPLATE type T_SIMPLE_REL,
      "!   Indicates that this is an online deployment. An object has to be specified but
      "!    can be empty.<br/>
      "!   The `serving_name` can be provided in the `online.parameters`.
      ONLINE type T_ONLINE_DEPLOYMENT,
      "!   A hardware specification.
      HARDWARE_SPEC type T_HARDWARE_SPEC,
      "!   The base model that is required for this deployment if this is for a prompt
      "!    template or a prompt tune for an IBM foundation model.
      BASE_MODEL_ID type STRING,
      "!   The type of the deployed model. The possible values are the following: 1.
      "!    `prompt_tune` - when a prompt tuned model is deployed. 2. `foundation_model` -
      "!    when a prompt template is used on a pre-deployed IBM provided model.
      DEPLOYED_ASSET_TYPE type STRING,
      "!   The verbalizer that was used to train this model if the deployment has
      "!    `deployed_asset_type` of `prompt_tune`.
      VERBALIZER type STRING,
      "!   Specifies the current status, additional information about the deployment<br/>
      "!   and any failure messages in case of deployment failures.
      STATUS type T_DEPLOYMENT_STATUS,
    end of T_DEPLOYMENT_ENTITY.
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
    "!    A minor or patch version for the model.</p>
    begin of T_FOUNDATION_MODEL_VERSION,
      "!   The version of the model. This must follow semantic versioning semantics.
      VERSION type STRING,
      "!   The date (ISO 8601 format YYYY-MM-DD) when this version first became available.
      AVAILABLE_DATE type DATE,
    end of T_FOUNDATION_MODEL_VERSION.
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
    end of T_FOUNDATION_MODEL.
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
    "! No documentation available.
    begin of T_EXTRNL_PRMPT_ADDTNL_INFRMTN1,
      "!   No documentation available.
      KEY type STRING,
    end of T_EXTRNL_PRMPT_ADDTNL_INFRMTN1.
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
    begin of T_DPLYMNT_RESOURCE_COLLECTION,
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
    end of T_DPLYMNT_RESOURCE_COLLECTION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Represents the maximum number of input tokens accepted. This</p>
    "!     can be used to avoid requests failing due to input being longer than configured
    "!     limits. If the text is truncated, then it truncates the start of the input (on
    "!     the left), so the end of the input will remain the same. If this value exceeds
    "!     the `maximum sequence length` (refer to the documentation to find this value
    "!     for the model) then the call will fail if the total number of tokens exceeds
    "!     the `maximum sequence length`. Zero means don&apos;t truncate.
      T_PRM_TRNCT_INPT_TKNS_FRM_STRT type Integer.
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
    "! No documentation available.
    begin of T_WX_PROMPT_RESP_MODEL_VERSION,
      "!   User provided semvar version for tracking in IBM AI Factsheets.
      NUMBER type STRING,
      "!   User provived tag.
      TAG type STRING,
      "!   Description of the version.
      DESCRIPTION type STRING,
    end of T_WX_PROMPT_RESP_MODEL_VERSION.
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
    "!    Optional details coming from the service and related to the</p>
    "!     API call or the associated resource.
    begin of T_TRAIN_RSRC_COLLECTION_SYS,
      "!   Any warnings coming from the system.
      WARNINGS type STANDARD TABLE OF T_WARNING WITH NON-UNIQUE DEFAULT KEY,
    end of T_TRAIN_RSRC_COLLECTION_SYS.
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
      SYSTEM type T_TRAIN_RSRC_COLLECTION_SYS,
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
    "!    The prompt variables.</p>
      T_PROMPT_VARIABLES type MAP.
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
    "!    Asset API asset description returned with a notebook</p>
    "!     listing.
    begin of T_NTBK_RESOURCE_ENTITY_ASSET,
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
    end of T_NTBK_RESOURCE_ENTITY_ASSET.
  types:
    "! No documentation available.
      T_EXTRNL_PRMPT_ADDTNL_INFRMTN type STANDARD TABLE OF T_EXTRNL_PRMPT_ADDTNL_INFRMTN1 WITH NON-UNIQUE DEFAULT KEY.
  types:
    "! No documentation available.
    begin of T_WX_PROMPT_PATCH_MODEL_VER,
      "!   User provided semvar version for tracking in IBM AI Factsheets.
      NUMBER type STRING,
      "!   User provived tag.
      TAG type STRING,
      "!   Description of the version.
      DESCRIPTION type STRING,
    end of T_WX_PROMPT_PATCH_MODEL_VER.
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
    "! <p class="shorttext synchronized" lang="en">
    "!    Status of the training job.</p>
    begin of T_TRAINING_STATUS_OUTPUT,
      "!   Status of the training job.
      STATUS type T_TRAINING_STATUS,
    end of T_TRAINING_STATUS_OUTPUT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Entity of notebook info returned in a listing.</p>
    begin of T_NOTEBOOK_RESOURCE_ENTITY,
      "!   Asset API asset description returned with a notebook listing.
      ASSET type T_NTBK_RESOURCE_ENTITY_ASSET,
      "!   Runtime info returned with a notebook listing.
      RUNTIME type T_NOTEBOOK_RESOURCE_ENTITY_RT,
    end of T_NOTEBOOK_RESOURCE_ENTITY.
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
    "!    Represents the maximum number of input tokens accepted. This</p>
    "!     can be used to avoid requests failing due to input being longer than configured
    "!     limits. If the text is truncated, then it truncates the end of the input (on
    "!     the right), so the start of the input will remain the same. If this value
    "!     exceeds the `maximum sequence length` (refer to the documentation to find this
    "!     value for the model) then the call will fail if the total number of tokens
    "!     exceeds the `maximum sequence length`. Zero means don&apos;t truncate.
      T_PRM_TRNCT_INPT_TKNS_FROM_END type Integer.
  types:
    "! No documentation available.
      T_NOTEBOOK_VER_CREATE_RESPONSE type JSONOBJECT.
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
    "!    Notebook info returned in a listing.</p>
    begin of T_NOTEBOOK_RESOURCE,
      "!   Metadata of notebook info returned in a listing.
      METADATA type T_NOTEBOOK_RESOURCE_METADATA,
      "!   Entity of notebook info returned in a listing.
      ENTITY type T_NOTEBOOK_RESOURCE_ENTITY,
    end of T_NOTEBOOK_RESOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The number of input tokens that were consumed.</p>
      T_INPUT_TOKEN_COUNT type Integer.
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
    "!    A list of notebook info as returned by a list query.</p>
    begin of T_NOTEBOOKS_RESOURCE_LIST,
      "!   The number of items in the resources list.
      TOTAL_RESULTS type INTEGER,
      "!   An array of notebooks.
      RESOURCES type STANDARD TABLE OF T_NOTEBOOK_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
    end of T_NOTEBOOKS_RESOURCE_LIST.
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
      "!   The time when the response was created.
      CREATED_AT type DATETIME,
      "!   The number of input tokens that were consumed.
      INPUT_TOKEN_COUNT type INTEGER,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_EMBEDDINGS_RESPONSE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A set of server sent events, each event contains a response</p>
    "!     for one or more tokens. The results will be an array of events of the form
    "!     `data: &#123;&lt;json event&gt;&#125;` where the schema of the individual `json
    "!     event` is described below.
      T_TEXT_GEN_STREAM_RESPONSE type STANDARD TABLE OF T_TEXT_GEN_RESPONSE WITH NON-UNIQUE DEFAULT KEY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The template properties if this request refers to a prompt</p>
    "!     template.
    begin of T_PROMPT_TEMPLATE_VARIABLES,
      "!   The prompt variables.
      PROMPT_VARIABLES type MAP,
    end of T_PROMPT_TEMPLATE_VARIABLES.
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
    begin of T_NTBK_CRE_RESP_NTBK_FOR_COPY,
      "!   Metadata of a notebook in a project.
      METADATA type T_NOTEBOOK_METADATA_IN_PROJECT,
      "!   Entity of a notebook copied from a source.
      ENTITY type T_NOTEBOOK_ENTITY_FOR_COPY,
    end of T_NTBK_CRE_RESP_NTBK_FOR_COPY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A prompt to be used to infer the next tokens.</p>
      T_DEPLOYMENT_TEXT_GEN_REQUEST type T_DEPLOYMENT_TEXT_GEN.
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
      "!    sequence length`. Zero means don&apos;t truncate.
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
      "!    sequence length`. Zero means don&apos;t truncate.
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
    "!    The common fields between a request and the response.</p>
    begin of T_DEPLOYMENT_ENTITY_COMMON,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   A reference to a resource.
      ASSET type T_REL,
      "!   A reference to a resource.
      PROMPT_TEMPLATE type T_SIMPLE_REL,
      "!   Indicates that this is an online deployment. An object has to be specified but
      "!    can be empty.<br/>
      "!   The `serving_name` can be provided in the `online.parameters`.
      ONLINE type T_ONLINE_DEPLOYMENT,
      "!   A hardware specification.
      HARDWARE_SPEC type T_HARDWARE_SPEC,
    end of T_DEPLOYMENT_ENTITY_COMMON.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    System details.</p>
    begin of T_RERANK_RESPONSE,
      "!   The `id` of the model to be used for this request. Please refer to the [list of
      "!    models](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/fm-mod
      "!   els-embed.html?context=wx&audience=wdp).
      MODEL_ID type STRING,
      "!   The rank query.
      QUERY type STRING,
      "!   The ranked results.
      RESULTS type STANDARD TABLE OF T_RERANKED_RESULTS WITH NON-UNIQUE DEFAULT KEY,
      "!   The time when the response was created.
      CREATED_AT type DATETIME,
      "!   The number of input tokens that were consumed.
      INPUT_TOKEN_COUNT type INTEGER,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_RERANK_RESPONSE.
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
      PROMPT_VARIABLE type MAP,
      "!   Input mode in use for the prompt.
      INPUT_MODE type STRING,
      "!   No documentation available.
      PROMPT type T_PROMPT,
    end of T_WX_PROMPT_PATCH.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The rank query.</p>
      T_RERANK_QUERY type String.
  types:
    "! No documentation available.
      T_PROMPT_VARIABLE_STRING type String.
  types:
    "! No documentation available.
      T_NOTEBOOK_CREATE_RESPONSE type JSONOBJECT.
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
    "!    Array of patch operations as defined in RFC 6902.</p>
      T_JSON_PATCH type STANDARD TABLE OF T_JSON_PATCH_OPERATION WITH NON-UNIQUE DEFAULT KEY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A list of tags for this resource.</p>
      T_TAGS type TT_String.
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
    "!    Information of a copied notebook as returned by a GET</p>
    "!     request.
    begin of T_NOTEBOOK_FOR_COPY,
      "!   Metadata of a notebook in a project.
      METADATA type T_NOTEBOOK_METADATA_IN_PROJECT,
      "!   Entity of a notebook copied from a source.
      ENTITY type T_NOTEBOOK_ENTITY_FOR_COPY,
    end of T_NOTEBOOK_FOR_COPY.
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
      "!   The time when the response was created.
      CREATED_AT type DATETIME,
      "!   The number of input tokens that were consumed.
      INPUT_TOKEN_COUNT type INTEGER,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_SIMILARITY_RESPONSE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The time when the response was created.</p>
      T_CREATED_AT type DATETIME.
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
    "!   Array parameter type for method DEPLOYMENTS_UPDATE</p>
    TT_JSON_PATCH_OPERATION type STANDARD TABLE OF T_JSON_PATCH_OPERATION WITH NON-UNIQUE DEFAULT KEY.

constants:
  "! <p class="shorttext synchronized" lang="en">List of required fields per type.</p>
  begin of C_REQUIRED_FIELDS,
    T_PRMPT_TUNING_METRICS_CONTEXT type string value '|',
    T_METRICS_CONTEXT type string value '|',
    T_MESSAGE type string value '|',
    T_API_ERROR_TARGET type string value '|TYPE|NAME|',
    T_API_ERROR type string value '|CODE|MESSAGE|',
    T_API_ERROR_RESPONSE type string value '|TRACE|ERRORS|',
    T_TRAINING_METRIC type string value '|',
    T_TRAINING_STATUS type string value '|STATE|',
    T_NOTEBOOK_ORIGIN_FROM_SOURCE type string value '|',
    T_TRAINING_NUM_EPOCHS type string value '|',
    T_LIFE_CYCLE_STATE type string value '|ID|',
    T_CONSUMPTIONS_LIMIT type string value '|',
    T_TRAINING_INIT_METHOD type string value '|',
    T_DATA_SCHEMA type string value '|ID|FIELDS|',
    T_NTBK_VER_ENTITY_IN_PROJECT type string value '|PROJECT_ID|',
    T_TEXT_MODERATION type string value '|',
    T_MASK_PROPERTIES type string value '|',
    T_MDRTN_HAP_INPUT_PROPERTIES type string value '|',
    T_TEXT_GEN_TOP_TOKEN_INFO type string value '|',
    T_WARNING type string value '|MESSAGE|',
    T_SYSTEM_DETAILS type string value '|',
    T_MODERATION_TEXT_RANGE type string value '|START|END|',
    T_MODERATION_RESULT type string value '|SCORE|INPUT|POSITION|ENTITY|',
    T_MODERATION_RESULTS type string value '|',
    T_TEXT_GEN_TOKEN_INFO type string value '|',
    T_TEXT_GEN_RESULT type string value '|GENERATED_TEXT|STOP_REASON|',
    T_TEXT_GEN_RESPONSE type string value '|MODEL_ID|CREATED_AT|RESULTS|',
    T_STATS type string value '|',
    T_DEPLOYMENT_SYSTEM_DETAILS type string value '|',
    T_DEPLOYMENT_SYSTEM type string value '|',
    T_ERROR_TARGET type string value '|TYPE|NAME|',
    T_ERROR type string value '|CODE|MESSAGE|',
    T_NOTEBOOK_KERNEL type string value '|',
    T_NOTEBOOK_METADATA type string value '|',
    T_NOTEBOOK_RUNTIME type string value '|ENVIRONMENT|',
    T_NOTEBOOK_ORIGIN type string value '|',
    T_NOTEBOOK_ENTITY_DEFINITION type string value '|',
    T_NOTEBOOK_ENTITY type string value '|',
    T_NOTEBOOK type string value '|',
    T_WX_PRMPT_SSSN_ENTRY_LST_RSL1 type string value '|',
    T_WX_PROMPT_SESSION_ENTRY_LIST type string value '|',
    T_RESOURCE_META_SIMPLE type string value '|ID|CREATED_AT|',
    T_NOTEBOOK_COPY_BODY type string value '|NAME|SOURCE_GUID|',
    T_TRAINING_RESOURCE_DETAILS type string value '|NAME|',
    T_HAP_PROPERTIES type string value '|',
    T_WX_PROMPT_INPUT_REQUEST type string value '|',
    T_RESOURCE_COMMIT_INFO type string value '|COMMITTED_AT|',
    T_OBJECT_LOCATION type string value '|TYPE|LOCATION|',
    T_DATA_CONNECTION_REFERENCE type string value '|TYPE|',
    T_BASE_MODEL type string value '|',
    T_PROMPT_TUNING type string value '|TASK_ID|',
    T_TRAINING_RESOURCE_PROTOTYPE type string value '|NAME|RESULTS_REFERENCE|',
    T_TEXT_TOKENIZE_PARAMETERS type string value '|',
    T_TEXT_TOKENIZE_REQUEST type string value '|MODEL_ID|INPUT|',
    T_NOTEBOOK_RESOURCE_ENTITY_RT type string value '|',
    T_TEXT_GEN_RESPONSE_FIELDS type string value '|MODEL_ID|CREATED_AT|RESULTS|',
    T_RETURN_OPTION_PROPERTIES type string value '|',
    T_MODERATION_HAP_PROPERTIES type string value '|',
    T_MODERATION_PII_PROPERTIES type string value '|',
    T_TEXT_GEN_LENGTH_PENALTY type string value '|',
    T_DPLYMNT_TEXT_GEN_PROPERTIES type string value '|',
    T_MODERATIONS type string value '|',
    T_DEPLOYMENT_TEXT_GEN type string value '|',
    T_EMBEDDING type string value '|EMBEDDING|',
    T_EMBEDDINGS_RESPONSE_FIELDS type string value '|MODEL_ID|RESULTS|CREATED_AT|INPUT_TOKEN_COUNT|',
    T_EXTRNL_INFRMTN_EXTRNL_MODEL type string value '|NAME|URL|',
    T_EXTRNL_INFRMTN_EXTRNL_PROMPT type string value '|URL|',
    T_EXTERNAL_INFORMATION type string value '|EXTERNAL_PROMPT_ID|EXTERNAL_MODEL_ID|EXTERNAL_MODEL_PROVIDER|',
    T_CHAT_ITEM type string value '|',
    T_PRMPT_WTH_EXTRNL_MODEL_PARAM type string value '|',
    T_PROMPT_DATA type string value '|',
    T_PROMPT_WITH_EXTERNAL type string value '|MODEL_ID|DATA|',
    T_SIMPLE_REL type string value '|ID|',
    T_EMBEDDING_RETURN_OPTIONS type string value '|',
    T_EMBEDDING_PARAMETERS type string value '|',
    T_ONLINE_DEPLOYMENT_PARAMETERS type string value '|',
    T_ONLINE_DEPLOYMENT type string value '|',
    T_HARDWARE_SPEC type string value '|',
    T_REL type string value '|ID|',
    T_DPLYMNT_RESOURCE_PROTOTYPE type string value '|NAME|ONLINE|',
    T_NOTEBOOK_VERSION_ENTITY type string value '|',
    T_NOTEBOOK_CREATE_BODY_GENERAL type string value '|NAME|FILE_REFERENCE|RUNTIME|',
    T_PROMPT_MODEL_PARAMETERS type string value '|',
    T_PAGINATION_FIRST type string value '|HREF|',
    T_PAGINATION_NEXT type string value '|HREF|',
    T_PAGINATION type string value '|LIMIT|FIRST|',
    T_RESOURCE_META type string value '|ID|CREATED_AT|',
    T_RESULTS_REFERENCE_INPUT type string value '|RESULTS_REFERENCE|',
    T_NOTEBOOK_VERSION_METADATA type string value '|',
    T_NOTEBOOK_VERSION_IN_PROJECT type string value '|',
    T_NTBK_VER_CRE_RESP_NTBK_VER_1 type string value '|',
    T_NOTEBOOK_METADATA_IN_PROJECT type string value '|PROJECT_ID|',
    T_NOTEBOOK_IN_PROJECT type string value '|',
    T_MODEL_LIMITS type string value '|',
    T_INFERENCE type string value '|URL|',
    T_DEPLOYMENT_STATUS type string value '|',
    T_PROMPT type string value '|MODEL_ID|DATA|',
    T_PROMPT_LOCK type string value '|LOCKED|',
    T_PAGINATION_BASE type string value '|LIMIT|FIRST|',
    T_TRAINING_BATCH_SIZE type string value '|',
    T_EMBEDDINGS_REQUEST type string value '|MODEL_ID|INPUTS|',
    T_WX_PROMPT_POST_MODEL_VERSION type string value '|',
    T_NOTEBOOK_RESOURCE_METADATA type string value '|',
    T_DEPLOYMENT_RESOURCE_ENTITY type string value '|',
    T_NOTEBOOK_REVERT_BODY type string value '|SOURCE|',
    T_RERANK_INPUT type string value '|TEXT|',
    T_RERANKED_RESULTS type string value '|SCORE|',
    T_RERANK_RESPONSE_FIELDS type string value '|MODEL_ID|RESULTS|CREATED_AT|INPUT_TOKEN_COUNT|',
    T_SIMILARITY_RESULT type string value '|SCORE|',
    T_SIMILARITY_RESPONSE_FIELDS type string value '|MODEL_ID|RESULTS|CREATED_AT|INPUT_TOKEN_COUNT|',
    T_MDRTN_PII_INPUT_PROPERTIES type string value '|',
    T_TRAINING_TORCH_DTYPE type string value '|',
    T_DEPLOYMENT_ENTITY type string value '|ONLINE|',
    T_NTBK_CRE_RESP_NTBK_IN_PRJCT type string value '|',
    T_TRAINING_VERBALIZER type string value '|',
    T_TRAINING_MAX_INPUT_TOKENS type string value '|',
    T_TRAINING_MAX_OUTPUT_TOKENS type string value '|',
    T_TRAINING_LEARNING_RATE type string value '|',
    T_TRAINING_NUM_VIRTUAL_TOKENS type string value '|',
    T_TRAINING_ACCUMULATED_STEPS type string value '|',
    T_TRAINING_INIT_TEXT type string value '|',
    T_TRAINING_PARAMETERS type string value '|',
    T_TASK_RATING type string value '|',
    T_TASK_DESCRIPTION type string value '|ID|',
    T_FOUNDATION_MODEL_VERSION type string value '|',
    T_FOUNDATION_MODEL_LIMITS type string value '|',
    T_FOUNDATION_MODEL type string value '|MODEL_ID|LABEL|PROVIDER|SHORT_DESCRIPTION|INPUT_TIER|OUTPUT_TIER|SOURCE|NUMBER_PARAMS|',
    T_COMMON_PATCH_REQUEST_HELPER type string value '|',
    T_EXTRNL_PRMPT_ADDTNL_INFRMTN1 type string value '|',
    T_DEPLOYMENT_RESOURCE type string value '|',
    T_DPLYMNT_RESOURCE_COLLECTION type string value '|LIMIT|FIRST|',
    T_FOUNDATION_MODEL_TASK type string value '|TASK_ID|LABEL|RANK|',
    T_FOUNDATION_MODEL_TASKS type string value '|LIMIT|FIRST|',
    T_WX_PROMPT_RESP_MODEL_VERSION type string value '|',
    T_NTBK_VRSNS_LST_RESP_NTBK_VR1 type string value '|TOTAL_RESULTS|RESOURCES|',
    T_TRAIN_RSRC_COLLECTION_SYS type string value '|',
    T_TRAINING_RESOURCE_ENTITY type string value '|RESULTS_REFERENCE|STATUS|',
    T_TRAINING_RESOURCE type string value '|',
    T_TRAINING_RESOURCE_COLLECTION type string value '|LIMIT|FIRST|',
    T_PII_PROPERTIES type string value '|',
    T_NTBK_VER_RTRV_RESP_NTBK_VER1 type string value '|',
    T_RESOURCE_META_BASE type string value '|',
    T_NTBK_RESOURCE_ENTITY_ASSET type string value '|',
    T_WX_PROMPT_PATCH_MODEL_VER type string value '|',
    T_MODERATION_PROPERTIES type string value '|',
    T_TRAINING_STATUS_OUTPUT type string value '|STATUS|',
    T_NOTEBOOK_RESOURCE_ENTITY type string value '|',
    T_SYSTEM type string value '|',
    T_NOTEBOOK_ENTITY_DEF_FOR_COPY type string value '|',
    T_NOTEBOOK_RESOURCE type string value '|',
    T_MODERATION_INPUT_PROPERTIES type string value '|',
    T_NTBK_RVRT_RESP_NTBK_IN_PRJCT type string value '|',
    T_NOTEBOOKS_RESOURCE_LIST type string value '|TOTAL_RESULTS|RESOURCES|',
    T_EMBEDDINGS_RESPONSE type string value '|MODEL_ID|RESULTS|CREATED_AT|INPUT_TOKEN_COUNT|',
    T_PROMPT_TEMPLATE_VARIABLES type string value '|',
    T_WX_PROMPT_SESSION_ENTRY type string value '|NAME|CREATED_AT|PROMPT|',
    T_WX_PROMPT_SESSION type string value '|NAME|',
    T_NOTEBOOK_ENTITY_FOR_COPY type string value '|',
    T_NTBK_CRE_RESP_NTBK_FOR_COPY type string value '|',
    T_TEXT_GEN_PARAMETERS2 type string value '|',
    T_ENTITY_REQ_SPC_PROJECT_BODY type string value '|NAME|',
    T_TEXT_GEN_COMMON type string value '|INPUT|',
    T_TEXT_GEN_PARAMETERS type string value '|',
    T_NTBK_VERSIONS_LST_IN_PROJECT type string value '|TOTAL_RESULTS|RESOURCES|',
    T_JSON_PATCH_OPERATION type string value '|OP|PATH|',
    T_ERROR_RESPONSE type string value '|TRACE|ERRORS|',
    T_DEPLOYMENT_ENTITY_COMMON type string value '|ONLINE|',
    T_RERANK_RESPONSE type string value '|MODEL_ID|RESULTS|CREATED_AT|INPUT_TOKEN_COUNT|',
    T_NOTEBOOK_UPDATE_BODY type string value '|',
    T_WX_PROMPT_POST type string value '|NAME|PROMPT|',
    T_TEXT_TOKENIZE_RESULT type string value '|TOKEN_COUNT|',
    T_TEXT_TOKENIZE_RESPONSE type string value '|MODEL_ID|RESULT|',
    T_TEXT_GEN_REQUEST type string value '|INPUT|MODEL_ID|',
    T_FOUNDATION_MODELS type string value '|LIMIT|FIRST|',
    T_WX_PROMPT_PATCH type string value '|NAME|PROMPT|',
    T_DEPLOYMENT_RESOURCE_PATCH type string value '|',
    T_CAI_KIT_TEXT_GEN_PROPERTIES type string value '|',
    T_PAGINATION_TC type string value '|LIMIT|FIRST|',
    T_TRAIN_RESOURCE_ENTITY_COMMON type string value '|',
    T_WX_PROMPT_RESPONSE type string value '|NAME|PROMPT|',
    T_NOTEBOOK_LIST_BODY type string value '|',
    T_NOTEBOOK_CRE_BODY_IN_PROJECT type string value '|NAME|FILE_REFERENCE|RUNTIME|PROJECT|',
    T_NOTEBOOK_FOR_COPY type string value '|',
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
     INPUT_RANGES type string value 'input_ranges',
     MODEL_ID type string value 'model_id',
     SPACE_ID type string value 'space_id',
     PROJECT_ID type string value 'project_id',
     PARAMETERS type string value 'parameters',
     MODERATIONS type string value 'moderations',
     TEXT type string value 'text',
     LOGPROB type string value 'logprob',
     RANK type string value 'rank',
     TOP_TOKENS type string value 'top_tokens',
     SCORE type string value 'score',
     POSITION type string value 'position',
     ENTITY type string value 'entity',
     WORD type string value 'word',
     GENERATED_TEXT type string value 'generated_text',
     GENERATED_TOKEN_COUNT type string value 'generated_token_count',
     INPUT_TOKEN_COUNT type string value 'input_token_count',
     STOP_REASON type string value 'stop_reason',
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
     PROMPT_TEMPLATE type string value 'prompt_template',
     ONLINE type string value 'online',
     HARDWARE_SPEC type string value 'hardware_spec',
     BASE_MODEL_ID type string value 'base_model_id',
     LEVEL type string value 'level',
     SSE type string value 'sse',
     USES_SERVING_NAME type string value 'uses_serving_name',
     STATE type string value 'state',
     FAILURE type string value 'failure',
     INFERENCE type string value 'inference',
     DEPLOYED_ASSET_TYPE type string value 'deployed_asset_type',
     STATUS type string value 'status',
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
     TIMESTAMP type string value 'timestamp',
     ITERATION type string value 'iteration',
     ML_METRICS type string value 'ml_metrics',
     CONTEXT type string value 'context',
     RUNNING_AT type string value 'running_at',
     COMPLETED_AT type string value 'completed_at',
     METRICS type string value 'metrics',
     INPUTS type string value 'inputs',
     EMBEDDING type string value 'embedding',
     QUERY type string value 'query',
     CREATED_BY type string value 'created_by',
     LAST_UPDATED_AT type string value 'last_updated_at',
     LAST_UPDATED_BY type string value 'last_updated_by',
     GOVERNANCE_TRACKED type string value 'governance_tracked',
     LOCK type string value 'lock',
     INPUT_MODE type string value 'input_mode',
     IS_TEMPLATE type string value 'is_template',
     RESOURCE_KEY type string value 'resource_key',
     PROMPT type string value 'prompt',
     PROMPT_VARIABLE type string value 'prompt_variable',
     PROMPTS type string value 'prompts',
     BOOKMARK type string value 'bookmark',
     MODEL_PARAMETERS type string value 'model_parameters',
     DATA type string value 'data',
     SYSTEM_PROMPT type string value 'system_prompt',
     CHAT_ITEMS type string value 'chat_items',
     EXTERNAL_INFORMATION type string value 'external_information',
     EXTERNAL_PROMPT_ID type string value 'external_prompt_id',
     EXTERNAL_MODEL_ID type string value 'external_model_id',
     EXTERNAL_MODEL_PROVIDER type string value 'external_model_provider',
     EXTERNAL_PROMPT type string value 'external_prompt',
     EXTERNAL_MODEL type string value 'external_model',
     CONTENT type string value 'content',
     INSTRUCTION type string value 'instruction',
     INPUT_PREFIX type string value 'input_prefix',
     OUTPUT_PREFIX type string value 'output_prefix',
     EXAMPLES type string value 'examples',
     LOCKED type string value 'locked',
     LOCK_TYPE type string value 'lock_type',
     LOCKED_BY type string value 'locked_by',
     TOTAL_RESULTS type string value 'total_results',
     ASSET_TYPE type string value 'asset_type',
     CREATED type string value 'created',
     OWNER_ID type string value 'owner_id',
     CATALOG_ID type string value 'catalog_id',
     ASSET_ID type string value 'asset_id',
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
     ADDITIONAL_INFORMATION type string value 'additional_information',
     NUMBER type string value 'number',
     TAG type string value 'tag',
     KEY type string value 'key',
  end of C_ABAPNAME_DICTIONARY .


  methods GET_APPNAME
    redefinition .
  methods GET_REQUEST_PROP
    redefinition .
  methods GET_SDK_VERSION_DATE
    redefinition .


    "! <p class="shorttext synchronized" lang="en">Create a new watsonx.ai deployment</p>
    "!   Create a new deployment, currently the only supported type is `online`.<br/>
    "!   If this is a deployment for a prompt tune then the `asset` object must exist and
    "!    the `id` must be the `id` of the `model` that was created after the prompt
    "!    training.<br/>
    "!   If this is a deployment for a prompt template then the `prompt_template` object
    "!    should exist and the `id` must be the `id` of the prompt template to be
    "!    deployed.<br/>
    "!
    "!
    "! @parameter I_DEPLOYMENTRESOURCEPROTOTYPE |
    "!   The deployment request entity.<br/>
    "!   <br/>
    "!   The following important fields are described for each use case: 1. Prompt
    "!    template: (`deployed_asset_type` is `foundation_model`)<br/>
    "!      - `base_model_id`: **required**<br/>
    "!      - `promt_template.id`: **required**<br/>
    "!      - `online`: **required**<br/>
    "!      - `hardware_spec`: **forbidden** 1. Prompt tune: (`deployed_asset_type` is
    "!    `prompt_tune`)<br/>
    "!      - `asset.id`: **required**<br/>
    "!      - `online`: **required**<br/>
    "!      - `hardware_spec`: **forbidden**<br/>
    "!      - `base_model_id`: **forbidden**.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_DEPLOYMENT_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods CREATE_DEPLOYMENT
    importing
      !I_DEPLOYMENTRESOURCEPROTOTYPE type T_DPLYMNT_RESOURCE_PROTOTYPE
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
    "!    - when a prompt template is used on a pre-deployed IBM provided model.<br/>
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
    "!   Service return value of type T_DPLYMNT_RESOURCE_COLLECTION
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
      !E_RESPONSE type T_DPLYMNT_RESOURCE_COLLECTION
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
    "!   - `/asset`<br/>
    "!   - `/prompt_template`<br/>
    "!   - `/hardware_spec`<br/>
    "!   <br/>
    "!   The PATCH operation with path specified as `/online/parameters` can be used to
    "!    update the `serving_name`.<br/>
    "!   <br/>
    "!   Patching `/asset` or `/prompt_template` should normally be used in the case when
    "!    these fields already exist.<br/>
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
    "!    returned in the `inference`<br/>
    "!   when the deployment was created.<br/>
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
    "!   The `project` or `space` for the deployment must have a WML instance that will
    "!    be used for limits and billing (if a paid plan).
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
    "!    returned in the `inference`<br/>
    "!   when the deployment was created.<br/>
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
    "!   The `project` or `space` for the deployment must have a WML instance that will
    "!    be used for limits and billing (if a paid plan).
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
    "!      function_*:    Filters by function.<br/>
    "!                     Namely, select all models that support a specific
    "!    function.<br/>
    "!   ```.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_FOUNDATION_MODELS
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods LIST_FOUNDATION_MODEL_SPECS
    importing
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_FILTERS type STRING optional
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
    "! <p class="shorttext synchronized" lang="en">Cancel the training</p>
    "!   Cancel the specified training and remove it.<br/>
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
    "!   Set to true in order to also delete the job metadata information.
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

    e_appname = 'watsonx.ai'.

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
    lv_auth_method = 'Bearer'.
  endif.
  if lv_auth_method is initial.
    e_request_prop-auth_basic      = c_boolean_false.
    e_request_prop-auth_oauth      = c_boolean_false.
    e_request_prop-auth_apikey     = c_boolean_false.
  elseif lv_auth_method eq 'Bearer'.
    e_request_prop-auth_name       = 'Bearer'.
    e_request_prop-auth_type       = 'http'.
    e_request_prop-auth_oauth      = c_boolean_true.
  else.
  endif.

  e_request_prop-url-protocol    = 'https'.
  e_request_prop-url-host        = 'us-south.ml.cloud.ibm.com'.
  e_request_prop-url-path_base   = ''.

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->GET_SDK_VERSION_DATE
* +-------------------------------------------------------------------------------------------------+
* | [<-()] E_SDK_VERSION_DATE             TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_sdk_version_date.

    e_sdk_version_date = '20240625'.

  endmethod.



* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->CREATE_DEPLOYMENT
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_DEPLOYMENTRESOURCEPROTOTYPE        TYPE T_DPLYMNT_RESOURCE_PROTOTYPE
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
* | [<---] E_RESPONSE                    TYPE        T_DPLYMNT_RESOURCE_COLLECTION
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
* | Instance Public Method ZCL_IBMX_WATSONX_AI_ML_V1->LIST_FOUNDATION_MODEL_SPECS
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_FILTERS        TYPE STRING (optional)
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
