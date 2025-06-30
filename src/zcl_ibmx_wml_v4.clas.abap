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
"! <p class="shorttext synchronized" lang="en">watsonx.ai Runtime</p>
"! No documentation available.<br/>
class ZCL_IBMX_WML_V4 DEFINITION
  public
  inheriting from ZCL_IBMX_SERVICE_EXT
  create public .

public section.
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
    "!    If the prediction schemas are provided here then they take</p>
    "!     precedent over any schemas provided in the data references. Note that data
    "!     references contain the schema for the associated data and this object contains
    "!     the schema(s) for the associated prediction, if any. In the case that the
    "!     prediction input data matches exactly the schema of the training data
    "!     references then the prediction schema can be omitted. However it is highly
    "!     recommended to always specify the prediction schemas using this field.
    begin of T_MODEL_ENTITY_SCHEMAS,
      "!   The schema of the expected prediction input data, see<br/>
      "!   [datarecord-metadata-v2-schema](https://raw.githubusercontent.com/elyra-ai/pipel
      "!   ine-schemas/master/common-pipeline/datarecord-metadata/datarecord-metadata-v2-sc
      "!   hema.json) for the schema definition.
      INPUT type STANDARD TABLE OF T_DATA_SCHEMA WITH NON-UNIQUE DEFAULT KEY,
      "!   The schema of the expected prediction output data, see<br/>
      "!   [datarecord-metadata-v2-schema](https://raw.githubusercontent.com/elyra-ai/pipel
      "!   ine-schemas/master/common-pipeline/datarecord-metadata/datarecord-metadata-v2-sc
      "!   hema.json) for the schema definition.
      OUTPUT type STANDARD TABLE OF T_DATA_SCHEMA WITH NON-UNIQUE DEFAULT KEY,
    end of T_MODEL_ENTITY_SCHEMAS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Hyperparameter optimization.</p>
    begin of T_TRAINING_STATUS_HPO,
      "!   No documentation available.
      NODE_ID type STRING,
      "!   No documentation available.
      HYPER_PARAMETERS type JSONOBJECT,
    end of T_TRAINING_STATUS_HPO.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The location of the intermediate model.</p>
    begin of T_MODEL_LOCATION,
      "!   The generated pipeline at this stage.
      PIPELINE type STRING,
      "!   The generated pipeline model.
      PIPELINE_MODEL type STRING,
      "!   The generated model at this stage.
      MODEL type STRING,
    end of T_MODEL_LOCATION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details of the intermediate model.</p>
    begin of T_INTERMEDIATE_MODEL,
      "!   The name of the pipeline.
      NAME type STRING,
      "!   The process that generated this pipeline.
      PROCESS type STRING,
      "!   The location of the intermediate model.
      LOCATION type T_MODEL_LOCATION,
      "!   No documentation available.
      NOTEBOOK_LOCATION type STRING,
      "!   No documentation available.
      SDK_NOTEBOOK_LOCATION type STRING,
      "!   The nodes of this pipeline.
      PIPELINE_NODES type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   The steps that lead to the creation of this pipeline.
      COMPOSITION_STEPS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   No documentation available.
      DURATION type INTEGER,
      "!   No documentation available.
      MODEL_ASSET type STRING,
    end of T_INTERMEDIATE_MODEL.
  types:
    "! No documentation available.
    begin of T_FEATURE_IMPORTANCE,
      "!   By default the `computation_type` will not be set except for incremental
      "!    learning, in this case the value will be one of `all`, `LR`, `Ridge`, `Lasso`,`
      "!    Stability`, `RFE`, `RF`, `Corr`, `MIC`.
      COMPUTATION_TYPE type STRING,
      "!   The feature names where the calculated score describes the importance of each
      "!    feature in the decision-making process.
      FEATURES type MAP,
      "!   Indicates if the importance coefficients, in the `features` field, should have
      "!    min-max rescaling (0-1) applied. When set to `false`, min-max rescaling (0-1)
      "!    will not be applied to the coefficients, when set to `true` the coefficients in
      "!    the `features` field will sum up to 1.
      MIN_MAX_NORMALIZATION type BOOLEAN,
    end of T_FEATURE_IMPORTANCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The confusion matrix for the selected class.</p>
    begin of T_CONFUSION_MATRIX,
      "!   No documentation available.
      TRUE_CLASS type STRING,
      "!   No documentation available.
      TP type INTEGER,
      "!   No documentation available.
      TN type INTEGER,
      "!   No documentation available.
      FP type INTEGER,
      "!   No documentation available.
      FN type INTEGER,
    end of T_CONFUSION_MATRIX.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The roc (receiver operating characteristic) curve for the</p>
    "!     selected class.
    begin of T_ROC_CURVE,
      "!   No documentation available.
      TRUE_CLASS type STRING,
      "!   The true positive rates.
      TPR type STANDARD TABLE OF NUMBER WITH NON-UNIQUE DEFAULT KEY,
      "!   The false positive rates.
      FPR type STANDARD TABLE OF NUMBER WITH NON-UNIQUE DEFAULT KEY,
      "!   The thresholds.
      THRESHOLDS type STANDARD TABLE OF NUMBER WITH NON-UNIQUE DEFAULT KEY,
    end of T_ROC_CURVE.
  types:
    "! No documentation available.
    begin of T_MULTI_CLASS_CLASSIFICATION,
      "!   The class name.
      CLASS type STRING,
      "!   The location of the confusion_matrix details in associated storage.
      CONFUSION_MATRIX_LOCATION type STRING,
      "!   The confusion matrix for the selected class.
      CONFUSION_MATRIX type T_CONFUSION_MATRIX,
      "!   The location of the roc (receiver operating characteristic) curve details in the
      "!    associated storage.
      ROC_CURVE_LOCATION type STRING,
      "!   The roc (receiver operating characteristic) curve for the selected class.
      ROC_CURVE type T_ROC_CURVE,
    end of T_MULTI_CLASS_CLASSIFICATION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Details about the step.</p>
    begin of T_STEP_INFO,
      "!   No documentation available.
      ID type STRING,
      "!   No documentation available.
      NAME type STRING,
      "!   No documentation available.
      STARTED_AT type DATETIME,
      "!   No documentation available.
      COMPLETED_AT type DATETIME,
      "!   No documentation available.
      HYPER_PARAMETERS type JSONOBJECT,
      "!   No documentation available.
      DATA_ALLOCATION type INTEGER,
      "!   No documentation available.
      ESTIMATOR type STRING,
      "!   No documentation available.
      TRANSFORMER type STRING,
      "!   No documentation available.
      SCORE type NUMBER,
    end of T_STEP_INFO.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The process of training the model in batches.</p>
    begin of T_INCREMENTAL_TRAINING,
      "!   The current iteration (batch of data).
      ITERATION type INTEGER,
      "!   Total number of iterations (data batches).
      TOTAL_ITERATIONS type INTEGER,
      "!   Location of csv file with incremental learning metrics.
      MEASURES_LOCATION type STRING,
      "!   The cumulative size of data used in incremental training.
      TRAIN_BATCH_SAMPLES_COUNT type INTEGER,
      "!   The size of the holdout data set used to evaluate training progress.
      HOLDOUT_SAMPLES_COUNT type INTEGER,
      "!   Indicates if the training has been stopped earlier.
      EARLY_STOP_TRIGGERED type BOOLEAN,
    end of T_INCREMENTAL_TRAINING.
  types:
    "! No documentation available.
    begin of T_MULTI_CLASS_CLASSIFICATIONS,
      "!   The classifications details for each class.
      ONE_VS_ALL type STANDARD TABLE OF T_MULTI_CLASS_CLASSIFICATION WITH NON-UNIQUE DEFAULT KEY,
      "!   The location of the classifications details in associated storage.
      ONE_VS_ALL_LOCATION type STRING,
    end of T_MULTI_CLASS_CLASSIFICATIONS.
  types:
    "! No documentation available.
    begin of T_BINARY_CLASSIFICATION,
      "!   No documentation available.
      CONFUSION_MATRICES type STANDARD TABLE OF T_CONFUSION_MATRIX WITH NON-UNIQUE DEFAULT KEY,
      "!   No documentation available.
      ROC_CURVES type STANDARD TABLE OF T_ROC_CURVE WITH NON-UNIQUE DEFAULT KEY,
    end of T_BINARY_CLASSIFICATION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Provides extra information for this training stage in the</p>
    "!     context of auto-ml.
    begin of T_METRICS_CONTEXT,
      "!   This field will not returned by fine tuning jobs created with InstructLab.<br/>
      "!   <br/>
      "!   The deployment that created the metrics.
      DEPLOYMENT_ID type STRING,
      "!   The details of the intermediate model.
      INTERMEDIATE_MODEL type T_INTERMEDIATE_MODEL,
      "!   No documentation available.
      PHASE type STRING,
      "!   Details about the step.
      STEP type T_STEP_INFO,
      "!   The prediction target labels. Can be either an array of `number` such as `[0,1]`
      "!    or array of `string` such
      "!    as`[&apos;positive&apos;,&apos;negative&apos;,&apos;neutral&apos;]`.
      CLASSES type STANDARD TABLE OF JSONOBJECT WITH NON-UNIQUE DEFAULT KEY,
      "!   No documentation available.
      BINARY_CLASSIFICATION type T_BINARY_CLASSIFICATION,
      "!   No documentation available.
      MULTI_CLASS_CLASSIFICATION type T_MULTI_CLASS_CLASSIFICATIONS,
      "!   No documentation available.
      FEATURES_IMPORTANCE type STANDARD TABLE OF T_FEATURE_IMPORTANCE WITH NON-UNIQUE DEFAULT KEY,
      "!   No documentation available.
      SCHEMA type STRING,
      "!   No documentation available.
      ESTIMATORS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   The process of training the model in batches.
      INCREMENTAL_TRAINING type T_INCREMENTAL_TRAINING,
      "!   The type of machine learning problem:<br/>
      "!   * `binary` - Binary Classification<br/>
      "!   * `multiclass` - Multiclass Classification<br/>
      "!   * `regression` - Regression<br/>
      "!   * `forecasting` - Forecasting<br/>
      "!   * `timeseries_anomaly_prediction` - Time Series Anomaly Prediction.
      PREDICTION_TYPE type STRING,
    end of T_METRICS_CONTEXT.
  types:
    "! No documentation available.
    begin of T_FDRTD_LRNNG_INF_AGGRGTR_CNN1,
      "!   No documentation available.
      HOST type STRING,
      "!   No documentation available.
      PORT type NUMBER,
      "!   No documentation available.
      ENDPOINT type STRING,
      "!   No documentation available.
      PROTOCOL type STRING,
      "!   The headers object contains key-value pairs of headers to be supplied when
      "!    connecting to the aggregator.
      HEADERS type JSONOBJECT,
    end of T_FDRTD_LRNNG_INF_AGGRGTR_CNN1.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The metrics from the time series. For more information,</p>
    "!     please see the [Time Series
    "!     Implementation](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-dat
    "!    a/autoai-timeseries-details.html?audience=wdp#ts-metrics) documentation.
      T_METRIC_TS_METRICS type JSONOBJECT.
  types:
    "! No documentation available.
    begin of T_FDRTD_LRNNG_INF_RMT_TRAIN_S3,
      "!   No documentation available.
      TIMESTAMP type DATETIME,
      "!   No documentation available.
      EVENT type STRING,
    end of T_FDRTD_LRNNG_INF_RMT_TRAIN_S3.
  types:
    "! No documentation available.
    begin of T_FDRTD_LRNNG_INF_RMT_TRAIN_S2,
      "!   No documentation available.
      ID type STRING,
      "!   No documentation available.
      NAME type STRING,
      "!   No documentation available.
      STATE type STRING,
      "!   No documentation available.
      REGISTRATION_LOG type STANDARD TABLE OF T_FDRTD_LRNNG_INF_RMT_TRAIN_S3 WITH NON-UNIQUE DEFAULT KEY,
    end of T_FDRTD_LRNNG_INF_RMT_TRAIN_S2.
  types:
    "! No documentation available.
    begin of T_FDRTD_LRNNG_INF_RMT_TRAIN_S1,
      "!   No documentation available.
      STATES type T_FDRTD_LRNNG_INF_RMT_TRAIN_S2,
    end of T_FDRTD_LRNNG_INF_RMT_TRAIN_S1.
  types:
    "! No documentation available.
    begin of T_FDRTD_LRNNG_INFO_AGGREGATOR,
      "!   No documentation available.
      CONNECTION type T_FDRTD_LRNNG_INF_AGGRGTR_CNN1,
    end of T_FDRTD_LRNNG_INFO_AGGREGATOR.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Federated learning info.</p>
    begin of T_FEDERATED_LEARNING_INFO,
      "!   No documentation available.
      AGGREGATOR type T_FDRTD_LRNNG_INFO_AGGREGATOR,
      "!   Remote training systems.
      REMOTE_TRAINING_SYSTEMS type STANDARD TABLE OF T_FDRTD_LRNNG_INF_RMT_TRAIN_S1 WITH NON-UNIQUE DEFAULT KEY,
    end of T_FEDERATED_LEARNING_INFO.
  types:
    "! No documentation available.
    begin of T_GPU_METRICS_MEMORY,
      "!   No documentation available.
      MEASURE type STRING,
      "!   No documentation available.
      VALUE type DOUBLE,
    end of T_GPU_METRICS_MEMORY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    GPU metrics.</p>
    begin of T_GPU_METRICS,
      "!   No documentation available.
      TYPE type STRING,
      "!   No documentation available.
      MEMORY type T_GPU_METRICS_MEMORY,
    end of T_GPU_METRICS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Compute usage metrics.</p>
    begin of T_COMPUTE_USAGE_METRICS,
      "!   No documentation available.
      TIMESTAMP type DATETIME,
      "!   No documentation available.
      GPU_COUNT type NUMBER,
      "!   No documentation available.
      GPUS type STANDARD TABLE OF T_GPU_METRICS WITH NON-UNIQUE DEFAULT KEY,
    end of T_COMPUTE_USAGE_METRICS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The metrics from the time series anomaly detection. For more</p>
    "!     information, please see the [Creating a Time Series Anomaly
    "!     Prediction](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/au
    "!    toai-ts-ad.html?audience=wdp) documentation.
      T_METRIC_TSAD_METRICS type JSONOBJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A metric.</p>
    begin of T_METRIC,
      "!   A timestamp for the metrics.
      TIMESTAMP type DATETIME,
      "!   The iteration number.
      ITERATION type INTEGER,
      "!   The metrics.
      ML_METRICS type MAP,
      "!   The metrics from the time series. For more information, please see the [Time
      "!    Series
      "!    Implementation](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-dat
      "!   a/autoai-timeseries-details.html?audience=wdp#ts-metrics) documentation.
      TS_METRICS type T_METRIC_TS_METRICS,
      "!   The metrics from the time series anomaly detection. For more information, please
      "!    see the [Creating a Time Series Anomaly
      "!    Prediction](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/au
      "!   toai-ts-ad.html?audience=wdp) documentation.
      TSAD_METRICS type T_METRIC_TSAD_METRICS,
      "!   The metrics from federated training.
      ML_FEDERATED_METRICS type MAP,
      "!   Provides extra information for this training stage in the context of auto-ml.
      CONTEXT type T_METRICS_CONTEXT,
    end of T_METRIC.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Message.</p>
    begin of T_TRAINING_STATUS_MESSAGE,
      "!   No documentation available.
      LEVEL type STRING,
      "!   No documentation available.
      TEXT type STRING,
    end of T_TRAINING_STATUS_MESSAGE.
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
    "!    Status of the model.</p>
    begin of T_TRAINING_STATUS,
      "!   Date and Time in which current training state has started.
      RUNNING_AT type DATETIME,
      "!   Date and Time in which training had completed.
      COMPLETED_AT type DATETIME,
      "!   Current training iteration.
      ITERATION type NUMBER,
      "!   Total number of iterations training must complete.
      TOTAL_ITERATIONS type NUMBER,
      "!   Current state of training.
      STATE type STRING,
      "!   Compute usage metrics.
      COMPUTE_USAGE_METRICS type T_COMPUTE_USAGE_METRICS,
      "!   Hyperparameter optimization.
      HPO type T_TRAINING_STATUS_HPO,
      "!   Federated learning info.
      FEDERATED_LEARNING_INFO type T_FEDERATED_LEARNING_INFO,
      "!   Message.
      MESSAGE type T_TRAINING_STATUS_MESSAGE,
      "!   Metrics that can be returned by an operation.
      METRICS type STANDARD TABLE OF T_METRIC WITH NON-UNIQUE DEFAULT KEY,
      "!   The data returned when an error is encountered.
      FAILURE type T_API_ERROR_RESPONSE,
    end of T_TRAINING_STATUS.
  types:
    "! No documentation available.
    begin of T_CONSUMPTION_GPU_COUNT,
      "!   The current number of reserved GPUs.
      CURRENT type INTEGER,
      "!   The maximal number of reserved GPUs.
      LIMIT type INTEGER,
    end of T_CONSUMPTION_GPU_COUNT.
  types:
    "! No documentation available.
      T_SYNC_SCRNG_DATA_ITEM_VALUES type TT_JSONOBJECT.
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
    "!    The token count for the account.</p>
    begin of T_TOKEN_COUNT,
      "!   The number of tokens used for text generation. It is the sum of the input tokens
      "!    and generated tokens.
      CURRENT type INTEGER,
      "!   The maximal number of tokens that can be used, when applicable.
      LIMIT type INTEGER,
    end of T_TOKEN_COUNT.
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
    "!    Variance anomaly refers to a segment of time series in which</p>
    "!     the variance of a time series is changed.
    begin of T_VARIANCE,
      "!   The mean value.
      MEAN type NUMBER,
      "!   The range of values.
      RANGE type STANDARD TABLE OF NUMBER WITH NON-UNIQUE DEFAULT KEY,
    end of T_VARIANCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Measures the accuracy of a prediction based on percent of</p>
    "!     positive predictions that are correct.
    begin of T_TSAD_HOLDOUT_AGG_PRECISION,
      "!   No documentation available.
      LEVEL_SHIFT type JSONOBJECT,
      "!   No documentation available.
      LOCALIZED_EXTREME type JSONOBJECT,
      "!   No documentation available.
      TREND type JSONOBJECT,
      "!   Variance anomaly refers to a segment of time series in which the variance of a
      "!    time series is changed.
      VARIANCE type T_VARIANCE,
    end of T_TSAD_HOLDOUT_AGG_PRECISION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Level shift anomaly refers to a segment in which the mean</p>
    "!     value of a time series is changed. Includes scores for all pipelines.
    begin of T_TSD_HLDT_SPPRTNG_RNK_AVG_PR2,
      "!   The score of the Level Shift anomaly with average_precision for Pipeline 1.
      P1 type NUMBER,
      "!   The score of the Level Shift anomaly with average_precision for Pipeline 2.
      P2 type NUMBER,
      "!   The score of the Level Shift anomaly with average_precision for Pipeline 3.
      P3 type NUMBER,
      "!   The score of the Level Shift anomaly with average_precision for Pipeline 4.
      P4 type NUMBER,
      "!   The score of the Level Shift anomaly with average_precision for Pipeline 5.
      P5 type NUMBER,
      "!   The score of the Level Shift anomaly with average_precision for Pipeline 6.
      P6 type NUMBER,
    end of T_TSD_HLDT_SPPRTNG_RNK_AVG_PR2.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    (Recommended): Average of the accuracy of predictions based</p>
    "!     on percent of positive predictions that are correct.
    begin of T_TSD_HLDT_SPPRTNG_RNK_AVG_PR1,
      "!   Level shift anomaly refers to a segment in which the mean value of a time series
      "!    is changed. Includes scores for all pipelines.
      LEVEL_SHIFT type T_TSD_HLDT_SPPRTNG_RNK_AVG_PR2,
      "!   Localized extreme anomaly refers to an unusual data point in a time series,
      "!    which deviates significantly from the data points around it.  Includes scores
      "!    for all pipelines.
      LOCALIZED_EXTREME type JSONOBJECT,
      "!   trend anomaly refers to a segment of time series, which has a trend change
      "!    compared to the time series before the segment. Includes scores for all
      "!    pipelines.
      TREND type JSONOBJECT,
      "!   variance anomaly refers to a segment of time series in which the variance of a
      "!    time series is changed.  Includes scores for all pipelines.
      VARIANCE type JSONOBJECT,
    end of T_TSD_HLDT_SPPRTNG_RNK_AVG_PR1.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    (Recommended): Average of the accuracy of predictions based</p>
    "!     on percent of positive predictions that are correct.
    begin of T_TSD_HLDT_ITRTNS_ITM_AVG_PRC1,
      "!   Localized extreme anomaly refers to an unusual data point in a time series,
      "!    which deviates significantly from the data points around it.
      LOCALIZED_EXTREME type NUMBER,
      "!   Level shift anomaly refers to a segment in which the mean value of a time series
      "!    is changed.
      LEVEL_SHIFT type NUMBER,
      "!   Variance anomaly refers to a segment of time series in which the variance of a
      "!    time series is changed.
      VARIANCE type NUMBER,
      "!   Trend anomaly refers to a segment of time series, which has a trend change
      "!    compared to the time series before the segment.
      TREND type NUMBER,
    end of T_TSD_HLDT_ITRTNS_ITM_AVG_PRC1.
  types:
    "! No documentation available.
    begin of T_TSAD_HOLDOUT_ITERATIONS_ITEM,
      "!   (Recommended): Average of the accuracy of predictions based on percent of
      "!    positive predictions that are correct.
      AVERAGE_PRECISION type T_TSD_HLDT_ITRTNS_ITM_AVG_PRC1,
      "!   Measure of how well a parameter can distinguish between two groups.
      ROC_AUC type JSONOBJECT,
      "!   Harmonic average of the precision and recall, with best value of 1 (perfect
      "!    precision and recall) and worst at 0.
      F1 type JSONOBJECT,
      "!   Measures the accuracy of a prediction based on percent of positive predictions
      "!    that are correct.
      PRECISION type JSONOBJECT,
      "!   Measures the percentage of identified positive predictions against possible
      "!    positives in data set.
      RECALL type JSONOBJECT,
    end of T_TSAD_HOLDOUT_ITERATIONS_ITEM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Level shift anomaly refers to a segment in which the mean</p>
    "!     value of a time series is changed.
    begin of T_TSD_HLDT_AGG_AVG_PRCSN_LVL_1,
      "!   The mean value.
      MEAN type NUMBER,
      "!   The range of values.
      RANGE type STANDARD TABLE OF NUMBER WITH NON-UNIQUE DEFAULT KEY,
    end of T_TSD_HLDT_AGG_AVG_PRCSN_LVL_1.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Pipeline ranking based on the specified metric.</p>
    begin of T_TSAD_HOLDOUT_SUPPORTING_RANK,
      "!   (Recommended): Average of the accuracy of predictions based on percent of
      "!    positive predictions that are correct.
      AVERAGE_PRECISION type T_TSD_HLDT_SPPRTNG_RNK_AVG_PR1,
      "!   Harmonic average of the precision and recall, with best value of 1 (perfect
      "!    precision and recall) and worst at 0.
      F1 type JSONOBJECT,
      "!   Measure of how well a parameter can distinguish between two groups.
      ROC_AUC type JSONOBJECT,
      "!   Measures the accuracy of a prediction based on percent of positive predictions
      "!    that are correct.
      PRECISION type JSONOBJECT,
      "!   Measures the percentage of identified positive predictions against possible
      "!    positives in data set.
      RECALL type JSONOBJECT,
    end of T_TSAD_HOLDOUT_SUPPORTING_RANK.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Measure of how well a parameter can distinguish between two</p>
    "!     groups.
    begin of T_TSAD_HOLDOUT_AGG_ROC_AUC,
      "!   No documentation available.
      LEVEL_SHIFT type JSONOBJECT,
      "!   No documentation available.
      LOCALIZED_EXTREME type JSONOBJECT,
      "!   No documentation available.
      TREND type JSONOBJECT,
      "!   Variance anomaly refers to a segment of time series in which the variance of a
      "!    time series is changed.
      VARIANCE type T_VARIANCE,
    end of T_TSAD_HOLDOUT_AGG_ROC_AUC.
  types:
    "! No documentation available.
    begin of T_TSD_HLDT_AGGRGTD_SCORE_ITEM,
      "!   Metric score for the Pipeline 1.
      P1 type NUMBER,
      "!   Metric score for the Pipeline 2.
      P2 type NUMBER,
      "!   Metric score for the Pipeline 3.
      P3 type NUMBER,
      "!   Metric score for the Pipeline 4.
      P4 type NUMBER,
      "!   Metric score for the Pipeline 5.
      P5 type NUMBER,
      "!   Metric score for the Pipeline 6.
      P6 type NUMBER,
    end of T_TSD_HLDT_AGGRGTD_SCORE_ITEM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    trend anomaly refers to a segment of time series, which has</p>
    "!     a trend change compared to the time series before the segment.
    begin of T_TSD_HLDT_AGG_AVG_PRCSN_TREND,
      "!   The mean value.
      MEAN type NUMBER,
      "!   The range of values.
      RANGE type STANDARD TABLE OF NUMBER WITH NON-UNIQUE DEFAULT KEY,
    end of T_TSD_HLDT_AGG_AVG_PRCSN_TREND.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Harmonic average of the precision and recall, with best</p>
    "!     value of 1 (perfect precision and recall) and worst at 0.
    begin of T_TSAD_HOLDOUT_AGG_F1,
      "!   Level shift anomaly refers to a segment in which the mean value of a time series
      "!    is changed.
      LEVEL_SHIFT type JSONOBJECT,
      "!   No documentation available.
      LOCALIZED_EXTREME type JSONOBJECT,
      "!   No documentation available.
      TREND type JSONOBJECT,
      "!   Variance anomaly refers to a segment of time series in which the variance of a
      "!    time series is changed.
      VARIANCE type T_VARIANCE,
    end of T_TSAD_HOLDOUT_AGG_F1.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Localized extreme anomaly refers to an unusual data point in</p>
    "!     a time series, which deviates significantly from the data points around it.
    begin of T_TSD_HLDT_AGG_AVG_PRCSN_LCLZ1,
      "!   The mean value.
      MEAN type NUMBER,
      "!   The range of values.
      RANGE type STANDARD TABLE OF NUMBER WITH NON-UNIQUE DEFAULT KEY,
    end of T_TSD_HLDT_AGG_AVG_PRCSN_LCLZ1.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Measures the percentage of identified positive predictions</p>
    "!     against possible positives in data set.
    begin of T_TSAD_HOLDOUT_AGG_RECALL,
      "!   No documentation available.
      LEVEL_SHIFT type JSONOBJECT,
      "!   No documentation available.
      LOCALIZED_EXTREME type JSONOBJECT,
      "!   No documentation available.
      TREND type JSONOBJECT,
      "!   Variance anomaly refers to a segment of time series in which the variance of a
      "!    time series is changed.
      VARIANCE type T_VARIANCE,
    end of T_TSAD_HOLDOUT_AGG_RECALL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Average of the accuracy of predictions based on percent of</p>
    "!     positive predictions that are correct.
    begin of T_TSD_HLDT_AGG_AVG_PRECISION,
      "!   Level shift anomaly refers to a segment in which the mean value of a time series
      "!    is changed.
      LEVEL_SHIFT type T_TSD_HLDT_AGG_AVG_PRCSN_LVL_1,
      "!   Localized extreme anomaly refers to an unusual data point in a time series,
      "!    which deviates significantly from the data points around it.
      LOCALIZED_EXTREME type T_TSD_HLDT_AGG_AVG_PRCSN_LCLZ1,
      "!   trend anomaly refers to a segment of time series, which has a trend change
      "!    compared to the time series before the segment.
      TREND type T_TSD_HLDT_AGG_AVG_PRCSN_TREND,
      "!   Variance anomaly refers to a segment of time series in which the variance of a
      "!    time series is changed.
      VARIANCE type T_VARIANCE,
    end of T_TSD_HLDT_AGG_AVG_PRECISION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Aggregated scores of anomaly types per metric.</p>
    begin of T_TSAD_HOLDOUT_AGG,
      "!   Average of the accuracy of predictions based on percent of positive predictions
      "!    that are correct.
      AVERAGE_PRECISION type T_TSD_HLDT_AGG_AVG_PRECISION,
      "!   Harmonic average of the precision and recall, with best value of 1 (perfect
      "!    precision and recall) and worst at 0.
      F1 type T_TSAD_HOLDOUT_AGG_F1,
      "!   Measures the accuracy of a prediction based on percent of positive predictions
      "!    that are correct.
      PRECISION type T_TSAD_HOLDOUT_AGG_PRECISION,
      "!   Measures the percentage of identified positive predictions against possible
      "!    positives in data set.
      RECALL type T_TSAD_HOLDOUT_AGG_RECALL,
      "!   Measure of how well a parameter can distinguish between two groups.
      ROC_AUC type T_TSAD_HOLDOUT_AGG_ROC_AUC,
    end of T_TSAD_HOLDOUT_AGG.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Metrics generated in model evaluation phase.</p>
    begin of T_MTRC_TSD_MTRCS_TSAD_HOLDOUT,
      "!   Simulated anomaly values are injected into the holdout data in each iteration
      "!    for pipeline evaluation.
      ITERATIONS type STANDARD TABLE OF T_TSAD_HOLDOUT_ITERATIONS_ITEM WITH NON-UNIQUE DEFAULT KEY,
      "!   Aggregated scores of anomaly types per metric.
      AGG type T_TSAD_HOLDOUT_AGG,
      "!   Pipeline ranking based on the specified metric.
      SUPPORTING_RANK type T_TSAD_HOLDOUT_SUPPORTING_RANK,
      "!   This score is calculated based on an aggregation of the optimized metric (for
      "!    example, Average precision) values for the 4 anomaly types. The scores for each
      "!    pipeline are ranked, using the Borda count method, and then weighted for their
      "!    contribution to the aggregate score. Unlike a standard metric score, this value
      "!    is not between 0 and 1. A higher value indicates a stronger score.
      AGGREGATED_SCORE type STANDARD TABLE OF T_TSD_HLDT_AGGRGTD_SCORE_ITEM WITH NON-UNIQUE DEFAULT KEY,
    end of T_MTRC_TSD_MTRCS_TSAD_HOLDOUT.
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
    "!    A reference to a resource.</p>
    begin of T_SIMPLE_REL,
      "!   The id of the referenced resource.
      ID type STRING,
    end of T_SIMPLE_REL.
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
    "!    The payload for scoring.</p>
    begin of T_SCORING_PAYLOAD_OPTIM,
      "!   Discriminates the data for multi input data situation. For example in cases
      "!    where multiple tensors are expected.
      ID type STRING,
      "!   The names of the fields. The order of fields values must be consistent with the
      "!    order of fields names. Mutually exclusive with `content` field.
      FIELDS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   Input data as a vector for a single record or a matrix representing a mini batch
      "!    of records. Mutually exclusive with `content` field.
      VALUES type STANDARD TABLE OF T_Array WITH NON-UNIQUE DEFAULT KEY,
      "!   Input data as a base64 encoded string. Mutually exclusive with `fields` or
      "!    `values` field.
      CONTENT type STRING,
    end of T_SCORING_PAYLOAD_OPTIM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    An optional message related to the job status.</p>
    begin of T_JOB_STATUS_MESSAGE,
      "!   The level of the message, normally one of `debug`, `info` or `warning`.
      LEVEL type STRING,
      "!   The message.
      TEXT type STRING,
    end of T_JOB_STATUS_MESSAGE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The status of the job.</p>
    begin of T_JOB_STATUS,
      "!   The state of the job.
      STATE type STRING,
      "!   The date when the job started to run.
      RUNNING_AT type DATETIME,
      "!   The date that the job finished.
      COMPLETED_AT type DATETIME,
      "!   An optional message related to the job status.
      MESSAGE type T_JOB_STATUS_MESSAGE,
      "!   The data returned when an error is encountered.
      FAILURE type T_API_ERROR_RESPONSE,
    end of T_JOB_STATUS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A reference to data.</p>
    begin of T_OBJECT_LOCATION_OPTIM,
      "!   Item identification inside a collection.
      ID type STRING,
      "!   The data source type like `connection_asset` or `data_asset`.
      TYPE type STRING,
      "!   Contains a set of fields specific to each connection. See here for [details
      "!    about specifying connections](#datareferences).
      CONNECTION type JSONOBJECT,
      "!   Contains a set of fields that describe the location of the data with respect to
      "!    the `connection`.
      LOCATION type MAP,
    end of T_OBJECT_LOCATION_OPTIM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The solve state for a Decision Optimization job.</p>
    begin of T_SOLVE_STATE,
      "!   Details related to the job.
      DETAILS type JSONOBJECT,
      "!   The solve status.
      SOLVE_STATUS type STRING,
      "!   The interrupted status.
      INTERRUPTION_STATUS type STRING,
      "!   The latest engine activity.
      LATEST_ENGINE_ACTIVITY type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
    end of T_SOLVE_STATE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The solve state for a Decision Optimization job.</p>
    begin of T_JB_DECISION_OPTIMIZATION_RES,
      "!   To control solve behavior, you can specify solve parameters in your request as
      "!    key-value pairs.
      SOLVE_PARAMETERS type JSONOBJECT,
      "!   A list of payloads.
      INPUT_DATA type STANDARD TABLE OF T_SCORING_PAYLOAD_OPTIM WITH NON-UNIQUE DEFAULT KEY,
      "!   A list of input data references.
      INPUT_DATA_REFERENCES type STANDARD TABLE OF T_OBJECT_LOCATION_OPTIM WITH NON-UNIQUE DEFAULT KEY,
      "!   A list of output payloads.
      OUTPUT_DATA type STANDARD TABLE OF T_SCORING_PAYLOAD_OPTIM WITH NON-UNIQUE DEFAULT KEY,
      "!   A list of output data references.
      OUTPUT_DATA_REFERENCES type STANDARD TABLE OF T_OBJECT_LOCATION_OPTIM WITH NON-UNIQUE DEFAULT KEY,
      "!   The status of the job.
      STATUS type T_JOB_STATUS,
      "!   The solve state for a Decision Optimization job.
      SOLVE_STATE type T_SOLVE_STATE,
    end of T_JB_DECISION_OPTIMIZATION_RES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The payload for scoring.</p>
    begin of T_SCORING_PAYLOAD,
      "!   Discriminates the data for multi input data situation. For example in cases
      "!    where multiple tensors are expected.
      ID type STRING,
      "!   If specified, the `values` represents the ground truth data (the label
      "!    information) for the input data provided. This information will be used for
      "!    computing machine learning metrics.
      TYPE type STRING,
      "!   The names of the fields. The order of fields values must be consistent with the
      "!    order of fields names.
      FIELDS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   Input data as a vector for a single record or a matrix representing a mini batch
      "!    of records.
      VALUES type STANDARD TABLE OF T_Array WITH NON-UNIQUE DEFAULT KEY,
      "!   Used when performing evaluation. This contains the ground truths for the input
      "!    data.
      TARGETS type STANDARD TABLE OF T_Array WITH NON-UNIQUE DEFAULT KEY,
    end of T_SCORING_PAYLOAD.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    An evaluation specification used to support evaluations for</p>
    "!     TensorFlow.
    begin of T_EVALUATIONS_SPEC_ITEM,
      "!   An identifier of this metrics set. For a DL problem this can be the output
      "!    tensor id/name in order to identify on which output these metrics will be
      "!    computed.
      ID type STRING,
      "!   The id of the `input_data.id` with the `type=target`. This points to the ground
      "!    truth information that will be used together with prediction information to
      "!    generate metrics.
      INPUT_TARGET type STRING,
      "!   A list of the metric names.
      METRICS_NAMES type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
    end of T_EVALUATIONS_SPEC_ITEM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The status of the job.</p>
    begin of T_JOB_SCORING_RESULT,
      "!   A list of payloads.
      INPUT_DATA type STANDARD TABLE OF T_SCORING_PAYLOAD WITH NON-UNIQUE DEFAULT KEY,
      "!   A list of input data references.
      INPUT_DATA_REFERENCES type STANDARD TABLE OF T_DATA_CONNECTION_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   A reference to data with an optional data schema.<br/>
      "!   If necessary, it is possible to provide a data connection that contains<br/>
      "!   just the data schema.
      OUTPUT_DATA_REFERENCE type T_DATA_CONNECTION_REFERENCE,
      "!   A list of evaluation specifications.
      EVALUATIONS type STANDARD TABLE OF T_EVALUATIONS_SPEC_ITEM WITH NON-UNIQUE DEFAULT KEY,
      "!   This property is used to specify environment variables and their values required
      "!    to be consumed by the batch deployment job. The environment variables and
      "!    values must be specified as key-value pairs.<br/>
      "!   <br/>
      "!   This property is currently supported only for Python Scripts in batch deployment
      "!    jobs.
      ENVIRONMENT_VARIABLES type MAP,
      "!   The predictions.
      PREDICTIONS type STANDARD TABLE OF T_SCORING_PAYLOAD WITH NON-UNIQUE DEFAULT KEY,
      "!   The status of the job.
      STATUS type T_JOB_STATUS,
    end of T_JOB_SCORING_RESULT.
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
    "! No documentation available.
    begin of T_HYBRD_PPLN_HRDWR_SPECS_ITEM,
      "!   The id of node runtime.
      NODE_RUNTIME_ID type STRING,
      "!   A hardware specification.
      HARDWARE_SPEC type T_HARDWARE_SPEC,
    end of T_HYBRD_PPLN_HRDWR_SPECS_ITEM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Information about the platform job assets related to this</p>
    "!     execution. Depending on the `version` date passed, the `platform_jobs` section
    "!     in the response may or may not be populated. Use the GET call to retrieve the
    "!     deployment job, this GET call will eventually populate the `platform_jobs`
    "!     section. Refer to the `version date` description for more details.
    begin of T_PLATFORM_JOB,
      "!   The id of the platform job.
      JOB_ID type STRING,
      "!   The run id of the platform job.
      RUN_ID type STRING,
    end of T_PLATFORM_JOB.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Information about the platform job assets related to this</p>
    "!     execution.
    begin of T_JOB_STATUS_ENTITY,
      "!   A reference to a resource.
      DEPLOYMENT type T_SIMPLE_REL,
      "!   User defined properties.
      CUSTOM type JSONOBJECT,
      "!   A hardware specification.
      HARDWARE_SPEC type T_HARDWARE_SPEC,
      "!   Hybrid pipeline hardware specification.
      HYBRID_PIPELINE_HARDWARE_SPECS type STANDARD TABLE OF T_HYBRD_PPLN_HRDWR_SPECS_ITEM WITH NON-UNIQUE DEFAULT KEY,
      "!   The status of the job.
      SCORING type T_JOB_SCORING_RESULT,
      "!   The solve state for a Decision Optimization job.
      DECISION_OPTIMIZATION type T_JB_DECISION_OPTIMIZATION_RES,
      "!   Information about the platform job assets related to this execution.<br/>
      "!   Depending on the `version` date passed, the `platform_jobs` section in the
      "!    response may or may not be populated.<br/>
      "!   Use the GET call to retrieve the deployment job, this GET call will eventually
      "!    populate the `platform_jobs` section.<br/>
      "!   Refer to the `version date` description for more details.
      PLATFORM_JOB type T_PLATFORM_JOB,
    end of T_JOB_STATUS_ENTITY.
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
    "!    The information related to the job.</p>
    begin of T_JOBS_RESOURCE,
      "!   Common metadata for a resource where `project_id` or `space_id` must be present.
      "!
      METADATA type T_RESOURCE_META,
      "!   Information about the platform job assets related to this execution.
      ENTITY type T_JOB_STATUS_ENTITY,
    end of T_JOBS_RESOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The information related to the jobs.</p>
    begin of T_JOBS_RESOURCES,
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
      "!   A list of jobs.
      RESOURCES type STANDARD TABLE OF T_JOBS_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
    end of T_JOBS_RESOURCES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details for the revision.</p>
    begin of T_RMT_TRAIN_SYS_REV_ENTITY_REQ,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   An optional commit message for the revision.
      COMMIT_MESSAGE type STRING,
    end of T_RMT_TRAIN_SYS_REV_ENTITY_REQ.
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
    "! No documentation available.
    begin of T_MDL_DEF_ENTITY_REQ_PLATFORM,
      "!   The name of the platform.
      NAME type STRING,
      "!   The supported versions.
      VERSIONS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
    end of T_MDL_DEF_ENTITY_REQ_PLATFORM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of a model. The `software_spec` is used only</p>
    "!     for training. Either space_id or project_id has to be provided and is
    "!     mandatory.
    begin of T_MODEL_DEF_ENTITY_REQUEST,
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
      "!   The package version.
      VERSION type STRING,
      "!   No documentation available.
      PLATFORM type T_MDL_DEF_ENTITY_REQ_PLATFORM,
      "!   The command used to run the model.
      COMMAND type STRING,
      "!   A software specification.
      SOFTWARE_SPEC type T_SOFTWARE_SPEC_REL,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
    end of T_MODEL_DEF_ENTITY_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The optimizer for federated learning.</p>
    begin of T_FEDERATED_LEARNING_OPTIMIZER,
      "!   No documentation available.
      NAME type STRING,
      "!   Optimizer specification.
      SPEC type JSONOBJECT,
    end of T_FEDERATED_LEARNING_OPTIMIZER.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Details about the batch deployment job.</p><br/>
    "!    <br/>
    "!    The `deployment` is a reference to the deployment associated with the deployment
    "!     job or deployment job definition.<br/>
    "!    <br/>
    "!    The `scoring` and `decision_optimization` properties are mutually exclusive.
    begin of T_JOB_ENTITY_RESULT,
      "!   A reference to a resource.
      DEPLOYMENT type T_SIMPLE_REL,
      "!   User defined properties.
      CUSTOM type JSONOBJECT,
      "!   A hardware specification.
      HARDWARE_SPEC type T_HARDWARE_SPEC,
      "!   Hybrid pipeline hardware specification.
      HYBRID_PIPELINE_HARDWARE_SPECS type STANDARD TABLE OF T_HYBRD_PPLN_HRDWR_SPECS_ITEM WITH NON-UNIQUE DEFAULT KEY,
      "!   The status of the job.
      SCORING type T_JOB_SCORING_RESULT,
      "!   The solve state for a Decision Optimization job.
      DECISION_OPTIMIZATION type T_JB_DECISION_OPTIMIZATION_RES,
    end of T_JOB_ENTITY_RESULT.
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
    "! No documentation available.
    begin of T_MODEL_DEF_ENTITY_PLATFORM,
      "!   The name of the platform.
      NAME type STRING,
      "!   The supported versions.
      VERSIONS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
    end of T_MODEL_DEF_ENTITY_PLATFORM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of a model. The `software_spec` is used only</p>
    "!     for training. Either space_id or project_id has to be provided and is
    "!     mandatory.
    begin of T_MODEL_DEFINITION_ENTITY,
      "!   The package version.
      VERSION type STRING,
      "!   No documentation available.
      PLATFORM type T_MODEL_DEF_ENTITY_PLATFORM,
      "!   The command used to run the model.
      COMMAND type STRING,
      "!   A software specification.
      SOFTWARE_SPEC type T_SOFTWARE_SPEC_REL,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
    end of T_MODEL_DEFINITION_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The information for a model definition.</p>
    begin of T_MODEL_DEFINITION_RESOURCE,
      "!   Common metadata for a resource where `project_id` or `space_id` must be present.
      "!
      METADATA type T_RESOURCE_META,
      "!   The definition of a model.<br/>
      "!   The `software_spec` is used only for training.<br/>
      "!   Either space_id or project_id has to be provided and is mandatory.
      ENTITY type T_MODEL_DEFINITION_ENTITY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_MODEL_DEFINITION_RESOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A paginated list of model definitions.</p>
    begin of T_MODEL_DEFINITION_RESOURCES,
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
      "!   A list of model definitions.
      RESOURCES type STANDARD TABLE OF T_MODEL_DEFINITION_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_MODEL_DEFINITION_RESOURCES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Details about the input/output data and other properties to</p>
    "!     be used for a batch deployment job of a model, Python Function or a Python
    "!     Scripts.<br/>
    "!    <br/>
    "!    Use `input_data` property to specify the input data for batch processing as part
    "!     of the job&apos;s payload. The `input_data` property is mutually exclusive with
    "!     `input_data_references` property, only use one of these. When `input_data` is
    "!     specified, the processed output of batch deployment job will be available in
    "!     `scoring.predictions` parameter in the deployment job response. `input_data`
    "!     property is not supported for batch deployment of Python Scripts.<br/>
    "!    <br/>
    "!    Use `input_data_references` property to specify the details pertaining to the
    "!     remote source where the input data for batch deployment job is available. The
    "!     `input_data_references` must be used with `output_data_references`. The
    "!     `input_data_references` property is mutually exclusive with `input_data`
    "!     property, only use one of these. The `input_data_references` property is not
    "!     supported for batch deployment job of Spark models and Python Functions.<br/>
    "!    <br/>
    "!    Use `output_data_references` property to specify the details pertaining to the
    "!     remote source where the input data for batch deployment job is available.
    "!     `output_data_references` must be used with `input_data_references`. The
    "!     `output_data_references` property is not supported for batch deployment job of
    "!     Spark models and Python Functions.
    begin of T_JOB_SCORING_REQUEST,
      "!   A list of payloads.
      INPUT_DATA type STANDARD TABLE OF T_SCORING_PAYLOAD WITH NON-UNIQUE DEFAULT KEY,
      "!   A list of input data references.
      INPUT_DATA_REFERENCES type STANDARD TABLE OF T_DATA_CONNECTION_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   A reference to data with an optional data schema.<br/>
      "!   If necessary, it is possible to provide a data connection that contains<br/>
      "!   just the data schema.
      OUTPUT_DATA_REFERENCE type T_DATA_CONNECTION_REFERENCE,
      "!   A list of evaluation specifications.
      EVALUATIONS type STANDARD TABLE OF T_EVALUATIONS_SPEC_ITEM WITH NON-UNIQUE DEFAULT KEY,
      "!   This property is used to specify environment variables and their values required
      "!    to be consumed by the batch deployment job. The environment variables and
      "!    values must be specified as key-value pairs.<br/>
      "!   <br/>
      "!   This property is currently supported only for Python Scripts in batch deployment
      "!    jobs.
      ENVIRONMENT_VARIABLES type MAP,
    end of T_JOB_SCORING_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A remote organization.</p>
    begin of T_ORGANIZATION,
      "!   The name of the organization.
      NAME type STRING,
      "!   The region for the organization.
      REGION type STRING,
    end of T_ORGANIZATION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The allowed identity.</p>
    begin of T_ALLOWED_IDENTITY,
      "!   The id of the identity.
      ID type STRING,
      "!   The type of the identity.
      TYPE type STRING,
      "!   A list of IP(s) and or CIDR(s) that are permitted to connect to the Remote
      "!    Training System, both IPv4 and IPv6 are supported.
      ALLOWED_IPS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
    end of T_ALLOWED_IDENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details of the remote administrator for the organization</p>
    "!     and identities.
    begin of T_REMOTE_ADMIN,
      "!   The name of the remote administrator.
      NAME type STRING,
      "!   The email of the remote administrator.
      EMAIL type STRING,
    end of T_REMOTE_ADMIN.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of a remote system used by Federated</p>
    "!     Learning.
    begin of T_REMOTE_TRAIN_SYSTEM_ENTITY,
      "!   The list of allowed identities that are allowed to access the remote system.
      ALLOWED_IDENTITIES type STANDARD TABLE OF T_ALLOWED_IDENTITY WITH NON-UNIQUE DEFAULT KEY,
      "!   A remote organization.
      ORGANIZATION type T_ORGANIZATION,
      "!   The details of the remote administrator for the organization and identities.
      REMOTE_ADMIN type T_REMOTE_ADMIN,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
    end of T_REMOTE_TRAIN_SYSTEM_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The information for a remote training system.</p>
    begin of T_REMOTE_TRAIN_SYSTEM_RESOURCE,
      "!   Common metadata for a resource where `project_id` or `space_id` must be present.
      "!
      METADATA type T_RESOURCE_META,
      "!   The definition of a remote system used by Federated Learning.
      ENTITY type T_REMOTE_TRAIN_SYSTEM_ENTITY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_REMOTE_TRAIN_SYSTEM_RESOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The model definition.</p>
    begin of T_MODEL_DEFINITION_ID,
      "!   The id of the model definition.
      ID type STRING,
    end of T_MODEL_DEFINITION_ID.
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
    "!    Parameters that can be used to control the prediction</p>
    "!     request.
    begin of T_SCORING_PARAMETERS,
      "!   The forecast window to use for the prediction. If no value is set then the value
      "!    used during training will be used.
      FORECAST_WINDOW type INTEGER,
    end of T_SCORING_PARAMETERS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The input data.</p>
    begin of T_SYNC_SCORING_DATA_ITEM,
      "!   Discriminates the data for multi input data situation. For example in cases
      "!    where multiple tensors are expected.
      ID type STRING,
      "!   The names of the fields. The order of fields values must be consistent with the
      "!    order of fields names.
      FIELDS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   Input data as a a vector for a single record or a matrix representing a mini
      "!    batch of records.
      VALUES type STANDARD TABLE OF T_Array WITH NON-UNIQUE DEFAULT KEY,
    end of T_SYNC_SCORING_DATA_ITEM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Scoring data.</p>
    begin of T_SYNC_SCORING_DATA,
      "!   The input data.
      INPUT_DATA type STANDARD TABLE OF T_SYNC_SCORING_DATA_ITEM WITH NON-UNIQUE DEFAULT KEY,
      "!   Parameters that can be used to control the prediction request.
      SCORING_PARAMETERS type T_SCORING_PARAMETERS,
    end of T_SYNC_SCORING_DATA.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A reference to a model that is used by this function. Note</p>
    "!     that the reference can be to a model that is in a different space or project
    "!     from this function. For this reason either a `space_id` or a `project_id` must
    "!     be provided or the `space_id` or a `project_id` of the function will be
    "!     assumed.
    begin of T_MODEL_REFERENCE,
      "!   The space that contains the resource.
      SPACE_ID type STRING,
      "!   The project that contains the resource.
      PROJECT_ID type STRING,
      "!   The model id.
      ID type STRING,
      "!   The optional revision of the model.
      REV type STRING,
    end of T_MODEL_REFERENCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The schemas of the expected data.</p>
    begin of T_FUNCTION_ENTITY_SCHEMAS,
      "!   The schema of the expected input data.
      INPUT type STANDARD TABLE OF T_DATA_SCHEMA WITH NON-UNIQUE DEFAULT KEY,
      "!   The schema of the expected output data.
      OUTPUT type STANDARD TABLE OF T_DATA_SCHEMA WITH NON-UNIQUE DEFAULT KEY,
    end of T_FUNCTION_ENTITY_SCHEMAS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details of the function to be created.</p>
    begin of T_FUNCTION_ENTITY,
      "!   A software specification.
      SOFTWARE_SPEC type T_SOFTWARE_SPEC_REL,
      "!   Type of the function to be created. Only `python` type is supported as of now.
      "!    If not specified, `python` is the default. Functions expect a gzip file that
      "!    contains a python file that make up the function. Python functions specify what
      "!    needs to be run when the function is deployed and what needs to be run when the
      "!    scoring function is called. In other words, you are able to customize what
      "!    preparation WML does in the environment when you deploy the function, as well
      "!    as what steps WML takes to generate the output when you call the API later on.
      "!    The function consists of the outer function (any place that is not within the
      "!    score function) and the inner score function. The code that sits in the outer
      "!    function runs when the function is deployed, and the environment is then frozen
      "!    and ready to be used whenever the online scoring or batch inline job processing
      "!    API is called. The code that sits in the inner score function runs when the
      "!    online scoring or batch inline job processing API is called, in the environment
      "!    customized by the outer function. See [Deploying Python
      "!    function](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/ml-d
      "!   eploy-py-function.html?context=cpdaas&audience=wdp) for more details.<br/>
      "!   <br/>
      "!   This is illustrated in the example below:<br/>
      "!   <br/>
      "!   &gt;&lt;python code used to set up the environment&gt; \<br/>
      "!   &gt;\<br/>
      "!   &gt;def score(payload): \<br/>
      "!   &gt;&nbsp;&nbsp;&nbsp;&nbsp;df_payload =
      "!    pd.DataFrame(payload[&quot;values&quot;]) \<br/>
      "!   &gt;&nbsp;&nbsp;&nbsp;&nbsp;df_payload.columns = payload[&quot;fields&quot;]
      "!    \<br/>
      "!   &gt;&nbsp;&nbsp;&nbsp;&nbsp;... \<br/>
      "!   &gt;&nbsp;&nbsp;&nbsp;&nbsp;output = &#123;&quot;result&quot; : res&#125; \<br/>
      "!   &gt;&nbsp;&nbsp;&nbsp;&nbsp;return output \<br/>
      "!   &gt;\<br/>
      "!   &gt;return score.
      TYPE type STRING,
      "!   Scoring data.
      SAMPLE_SCORING_INPUT type T_SYNC_SCORING_DATA,
      "!   The schemas of the expected data.
      SCHEMAS type T_FUNCTION_ENTITY_SCHEMAS,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   This is a list of references of the models that are used by this function, if
      "!    any. These references are provided by the owner of the function and are used
      "!    for usage tracking only.
      MODEL_REFERENCES type STANDARD TABLE OF T_MODEL_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
    end of T_FUNCTION_ENTITY.
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
    "!    A reference to a resource.</p>
    begin of T_REL,
      "!   The id of the referenced resource.
      ID type STRING,
      "!   The revision of the referenced resource.
      REV type STRING,
    end of T_REL.
  types:
    "! No documentation available.
    begin of T_FDRTD_LEARNING_MODEL_SPEC,
      "!   A reference to a resource.
      HREF type T_REL,
    end of T_FDRTD_LEARNING_MODEL_SPEC.
  types:
    "! No documentation available.
    begin of T_FDRTD_LRNNG_RMT_TRAIN_RMT_T1,
      "!   The remote training id of the referenced resource.
      ID type STRING,
      "!   The required of the referenced resource.
      REQUIRED type BOOLEAN,
    end of T_FDRTD_LRNNG_RMT_TRAIN_RMT_T1.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The remote training for federated learning.</p>
    begin of T_FDRTD_LEARNING_REMOTE_TRAIN,
      "!   The quorum for federated learning.
      QUORUM type DOUBLE,
      "!   The maximum timeout for federated learning.
      MAX_TIMEOUT type INTEGER,
      "!   No documentation available.
      REMOTE_TRAINING_SYSTEMS type STANDARD TABLE OF T_FDRTD_LRNNG_RMT_TRAIN_RMT_T1 WITH NON-UNIQUE DEFAULT KEY,
    end of T_FDRTD_LEARNING_REMOTE_TRAIN.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Settings for cryptographic fusion for federated learning.</p>
    begin of T_FEDERATED_LEARNING_CRYPTO,
      "!   The level of encryption used to encrypt training data.
      CIPHER_SPEC type STRING,
    end of T_FEDERATED_LEARNING_CRYPTO.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The model type for federated_learning.</p>
    begin of T_FEDERATED_LEARNING_MODEL,
      "!   No documentation available.
      TYPE type STRING,
      "!   No documentation available.
      SPEC type T_FDRTD_LEARNING_MODEL_SPEC,
      "!   No documentation available.
      MODEL_FILE type STRING,
    end of T_FEDERATED_LEARNING_MODEL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Federated Learning.</p>
    begin of T_FEDERATED_LEARNING,
      "!   The model type for federated_learning.
      MODEL type T_FEDERATED_LEARNING_MODEL,
      "!   The fusion type for federated learning. For an in-depth description of each
      "!    fusion type, please refer to
      "!    [here](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/fl-fram
      "!   es.html).<br/>
      "!    * `iter_avg` - Simple Avg, simplest aggregation that is used as a baseline
      "!    where all parties&apos; model updates are equally weighted.<br/>
      "!    * `avg` - Weighted Avg, weights the average of updates based on the number of
      "!    each party sample. Use with training data sets of widely differing sizes.<br/>
      "!    * `pfnm` - Probabilistic Federated Neural Matching (PFNM),
      "!    communication-efficient method for fully connected neural networks when parties
      "!    have heterogeneous data sets.<br/>
      "!    * `spahm` - K-Means/SPAHM, used to train KMeans (unsupervised learning) models
      "!    when parties have heterogeneous data sets.<br/>
      "!    * `xgb_classifier` - XGBoost Classification, used to build classification
      "!    models that use XGBoost.<br/>
      "!    * `xgb_regressor` - XGBoost Regression, used to build regression models that
      "!    use XGBoost.<br/>
      "!    * `crypto_iter_avg` - Iterative averaging based fusion implemented with a
      "!    crypto system.
      FUSION_TYPE type STRING,
      "!   The remote training for federated learning.
      REMOTE_TRAINING type T_FDRTD_LEARNING_REMOTE_TRAIN,
      "!   The number of training iterations to complete between the aggregator and the
      "!    remote systems unless termination accuracy is achieved first.
      ROUNDS type INTEGER,
      "!   A boolean expression that describes the conditions, in terms of model metrics,
      "!    under which training should complete.
      TERMINATION_PREDICATE type STRING,
      "!   The total number of passes over the local training dataset to train a model.
      EPOCHS type INTEGER,
      "!   The optimizer for federated learning.
      OPTIMIZER type T_FEDERATED_LEARNING_OPTIMIZER,
      "!   The loss function to use in the boosting process.
      LOSS type STRING,
      "!   The metrics for federated learning.
      METRICS type STRING,
      "!   The maximum depth of each tree.
      MAX_DEPTH type INTEGER,
      "!   Controls how rapidly to change the model in response to the estimated error each
      "!    time the model weights are updated.
      LEARNING_RATE type DOUBLE,
      "!   The coefficient for the L2 regularizer.
      L2_REGULARIZATION type DOUBLE,
      "!   The maximum number of bins to use for non-missing values across all features.
      MAX_BINS type INTEGER,
      "!   The maximum number of leaves for each tree.
      MAX_LEAF_NODES type INTEGER,
      "!   The minimum number of samples per leaf.
      MIN_SAMPLES_LEAF type INTEGER,
      "!   Seed used to set the pseudo-random number generator.
      RANDOM_STATE type INTEGER,
      "!   A general programming term to produce logging output.
      VERBOSE type BOOLEAN,
      "!   Number of target classes for the classification model.
      NUM_CLASSES type INTEGER,
      "!   Specifies the failure tolerance, for example the maximum number of parties that
      "!    would possibly be failing during training.
      BYZANTINE_THRESHOLD type INTEGER,
      "!   Specifies how far the local model neurons are allowed from the global model.
      SIGMA type DOUBLE,
      "!   Specifies the standard deviation of the global network neurons.
      SIGMA0 type DOUBLE,
      "!   Specifies the expected number of features present in each observation.
      GAMMA type DOUBLE,
      "!   Specifies the number of iterations of randomly initialized matching-unmatching
      "!    procedure is to be performed.
      ITERS type INTEGER,
      "!   If true, save the model generated at the end of each round of training.
      SAVE_INTERMEDIATE_MODELS type BOOLEAN,
      "!   Settings for cryptographic fusion for federated learning.
      CRYPTO type T_FEDERATED_LEARNING_CRYPTO,
      "!   A hardware specification.
      HARDWARE_SPEC type T_HARDWARE_SPEC,
      "!   A software specification.
      SOFTWARE_SPEC type T_SOFTWARE_SPEC_REL,
      "!   The version for federated learning.
      VERSION type STRING,
      "!   The log level (`critical`, `error`, `warning`, `info`, `debug`) for federated
      "!    learning.
      LOG_LEVEL type STRING,
      "!   Used with XGBoost training to control the relative accuracy of sketched data
      "!    sent to the aggregator. Higher values will result in higher quality models but
      "!    with a reduction in data privacy and increase in resource consumption.
      SKETCH_ACCURACY_VS_PRIVACY type NUMBER,
    end of T_FEDERATED_LEARNING.
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
    "!    System details including warnings and stats. This will get</p>
    "!     populated only if &apos;stats&apos; query parameter is passed with
    "!     &apos;true&apos;.
    begin of T_DEPLOYMENT_RESOURCES_SYSTEM,
      "!   Optional details provided by the service about statistics of the number of
      "!    deployments created. The deployments that are counted will depend on the
      "!    request parameters.
      SYSTEM type T_DEPLOYMENT_SYSTEM_DETAILS,
    end of T_DEPLOYMENT_RESOURCES_SYSTEM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A set of key-value pairs where `key` is the parameter name.</p>
    begin of T_ONLINE_PARAMETERS,
      "!   The `serving_name` can be used in the prediction URL in place of the
      "!    `deployment_id`. The `serving_name`` can only have the characters [a-z,0-9,_]
      "!    and the length should not be more than 36 characters.
      SERVING_NAME type STRING,
    end of T_ONLINE_PARAMETERS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Indicates that this is an online deployment. An empty object</p>
    "!     has to be specified. If the online scoring schema has a `type` of `DataFrame`
    "!     then the scoring payload will be converted to a `Pandas` data frame.
    begin of T_ONLINE_REQUEST,
      "!   A set of key-value pairs where `key` is the parameter name.
      PARAMETERS type T_ONLINE_PARAMETERS,
    end of T_ONLINE_REQUEST.
  types:
    "! No documentation available.
    begin of T_PPLN_REL_DATA_BINDINGS_ITEM,
      "!   The input_data_reference name that is the input for the node identified by
      "!    node_id.
      DATA_REFERENCE_NAME type STRING,
      "!   The id of the pipeline node that will receive the associated
      "!    input_data_reference input.
      NODE_ID type STRING,
    end of T_PPLN_REL_DATA_BINDINGS_ITEM.
  types:
    "! No documentation available.
    begin of T_PPLN_REL_NODES_PARAM_ITEM,
      "!   The id of the pipeline node that will receive the associated
      "!    input_data_reference input.
      NODE_ID type STRING,
      "!   The parameters.
      PARAMETERS type JSONOBJECT,
    end of T_PPLN_REL_NODES_PARAM_ITEM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A pipeline. The `hardware_spec` is a reference to the</p>
    "!     hardware specification. The `hybrid_pipeline_hardware_specs` are used only when
    "!     training a hybrid pipeline in order to specify compute requirement for each
    "!     pipeline node.
    begin of T_PIPELINE_REL,
      "!   The id of the referenced resource.
      ID type STRING,
      "!   The revision of the referenced resource.
      REV type STRING,
      "!   The underlying model type produced by the pipeline or by the model_definition.
      MODEL_TYPE type STRING,
      "!   The data bindings.
      DATA_BINDINGS type STANDARD TABLE OF T_PPLN_REL_DATA_BINDINGS_ITEM WITH NON-UNIQUE DEFAULT KEY,
      "!   The node parameters.
      NODES_PARAMETERS type STANDARD TABLE OF T_PPLN_REL_NODES_PARAM_ITEM WITH NON-UNIQUE DEFAULT KEY,
      "!   A hardware specification.
      HARDWARE_SPEC type T_HARDWARE_SPEC,
      "!   Hybrid pipeline hardware specification.
      HYBRID_PIPELINE_HARDWARE_SPECS type STANDARD TABLE OF T_HYBRD_PPLN_HRDWR_SPECS_ITEM WITH NON-UNIQUE DEFAULT KEY,
    end of T_PIPELINE_REL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A model. The `software_spec` is a reference to a software</p>
    "!     specification. The `hardware_spec` is a reference to a hardware specification.
    begin of T_MODEL_DEFINITION_REL,
      "!   The id of the referenced resource.
      ID type STRING,
      "!   The revision of the referenced resource.
      REV type STRING,
      "!   The underlying model type produced by the pipeline or by the model_definition.
      MODEL_TYPE type STRING,
      "!   A hardware specification.
      HARDWARE_SPEC type T_HARDWARE_SPEC,
      "!   A software specification.
      SOFTWARE_SPEC type T_SOFTWARE_SPEC_REL,
      "!   If present, it overrides the command specified to the library resource itself.
      COMMAND type STRING,
      "!   Optional key-value pairs parameters.
      PARAMETERS type JSONOBJECT,
    end of T_MODEL_DEFINITION_REL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The `training_data_references` contain the training datasets</p>
    "!     and the<br/>
    "!    `results_reference` the connection where results will be stored.
    begin of T_TRAIN_DEF_ENTITY_REQUEST,
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
      "!   A reference to a resource.
      EXPERIMENT type T_REL,
      "!   A pipeline.<br/>
      "!   The `hardware_spec` is a reference to the hardware specification.<br/>
      "!   The `hybrid_pipeline_hardware_specs` are used only when training a hybrid
      "!    pipeline in order to<br/>
      "!   specify compute requirement for each pipeline node.
      PIPELINE type T_PIPELINE_REL,
      "!   A model.<br/>
      "!   The `software_spec` is a reference to a software specification.<br/>
      "!   The `hardware_spec` is a reference to a hardware specification.
      MODEL_DEFINITION type T_MODEL_DEFINITION_REL,
      "!   Federated Learning.
      FEDERATED_LEARNING type T_FEDERATED_LEARNING,
      "!   Training datasets.
      TRAINING_DATA_REFERENCES type STANDARD TABLE OF T_DATA_CONNECTION_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   The training results.
      RESULTS_REFERENCE type T_OBJECT_LOCATION,
      "!   The holdout/test datasets.
      TEST_DATA_REFERENCES type STANDARD TABLE OF T_DATA_CONNECTION_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
    end of T_TRAIN_DEF_ENTITY_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    To control solve behavior, you can specify solve parameters</p>
    "!     in your request as key-value pairs.
      T_SOLVE_PARAMETERS type JSONOBJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of a remote system used by Federated</p>
    "!     Learning.
    begin of T_REMOTE_TRAIN_SYS_ENTITY_REQ,
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
      "!   The list of allowed identities that are allowed to access the remote system.
      ALLOWED_IDENTITIES type STANDARD TABLE OF T_ALLOWED_IDENTITY WITH NON-UNIQUE DEFAULT KEY,
      "!   A remote organization.
      ORGANIZATION type T_ORGANIZATION,
      "!   The details of the remote administrator for the organization and identities.
      REMOTE_ADMIN type T_REMOTE_ADMIN,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
    end of T_REMOTE_TRAIN_SYS_ENTITY_REQ.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The `training_data_references` contain the training datasets</p>
    "!     and the<br/>
    "!    `results_reference` the connection where results will be stored.
    begin of T_TRAINING_DEFINITION_ENTITY,
      "!   A reference to a resource.
      EXPERIMENT type T_REL,
      "!   A pipeline.<br/>
      "!   The `hardware_spec` is a reference to the hardware specification.<br/>
      "!   The `hybrid_pipeline_hardware_specs` are used only when training a hybrid
      "!    pipeline in order to<br/>
      "!   specify compute requirement for each pipeline node.
      PIPELINE type T_PIPELINE_REL,
      "!   A model.<br/>
      "!   The `software_spec` is a reference to a software specification.<br/>
      "!   The `hardware_spec` is a reference to a hardware specification.
      MODEL_DEFINITION type T_MODEL_DEFINITION_REL,
      "!   Federated Learning.
      FEDERATED_LEARNING type T_FEDERATED_LEARNING,
      "!   Training datasets.
      TRAINING_DATA_REFERENCES type STANDARD TABLE OF T_DATA_CONNECTION_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   The training results.
      RESULTS_REFERENCE type T_OBJECT_LOCATION,
      "!   The holdout/test datasets.
      TEST_DATA_REFERENCES type STANDARD TABLE OF T_DATA_CONNECTION_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
    end of T_TRAINING_DEFINITION_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The information for a training definition.</p>
    begin of T_TRAINING_DEFINITION_RESOURCE,
      "!   Common metadata for a resource where `project_id` or `space_id` must be present.
      "!
      METADATA type T_RESOURCE_META,
      "!   The `training_data_references` contain the training datasets and the<br/>
      "!   `results_reference` the connection where results will be stored.
      ENTITY type T_TRAINING_DEFINITION_ENTITY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_TRAINING_DEFINITION_RESOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A paginated list of training definitions.</p>
    begin of T_TRAIN_DEFINITION_RESOURCES,
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
      RESOURCES type STANDARD TABLE OF T_TRAINING_DEFINITION_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_TRAIN_DEFINITION_RESOURCES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Contains a set of fields that describe the location of the</p>
    "!     data with respect to the `connection`.
      T_DATA_LOCATION type MAP.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The solve state for a Decision Optimization job.</p>
    begin of T_FIELD_SOLVE_STATE,
      "!   The solve state for a Decision Optimization job.
      SOLVE_STATE type T_SOLVE_STATE,
    end of T_FIELD_SOLVE_STATE.
  types:
    "! No documentation available.
    begin of T_CNSMPTN_CAPACITY_UNIT_HOURS,
      "!   The expiration date of the instance limit.
      EXPIRATION_DATE type DATE,
      "!   The current total computation time (in capacity unit hours). It is a sum of
      "!    both, reserved and already send to BSS, units.
      CURRENT type NUMBER,
      "!   The maximal computation time (in capacity unit hours).
      LIMIT type DOUBLE,
    end of T_CNSMPTN_CAPACITY_UNIT_HOURS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Limit for deployment jobs.</p>
    begin of T_CNSMPTN_DEPLOYMENT_JOB_COUNT,
      "!   The maximal number of deployment jobs.
      LIMIT type INTEGER,
    end of T_CNSMPTN_DEPLOYMENT_JOB_COUNT.
  types:
    "! No documentation available.
    begin of T_CONSUMPTION_DO_JOB_COUNT,
      "!   The maximal number of parallel DO jobs.
      LIMIT type INTEGER,
    end of T_CONSUMPTION_DO_JOB_COUNT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Compute usage details in a given context and framework.</p>
    begin of T_CONSUMPTION_DETAILS,
      "!   Context in which compute resources are consumed.
      CONTEXT type STRING,
      "!   Machine learning framework or tool.
      FRAMEWORK type STRING,
      "!   The current total computation time (in capacity unit hours) in a given context
      "!    and framework. It is a sum of both, reserved and already send to BSS, units.
      CAPACITY_UNIT_HOURS type NUMBER,
      "!   The current total number of tokens in a given context and framework. It is a sum
      "!    of both, reserved and already send to BSS, units.
      TOKEN_COUNT type INTEGER,
      "!   Space ID on which the consumption is requested. At most, only one of `space_id`
      "!    or `project_id` will be provided.
      SPACE_ID type STRING,
      "!   Project ID on which the consumption is requested. At most, only one of
      "!    `space_id` or `project_id` will be provided.
      PROJECT_ID type STRING,
    end of T_CONSUMPTION_DETAILS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The consumption part is available only when `plan.version`</p>
    "!     is `2`. All the values are calculated at the account level the instance belongs
    "!     to, not the instance itself.
    begin of T_CONSUMPTION,
      "!   No documentation available.
      CAPACITY_UNIT_HOURS type T_CNSMPTN_CAPACITY_UNIT_HOURS,
      "!   No documentation available.
      GPU_COUNT type T_CONSUMPTION_GPU_COUNT,
      "!   No documentation available.
      DO_JOB_COUNT type T_CONSUMPTION_DO_JOB_COUNT,
      "!   Limit for deployment jobs.
      DEPLOYMENT_JOB_COUNT type T_CNSMPTN_DEPLOYMENT_JOB_COUNT,
      "!   Grouped compute usage details presented at the account level the instance
      "!    belongs to.
      DETAILS type STANDARD TABLE OF T_CONSUMPTION_DETAILS WITH NON-UNIQUE DEFAULT KEY,
      "!   The token count for the account.
      TOKEN_COUNT type T_TOKEN_COUNT,
    end of T_CONSUMPTION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The list of allowed identities that are allowed to access</p>
    "!     the remote system.
      T_ALLOWED_IDENTITIES type STANDARD TABLE OF T_ALLOWED_IDENTITY WITH NON-UNIQUE DEFAULT KEY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The feature names where the calculated score describes the</p>
    "!     importance of each feature in the decision-making process.
      T_FEATURE_COEFFICIENTS type MAP.
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
    "!    Details about the input/output data and other properties to</p>
    "!     be used for a batch deployment job of a Decision Optimization problem. You can
    "!     find more information in [Deploying Decision
    "!     Optimization](https://dataplatform.cloud.ibm.com/docs/content/DO/WML_Deployment
    "!    /ModelIODataDefn.html) documentation. Use the `solve_parameters` as named value
    "!     pairs to control the Decision Optimization solve behavior. Use the `input_data`
    "!     and `output_data` properties to specify respectively input and output data for
    "!     batch processing as part of the job&apos;s payload. Use the
    "!     `input_data_references` and `output_data_references` properties to specify
    "!     respectively input and output data for batch processing as remote data sources.
    begin of T_JB_DECISION_OPTIMIZATION_REQ,
      "!   To control solve behavior, you can specify solve parameters in your request as
      "!    key-value pairs.
      SOLVE_PARAMETERS type JSONOBJECT,
      "!   A list of payloads.
      INPUT_DATA type STANDARD TABLE OF T_SCORING_PAYLOAD_OPTIM WITH NON-UNIQUE DEFAULT KEY,
      "!   A list of input data references.
      INPUT_DATA_REFERENCES type STANDARD TABLE OF T_OBJECT_LOCATION_OPTIM WITH NON-UNIQUE DEFAULT KEY,
      "!   A list of output payloads.
      OUTPUT_DATA type STANDARD TABLE OF T_SCORING_PAYLOAD_OPTIM WITH NON-UNIQUE DEFAULT KEY,
      "!   A list of output data references.
      OUTPUT_DATA_REFERENCES type STANDARD TABLE OF T_OBJECT_LOCATION_OPTIM WITH NON-UNIQUE DEFAULT KEY,
    end of T_JB_DECISION_OPTIMIZATION_REQ.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Details about the batch deployment job.</p><br/>
    "!    <br/>
    "!    The `deployment` is a reference to the deployment associated with the deployment
    "!     job or deployment job definition.<br/>
    "!    <br/>
    "!    The `scoring` and `decision_optimization` properties are mutually exclusive.
    "!     Specify only one of these when submitting a batch deployment job.<br/>
    "!    <br/>
    "!    Use `hybrid_pipeline_hardware_specs` only in a batch deployment job of a hybrid
    "!     pipeline in order to specify compute configuration for each pipeline node. For
    "!     all other cases use `hardware_spec` to specify compute configuration.<br/>
    "!    <br/>
    "!    In case of output data references where the data asset is a remote database,
    "!     users can specify if the batch deployment output must be appended to the table
    "!     or if the table is to be truncated and output data updated.<br/>
    "!    `output_data_references.location.write_mode` parameter can be used to for this
    "!     purpose. The values `truncate` or `append` can be specified for
    "!     `output_data_references.location.write_mode` parameter.<br/>
    "!    * Specifying `truncate` as value will truncate the table and the batch output
    "!     data will be inserted.<br/>
    "!    * Specifying `append` as value will insert the batch output data to the remote
    "!     database table.<br/>
    "!    * The `write_mode` parameter is applicable only for `output_data_references`
    "!     parameter.<br/>
    "!    * The `write_mode` parameter will be applicable only for remote database related
    "!     data assets. This parameter will not be applicable for local data asset or COS
    "!     based data asset.
    begin of T_JOB_RESOURCE_ENTITY,
      "!   A reference to a resource.
      DEPLOYMENT type T_SIMPLE_REL,
      "!   User defined properties.
      CUSTOM type JSONOBJECT,
      "!   A hardware specification.
      HARDWARE_SPEC type T_HARDWARE_SPEC,
      "!   Hybrid pipeline hardware specification.
      HYBRID_PIPELINE_HARDWARE_SPECS type STANDARD TABLE OF T_HYBRD_PPLN_HRDWR_SPECS_ITEM WITH NON-UNIQUE DEFAULT KEY,
      "!   Details about the input/output data and other properties to be used for a batch
      "!    deployment job of a model,<br/>
      "!   Python Function or a Python Scripts.<br/>
      "!   <br/>
      "!   Use `input_data` property to specify the input data for batch processing as part
      "!    of the job&apos;s payload.<br/>
      "!   The `input_data` property is mutually exclusive with `input_data_references`
      "!    property, only use one of these.<br/>
      "!   When `input_data` is specified, the processed output of batch deployment job
      "!    will be available in `scoring.predictions`<br/>
      "!   parameter in the deployment job response. `input_data` property is not supported
      "!    for batch deployment of Python Scripts.<br/>
      "!   <br/>
      "!   Use `input_data_references` property to specify the details pertaining to the
      "!    remote source where the input data for<br/>
      "!   batch deployment job is available. The `input_data_references` must be used with
      "!    `output_data_references`.<br/>
      "!   The `input_data_references` property<br/>
      "!   is mutually exclusive with `input_data` property, only use one of these. The
      "!    `input_data_references`<br/>
      "!   property is not supported for batch deployment job of Spark models and Python
      "!    Functions.<br/>
      "!   <br/>
      "!   Use `output_data_references` property to specify the details pertaining to the
      "!    remote source where the input<br/>
      "!   data for batch deployment job is available. `output_data_references` must be
      "!    used with `input_data_references`.<br/>
      "!   The `output_data_references`<br/>
      "!   property is not supported for batch deployment job of Spark models and Python
      "!    Functions.
      SCORING type T_JOB_SCORING_REQUEST,
      "!   Details about the input/output data and other properties to be used for a batch
      "!    deployment job of a Decision Optimization problem. You can find more
      "!    information in [Deploying Decision
      "!    Optimization](https://dataplatform.cloud.ibm.com/docs/content/DO/WML_Deployment
      "!   /ModelIODataDefn.html) documentation.<br/>
      "!   Use the `solve_parameters` as named value pairs to control the Decision
      "!    Optimization solve behavior.<br/>
      "!   Use the `input_data` and `output_data` properties to specify respectively input
      "!    and output data for batch processing as part of the job&apos;s payload.<br/>
      "!   Use the `input_data_references` and `output_data_references` properties to
      "!    specify respectively input and output data for batch processing as remote data
      "!    sources.
      DECISION_OPTIMIZATION type T_JB_DECISION_OPTIMIZATION_REQ,
    end of T_JOB_RESOURCE_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details of the pipeline to be created.</p>
    begin of T_PIPELINE_ENTITY,
      "!   The pipeline document, see<br/>
      "!   [pipeline-flow-v2-schema](https://raw.githubusercontent.com/elyra-ai/pipeline-sc
      "!   hemas/master/common-pipeline/pipeline-flow/pipeline-flow-v2-schema.json) for the
      "!    schema definition.
      DOCUMENT type JSONOBJECT,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
    end of T_PIPELINE_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The information for a pipeline.</p>
    begin of T_PIPELINE_RESOURCE,
      "!   Common metadata for a resource where `project_id` or `space_id` must be present.
      "!
      METADATA type T_RESOURCE_META,
      "!   The details of the pipeline to be created.
      ENTITY type T_PIPELINE_ENTITY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_PIPELINE_RESOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A paginated list of pipelines.</p>
    begin of T_PIPELINE_RESOURCES,
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
      "!   A list of pipelines.
      RESOURCES type STANDARD TABLE OF T_PIPELINE_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_PIPELINE_RESOURCES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details for the revision.</p>
    begin of T_REV_ENTITY_SPACE_REQUEST,
      "!   The space that contains the resource.
      SPACE_ID type STRING,
      "!   An optional commit message for the revision.
      COMMIT_MESSAGE type STRING,
    end of T_REV_ENTITY_SPACE_REQUEST.
  types:
    "! No documentation available.
    begin of T_INSTANCE_RESRC_ENTITY_PLAN,
      "!   The payment plan ID.
      ID type STRING,
      "!   The payment plan name, this can be one of<br/>
      "!   `lite`, `v2-standard` or `v2-professional`.
      NAME type STRING,
      "!   2 - for the v2 plans where v2 plan means an instance is space / project aware.
      VERSION type INTEGER,
    end of T_INSTANCE_RESRC_ENTITY_PLAN.
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
    "! No documentation available.
    begin of T_BLUEMIX_ACCOUNT,
      "!   The account ID.
      ID type STRING,
    end of T_BLUEMIX_ACCOUNT.
  types:
    "! No documentation available.
    begin of T_INSTANCE_RESOURCE_ENTITY,
      "!   Status of the service instance.
      STATUS type STRING,
      "!   No documentation available.
      PLAN type T_INSTANCE_RESRC_ENTITY_PLAN,
      "!   No documentation available.
      CRN type STRING,
      "!   No documentation available.
      ACCOUNT type T_BLUEMIX_ACCOUNT,
      "!   The consumption part is available only when `plan.version` is `2`.<br/>
      "!   All the values are calculated at the account<br/>
      "!   level the instance belongs to, not the instance itself.
      CONSUMPTION type T_CONSUMPTION,
      "!   Cloud Service Endpoints (CSE) the instance is enabled for. Possible values are
      "!    `public`, `private` and `public-and-private`.
      SERVICE_ENDPOINTS type STRING,
      "!   The `id` of the resource group that contains this instance.
      RESOURCE_GROUP_ID type STRING,
    end of T_INSTANCE_RESOURCE_ENTITY.
  types:
    "! No documentation available.
    begin of T_INSTANCE_RESOURCE,
      "!   Common metadata for a resource.
      METADATA type T_RESOURCE_META_BASE,
      "!   No documentation available.
      ENTITY type T_INSTANCE_RESOURCE_ENTITY,
    end of T_INSTANCE_RESOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Optimization algorithm.</p>
    begin of T_TRAIN_REF_HYPR_PRM_OPTMZTN_1,
      "!   No documentation available.
      NAME type STRING,
      "!   Optimizer configuration parameters.
      PARAMETERS type JSONOBJECT,
    end of T_TRAIN_REF_HYPR_PRM_OPTMZTN_1.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A set of hyper parameters.</p>
    begin of T_HYPER_PARAMETER,
      "!   The name of the hyper parameters.
      NAME type STRING,
      "!   An object containing floating point properties &apos;min_value&apos;,
      "!    &apos;max_value&apos;, &apos;step&apos;, and &apos;power&apos;, or a list of
      "!    either strings or floating point values.
      ITEMS type JSONOBJECT,
    end of T_HYPER_PARAMETER.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The hyper parameters used in the experiment.</p>
    begin of T_TRAIN_REF_HYPR_PRM_OPTMZTN,
      "!   Optimization algorithm.
      METHOD type T_TRAIN_REF_HYPR_PRM_OPTMZTN_1,
      "!   Hyper parameters that can be a range or an array of number or strings.
      HYPER_PARAMETERS type STANDARD TABLE OF T_HYPER_PARAMETER WITH NON-UNIQUE DEFAULT KEY,
    end of T_TRAIN_REF_HYPR_PRM_OPTMZTN.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    An evaluation metric.</p>
    begin of T_EVALUATION_METRIC,
      "!   No documentation available.
      NAME type STRING,
      "!   No documentation available.
      MAXIMIZE type BOOLEAN,
    end of T_EVALUATION_METRIC.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The optional evaluation definition.</p>
    begin of T_EVALUATION_DEFINITION,
      "!   The evaluation method.
      METHOD type STRING,
      "!   The evaluation metrics.
      METRICS type STANDARD TABLE OF T_EVALUATION_METRIC WITH NON-UNIQUE DEFAULT KEY,
    end of T_EVALUATION_DEFINITION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The `pipeline` is a reference to the pipeline. The</p>
    "!     `model_definition` is the library reference that contains the training library.
    begin of T_TRAINING_REFERENCE,
      "!   A pipeline.<br/>
      "!   The `hardware_spec` is a reference to the hardware specification.<br/>
      "!   The `hybrid_pipeline_hardware_specs` are used only when training a hybrid
      "!    pipeline in order to<br/>
      "!   specify compute requirement for each pipeline node.
      PIPELINE type T_PIPELINE_REL,
      "!   The model definition.
      MODEL_DEFINITION type T_MODEL_DEFINITION_ID,
      "!   The hyper parameters used in the experiment.
      HYPER_PARAMETERS_OPTIMIZATION type T_TRAIN_REF_HYPR_PRM_OPTMZTN,
    end of T_TRAINING_REFERENCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details of the experiment to be created.</p>
    begin of T_EXPERIMENT_ENTITY_REQUEST,
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
      "!   The label column.
      LABEL_COLUMN type STRING,
      "!   The optional evaluation definition.
      EVALUATION_DEFINITION type T_EVALUATION_DEFINITION,
      "!   The optional training references used by the experiment.
      TRAINING_REFERENCES type STANDARD TABLE OF T_TRAINING_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
    end of T_EXPERIMENT_ENTITY_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Data shape after the transformation.</p>
    begin of T_DATA_OUTPUT,
      "!   The number of rows.
      ROWS type INTEGER,
      "!   The number of columns.
      COLUMNS type INTEGER,
    end of T_DATA_OUTPUT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Data shape (rows, columns) passed as input to the</p>
    "!     transformer/transformation.
    begin of T_DATA_INPUT,
      "!   The number of rows.
      ROWS type INTEGER,
      "!   The number of columns.
      COLUMNS type INTEGER,
    end of T_DATA_INPUT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Informational information about the preprocessing</p>
    "!     transformation that was executed during the training run.
    begin of T_DATA_PREPROCESSING_TRANS,
      "!   The preprocessing stage.
      STAGE type STRING,
      "!   Data shape (rows, columns) passed as input to the transformer/transformation.
      INPUT type T_DATA_INPUT,
      "!   Data shape after the transformation.
      OUTPUT type T_DATA_OUTPUT,
      "!   Properties of preprocessing transformation.
      PROPS type JSONOBJECT,
    end of T_DATA_PREPROCESSING_TRANS.
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
    "!    Status information related to the state of the scaling, if</p>
    "!     scaling is in progress or has completed.
    begin of T_DEPLOYMENT_SCALING,
      "!   The state of the scaling request.
      STATE type STRING,
      "!   The time when the scaling was attempted.
      ATTEMPTED_AT type DATETIME,
      "!   The number of requested replicas.
      REQUESTED_REPLICAS type INTEGER,
      "!   The number of replicas currently deployed.
      DEPLOYED_REPLICAS type INTEGER,
      "!   Optional messages related to the resource.
      MESSAGE type T_MESSAGE,
    end of T_DEPLOYMENT_SCALING.
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
      "!   The URLs that can be used to submit online prediction API requests. These URLs
      "!    will contain the<br/>
      "!   `deployment_id` and the `serving_name`, if the `serving_name` was set.
      INFERENCE type STANDARD TABLE OF T_INFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   **Deprecated: use `inference` instead.**.
      SERVING_URLS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   Status information related to the state of the scaling, if scaling is in
      "!    progress or has completed.
      SCALING type T_DEPLOYMENT_SCALING,
    end of T_DEPLOYMENT_STATUS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The `training_data_references` contain the training datasets</p>
    "!     and the<br/>
    "!    `results_reference` the connection where results will be stored.
    begin of T_TRAIN_RESRC_ENTITY_REQUEST,
      "!   A reference to a resource.
      EXPERIMENT type T_REL,
      "!   A pipeline.<br/>
      "!   The `hardware_spec` is a reference to the hardware specification.<br/>
      "!   The `hybrid_pipeline_hardware_specs` are used only when training a hybrid
      "!    pipeline in order to<br/>
      "!   specify compute requirement for each pipeline node.
      PIPELINE type T_PIPELINE_REL,
      "!   A model.<br/>
      "!   The `software_spec` is a reference to a software specification.<br/>
      "!   The `hardware_spec` is a reference to a hardware specification.
      MODEL_DEFINITION type T_MODEL_DEFINITION_REL,
      "!   Federated Learning.
      FEDERATED_LEARNING type T_FEDERATED_LEARNING,
      "!   Training datasets.
      TRAINING_DATA_REFERENCES type STANDARD TABLE OF T_DATA_CONNECTION_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   The training results.
      RESULTS_REFERENCE type T_OBJECT_LOCATION,
      "!   The holdout/test datasets.
      TEST_DATA_REFERENCES type STANDARD TABLE OF T_DATA_CONNECTION_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   A list of tags for this resource.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   The name of the training.
      NAME type STRING,
      "!   A description of the training.
      DESCRIPTION type STRING,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
    end of T_TRAIN_RESRC_ENTITY_REQUEST.
  types:
    "! No documentation available.
    begin of T_MTRC_TSD_MTRCS_TSD_TRAIN_AG1,
      "!   Metric score for the Pipeline 1.
      P1 type NUMBER,
    end of T_MTRC_TSD_MTRCS_TSD_TRAIN_AG1.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The content information to be uploaded.</p>
    begin of T_CONTENT_INFO,
      "!   The content format of the attachment. This can be one of `native`, `coreML`,
      "!    `pipeline-node`.
      CONTENT_FORMAT type STRING,
      "!   The location of the content to be uploaded.
      LOCATION type STRING,
      "!   The file name that will be used when downloading the content from the UI.
      FILE_NAME type STRING,
      "!   The `pipeline_node_id` that corresponds to this content. This is required only
      "!    if the `content_format` is `pipeline-node` otherwise it is rejected or ignored.
      "!
      PIPELINE_NODE_ID type STRING,
      "!   The `deployment_id` that corresponds to this content. This is required only if
      "!    the `content_format` is `coreml` otherwise it is rejected or ignored.
      DEPLOYMENT_ID type STRING,
    end of T_CONTENT_INFO.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Details about the attachments that should be uploaded with</p>
    "!     this model.
    begin of T_CONTENT_LOCATION,
      "!   The content information to be uploaded.
      CONTENTS type STANDARD TABLE OF T_CONTENT_INFO WITH NON-UNIQUE DEFAULT KEY,
      "!   The data source type like `connection_asset` or `data_asset`.
      TYPE type STRING,
      "!   Connection properties.
      CONNECTION type MAP,
      "!   Location properties.
      LOCATION type MAP,
    end of T_CONTENT_LOCATION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A paginated list of remote training systems.</p>
    begin of T_REMOTE_TRAIN_SYS_RESOURCES,
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
      "!   A list of remote training systems.
      RESOURCES type STANDARD TABLE OF T_REMOTE_TRAIN_SYSTEM_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_REMOTE_TRAIN_SYS_RESOURCES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The metadata related to the attachment.</p>
    begin of T_CONTENT_METADATA,
      "!   The content id for the attachment.
      ATTACHMENT_ID type STRING,
      "!   The type of the content.
      CONTENT_FORMAT type STRING,
      "!   The name of the attachment.
      NAME type STRING,
      "!   The `pipeline_node_id` that corresponds to this content.
      PIPELINE_NODE_ID type STRING,
      "!   The `deployment_id` that corresponds to this content.
      DEPLOYMENT_ID type STRING,
      "!   This will be set to `true` if the content has been persisted. If this content
      "!    was part of the import process and the upload of the content failed then the
      "!    message can be found in the<br/>
      "!   `warnings` field of the `system_details` that are returned with the model
      "!    details.
      PERSISTED type BOOLEAN,
    end of T_CONTENT_METADATA.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The metadata related to the attachments.</p>
    begin of T_ALL_CONTENT_METADATA,
      "!   The number of attachments associated with the resource.
      TOTAL_COUNT type INTEGER,
      "!   No documentation available.
      ATTACHMENTS type STANDARD TABLE OF T_CONTENT_METADATA WITH NON-UNIQUE DEFAULT KEY,
    end of T_ALL_CONTENT_METADATA.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Details about the batch deployment job.</p><br/>
    "!    <br/>
    "!    The `deployment` is a reference to the deployment associated with the deployment
    "!     job or deployment job definition.<br/>
    "!    <br/>
    "!    The `scoring` and `decision_optimization` properties are mutually exclusive.
    "!     Specify only one of these when submitting a batch deployment job.<br/>
    "!    <br/>
    "!    Use `hybrid_pipeline_hardware_specs` only in a batch deployment job of a hybrid
    "!     pipeline in order to specify compute configuration for each pipeline node. For
    "!     all other cases use `hardware_spec` to specify compute configuration.<br/>
    "!    <br/>
    "!    In case of output data references where the data asset is a remote database,
    "!     users can specify if the batch deployment output must be appended to the table
    "!     or if the table is to be truncated and output data updated.<br/>
    "!    `output_data_references.location.write_mode` parameter can be used to for this
    "!     purpose. The values `truncate` or `append` can be specified for
    "!     `output_data_references.location.write_mode` parameter.<br/>
    "!    * Specifying `truncate` as value will truncate the table and the batch output
    "!     data will be inserted.<br/>
    "!    * Specifying `append` as value will insert the batch output data to the remote
    "!     database table.<br/>
    "!    * The `write_mode` parameter is applicable only for `output_data_references`
    "!     parameter.<br/>
    "!    * The `write_mode` parameter will be applicable only for remote database related
    "!     data assets. This parameter will not be applicable for local data asset or COS
    "!     based data asset.
    begin of T_JOB_ENTITY,
      "!   A reference to a resource.
      DEPLOYMENT type T_SIMPLE_REL,
      "!   User defined properties.
      CUSTOM type JSONOBJECT,
      "!   A hardware specification.
      HARDWARE_SPEC type T_HARDWARE_SPEC,
      "!   Hybrid pipeline hardware specification.
      HYBRID_PIPELINE_HARDWARE_SPECS type STANDARD TABLE OF T_HYBRD_PPLN_HRDWR_SPECS_ITEM WITH NON-UNIQUE DEFAULT KEY,
      "!   Details about the input/output data and other properties to be used for a batch
      "!    deployment job of a model,<br/>
      "!   Python Function or a Python Scripts.<br/>
      "!   <br/>
      "!   Use `input_data` property to specify the input data for batch processing as part
      "!    of the job&apos;s payload.<br/>
      "!   The `input_data` property is mutually exclusive with `input_data_references`
      "!    property, only use one of these.<br/>
      "!   When `input_data` is specified, the processed output of batch deployment job
      "!    will be available in `scoring.predictions`<br/>
      "!   parameter in the deployment job response. `input_data` property is not supported
      "!    for batch deployment of Python Scripts.<br/>
      "!   <br/>
      "!   Use `input_data_references` property to specify the details pertaining to the
      "!    remote source where the input data for<br/>
      "!   batch deployment job is available. The `input_data_references` must be used with
      "!    `output_data_references`.<br/>
      "!   The `input_data_references` property<br/>
      "!   is mutually exclusive with `input_data` property, only use one of these. The
      "!    `input_data_references`<br/>
      "!   property is not supported for batch deployment job of Spark models and Python
      "!    Functions.<br/>
      "!   <br/>
      "!   Use `output_data_references` property to specify the details pertaining to the
      "!    remote source where the input<br/>
      "!   data for batch deployment job is available. `output_data_references` must be
      "!    used with `input_data_references`.<br/>
      "!   The `output_data_references`<br/>
      "!   property is not supported for batch deployment job of Spark models and Python
      "!    Functions.
      SCORING type T_JOB_SCORING_REQUEST,
      "!   Details about the input/output data and other properties to be used for a batch
      "!    deployment job of a Decision Optimization problem. You can find more
      "!    information in [Deploying Decision
      "!    Optimization](https://dataplatform.cloud.ibm.com/docs/content/DO/WML_Deployment
      "!   /ModelIODataDefn.html) documentation.<br/>
      "!   Use the `solve_parameters` as named value pairs to control the Decision
      "!    Optimization solve behavior.<br/>
      "!   Use the `input_data` and `output_data` properties to specify respectively input
      "!    and output data for batch processing as part of the job&apos;s payload.<br/>
      "!   Use the `input_data_references` and `output_data_references` properties to
      "!    specify respectively input and output data for batch processing as remote data
      "!    sources.
      DECISION_OPTIMIZATION type T_JB_DECISION_OPTIMIZATION_REQ,
    end of T_JOB_ENTITY.
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
    "!    User defined properties specified as key-value pairs.</p>
      T_CUSTOM type JSONOBJECT.
  types:
    "! No documentation available.
    begin of T_TRAINING_WEBSOCKET,
      "!   Common metadata for a resource where `project_id` or `space_id` must be present.
      "!
      METADATA type T_RESOURCE_META,
      "!   Status of the model.
      ENTITY type T_TRAINING_STATUS,
    end of T_TRAINING_WEBSOCKET.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Common metadata for a resource where `project_id` or</p>
    "!     `space_id` must be present.
    begin of T_JOB_RESOURCE_METADATA,
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
    end of T_JOB_RESOURCE_METADATA.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The information for a deployment job definition.</p>
    begin of T_JOB_RESOURCE,
      "!   Common metadata for a resource where `project_id` or `space_id` must be present.
      "!
      METADATA type T_JOB_RESOURCE_METADATA,
      "!   Details about the batch deployment job.<br/>
      "!   <br/>
      "!   The `deployment` is a reference to the deployment associated with the deployment
      "!    job or deployment job definition.<br/>
      "!   <br/>
      "!   The `scoring` and `decision_optimization` properties are mutually
      "!    exclusive.<br/>
      "!   Specify only one of these when submitting a batch deployment job.<br/>
      "!   <br/>
      "!   Use `hybrid_pipeline_hardware_specs` only in a batch deployment job of a hybrid
      "!    pipeline<br/>
      "!   in order to specify compute configuration for each pipeline node. For all other
      "!    cases use `hardware_spec`<br/>
      "!   to specify compute configuration.<br/>
      "!   <br/>
      "!   In case of output data references where the data asset is a remote database,
      "!    users can specify if the batch<br/>
      "!   deployment output must be appended to the table or if the table is to be
      "!    truncated and output data updated.<br/>
      "!   `output_data_references.location.write_mode` parameter can be used to for this
      "!    purpose.<br/>
      "!   The values `truncate` or `append` can be specified for
      "!    `output_data_references.location.write_mode`<br/>
      "!   parameter.<br/>
      "!   * Specifying `truncate` as value will truncate the table and the batch output
      "!    data will be inserted.<br/>
      "!   * Specifying `append` as value will insert the batch output data to the remote
      "!    database table.<br/>
      "!   * The `write_mode` parameter is applicable only for `output_data_references`
      "!    parameter.<br/>
      "!   * The `write_mode` parameter will be applicable only for remote database related
      "!    data assets.<br/>
      "!   This parameter will not be applicable for local data asset or COS based data
      "!    asset.
      ENTITY type T_JOB_RESOURCE_ENTITY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_JOB_RESOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details for the revision.</p>
    begin of T_EXPERIMENT_REV_ENTITY_REQ,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   An optional commit message for the revision.
      COMMIT_MESSAGE type STRING,
    end of T_EXPERIMENT_REV_ENTITY_REQ.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Arbitrary `gzip` file.</p>
      T_CONTENT_GZIP type FILE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details of the pipeline to be created.</p>
    begin of T_PIPELINE_ENTITY_REQUEST,
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
      "!   The pipeline document, see<br/>
      "!   [pipeline-flow-v2-schema](https://raw.githubusercontent.com/elyra-ai/pipeline-sc
      "!   hemas/master/common-pipeline/pipeline-flow/pipeline-flow-v2-schema.json) for the
      "!    schema definition.
      DOCUMENT type JSONOBJECT,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
    end of T_PIPELINE_ENTITY_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Metrics generated during training.</p>
    begin of T_TS_TRAINING_TRAINING,
      "!   At each fitted point, the absolute difference between actual value and predicted
      "!    value is divided by half the sum of absolute actual value and predicted value,
      "!    and then average all such values across all the fitted points.
      NG_SYMMTRC_MN_ABSLT_PRCNTG_ERR type NUMBER,
    end of T_TS_TRAINING_TRAINING.
  types:
    "! No documentation available.
    begin of T_METRIC_TS_METRICS_TS_TRAIN,
      "!   Metrics generated during training.
      TRAINING type T_TS_TRAINING_TRAINING,
    end of T_METRIC_TS_METRICS_TS_TRAIN.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The information for a function.</p>
    begin of T_FUNCTION_RESOURCE,
      "!   Common metadata for a resource where `project_id` or `space_id` must be present.
      "!
      METADATA type T_RESOURCE_META,
      "!   The details of the function to be created.
      ENTITY type T_FUNCTION_ENTITY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_FUNCTION_RESOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A paginated list of functions.</p>
    begin of T_FUNCTION_RESOURCES,
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
      "!   A list of functions.
      RESOURCES type STANDARD TABLE OF T_FUNCTION_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_FUNCTION_RESOURCES.
  types:
    "! No documentation available.
      T_SCORING_TARGETS type TT_JSONOBJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    This will be used by scoring to record the size of the</p>
    "!     model.
    begin of T_MODEL_ENTITY_SIZE,
      "!   The memory size of the model.
      IN_MEMORY type NUMBER,
      "!   The size of the model on disk.
      CONTENT type NUMBER,
    end of T_MODEL_ENTITY_SIZE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The model id of the base model for this job.</p>
    begin of T_BASE_MODEL,
      "!   The model id of the base model.
      MODEL_ID type STRING,
    end of T_BASE_MODEL.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Optional metadata that can be used to provide information</p>
    "!     about this model that can be tracked with IBM AI Factsheets. See [Using AI
    "!     Factsheets](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/fa
    "!    ctsheets-model-inventory.html) for more details.
    begin of T_MODEL_ENTITY_MODEL_VERSION,
      "!   This is the user-provided version which should follow semantic versioning.
      NUMBER type STRING,
      "!   This is the user-provided tag for the model.
      TAG type STRING,
      "!   This is the user provided description that provides context for the change in
      "!    the model version.
      DESCRIPTION type STRING,
    end of T_MODEL_ENTITY_MODEL_VERSION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Information about the training job that created this model.</p>
    begin of T_TRAINING_DETAILS,
      "!   The `id` of the training job that produced this model.
      ID type STRING,
      "!   The model id of the base model for this job.
      BASE_MODEL type T_BASE_MODEL,
      "!   The task that is targeted for this model.
      TASK_ID type STRING,
      "!   The optional verbalizer that was used during the training, if appropriate.
      VERBALIZER type STRING,
    end of T_TRAINING_DETAILS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Information related to the upload of the model content.</p>
    begin of T_MODEL_RESOURCE_ENTITY,
      "!   The model type. The supported model types can be found in the documentation<br/>
      "!   [here](https://dataplatform.cloud.ibm.com/docs/content/wsj/wmls/wmls-deploy-pyth
      "!   on-types.html?context=analytics).
      TYPE type STRING,
      "!   A software specification.
      SOFTWARE_SPEC type T_SOFTWARE_SPEC_REL,
      "!   A reference to a resource.
      PIPELINE type T_REL,
      "!   The model definition.
      MODEL_DEFINITION type T_MODEL_DEFINITION_ID,
      "!   Hyper parameters used for training this model.
      HYPER_PARAMETERS type JSONOBJECT,
      "!   User provided domain name for this model. For example: sentiment, entity,
      "!    visual-recognition, finance, retail, real estate etc.
      DOMAIN type STRING,
      "!   The training data that was used to create this model.
      TRAINING_DATA_REFERENCES type STANDARD TABLE OF T_DATA_CONNECTION_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   The holdout/test datasets.
      TEST_DATA_REFERENCES type STANDARD TABLE OF T_DATA_CONNECTION_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   If the prediction schemas are provided here then they take precedent over any
      "!    schemas<br/>
      "!   provided in the data references. Note that data references contain the schema
      "!    for the<br/>
      "!   associated data and this object contains the schema(s) for the associated
      "!    prediction, if any.<br/>
      "!   In the case that the prediction input data matches exactly the schema of the
      "!    training data<br/>
      "!   references then the prediction schema can be omitted. However it is highly
      "!    recommended to<br/>
      "!   always specify the prediction schemas using this field.
      SCHEMAS type T_MODEL_ENTITY_SCHEMAS,
      "!   The name of the label column.
      LABEL_COLUMN type STRING,
      "!   The name of the  label column seen by the estimator, which may have been
      "!    transformed by the previous transformers in the pipeline. This is not
      "!    necessarily the same column as the `label_column` in the initial data set.
      TRANSFORMED_LABEL_COLUMN type STRING,
      "!   This will be used by scoring to record the size of the model.
      SIZE type T_MODEL_ENTITY_SIZE,
      "!   Metrics that can be returned by an operation.
      METRICS type STANDARD TABLE OF T_METRIC WITH NON-UNIQUE DEFAULT KEY,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   User defined objects referenced by the model. For any user defined class or
      "!    function used in the model, its name, as referenced in the model, must be
      "!    specified as the `key` and its fully qualified class or function name must be
      "!    specified as the `value`. This is applicable for `Tensorflow 2.X` models
      "!    serialized in `H5` format using the `tf.keras` API.
      USER_DEFINED_OBJECTS type MAP,
      "!   The list of the software specifications that are used by the pipeline that
      "!    generated this model, if the model was generated by a pipeline.
      HYBRID_PIPELINE_SOFTWARE_SPECS type STANDARD TABLE OF T_SOFTWARE_SPEC_REL WITH NON-UNIQUE DEFAULT KEY,
      "!   Optional metadata that can be used to provide information<br/>
      "!   about this model that can be tracked with IBM AI Factsheets.<br/>
      "!   See [Using AI
      "!    Factsheets](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/fa
      "!   ctsheets-model-inventory.html) for more details.
      MODEL_VERSION type T_MODEL_ENTITY_MODEL_VERSION,
      "!   Deprecated: this is replaced by `training.id`. This field can be used to store
      "!    the `id` of the training job that was used to produce this model.
      TRAINING_ID type STRING,
      "!   An optional array which contains the data preprocessing transformations that
      "!    were executed by the training job that created this model.
      DATA_PREPROCESSING type STANDARD TABLE OF T_DATA_PREPROCESSING_TRANS WITH NON-UNIQUE DEFAULT KEY,
      "!   Information about the training job that created this model.
      TRAINING type T_TRAINING_DETAILS,
      "!   The upload state.
      CONTENT_IMPORT_STATE type STRING,
    end of T_MODEL_RESOURCE_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The information for a model.</p>
    begin of T_MODEL_RESOURCE,
      "!   Common metadata for a resource where `project_id` or `space_id` must be present.
      "!
      METADATA type T_RESOURCE_META,
      "!   Information related to the upload of the model content.
      ENTITY type T_MODEL_RESOURCE_ENTITY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_MODEL_RESOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A paginated list of models.</p>
    begin of T_MODEL_RESOURCES,
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
      "!   A list of models.
      RESOURCES type STANDARD TABLE OF T_MODEL_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_MODEL_RESOURCES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A list of evaluation specifications.</p>
      T_EVALUATIONS_SPEC type STANDARD TABLE OF T_EVALUATIONS_SPEC_ITEM WITH NON-UNIQUE DEFAULT KEY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The forecast window to use for the prediction. If no value</p>
    "!     is set then the value used during training will be used.
      T_SCRNG_PARAM_FORECAST_WINDOW type Integer.
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
    "!    The details for the revision.</p>
    begin of T_JOB_REVISION_ENTITY_REQUEST,
      "!   The space that contains the resource.
      SPACE_ID type STRING,
      "!   An optional commit message for the revision.
      COMMIT_MESSAGE type STRING,
    end of T_JOB_REVISION_ENTITY_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The status of the job.</p>
    begin of T_FIELD_JOB_STATUS,
      "!   The status of the job.
      STATUS type T_JOB_STATUS,
    end of T_FIELD_JOB_STATUS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Indicates that this is a batch deployment. An empty object</p>
    "!     has to be specified.
    begin of T_BATCH_REQUEST,
      "!   A set of key-value pairs where `key` is the parameter name.
      PARAMETERS type JSONOBJECT,
    end of T_BATCH_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The definition of the deployment.</p>
    begin of T_DEPLOYMENT_ENTITY,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   A reference to a resource.
      ASSET type T_REL,
      "!   A hardware specification.
      HARDWARE_SPEC type T_HARDWARE_SPEC,
      "!   Hybrid pipeline hardware specification.
      HYBRID_PIPELINE_HARDWARE_SPECS type STANDARD TABLE OF T_HYBRD_PPLN_HRDWR_SPECS_ITEM WITH NON-UNIQUE DEFAULT KEY,
      "!   Indicates that this is an online deployment. An empty object has to be
      "!    specified.<br/>
      "!   If the online scoring schema has a `type` of `DataFrame` then the scoring
      "!    payload will be converted to a `Pandas` data frame.
      ONLINE type T_ONLINE_REQUEST,
      "!   Indicates that this is a batch deployment. An empty object has to be specified.
      BATCH type T_BATCH_REQUEST,
      "!   Specifies the type of the asset on which deployment is created.
      DEPLOYED_ASSET_TYPE type STRING,
      "!   Specifies the current status, additional information about the deployment<br/>
      "!   and any failure messages in case of deployment failures.
      STATUS type T_DEPLOYMENT_STATUS,
    end of T_DEPLOYMENT_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details for the revision.</p>
    begin of T_TRAIN_DEF_REV_ENTITY_REQUEST,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   An optional commit message for the revision.
      COMMIT_MESSAGE type STRING,
    end of T_TRAIN_DEF_REV_ENTITY_REQUEST.
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
    "!    The remote training system metric.</p>
    begin of T_REMOTE_TRAIN_SYSTEM_METRIC,
      "!   No documentation available.
      ID type STRING,
      "!   No documentation available.
      LOCAL type NUMBER,
      "!   No documentation available.
      FUSED type NUMBER,
    end of T_REMOTE_TRAIN_SYSTEM_METRIC.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Information for paging when querying resources.</p>
    begin of T_INSTANCE_RESOURCES,
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
      RESOURCES type STANDARD TABLE OF T_INSTANCE_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
    end of T_INSTANCE_RESOURCES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Details about the batch deployment job.</p><br/>
    "!    <br/>
    "!    The `deployment` is a reference to the deployment associated with the deployment
    "!     job or deployment job definition.<br/>
    "!    <br/>
    "!    The `scoring` and `decision_optimization` properties are mutually exclusive.
    "!     Specify only one of these when submitting a batch deployment job.<br/>
    "!    <br/>
    "!    Use `hybrid_pipeline_hardware_specs` only in a batch deployment job of a hybrid
    "!     pipeline in order to specify compute configuration for each pipeline node. For
    "!     all other cases use `hardware_spec` to specify compute configuration.<br/>
    "!    <br/>
    "!    In case of output data references where the data asset is a remote database,
    "!     users can specify if the batch deployment output must be appended to the table
    "!     or if the table is to be truncated and output data updated.<br/>
    "!    `output_data_references.location.write_mode` parameter can be used to for this
    "!     purpose. The values `truncate` or `append` can be specified for
    "!     `output_data_references.location.write_mode` parameter.<br/>
    "!    * Specifying `truncate` as value will truncate the table and the batch output
    "!     data will be inserted.<br/>
    "!    * Specifying `append` as value will insert the batch output data to the remote
    "!     database table.<br/>
    "!    * The `write_mode` parameter is applicable only for `output_data_references`
    "!     parameter.<br/>
    "!    * The `write_mode` parameter will be applicable only for remote database related
    "!     data assets. This parameter will not be applicable for local data asset or COS
    "!     based data asset.
    begin of T_JOB_ENTITY_REQUEST,
      "!   The space that contains the resource.
      SPACE_ID type STRING,
      "!   The name of the resource.
      NAME type STRING,
      "!   A description of the resource.
      DESCRIPTION type STRING,
      "!   A list of tags for this resource.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   A reference to a resource.
      DEPLOYMENT type T_SIMPLE_REL,
      "!   User defined properties.
      CUSTOM type JSONOBJECT,
      "!   A hardware specification.
      HARDWARE_SPEC type T_HARDWARE_SPEC,
      "!   Hybrid pipeline hardware specification.
      HYBRID_PIPELINE_HARDWARE_SPECS type STANDARD TABLE OF T_HYBRD_PPLN_HRDWR_SPECS_ITEM WITH NON-UNIQUE DEFAULT KEY,
      "!   Details about the input/output data and other properties to be used for a batch
      "!    deployment job of a model,<br/>
      "!   Python Function or a Python Scripts.<br/>
      "!   <br/>
      "!   Use `input_data` property to specify the input data for batch processing as part
      "!    of the job&apos;s payload.<br/>
      "!   The `input_data` property is mutually exclusive with `input_data_references`
      "!    property, only use one of these.<br/>
      "!   When `input_data` is specified, the processed output of batch deployment job
      "!    will be available in `scoring.predictions`<br/>
      "!   parameter in the deployment job response. `input_data` property is not supported
      "!    for batch deployment of Python Scripts.<br/>
      "!   <br/>
      "!   Use `input_data_references` property to specify the details pertaining to the
      "!    remote source where the input data for<br/>
      "!   batch deployment job is available. The `input_data_references` must be used with
      "!    `output_data_references`.<br/>
      "!   The `input_data_references` property<br/>
      "!   is mutually exclusive with `input_data` property, only use one of these. The
      "!    `input_data_references`<br/>
      "!   property is not supported for batch deployment job of Spark models and Python
      "!    Functions.<br/>
      "!   <br/>
      "!   Use `output_data_references` property to specify the details pertaining to the
      "!    remote source where the input<br/>
      "!   data for batch deployment job is available. `output_data_references` must be
      "!    used with `input_data_references`.<br/>
      "!   The `output_data_references`<br/>
      "!   property is not supported for batch deployment job of Spark models and Python
      "!    Functions.
      SCORING type T_JOB_SCORING_REQUEST,
      "!   Details about the input/output data and other properties to be used for a batch
      "!    deployment job of a Decision Optimization problem. You can find more
      "!    information in [Deploying Decision
      "!    Optimization](https://dataplatform.cloud.ibm.com/docs/content/DO/WML_Deployment
      "!   /ModelIODataDefn.html) documentation.<br/>
      "!   Use the `solve_parameters` as named value pairs to control the Decision
      "!    Optimization solve behavior.<br/>
      "!   Use the `input_data` and `output_data` properties to specify respectively input
      "!    and output data for batch processing as part of the job&apos;s payload.<br/>
      "!   Use the `input_data_references` and `output_data_references` properties to
      "!    specify respectively input and output data for batch processing as remote data
      "!    sources.
      DECISION_OPTIMIZATION type T_JB_DECISION_OPTIMIZATION_REQ,
    end of T_JOB_ENTITY_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Arbitrary `text` file.</p>
      T_CONTENT_TEXT type String.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A set of metrics.</p>
    begin of T_TS_METRIC_LEVELS,
      "!   At each fitted point, the absolute difference between actual value and predicted
      "!    value is divided by half the sum of absolute actual value and predicted value,
      "!    and then average all such values across all the fitted points. A single `float`
      "!    in the univariate case, an array of `float` in the multivariate case.
      NG_SYMMTRC_MN_ABSLT_PRCNTG_ERR type JSONOBJECT,
      "!   The average of the Negative Symmetric Mean Absolute Percentage Error (SMAPE).
      NG_AVG_SYMMTRC_MN_ABSLT_PRCNT1 type NUMBER,
      "!   Measure of how the model performance compares to the baseline model, or mean
      "!    model. The R2 should be equal or less than 1. Negative R2 value means that the
      "!    model under consideration is worse than the mean model. Zero R2 value means
      "!    that the model under consideration is as good or bad as the mean model.
      "!    Positive R2 value means that the model under consideration is better than the
      "!    mean model. A single `float` in the univariate case, an array of `float` in the
      "!    multivariate case.
      R2 type JSONOBJECT,
      "!   The average of the r2.
      AVG_R2 type NUMBER,
      "!   Square root of the mean of the squared differences between the actual values and
      "!    predicted values. A single `float` in the univariate case, an array of `float`
      "!    in the multivariate case.
      NEG_ROOT_MEAN_SQUARED_ERROR type JSONOBJECT,
      "!   Average of the Negative Root Mean Squared Error (RMSE). Only appears in the
      "!    univariate case.
      NEG_AVG_ROOT_MEAN_SQUARED_ERR type NUMBER,
      "!   Average of absolute differences between the actual values and predicted values.
      "!    A single `float` in the univariate case, an array of `float` in the
      "!    multivariate case.
      NEG_MEAN_ABSOLUTE_ERROR type JSONOBJECT,
      "!   Average of the Mean Absolute Error (MAE). Only appears in the univariate case.
      NEG_AVG_MEAN_ABSOLUTE_ERROR type NUMBER,
    end of T_TS_METRIC_LEVELS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Metrics generated during evaluation of the pipeline on</p>
    "!     holdout data.
    begin of T_METRIC_TS_METRICS_TS_HOLDOUT,
      "!   A set of metrics.
      HOLDOUT type T_TS_METRIC_LEVELS,
    end of T_METRIC_TS_METRICS_TS_HOLDOUT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details of the experiment to be created.</p>
    begin of T_EXPERIMENT_ENTITY,
      "!   The label column.
      LABEL_COLUMN type STRING,
      "!   The optional evaluation definition.
      EVALUATION_DEFINITION type T_EVALUATION_DEFINITION,
      "!   The optional training references used by the experiment.
      TRAINING_REFERENCES type STANDARD TABLE OF T_TRAINING_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
    end of T_EXPERIMENT_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The information for an experiment.</p>
    begin of T_EXPERIMENT_RESOURCE,
      "!   Common metadata for a resource where `project_id` or `space_id` must be present.
      "!
      METADATA type T_RESOURCE_META,
      "!   The details of the experiment to be created.
      ENTITY type T_EXPERIMENT_ENTITY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_EXPERIMENT_RESOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A paginated list of experiments.</p>
    begin of T_EXPERIMENT_RESOURCES,
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
      "!   A list of experiments.
      RESOURCES type STANDARD TABLE OF T_EXPERIMENT_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_EXPERIMENT_RESOURCES.
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
    "!    The project that contains the resource.</p>
      T_PROJECT_ID_ONLY type String.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The record.</p>
      T_SCORING_PAYLOAD_OPTIM_VALUE type JSONOBJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Metrics generated in model evaluation phase.</p>
    begin of T_TSAD_HOLDOUT,
      "!   Simulated anomaly values are injected into the holdout data in each iteration
      "!    for pipeline evaluation.
      ITERATIONS type STANDARD TABLE OF T_TSAD_HOLDOUT_ITERATIONS_ITEM WITH NON-UNIQUE DEFAULT KEY,
      "!   Aggregated scores of anomaly types per metric.
      AGG type T_TSAD_HOLDOUT_AGG,
      "!   Pipeline ranking based on the specified metric.
      SUPPORTING_RANK type T_TSAD_HOLDOUT_SUPPORTING_RANK,
      "!   This score is calculated based on an aggregation of the optimized metric (for
      "!    example, Average precision) values for the 4 anomaly types. The scores for each
      "!    pipeline are ranked, using the Borda count method, and then weighted for their
      "!    contribution to the aggregate score. Unlike a standard metric score, this value
      "!    is not between 0 and 1. A higher value indicates a stronger score.
      AGGREGATED_SCORE type STANDARD TABLE OF T_TSD_HLDT_AGGRGTD_SCORE_ITEM WITH NON-UNIQUE DEFAULT KEY,
    end of T_TSAD_HOLDOUT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Can patch the deployment id.</p>
    begin of T_DPLYMNT_JOB_DEF_PATCH_HELPER,
      "!   A list of tags for this resource.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   The name of the resource.
      NAME type STRING,
      "!   A description of the resource.
      DESCRIPTION type STRING,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   A reference to a resource.
      DEPLOYMENT type T_SIMPLE_REL,
    end of T_DPLYMNT_JOB_DEF_PATCH_HELPER.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Information related to the upload of the model content.</p>
    begin of T_EXTRA_MODEL_ENTITY,
      "!   The upload state.
      CONTENT_IMPORT_STATE type STRING,
    end of T_EXTRA_MODEL_ENTITY.
  types:
    "! No documentation available.
    begin of T_TS_MTRC_BCKTST_ITRTNS_ITEM,
      "!   Average of absolute differences between the actual values and predicted values.
      "!    A single `float` in the univariate case, an array of `float` in the
      "!    multivariate case.
      NEG_MEAN_ABSOLUTE_ERROR type JSONOBJECT,
      "!   Square root of the mean of the squared differences between the actual values and
      "!    predicted values. A single `float` in the univariate case, an array of `float`
      "!    in the multivariate case.
      NEG_ROOT_MEAN_SQUARED_ERROR type JSONOBJECT,
      "!   Measure of how the model performance compares to the baseline model, or mean
      "!    model. The R2 should be equal or less than 1. Negative R2 value means that the
      "!    model under consideration is worse than the mean model. Zero R2 value means
      "!    that the model under consideration is as good or bad as the mean model.
      "!    Positive R2 value means that the model under consideration is better than the
      "!    mean model. A single `float` in the univariate case, an array of `float` in the
      "!    multivariate case.
      R2 type JSONOBJECT,
      "!   At each fitted point, the absolute difference between actual value and predicted
      "!    value is divided by half the sum of absolute actual value and predicted value,
      "!    and then average all such values across all the fitted points. A single `float`
      "!    in the univariate case, an array of `float` in the multivariate case.
      NG_SYMMTRC_MN_ABSLT_PRCNTG_ERR type JSONOBJECT,
    end of T_TS_MTRC_BCKTST_ITRTNS_ITEM.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Scoring results.</p>
    begin of T_SYNC_SCORING_DATA_RESULTS,
      "!   The predictions.
      PREDICTIONS type STANDARD TABLE OF T_SCORING_PAYLOAD WITH NON-UNIQUE DEFAULT KEY,
    end of T_SYNC_SCORING_DATA_RESULTS.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A paginated list of deployment job definitions.</p>
    begin of T_JOB_RESOURCES,
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
      "!   A list of deployment job definitions.
      RESOURCES type STANDARD TABLE OF T_JOB_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_JOB_RESOURCES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    This property is used to specify environment variables and</p>
    "!     their values required to be consumed by the batch deployment job. The
    "!     environment variables and values must be specified as key-value pairs.<br/>
    "!    <br/>
    "!    This property is currently supported only for Python Scripts in batch deployment
    "!     jobs.
      T_ENVIRONMENT_VARIABLES type MAP.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Arbitrary `JSON` file.</p>
      T_CONTENT_JSON type JSONOBJECT.
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
    "!    Metrics generated in model selection phase.</p>
    begin of T_MTRC_TSAD_METRICS_TSAD_TRAIN,
      "!   This score is calculated based on an aggregation of the optimized metric (for
      "!    example, Average precision) values for the 4 anomaly types. The scores for each
      "!    pipeline are ranked, using the Borda count method, and then weighted for their
      "!    contribution to the aggregate score. Unlike a standard metric score, this value
      "!    is not between 0 and 1. A higher value indicates a stronger score.
      AGGREGATED_SCORE type STANDARD TABLE OF T_MTRC_TSD_MTRCS_TSD_TRAIN_AG1 WITH NON-UNIQUE DEFAULT KEY,
    end of T_MTRC_TSAD_METRICS_TSAD_TRAIN.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The common fields that can be patched. This is a helper for</p>
    "!     `cpdctl`.
    begin of T_DEPLOYMENT_PATCH_REQ_HELPER,
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
      "!   A hardware specification.
      HARDWARE_SPEC type T_HARDWARE_SPEC,
      "!   Hybrid pipeline hardware specification.
      HYBRID_PIPELINE_HARDWARE_SPECS type STANDARD TABLE OF T_HYBRD_PPLN_HRDWR_SPECS_ITEM WITH NON-UNIQUE DEFAULT KEY,
    end of T_DEPLOYMENT_PATCH_REQ_HELPER.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    See the description in `POST /ml/v4/deployments`.</p>
    begin of T_DEPLOYMENT_ENTITY_REQUEST,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   A reference to a resource.
      ASSET type T_REL,
      "!   A hardware specification.
      HARDWARE_SPEC type T_HARDWARE_SPEC,
      "!   Hybrid pipeline hardware specification.
      HYBRID_PIPELINE_HARDWARE_SPECS type STANDARD TABLE OF T_HYBRD_PPLN_HRDWR_SPECS_ITEM WITH NON-UNIQUE DEFAULT KEY,
      "!   Indicates that this is an online deployment. An empty object has to be
      "!    specified.<br/>
      "!   If the online scoring schema has a `type` of `DataFrame` then the scoring
      "!    payload will be converted to a `Pandas` data frame.
      ONLINE type T_ONLINE_REQUEST,
      "!   Indicates that this is a batch deployment. An empty object has to be specified.
      BATCH type T_BATCH_REQUEST,
      "!   Tags that can be used when searching for resources.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   The space that contains the resource.
      SPACE_ID type STRING,
      "!   The name of the deployment.
      NAME type STRING,
      "!   A description of the deployment.
      DESCRIPTION type STRING,
    end of T_DEPLOYMENT_ENTITY_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The space that contains the resource.</p>
      T_SPACE_ID_ONLY type String.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details of the model to be created.</p>
    begin of T_MODEL_ENTITY_REQUEST,
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
      "!   The model type. The supported model types can be found in the documentation<br/>
      "!   [here](https://dataplatform.cloud.ibm.com/docs/content/wsj/wmls/wmls-deploy-pyth
      "!   on-types.html?context=analytics).
      TYPE type STRING,
      "!   A software specification.
      SOFTWARE_SPEC type T_SOFTWARE_SPEC_REL,
      "!   A reference to a resource.
      PIPELINE type T_REL,
      "!   The model definition.
      MODEL_DEFINITION type T_MODEL_DEFINITION_ID,
      "!   Hyper parameters used for training this model.
      HYPER_PARAMETERS type JSONOBJECT,
      "!   User provided domain name for this model. For example: sentiment, entity,
      "!    visual-recognition, finance, retail, real estate etc.
      DOMAIN type STRING,
      "!   The training data that was used to create this model.
      TRAINING_DATA_REFERENCES type STANDARD TABLE OF T_DATA_CONNECTION_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   The holdout/test datasets.
      TEST_DATA_REFERENCES type STANDARD TABLE OF T_DATA_CONNECTION_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   If the prediction schemas are provided here then they take precedent over any
      "!    schemas<br/>
      "!   provided in the data references. Note that data references contain the schema
      "!    for the<br/>
      "!   associated data and this object contains the schema(s) for the associated
      "!    prediction, if any.<br/>
      "!   In the case that the prediction input data matches exactly the schema of the
      "!    training data<br/>
      "!   references then the prediction schema can be omitted. However it is highly
      "!    recommended to<br/>
      "!   always specify the prediction schemas using this field.
      SCHEMAS type T_MODEL_ENTITY_SCHEMAS,
      "!   The name of the label column.
      LABEL_COLUMN type STRING,
      "!   The name of the  label column seen by the estimator, which may have been
      "!    transformed by the previous transformers in the pipeline. This is not
      "!    necessarily the same column as the `label_column` in the initial data set.
      TRANSFORMED_LABEL_COLUMN type STRING,
      "!   This will be used by scoring to record the size of the model.
      SIZE type T_MODEL_ENTITY_SIZE,
      "!   Metrics that can be returned by an operation.
      METRICS type STANDARD TABLE OF T_METRIC WITH NON-UNIQUE DEFAULT KEY,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   User defined objects referenced by the model. For any user defined class or
      "!    function used in the model, its name, as referenced in the model, must be
      "!    specified as the `key` and its fully qualified class or function name must be
      "!    specified as the `value`. This is applicable for `Tensorflow 2.X` models
      "!    serialized in `H5` format using the `tf.keras` API.
      USER_DEFINED_OBJECTS type MAP,
      "!   The list of the software specifications that are used by the pipeline that
      "!    generated this model, if the model was generated by a pipeline.
      HYBRID_PIPELINE_SOFTWARE_SPECS type STANDARD TABLE OF T_SOFTWARE_SPEC_REL WITH NON-UNIQUE DEFAULT KEY,
      "!   Optional metadata that can be used to provide information<br/>
      "!   about this model that can be tracked with IBM AI Factsheets.<br/>
      "!   See [Using AI
      "!    Factsheets](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/fa
      "!   ctsheets-model-inventory.html) for more details.
      MODEL_VERSION type T_MODEL_ENTITY_MODEL_VERSION,
      "!   Deprecated: this is replaced by `training.id`. This field can be used to store
      "!    the `id` of the training job that was used to produce this model.
      TRAINING_ID type STRING,
      "!   An optional array which contains the data preprocessing transformations that
      "!    were executed by the training job that created this model.
      DATA_PREPROCESSING type STANDARD TABLE OF T_DATA_PREPROCESSING_TRANS WITH NON-UNIQUE DEFAULT KEY,
      "!   Information about the training job that created this model.
      TRAINING type T_TRAINING_DETAILS,
      "!   Details about the attachments that should be uploaded with this model.
      CONTENT_LOCATION type T_CONTENT_LOCATION,
    end of T_MODEL_ENTITY_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Arbitrary `zip` file.</p>
      T_CONTENT_ZIP type FILE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Hybrid pipeline hardware specification.</p>
      T_HYBRD_PPLN_HARDWARE_SPECS type STANDARD TABLE OF T_HYBRD_PPLN_HRDWR_SPECS_ITEM WITH NON-UNIQUE DEFAULT KEY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Metrics from the backtest data.</p>
    begin of T_TS_METRIC_BACKTEST,
      "!   A set of metrics.
      AVG type T_TS_METRIC_LEVELS,
      "!   Time Series metrics evaluated per iteration on the backtest data.
      ITERATIONS type STANDARD TABLE OF T_TS_MTRC_BCKTST_ITRTNS_ITEM WITH NON-UNIQUE DEFAULT KEY,
    end of T_TS_METRIC_BACKTEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Metrics generated during evaluation of the pipeline on</p>
    "!     backtest data.
    begin of T_TS_BACKTEST,
      "!   Metrics from the backtest data.
      BACKTEST type T_TS_METRIC_BACKTEST,
    end of T_TS_BACKTEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Metrics that can be returned by an operation.</p>
      T_METRICS type STANDARD TABLE OF T_METRIC WITH NON-UNIQUE DEFAULT KEY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The records.</p>
      T_SCORING_PAYLOAD_OPTIM_VALUES type STANDARD TABLE OF T_SCORING_PAYLOAD_OPTIM_VALUE WITH NON-UNIQUE DEFAULT KEY.
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
    begin of T_DEPLOYMENT_RESOURCES,
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
      "!   A list of deployment resources. This will be empty if &apos;stats&apos; query
      "!    parameter is passed with &apos;true&apos;.
      RESOURCES type STANDARD TABLE OF T_DEPLOYMENT_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
      "!   System details including warnings and stats. This will get populated only if
      "!    &apos;stats&apos; query parameter is passed with &apos;true&apos;.
      SYSTEM type T_DEPLOYMENT_RESOURCES_SYSTEM,
    end of T_DEPLOYMENT_RESOURCES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details for the revision.</p>
    begin of T_MODEL_REV_ENTITY_REQUEST,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   An optional commit message for the revision.
      COMMIT_MESSAGE type STRING,
    end of T_MODEL_REV_ENTITY_REQUEST.
  types:
    "! No documentation available.
    begin of T_TSD_TRAIN_AGGRGTD_SCORE_ITEM,
      "!   Metric score for the Pipeline 1.
      P1 type NUMBER,
    end of T_TSD_TRAIN_AGGRGTD_SCORE_ITEM.
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
    "!    Metrics generated in model selection phase.</p>
    begin of T_TSAD_TRAINING,
      "!   This score is calculated based on an aggregation of the optimized metric (for
      "!    example, Average precision) values for the 4 anomaly types. The scores for each
      "!    pipeline are ranked, using the Borda count method, and then weighted for their
      "!    contribution to the aggregate score. Unlike a standard metric score, this value
      "!    is not between 0 and 1. A higher value indicates a stronger score.
      AGGREGATED_SCORE type STANDARD TABLE OF T_TSD_TRAIN_AGGRGTD_SCORE_ITEM WITH NON-UNIQUE DEFAULT KEY,
    end of T_TSAD_TRAINING.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Metrics generated during evaluation of the pipeline on</p>
    "!     holdout data.
    begin of T_TS_HOLDOUT,
      "!   A set of metrics.
      HOLDOUT type T_TS_METRIC_LEVELS,
    end of T_TS_HOLDOUT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    This model represents an individual patch operation to be</p>
    "!     performed on an object, as defined by<br/>
    "!    [RFC 6902](https://tools.ietf.org/html/rfc6902).
    begin of T_JSON_PATCH_OPERATION,
      "!   The operation to be performed.
      OP type STRING,
      "!   The pointer that identifies the field that is the target of the operation.
      PATH type STRING,
      "!   The value to be used within the operation.
      VALUE type STRING,
    end of T_JSON_PATCH_OPERATION.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Arbitrary `XML` file.</p>
      T_CONTENT_XML type JSONOBJECT.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    See the description in `POST /ml/v4/deployments`.</p>
    begin of T_DEPLOYMENT_ENTITY_COMMON,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   A reference to a resource.
      ASSET type T_REL,
      "!   A hardware specification.
      HARDWARE_SPEC type T_HARDWARE_SPEC,
      "!   Hybrid pipeline hardware specification.
      HYBRID_PIPELINE_HARDWARE_SPECS type STANDARD TABLE OF T_HYBRD_PPLN_HRDWR_SPECS_ITEM WITH NON-UNIQUE DEFAULT KEY,
      "!   Indicates that this is an online deployment. An empty object has to be
      "!    specified.<br/>
      "!   If the online scoring schema has a `type` of `DataFrame` then the scoring
      "!    payload will be converted to a `Pandas` data frame.
      ONLINE type T_ONLINE_REQUEST,
      "!   Indicates that this is a batch deployment. An empty object has to be specified.
      BATCH type T_BATCH_REQUEST,
    end of T_DEPLOYMENT_ENTITY_COMMON.
  types:
    "! No documentation available.
    begin of T_TS_TRAINING,
      "!   Metrics generated during training.
      TRAINING type T_TS_TRAINING_TRAINING,
    end of T_TS_TRAINING.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The `training_data_references` contain the training datasets</p>
    "!     and the<br/>
    "!    `results_reference` the connection where results will be stored.
    begin of T_TRAINING_RESOURCE_ENTITY,
      "!   A reference to a resource.
      EXPERIMENT type T_REL,
      "!   A pipeline.<br/>
      "!   The `hardware_spec` is a reference to the hardware specification.<br/>
      "!   The `hybrid_pipeline_hardware_specs` are used only when training a hybrid
      "!    pipeline in order to<br/>
      "!   specify compute requirement for each pipeline node.
      PIPELINE type T_PIPELINE_REL,
      "!   A model.<br/>
      "!   The `software_spec` is a reference to a software specification.<br/>
      "!   The `hardware_spec` is a reference to a hardware specification.
      MODEL_DEFINITION type T_MODEL_DEFINITION_REL,
      "!   Federated Learning.
      FEDERATED_LEARNING type T_FEDERATED_LEARNING,
      "!   Training datasets.
      TRAINING_DATA_REFERENCES type STANDARD TABLE OF T_DATA_CONNECTION_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   The training results.
      RESULTS_REFERENCE type T_OBJECT_LOCATION,
      "!   The holdout/test datasets.
      TEST_DATA_REFERENCES type STANDARD TABLE OF T_DATA_CONNECTION_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   Status of the model.
      STATUS type T_TRAINING_STATUS,
    end of T_TRAINING_RESOURCE_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Training resource.</p>
    begin of T_TRAINING_RESOURCE,
      "!   Common metadata for a resource where `project_id` or `space_id` must be present.
      "!
      METADATA type T_RESOURCE_META,
      "!   The `training_data_references` contain the training datasets and the<br/>
      "!   `results_reference` the connection where results will be stored.
      ENTITY type T_TRAINING_RESOURCE_ENTITY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_TRAINING_RESOURCE.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Information for paging when querying resources.</p>
    begin of T_TRAINING_RESOURCES,
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
      RESOURCES type STANDARD TABLE OF T_TRAINING_RESOURCE WITH NON-UNIQUE DEFAULT KEY,
      "!   Optional details coming from the service and related to the API call or the
      "!    associated resource.
      SYSTEM type T_SYSTEM_DETAILS,
    end of T_TRAINING_RESOURCES.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details for the revision.</p>
    begin of T_PIPELINE_REV_ENTITY_REQUEST,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   An optional commit message for the revision.
      COMMIT_MESSAGE type STRING,
    end of T_PIPELINE_REV_ENTITY_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details for the revision.</p>
    begin of T_MODEL_DEF_REV_ENTITY_REQUEST,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   An optional commit message for the revision.
      COMMIT_MESSAGE type STRING,
    end of T_MODEL_DEF_REV_ENTITY_REQUEST.
  types:
    "! No documentation available.
    begin of T_CONTENT_LOCATION_FIELD,
      "!   Details about the attachments that should be uploaded with this model.
      CONTENT_LOCATION type T_CONTENT_LOCATION,
    end of T_CONTENT_LOCATION_FIELD.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    See [JSON PATCH RFC</p>
    "!     6902](https://tools.ietf.org/html/rfc6902).
      T_JSON_PATCH type STANDARD TABLE OF T_JSON_PATCH_OPERATION WITH NON-UNIQUE DEFAULT KEY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Fields that can be patched.</p>
    begin of T_TRAIN_DEF_PATCH_HELPER,
      "!   A list of tags for this resource.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   The name of the resource.
      NAME type STRING,
      "!   A description of the resource.
      DESCRIPTION type STRING,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   Federated Learning.
      FEDERATED_LEARNING type T_FEDERATED_LEARNING,
    end of T_TRAIN_DEF_PATCH_HELPER.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The expiration date of the instance limit.</p>
      T_LIMIT_EXPIRATION_DATE type Date.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    A list of tags for this resource.</p>
      T_TAGS type TT_String.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details for the revision.</p>
    begin of T_FUNC_REVISION_ENTITY_REQUEST,
      "!   The space that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      SPACE_ID type STRING,
      "!   The project that contains the resource. Either `space_id` or `project_id` has to
      "!    be given.
      PROJECT_ID type STRING,
      "!   An optional commit message for the revision.
      COMMIT_MESSAGE type STRING,
    end of T_FUNC_REVISION_ENTITY_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details of the model to be created.</p>
    begin of T_MODEL_ENTITY,
      "!   The model type. The supported model types can be found in the documentation<br/>
      "!   [here](https://dataplatform.cloud.ibm.com/docs/content/wsj/wmls/wmls-deploy-pyth
      "!   on-types.html?context=analytics).
      TYPE type STRING,
      "!   A software specification.
      SOFTWARE_SPEC type T_SOFTWARE_SPEC_REL,
      "!   A reference to a resource.
      PIPELINE type T_REL,
      "!   The model definition.
      MODEL_DEFINITION type T_MODEL_DEFINITION_ID,
      "!   Hyper parameters used for training this model.
      HYPER_PARAMETERS type JSONOBJECT,
      "!   User provided domain name for this model. For example: sentiment, entity,
      "!    visual-recognition, finance, retail, real estate etc.
      DOMAIN type STRING,
      "!   The training data that was used to create this model.
      TRAINING_DATA_REFERENCES type STANDARD TABLE OF T_DATA_CONNECTION_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   The holdout/test datasets.
      TEST_DATA_REFERENCES type STANDARD TABLE OF T_DATA_CONNECTION_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   If the prediction schemas are provided here then they take precedent over any
      "!    schemas<br/>
      "!   provided in the data references. Note that data references contain the schema
      "!    for the<br/>
      "!   associated data and this object contains the schema(s) for the associated
      "!    prediction, if any.<br/>
      "!   In the case that the prediction input data matches exactly the schema of the
      "!    training data<br/>
      "!   references then the prediction schema can be omitted. However it is highly
      "!    recommended to<br/>
      "!   always specify the prediction schemas using this field.
      SCHEMAS type T_MODEL_ENTITY_SCHEMAS,
      "!   The name of the label column.
      LABEL_COLUMN type STRING,
      "!   The name of the  label column seen by the estimator, which may have been
      "!    transformed by the previous transformers in the pipeline. This is not
      "!    necessarily the same column as the `label_column` in the initial data set.
      TRANSFORMED_LABEL_COLUMN type STRING,
      "!   This will be used by scoring to record the size of the model.
      SIZE type T_MODEL_ENTITY_SIZE,
      "!   Metrics that can be returned by an operation.
      METRICS type STANDARD TABLE OF T_METRIC WITH NON-UNIQUE DEFAULT KEY,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   User defined objects referenced by the model. For any user defined class or
      "!    function used in the model, its name, as referenced in the model, must be
      "!    specified as the `key` and its fully qualified class or function name must be
      "!    specified as the `value`. This is applicable for `Tensorflow 2.X` models
      "!    serialized in `H5` format using the `tf.keras` API.
      USER_DEFINED_OBJECTS type MAP,
      "!   The list of the software specifications that are used by the pipeline that
      "!    generated this model, if the model was generated by a pipeline.
      HYBRID_PIPELINE_SOFTWARE_SPECS type STANDARD TABLE OF T_SOFTWARE_SPEC_REL WITH NON-UNIQUE DEFAULT KEY,
      "!   Optional metadata that can be used to provide information<br/>
      "!   about this model that can be tracked with IBM AI Factsheets.<br/>
      "!   See [Using AI
      "!    Factsheets](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/fa
      "!   ctsheets-model-inventory.html) for more details.
      MODEL_VERSION type T_MODEL_ENTITY_MODEL_VERSION,
      "!   Deprecated: this is replaced by `training.id`. This field can be used to store
      "!    the `id` of the training job that was used to produce this model.
      TRAINING_ID type STRING,
      "!   An optional array which contains the data preprocessing transformations that
      "!    were executed by the training job that created this model.
      DATA_PREPROCESSING type STANDARD TABLE OF T_DATA_PREPROCESSING_TRANS WITH NON-UNIQUE DEFAULT KEY,
      "!   Information about the training job that created this model.
      TRAINING type T_TRAINING_DETAILS,
    end of T_MODEL_ENTITY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The `training_data_references` contain the training datasets</p>
    "!     and the<br/>
    "!    `results_reference` the connection where results will be stored.
    begin of T_TRAIN_RESOURCE_ENTITY_COMMON,
      "!   A reference to a resource.
      EXPERIMENT type T_REL,
      "!   A pipeline.<br/>
      "!   The `hardware_spec` is a reference to the hardware specification.<br/>
      "!   The `hybrid_pipeline_hardware_specs` are used only when training a hybrid
      "!    pipeline in order to<br/>
      "!   specify compute requirement for each pipeline node.
      PIPELINE type T_PIPELINE_REL,
      "!   A model.<br/>
      "!   The `software_spec` is a reference to a software specification.<br/>
      "!   The `hardware_spec` is a reference to a hardware specification.
      MODEL_DEFINITION type T_MODEL_DEFINITION_REL,
      "!   Federated Learning.
      FEDERATED_LEARNING type T_FEDERATED_LEARNING,
      "!   Training datasets.
      TRAINING_DATA_REFERENCES type STANDARD TABLE OF T_DATA_CONNECTION_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   The training results.
      RESULTS_REFERENCE type T_OBJECT_LOCATION,
      "!   The holdout/test datasets.
      TEST_DATA_REFERENCES type STANDARD TABLE OF T_DATA_CONNECTION_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
    end of T_TRAIN_RESOURCE_ENTITY_COMMON.
  types:
    "! No documentation available.
      T_FEATURES_IMPORTANCE type STANDARD TABLE OF T_FEATURE_IMPORTANCE WITH NON-UNIQUE DEFAULT KEY.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Metrics generated during evaluation of the pipeline on</p>
    "!     backtest data.
    begin of T_MTRC_TS_METRICS_TS_BACKTEST,
      "!   Metrics from the backtest data.
      BACKTEST type T_TS_METRIC_BACKTEST,
    end of T_MTRC_TS_METRICS_TS_BACKTEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    Fields that can be patched.</p>
    begin of T_RMT_TRAIN_SYS_PATCH_HELPER,
      "!   A list of tags for this resource.
      TAGS type STANDARD TABLE OF STRING WITH NON-UNIQUE DEFAULT KEY,
      "!   The name of the resource.
      NAME type STRING,
      "!   A description of the resource.
      DESCRIPTION type STRING,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   A remote organization.
      ORGANIZATION type T_ORGANIZATION,
      "!   The list of allowed identities that are allowed to access the remote system.
      ALLOWED_IDENTITIES type STANDARD TABLE OF T_ALLOWED_IDENTITY WITH NON-UNIQUE DEFAULT KEY,
      "!   The details of the remote administrator for the organization and identities.
      REMOTE_ADMIN type T_REMOTE_ADMIN,
    end of T_RMT_TRAIN_SYS_PATCH_HELPER.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The metrics from federated training.</p>
    begin of T_ML_FEDERATED_METRIC,
      "!   Remote training systems.
      REMOTE_TRAINING_SYSTEMS type STANDARD TABLE OF T_REMOTE_TRAIN_SYSTEM_METRIC WITH NON-UNIQUE DEFAULT KEY,
      "!   No documentation available.
      GLOBAL type NUMBER,
    end of T_ML_FEDERATED_METRIC.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!    The details of the function to be created.</p>
    begin of T_FUNCTION_ENTITY_REQUEST,
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
      "!   A software specification.
      SOFTWARE_SPEC type T_SOFTWARE_SPEC_REL,
      "!   Type of the function to be created. Only `python` type is supported as of now.
      "!    If not specified, `python` is the default. Functions expect a gzip file that
      "!    contains a python file that make up the function. Python functions specify what
      "!    needs to be run when the function is deployed and what needs to be run when the
      "!    scoring function is called. In other words, you are able to customize what
      "!    preparation WML does in the environment when you deploy the function, as well
      "!    as what steps WML takes to generate the output when you call the API later on.
      "!    The function consists of the outer function (any place that is not within the
      "!    score function) and the inner score function. The code that sits in the outer
      "!    function runs when the function is deployed, and the environment is then frozen
      "!    and ready to be used whenever the online scoring or batch inline job processing
      "!    API is called. The code that sits in the inner score function runs when the
      "!    online scoring or batch inline job processing API is called, in the environment
      "!    customized by the outer function. See [Deploying Python
      "!    function](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/ml-d
      "!   eploy-py-function.html?context=cpdaas&audience=wdp) for more details.<br/>
      "!   <br/>
      "!   This is illustrated in the example below:<br/>
      "!   <br/>
      "!   &gt;&lt;python code used to set up the environment&gt; \<br/>
      "!   &gt;\<br/>
      "!   &gt;def score(payload): \<br/>
      "!   &gt;&nbsp;&nbsp;&nbsp;&nbsp;df_payload =
      "!    pd.DataFrame(payload[&quot;values&quot;]) \<br/>
      "!   &gt;&nbsp;&nbsp;&nbsp;&nbsp;df_payload.columns = payload[&quot;fields&quot;]
      "!    \<br/>
      "!   &gt;&nbsp;&nbsp;&nbsp;&nbsp;... \<br/>
      "!   &gt;&nbsp;&nbsp;&nbsp;&nbsp;output = &#123;&quot;result&quot; : res&#125; \<br/>
      "!   &gt;&nbsp;&nbsp;&nbsp;&nbsp;return output \<br/>
      "!   &gt;\<br/>
      "!   &gt;return score.
      TYPE type STRING,
      "!   Scoring data.
      SAMPLE_SCORING_INPUT type T_SYNC_SCORING_DATA,
      "!   The schemas of the expected data.
      SCHEMAS type T_FUNCTION_ENTITY_SCHEMAS,
      "!   User defined properties specified as key-value pairs.
      CUSTOM type JSONOBJECT,
      "!   This is a list of references of the models that are used by this function, if
      "!    any. These references are provided by the owner of the function and are used
      "!    for usage tracking only.
      MODEL_REFERENCES type STANDARD TABLE OF T_MODEL_REFERENCE WITH NON-UNIQUE DEFAULT KEY,
    end of T_FUNCTION_ENTITY_REQUEST.
  types:
    "! <p class="shorttext synchronized" lang="en">
    "!   Array parameter type for method DEPLOYMENT_JOB_DEF_UPDATE</p>
    TT_JSON_PATCH_OPERATION type STANDARD TABLE OF T_JSON_PATCH_OPERATION WITH NON-UNIQUE DEFAULT KEY.

constants:
  "! <p class="shorttext synchronized" lang="en">List of required fields per type.</p>
  begin of C_REQUIRED_FIELDS,
    T_DATA_SCHEMA type string value '|ID|FIELDS|',
    T_MODEL_ENTITY_SCHEMAS type string value '|',
    T_TRAINING_STATUS_HPO type string value '|HYPER_PARAMETERS|',
    T_MODEL_LOCATION type string value '|',
    T_INTERMEDIATE_MODEL type string value '|NAME|PROCESS|',
    T_FEATURE_IMPORTANCE type string value '|FEATURES|',
    T_CONFUSION_MATRIX type string value '|TRUE_CLASS|TP|TN|FP|FN|',
    T_ROC_CURVE type string value '|TRUE_CLASS|TPR|FPR|',
    T_MULTI_CLASS_CLASSIFICATION type string value '|CLASS|CONFUSION_MATRIX|ROC_CURVE|',
    T_STEP_INFO type string value '|NAME|',
    T_INCREMENTAL_TRAINING type string value '|',
    T_MULTI_CLASS_CLASSIFICATIONS type string value '|',
    T_BINARY_CLASSIFICATION type string value '|',
    T_METRICS_CONTEXT type string value '|',
    T_FDRTD_LRNNG_INF_AGGRGTR_CNN1 type string value '|',
    T_FDRTD_LRNNG_INF_RMT_TRAIN_S3 type string value '|',
    T_FDRTD_LRNNG_INF_RMT_TRAIN_S2 type string value '|',
    T_FDRTD_LRNNG_INF_RMT_TRAIN_S1 type string value '|',
    T_FDRTD_LRNNG_INFO_AGGREGATOR type string value '|',
    T_FEDERATED_LEARNING_INFO type string value '|',
    T_GPU_METRICS_MEMORY type string value '|MEASURE|VALUE|',
    T_GPU_METRICS type string value '|TYPE|',
    T_COMPUTE_USAGE_METRICS type string value '|TIMESTAMP|',
    T_METRIC type string value '|TIMESTAMP|',
    T_TRAINING_STATUS_MESSAGE type string value '|',
    T_API_ERROR_TARGET type string value '|TYPE|NAME|',
    T_API_ERROR type string value '|CODE|MESSAGE|',
    T_API_ERROR_RESPONSE type string value '|TRACE|ERRORS|',
    T_TRAINING_STATUS type string value '|STATE|',
    T_CONSUMPTION_GPU_COUNT type string value '|',
    T_TOKEN_COUNT type string value '|CURRENT|',
    T_RESOURCE_META_SIMPLE type string value '|ID|CREATED_AT|',
    T_VARIANCE type string value '|',
    T_TSAD_HOLDOUT_AGG_PRECISION type string value '|',
    T_TSD_HLDT_SPPRTNG_RNK_AVG_PR2 type string value '|',
    T_TSD_HLDT_SPPRTNG_RNK_AVG_PR1 type string value '|',
    T_TSD_HLDT_ITRTNS_ITM_AVG_PRC1 type string value '|',
    T_TSAD_HOLDOUT_ITERATIONS_ITEM type string value '|',
    T_TSD_HLDT_AGG_AVG_PRCSN_LVL_1 type string value '|',
    T_TSAD_HOLDOUT_SUPPORTING_RANK type string value '|',
    T_TSAD_HOLDOUT_AGG_ROC_AUC type string value '|',
    T_TSD_HLDT_AGGRGTD_SCORE_ITEM type string value '|',
    T_TSD_HLDT_AGG_AVG_PRCSN_TREND type string value '|',
    T_TSAD_HOLDOUT_AGG_F1 type string value '|',
    T_TSD_HLDT_AGG_AVG_PRCSN_LCLZ1 type string value '|',
    T_TSAD_HOLDOUT_AGG_RECALL type string value '|',
    T_TSD_HLDT_AGG_AVG_PRECISION type string value '|',
    T_TSAD_HOLDOUT_AGG type string value '|',
    T_MTRC_TSD_MTRCS_TSAD_HOLDOUT type string value '|',
    T_RESOURCE_COMMIT_INFO type string value '|COMMITTED_AT|',
    T_SIMPLE_REL type string value '|ID|',
    T_DATA_CONNECTION_REFERENCE type string value '|TYPE|',
    T_SCORING_PAYLOAD_OPTIM type string value '|ID|',
    T_JOB_STATUS_MESSAGE type string value '|',
    T_JOB_STATUS type string value '|',
    T_OBJECT_LOCATION_OPTIM type string value '|ID|TYPE|LOCATION|',
    T_SOLVE_STATE type string value '|',
    T_JB_DECISION_OPTIMIZATION_RES type string value '|',
    T_SCORING_PAYLOAD type string value '|',
    T_EVALUATIONS_SPEC_ITEM type string value '|',
    T_JOB_SCORING_RESULT type string value '|',
    T_HARDWARE_SPEC type string value '|',
    T_HYBRD_PPLN_HRDWR_SPECS_ITEM type string value '|NODE_RUNTIME_ID|HARDWARE_SPEC|',
    T_PLATFORM_JOB type string value '|JOB_ID|RUN_ID|',
    T_JOB_STATUS_ENTITY type string value '|DEPLOYMENT|',
    T_RESOURCE_META type string value '|ID|CREATED_AT|',
    T_PAGINATION_FIRST type string value '|HREF|',
    T_PAGINATION_NEXT type string value '|HREF|',
    T_JOBS_RESOURCE type string value '|',
    T_JOBS_RESOURCES type string value '|LIMIT|FIRST|',
    T_RMT_TRAIN_SYS_REV_ENTITY_REQ type string value '|',
    T_SOFTWARE_SPEC_REL type string value '|',
    T_MDL_DEF_ENTITY_REQ_PLATFORM type string value '|NAME|VERSIONS|',
    T_MODEL_DEF_ENTITY_REQUEST type string value '|NAME|VERSION|PLATFORM|',
    T_FEDERATED_LEARNING_OPTIMIZER type string value '|',
    T_JOB_ENTITY_RESULT type string value '|DEPLOYMENT|',
    T_WARNING type string value '|MESSAGE|',
    T_SYSTEM_DETAILS type string value '|',
    T_MODEL_DEF_ENTITY_PLATFORM type string value '|NAME|VERSIONS|',
    T_MODEL_DEFINITION_ENTITY type string value '|VERSION|PLATFORM|',
    T_MODEL_DEFINITION_RESOURCE type string value '|METADATA|ENTITY|',
    T_MODEL_DEFINITION_RESOURCES type string value '|LIMIT|FIRST|',
    T_JOB_SCORING_REQUEST type string value '|',
    T_ORGANIZATION type string value '|NAME|',
    T_ALLOWED_IDENTITY type string value '|ID|TYPE|',
    T_REMOTE_ADMIN type string value '|NAME|',
    T_REMOTE_TRAIN_SYSTEM_ENTITY type string value '|ALLOWED_IDENTITIES|',
    T_REMOTE_TRAIN_SYSTEM_RESOURCE type string value '|METADATA|ENTITY|',
    T_MODEL_DEFINITION_ID type string value '|',
    T_MESSAGE type string value '|',
    T_SCORING_PARAMETERS type string value '|',
    T_SYNC_SCORING_DATA_ITEM type string value '|',
    T_SYNC_SCORING_DATA type string value '|INPUT_DATA|',
    T_MODEL_REFERENCE type string value '|ID|',
    T_FUNCTION_ENTITY_SCHEMAS type string value '|',
    T_FUNCTION_ENTITY type string value '|SOFTWARE_SPEC|',
    T_OBJECT_LOCATION type string value '|TYPE|LOCATION|',
    T_REL type string value '|ID|',
    T_FDRTD_LEARNING_MODEL_SPEC type string value '|',
    T_FDRTD_LRNNG_RMT_TRAIN_RMT_T1 type string value '|ID|',
    T_FDRTD_LEARNING_REMOTE_TRAIN type string value '|REMOTE_TRAINING_SYSTEMS|',
    T_FEDERATED_LEARNING_CRYPTO type string value '|',
    T_FEDERATED_LEARNING_MODEL type string value '|TYPE|',
    T_FEDERATED_LEARNING type string value '|FUSION_TYPE|REMOTE_TRAINING|',
    T_STATS type string value '|',
    T_DEPLOYMENT_SYSTEM_DETAILS type string value '|',
    T_DEPLOYMENT_RESOURCES_SYSTEM type string value '|',
    T_ONLINE_PARAMETERS type string value '|',
    T_ONLINE_REQUEST type string value '|',
    T_PPLN_REL_DATA_BINDINGS_ITEM type string value '|DATA_REFERENCE_NAME|NODE_ID|',
    T_PPLN_REL_NODES_PARAM_ITEM type string value '|NODE_ID|PARAMETERS|',
    T_PIPELINE_REL type string value '|ID|',
    T_MODEL_DEFINITION_REL type string value '|ID|',
    T_TRAIN_DEF_ENTITY_REQUEST type string value '|NAME|RESULTS_REFERENCE|',
    T_REMOTE_TRAIN_SYS_ENTITY_REQ type string value '|NAME|ALLOWED_IDENTITIES|',
    T_TRAINING_DEFINITION_ENTITY type string value '|RESULTS_REFERENCE|',
    T_TRAINING_DEFINITION_RESOURCE type string value '|METADATA|ENTITY|',
    T_TRAIN_DEFINITION_RESOURCES type string value '|LIMIT|FIRST|',
    T_FIELD_SOLVE_STATE type string value '|',
    T_CNSMPTN_CAPACITY_UNIT_HOURS type string value '|CURRENT|',
    T_CNSMPTN_DEPLOYMENT_JOB_COUNT type string value '|',
    T_CONSUMPTION_DO_JOB_COUNT type string value '|',
    T_CONSUMPTION_DETAILS type string value '|CONTEXT|',
    T_CONSUMPTION type string value '|',
    T_PAGINATION type string value '|LIMIT|FIRST|',
    T_JB_DECISION_OPTIMIZATION_REQ type string value '|',
    T_JOB_RESOURCE_ENTITY type string value '|DEPLOYMENT|',
    T_PIPELINE_ENTITY type string value '|DOCUMENT|',
    T_PIPELINE_RESOURCE type string value '|METADATA|ENTITY|',
    T_PIPELINE_RESOURCES type string value '|LIMIT|FIRST|',
    T_REV_ENTITY_SPACE_REQUEST type string value '|SPACE_ID|',
    T_INSTANCE_RESRC_ENTITY_PLAN type string value '|ID|NAME|VERSION|',
    T_RESOURCE_META_BASE type string value '|',
    T_BLUEMIX_ACCOUNT type string value '|ID|',
    T_INSTANCE_RESOURCE_ENTITY type string value '|STATUS|PLAN|SERVICE_ENDPOINTS|',
    T_INSTANCE_RESOURCE type string value '|',
    T_TRAIN_REF_HYPR_PRM_OPTMZTN_1 type string value '|',
    T_HYPER_PARAMETER type string value '|NAME|ITEMS|',
    T_TRAIN_REF_HYPR_PRM_OPTMZTN type string value '|',
    T_EVALUATION_METRIC type string value '|NAME|',
    T_EVALUATION_DEFINITION type string value '|METRICS|',
    T_TRAINING_REFERENCE type string value '|',
    T_EXPERIMENT_ENTITY_REQUEST type string value '|NAME|',
    T_DATA_OUTPUT type string value '|',
    T_DATA_INPUT type string value '|',
    T_DATA_PREPROCESSING_TRANS type string value '|',
    T_INFERENCE type string value '|URL|',
    T_DEPLOYMENT_SCALING type string value '|STATE|',
    T_DEPLOYMENT_STATUS type string value '|',
    T_TRAIN_RESRC_ENTITY_REQUEST type string value '|RESULTS_REFERENCE|',
    T_MTRC_TSD_MTRCS_TSD_TRAIN_AG1 type string value '|',
    T_CONTENT_INFO type string value '|CONTENT_FORMAT|LOCATION|FILE_NAME|',
    T_CONTENT_LOCATION type string value '|CONTENTS|TYPE|',
    T_REMOTE_TRAIN_SYS_RESOURCES type string value '|LIMIT|FIRST|',
    T_CONTENT_METADATA type string value '|ATTACHMENT_ID|CONTENT_FORMAT|',
    T_ALL_CONTENT_METADATA type string value '|TOTAL_COUNT|ATTACHMENTS|',
    T_JOB_ENTITY type string value '|DEPLOYMENT|',
    T_PAGINATION_BASE type string value '|LIMIT|FIRST|',
    T_TRAINING_WEBSOCKET type string value '|',
    T_JOB_RESOURCE_METADATA type string value '|ID|CREATED_AT|',
    T_JOB_RESOURCE type string value '|METADATA|ENTITY|',
    T_EXPERIMENT_REV_ENTITY_REQ type string value '|',
    T_PIPELINE_ENTITY_REQUEST type string value '|NAME|DOCUMENT|',
    T_TS_TRAINING_TRAINING type string value '|',
    T_METRIC_TS_METRICS_TS_TRAIN type string value '|',
    T_FUNCTION_RESOURCE type string value '|METADATA|ENTITY|',
    T_FUNCTION_RESOURCES type string value '|LIMIT|FIRST|',
    T_MODEL_ENTITY_SIZE type string value '|',
    T_BASE_MODEL type string value '|',
    T_MODEL_ENTITY_MODEL_VERSION type string value '|',
    T_TRAINING_DETAILS type string value '|',
    T_MODEL_RESOURCE_ENTITY type string value '|TYPE|',
    T_MODEL_RESOURCE type string value '|METADATA|',
    T_MODEL_RESOURCES type string value '|LIMIT|FIRST|',
    T_REV_ENTITY_SPC_PROJECT_REQ type string value '|',
    T_JOB_REVISION_ENTITY_REQUEST type string value '|SPACE_ID|',
    T_FIELD_JOB_STATUS type string value '|',
    T_BATCH_REQUEST type string value '|',
    T_DEPLOYMENT_ENTITY type string value '|',
    T_TRAIN_DEF_REV_ENTITY_REQUEST type string value '|',
    T_COMMON_PATCH_REQUEST_HELPER type string value '|',
    T_REMOTE_TRAIN_SYSTEM_METRIC type string value '|ID|',
    T_INSTANCE_RESOURCES type string value '|LIMIT|FIRST|',
    T_JOB_ENTITY_REQUEST type string value '|SPACE_ID|NAME|DEPLOYMENT|',
    T_TS_METRIC_LEVELS type string value '|',
    T_METRIC_TS_METRICS_TS_HOLDOUT type string value '|',
    T_EXPERIMENT_ENTITY type string value '|',
    T_EXPERIMENT_RESOURCE type string value '|METADATA|ENTITY|',
    T_EXPERIMENT_RESOURCES type string value '|LIMIT|FIRST|',
    T_ENTITY_REQUEST_SPACE_BODY type string value '|SPACE_ID|NAME|',
    T_TSAD_HOLDOUT type string value '|',
    T_DPLYMNT_JOB_DEF_PATCH_HELPER type string value '|',
    T_EXTRA_MODEL_ENTITY type string value '|',
    T_TS_MTRC_BCKTST_ITRTNS_ITEM type string value '|',
    T_SYNC_SCORING_DATA_RESULTS type string value '|',
    T_JOB_RESOURCES type string value '|LIMIT|FIRST|',
    T_SYSTEM type string value '|',
    T_MTRC_TSAD_METRICS_TSAD_TRAIN type string value '|',
    T_DEPLOYMENT_PATCH_REQ_HELPER type string value '|',
    T_DEPLOYMENT_ENTITY_REQUEST type string value '|SPACE_ID|',
    T_MODEL_ENTITY_REQUEST type string value '|NAME|TYPE|',
    T_TS_METRIC_BACKTEST type string value '|',
    T_TS_BACKTEST type string value '|',
    T_DEPLOYMENT_RESOURCE type string value '|',
    T_DEPLOYMENT_RESOURCES type string value '|LIMIT|FIRST|',
    T_MODEL_REV_ENTITY_REQUEST type string value '|',
    T_TSD_TRAIN_AGGRGTD_SCORE_ITEM type string value '|',
    T_ENTITY_REQ_SPC_PROJECT_BODY type string value '|NAME|',
    T_TSAD_TRAINING type string value '|',
    T_TS_HOLDOUT type string value '|',
    T_JSON_PATCH_OPERATION type string value '|OP|PATH|',
    T_DEPLOYMENT_ENTITY_COMMON type string value '|',
    T_TS_TRAINING type string value '|',
    T_TRAINING_RESOURCE_ENTITY type string value '|RESULTS_REFERENCE|',
    T_TRAINING_RESOURCE type string value '|',
    T_TRAINING_RESOURCES type string value '|LIMIT|FIRST|',
    T_PIPELINE_REV_ENTITY_REQUEST type string value '|',
    T_MODEL_DEF_REV_ENTITY_REQUEST type string value '|',
    T_CONTENT_LOCATION_FIELD type string value '|',
    T_TRAIN_DEF_PATCH_HELPER type string value '|',
    T_FUNC_REVISION_ENTITY_REQUEST type string value '|',
    T_MODEL_ENTITY type string value '|TYPE|',
    T_TRAIN_RESOURCE_ENTITY_COMMON type string value '|RESULTS_REFERENCE|',
    T_MTRC_TS_METRICS_TS_BACKTEST type string value '|',
    T_RMT_TRAIN_SYS_PATCH_HELPER type string value '|',
    T_ML_FEDERATED_METRIC type string value '|',
    T_FUNCTION_ENTITY_REQUEST type string value '|NAME|SOFTWARE_SPEC|',
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
     DEPLOYMENT type string value 'deployment',
     ASSET type string value 'asset',
     HARDWARE_SPEC type string value 'hardware_spec',
     HYBRID_PIPELINE_HARDWARE_SPECS type string value 'hybrid_pipeline_hardware_specs',
     ORGANIZATION type string value 'organization',
     ALLOWED_IDENTITIES type string value 'allowed_identities',
     REMOTE_ADMIN type string value 'remote_admin',
     FEDERATED_LEARNING type string value 'federated_learning',
     HREF type string value 'href',
     TOTAL_COUNT type string value 'total_count',
     LIMIT type string value 'limit',
     FIRST type string value 'first',
     NEXT type string value 'next',
     ID type string value 'id',
     CREATED_AT type string value 'created_at',
     COMMITTED_AT type string value 'committed_at',
     COMMIT_MESSAGE type string value 'commit_message',
     REV type string value 'rev',
     OWNER type string value 'owner',
     MODIFIED_AT type string value 'modified_at',
     PARENT_ID type string value 'parent_id',
     COMMIT_INFO type string value 'commit_info',
     SPACE_ID type string value 'space_id',
     PROJECT_ID type string value 'project_id',
     NUM_NODES type string value 'num_nodes',
     MODEL_TYPE type string value 'model_type',
     DATA_BINDINGS type string value 'data_bindings',
     NODES_PARAMETERS type string value 'nodes_parameters',
     SOFTWARE_SPEC type string value 'software_spec',
     COMMAND type string value 'command',
     PARAMETERS type string value 'parameters',
     MODEL type string value 'model',
     FUSION_TYPE type string value 'fusion_type',
     REMOTE_TRAINING type string value 'remote_training',
     ROUNDS type string value 'rounds',
     TERMINATION_PREDICATE type string value 'termination_predicate',
     EPOCHS type string value 'epochs',
     OPTIMIZER type string value 'optimizer',
     LOSS type string value 'loss',
     METRICS type string value 'metrics',
     MAX_DEPTH type string value 'max_depth',
     LEARNING_RATE type string value 'learning_rate',
     L2_REGULARIZATION type string value 'l2_regularization',
     MAX_BINS type string value 'max_bins',
     MAX_LEAF_NODES type string value 'max_leaf_nodes',
     MIN_SAMPLES_LEAF type string value 'min_samples_leaf',
     RANDOM_STATE type string value 'random_state',
     VERBOSE type string value 'verbose',
     NUM_CLASSES type string value 'num_classes',
     BYZANTINE_THRESHOLD type string value 'byzantine_threshold',
     SIGMA type string value 'sigma',
     SIGMA0 type string value 'sigma0',
     GAMMA type string value 'gamma',
     ITERS type string value 'iters',
     SAVE_INTERMEDIATE_MODELS type string value 'save_intermediate_models',
     CRYPTO type string value 'crypto',
     VERSION type string value 'version',
     LOG_LEVEL type string value 'log_level',
     SKETCH_ACCURACY_VS_PRIVACY type string value 'sketch_accuracy_vs_privacy',
     FIELDS type string value 'fields',
     TYPE type string value 'type',
     CONNECTION type string value 'connection',
     LOCATION type string value 'location',
     SCHEMA type string value 'schema',
     EXPERIMENT type string value 'experiment',
     PIPELINE type string value 'pipeline',
     MODEL_DEFINITION type string value 'model_definition',
     TRAINING_DATA_REFERENCES type string value 'training_data_references',
     RESULTS_REFERENCE type string value 'results_reference',
     TEST_DATA_REFERENCES type string value 'test_data_references',
     MEMORY type string value 'memory',
     TIMESTAMP type string value 'timestamp',
     GPU_COUNT type string value 'gpu_count',
     GPUS type string value 'gpus',
     AGGREGATOR type string value 'aggregator',
     REMOTE_TRAINING_SYSTEMS type string value 'remote_training_systems',
     TRAINING type string value 'training',
     NG_SYMMTRC_MN_ABSLT_PRCNTG_ERR type string value 'neg_symmetric_mean_absolute_percentage_error',
     NG_AVG_SYMMTRC_MN_ABSLT_PRCNT1 type string value 'neg_avg_symmetric_mean_absolute_percentage_error',
     R2 type string value 'r2',
     AVG_R2 type string value 'avg_r2',
     NEG_ROOT_MEAN_SQUARED_ERROR type string value 'neg_root_mean_squared_error',
     NEG_AVG_ROOT_MEAN_SQUARED_ERR type string value 'neg_avg_root_mean_squared_error',
     NEG_MEAN_ABSOLUTE_ERROR type string value 'neg_mean_absolute_error',
     NEG_AVG_MEAN_ABSOLUTE_ERROR type string value 'neg_avg_mean_absolute_error',
     HOLDOUT type string value 'holdout',
     AVG type string value 'avg',
     ITERATIONS type string value 'iterations',
     BACKTEST type string value 'backtest',
     MEAN type string value 'mean',
     RANGE type string value 'range',
     AGG type string value 'agg',
     SUPPORTING_RANK type string value 'supporting_rank',
     AGGREGATED_SCORE type string value 'aggregated_score',
     LOCAL type string value 'local',
     FUSED type string value 'fused',
     GLOBAL type string value 'global',
     PIPELINE_MODEL type string value 'pipeline_model',
     PROCESS type string value 'process',
     NOTEBOOK_LOCATION type string value 'notebook_location',
     SDK_NOTEBOOK_LOCATION type string value 'sdk_notebook_location',
     PIPELINE_NODES type string value 'pipeline_nodes',
     COMPOSITION_STEPS type string value 'composition_steps',
     DURATION type string value 'duration',
     MODEL_ASSET type string value 'model_asset',
     STARTED_AT type string value 'started_at',
     COMPLETED_AT type string value 'completed_at',
     HYPER_PARAMETERS type string value 'hyper_parameters',
     DATA_ALLOCATION type string value 'data_allocation',
     ESTIMATOR type string value 'estimator',
     TRANSFORMER type string value 'transformer',
     SCORE type string value 'score',
     TRUE_CLASS type string value 'true_class',
     TP type string value 'tp',
     TN type string value 'tn',
     FP type string value 'fp',
     FN type string value 'fn',
     TPR type string value 'tpr',
     FPR type string value 'fpr',
     THRESHOLDS type string value 'thresholds',
     CONFUSION_MATRICES type string value 'confusion_matrices',
     ROC_CURVES type string value 'roc_curves',
     CLASS type string value 'class',
     CONFUSION_MATRIX_LOCATION type string value 'confusion_matrix_location',
     CONFUSION_MATRIX type string value 'confusion_matrix',
     ROC_CURVE_LOCATION type string value 'roc_curve_location',
     ROC_CURVE type string value 'roc_curve',
     ONE_VS_ALL type string value 'one_vs_all',
     ONE_VS_ALL_LOCATION type string value 'one_vs_all_location',
     COMPUTATION_TYPE type string value 'computation_type',
     FEATURES type string value 'features',
     MIN_MAX_NORMALIZATION type string value 'min_max_normalization',
     ITERATION type string value 'iteration',
     TOTAL_ITERATIONS type string value 'total_iterations',
     MEASURES_LOCATION type string value 'measures_location',
     TRAIN_BATCH_SAMPLES_COUNT type string value 'train_batch_samples_count',
     HOLDOUT_SAMPLES_COUNT type string value 'holdout_samples_count',
     EARLY_STOP_TRIGGERED type string value 'early_stop_triggered',
     DEPLOYMENT_ID type string value 'deployment_id',
     INTERMEDIATE_MODEL type string value 'intermediate_model',
     PHASE type string value 'phase',
     STEP type string value 'step',
     CLASSES type string value 'classes',
     BINARY_CLASSIFICATION type string value 'binary_classification',
     MULTI_CLASS_CLASSIFICATION type string value 'multi_class_classification',
     FEATURES_IMPORTANCE type string value 'features_importance',
     ESTIMATORS type string value 'estimators',
     INCREMENTAL_TRAINING type string value 'incremental_training',
     PREDICTION_TYPE type string value 'prediction_type',
     ML_METRICS type string value 'ml_metrics',
     TS_METRICS type string value 'ts_metrics',
     TSAD_METRICS type string value 'tsad_metrics',
     ML_FEDERATED_METRICS type string value 'ml_federated_metrics',
     CONTEXT type string value 'context',
     CODE type string value 'code',
     MESSAGE type string value 'message',
     MORE_INFO type string value 'more_info',
     TARGET type string value 'target',
     TRACE type string value 'trace',
     ERRORS type string value 'errors',
     RUNNING_AT type string value 'running_at',
     STATE type string value 'state',
     COMPUTE_USAGE_METRICS type string value 'compute_usage_metrics',
     HPO type string value 'hpo',
     FEDERATED_LEARNING_INFO type string value 'federated_learning_info',
     FAILURE type string value 'failure',
     STATUS type string value 'status',
     ADDITIONAL_PROPERTIES type string value 'additional_properties',
     WARNINGS type string value 'warnings',
     METADATA type string value 'metadata',
     ENTITY type string value 'entity',
     SYSTEM type string value 'system',
     RESOURCES type string value 'resources',
     SERVING_NAME type string value 'serving_name',
     ONLINE type string value 'online',
     BATCH type string value 'batch',
     LEVEL type string value 'level',
     TEXT type string value 'text',
     URL type string value 'url',
     SSE type string value 'sse',
     USES_SERVING_NAME type string value 'uses_serving_name',
     ATTEMPTED_AT type string value 'attempted_at',
     REQUESTED_REPLICAS type string value 'requested_replicas',
     DEPLOYED_REPLICAS type string value 'deployed_replicas',
     INFERENCE type string value 'inference',
     SERVING_URLS type string value 'serving_urls',
     SCALING type string value 'scaling',
     DEPLOYED_ASSET_TYPE type string value 'deployed_asset_type',
     ONLINE_COUNT type string value 'online_count',
     BATCH_COUNT type string value 'batch_count',
     STATS type string value 'stats',
     OP type string value 'op',
     PATH type string value 'path',
     VALUE type string value 'value',
     VALUES type string value 'values',
     FORECAST_WINDOW type string value 'forecast_window',
     INPUT_DATA type string value 'input_data',
     SCORING_PARAMETERS type string value 'scoring_parameters',
     TARGETS type string value 'targets',
     PREDICTIONS type string value 'predictions',
     INPUT_DATA_REFERENCES type string value 'input_data_references',
     OUTPUT_DATA_REFERENCE type string value 'output_data_reference',
     EVALUATIONS type string value 'evaluations',
     ENVIRONMENT_VARIABLES type string value 'environment_variables',
     CONTENT type string value 'content',
     SOLVE_PARAMETERS type string value 'solve_parameters',
     OUTPUT_DATA type string value 'output_data',
     OUTPUT_DATA_REFERENCES type string value 'output_data_references',
     DETAILS type string value 'details',
     SOLVE_STATUS type string value 'solve_status',
     INTERRUPTION_STATUS type string value 'interruption_status',
     LATEST_ENGINE_ACTIVITY type string value 'latest_engine_activity',
     SOLVE_STATE type string value 'solve_state',
     SCORING type string value 'scoring',
     DECISION_OPTIMIZATION type string value 'decision_optimization',
     JOB_ID type string value 'job_id',
     RUN_ID type string value 'run_id',
     PLATFORM_JOB type string value 'platform_job',
     FRAMEWORK type string value 'framework',
     CAPACITY_UNIT_HOURS type string value 'capacity_unit_hours',
     TOKEN_COUNT type string value 'token_count',
     CURRENT type string value 'current',
     DO_JOB_COUNT type string value 'do_job_count',
     DEPLOYMENT_JOB_COUNT type string value 'deployment_job_count',
     PLAN type string value 'plan',
     CRN type string value 'crn',
     ACCOUNT type string value 'account',
     CONSUMPTION type string value 'consumption',
     SERVICE_ENDPOINTS type string value 'service_endpoints',
     RESOURCE_GROUP_ID type string value 'resource_group_id',
     MAXIMIZE type string value 'maximize',
     METHOD type string value 'method',
     ITEMS type string value 'items',
     HYPER_PARAMETERS_OPTIMIZATION type string value 'hyper_parameters_optimization',
     LABEL_COLUMN type string value 'label_column',
     EVALUATION_DEFINITION type string value 'evaluation_definition',
     TRAINING_REFERENCES type string value 'training_references',
     SAMPLE_SCORING_INPUT type string value 'sample_scoring_input',
     SCHEMAS type string value 'schemas',
     MODEL_REFERENCES type string value 'model_references',
     ATTACHMENT_ID type string value 'attachment_id',
     CONTENT_FORMAT type string value 'content_format',
     PIPELINE_NODE_ID type string value 'pipeline_node_id',
     PERSISTED type string value 'persisted',
     DOCUMENT type string value 'document',
     ROWS type string value 'rows',
     COLUMNS type string value 'columns',
     STAGE type string value 'stage',
     INPUT type string value 'input',
     OUTPUT type string value 'output',
     PROPS type string value 'props',
     MODEL_ID type string value 'model_id',
     BASE_MODEL type string value 'base_model',
     TASK_ID type string value 'task_id',
     VERBALIZER type string value 'verbalizer',
     DOMAIN type string value 'domain',
     TRANSFORMED_LABEL_COLUMN type string value 'transformed_label_column',
     SIZE type string value 'size',
     USER_DEFINED_OBJECTS type string value 'user_defined_objects',
     HYBRID_PIPELINE_SOFTWARE_SPECS type string value 'hybrid_pipeline_software_specs',
     MODEL_VERSION type string value 'model_version',
     TRAINING_ID type string value 'training_id',
     DATA_PREPROCESSING type string value 'data_preprocessing',
     CONTENT_IMPORT_STATE type string value 'content_import_state',
     FILE_NAME type string value 'file_name',
     CONTENTS type string value 'contents',
     CONTENT_LOCATION type string value 'content_location',
     ATTACHMENTS type string value 'attachments',
     PLATFORM type string value 'platform',
     ALLOWED_IPS type string value 'allowed_ips',
     REGION type string value 'region',
     EMAIL type string value 'email',
     VERSIONS type string value 'versions',
     SPEC type string value 'spec',
     MODEL_FILE type string value 'model_file',
     QUORUM type string value 'quorum',
     MAX_TIMEOUT type string value 'max_timeout',
     CIPHER_SPEC type string value 'cipher_spec',
     NODE_RUNTIME_ID type string value 'node_runtime_id',
     AVERAGE_PRECISION type string value 'average_precision',
     ROC_AUC type string value 'roc_auc',
     F1 type string value 'f1',
     PRECISION type string value 'precision',
     RECALL type string value 'recall',
     P1 type string value 'p1',
     P2 type string value 'p2',
     P3 type string value 'p3',
     P4 type string value 'p4',
     P5 type string value 'p5',
     P6 type string value 'p6',
     MEASURE type string value 'measure',
     EXPIRATION_DATE type string value 'expiration_date',
     DATA_REFERENCE_NAME type string value 'data_reference_name',
     NODE_ID type string value 'node_id',
     INPUT_TARGET type string value 'input_target',
     METRICS_NAMES type string value 'metrics_names',
     IN_MEMORY type string value 'in_memory',
     NUMBER type string value 'number',
     TAG type string value 'tag',
     STATES type string value 'states',
     LEVEL_SHIFT type string value 'level_shift',
     LOCALIZED_EXTREME type string value 'localized_extreme',
     TREND type string value 'trend',
     VARIANCE type string value 'variance',
     HOST type string value 'host',
     PORT type string value 'port',
     ENDPOINT type string value 'endpoint',
     PROTOCOL type string value 'protocol',
     HEADERS type string value 'headers',
     REQUIRED type string value 'required',
     REGISTRATION_LOG type string value 'registration_log',
     EVENT type string value 'event',
  end of C_ABAPNAME_DICTIONARY .


  methods GET_APPNAME
    redefinition .
  methods GET_REQUEST_PROP
    redefinition .
  methods GET_SDK_VERSION_DATE
    redefinition .


    "! <p class="shorttext synchronized" lang="en">Create a new WML deployment</p>
    "!   Create a new deployment, the parameters specifying the deployment type are
    "!    `online` and `batch`.<br/>
    "!   These parameters are mutually exclusive, specify only one of these when creating
    "!    a deployment.<br/>
    "!   Use `hybrid_pipeline_hardware_specs` only when creating a `batch` deployment job
    "!    of a hybrid pipeline in order to specify compute configuration for each
    "!    pipeline node. For all other `batch` deployment cases use `hardware_spec` to
    "!    specify compute configuration. The `hybrid_pipeline_hardware_specs` and
    "!    `hardware_spec` are mutually exclusive, specify only one of these when creating
    "!    a deployment.<br/>
    "!   For `batch` deployments, `hardware_spec.num_nodes` parameter is not currently
    "!    supported.<br/>
    "!   For `online` deployments, `hardware_spec` cannot be specified at the time of
    "!    creation, `hardware_spec.num_nodes` parameter is not supported as part of `POST
    "!    /ml/v4/deployments` API request, but it can be updated using `PATCH
    "!    /ml/v4/deployments/&lt;deployment id&gt;`.<br/>
    "!   For `online` deployments, `serving_name` can be provided in
    "!    `online.parameters`.<br/>
    "!   The serving name can have the characters `[a-z,0-9,_]` and must not be more than
    "!    36 characters.<br/>
    "!   The `serving_name` can be used in the prediction URL in place of the
    "!    `deployment_id`.<br/>
    "!   See the documentation [supported
    "!    frameworks](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/pm
    "!   _service_supported_frameworks.html?context=cpdaas&audience=wdp) for details
    "!    about which frameworks can be used in a deployment.<br/>
    "!
    "!
    "! @parameter I_DEPLOYMENTENTITYREQUEST |
    "!   The deployment entity.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_DEPLOYMENT_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENTS_CREATE
    importing
      !I_DEPLOYMENTENTITYREQUEST type T_DEPLOYMENT_ENTITY_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_DEPLOYMENT_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the deployments</p>
    "!   Retrieve the list of deployments for the specified space.<br/>
    "!
    "!
    "! @parameter I_SPACE_ID |
    "!   Retrieves the deployments that belong to this space.
    "! @parameter I_SERVING_NAME |
    "!   Retrieves the deployment, if any, that contains this `serving_name`.
    "! @parameter I_TAG_VALUE |
    "!   Retrieves only the resources with the given tag value.
    "! @parameter I_ASSET_ID |
    "!   Retrieves only the resources with the given asset_id, asset_id would be either
    "!    model_id or function_id.
    "! @parameter I_NAME |
    "!   Retrieves only the resources with the given name.
    "! @parameter I_TYPE |
    "!   Retrieves the resources filtered with the given type. Allowed values are
    "!    `model`, `function`, `py_script` and `do`.
    "! @parameter I_STATE |
    "!   Retrieves the resources filtered by state. Allowed values are `initializing`,
    "!    `updating`, `ready` and `failed`.
    "! @parameter I_STATS |
    "!   Returns stats about deployments within a space or across spaces if it is set to
    "!    true. This query parameter cannot be combined with any other except for
    "!    &apos;space_id&apos;.
    "! @parameter I_CONFLICT |
    "!   Returns whether serving_name is available for use or not. This query parameter
    "!    cannot be combined with any other except for &apos;serving_name&apos;.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_DEPLOYMENT_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENTS_LIST
    importing
      !I_SPACE_ID type STRING optional
      !I_SERVING_NAME type STRING optional
      !I_TAG_VALUE type STRING optional
      !I_ASSET_ID type STRING optional
      !I_NAME type STRING optional
      !I_TYPE type STRING optional
      !I_STATE type STRING optional
      !I_STATS type BOOLEAN optional
      !I_CONFLICT type BOOLEAN default c_boolean_false
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_DEPLOYMENT_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the deployment details</p>
    "!   Retrieve the deployment details with the specified identifier.<br/>
    "!
    "!
    "! @parameter I_DEPLOYMENT_ID |
    "!   The deployment id.
    "! @parameter I_SPACE_ID |
    "!   Retrieves the deployments of assets that belong to this space.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_DEPLOYMENT_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENTS_GET
    importing
      !I_DEPLOYMENT_ID type STRING
      !I_SPACE_ID type STRING
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
    "!   Retrieves the deployments of assets that belong to this space.
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENTS_DELETE
    importing
      !I_DEPLOYMENT_ID type STRING
      !I_SPACE_ID type STRING
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Update the deployment metadata</p>
    "!   Update the deployment metadata.<br/>
    "!   The following parameters of deployment metadata are supported for the patch
    "!    operation.<br/>
    "!   - `/tags` - `/name` - `/description` - `/custom` - `/hardware_spec` -
    "!    `/hybrid_pipeline_hardware_specs` - `/asset` - `/online/parameters`<br/>
    "!   In case of online deployments, using PATCH operation of `/ml/v4/deployments`,
    "!    users can update the number of copies of an online deployment.<br/>
    "!   Users can specify the desired value of number of copies in
    "!    `hardware_spec.num_nodes` parameter.<br/>
    "!   As `hardware_spec.name` or `hardware_spec.id` is mandatory for `hardware_spec`
    "!    schema, a valid value such as `XS`, `S` must be specified for
    "!    `hardware_spec.name` parameter as part of PATCH request. Alternatively, users
    "!    can also specify a valid ID of a hardware specification in `hardware_spec.id`
    "!    parameter. However, changes related to `hardware_spec.name` or
    "!    `hardware_spec.id` specified in PATCH operation will not be applied for online
    "!    deployments.<br/>
    "!   &lt;br /&gt;<br/>
    "!   In case of batch deployments, using PATCH operation of `/ml/v4/deployments`,
    "!    users can update the hardware specification so that subsequent batch deployment
    "!    jobs can make use of the updated compute configurations. To update the compute
    "!    configuration, users must specify a valid value for either `hardware_spec.name`
    "!    or `hardware_spec.id` of the hardware specification that suits their
    "!    requirement. In the batch deployment context, `hardware_spec.num_nodes`
    "!    parameter is not currently supported.<br/>
    "!   &lt;br /&gt;<br/>
    "!   When &apos;asset&apos; is patched with id/rev:<br/>
    "!   - Deployment with the patched id/rev is started. - With an asynchronous
    "!    deployment (`version` greater than [2021-05-01](#vd-2021-05-01)), 202 response
    "!    code will be returned and<br/>
    "!     one can poll the deployment for the status.<br/>
    "!   - If any failures, deployment will be reverted back to the previous id/rev<br/>
    "!     and the failure message will be captured in &apos;failures&apos; field in the
    "!    response.<br/>
    "!   <br/>
    "!   In the case of an online deployment, the PATCH operation with path specified as
    "!    `/online/parameters` can be used to update the `serving_name`.<br/>
    "!
    "!
    "! @parameter I_DEPLOYMENT_ID |
    "!   The deployment id.
    "! @parameter I_SPACE_ID |
    "!   Retrieves the deployments of assets that belong to this space.
    "! @parameter I_JSON_PATCH |
    "!   The json patch.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_DEPLOYMENT_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENTS_UPDATE
    importing
      !I_DEPLOYMENT_ID type STRING
      !I_SPACE_ID type STRING
      !I_JSON_PATCH type TT_JSON_PATCH_OPERATION
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_DEPLOYMENT_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Execute a synchronous deployment prediction</p>
    "!   Execute a synchronous prediction for the deployment with the specified
    "!    identifier.<br/>
    "!   If a `serving_name` is used then it must match the `serving_name` that is
    "!    returned in the `inference` field.<br/>
    "!
    "!
    "! @parameter I_DEPLOYMENT_ID |
    "!   The `deployment_id` can be either the `deployment_id` that identifies the
    "!    deployment or a `serving_name` that allows a predefined URL to be used to post
    "!    a prediction.
    "! @parameter I_SYNCSCORINGDATA |
    "!   The scoring data.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_SYNC_SCORING_DATA_RESULTS
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENTS_COMPUTE_PREDICT
    importing
      !I_DEPLOYMENT_ID type STRING
      !I_SYNCSCORINGDATA type T_SYNC_SCORING_DATA
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_SYNC_SCORING_DATA_RESULTS
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .

    "! <p class="shorttext synchronized" lang="en">Retrieve the deployment jobs</p>
    "!   Retrieve the status of the current jobs. The system will apply a max limit of
    "!    jobs retained by the system<br/>
    "!   as we cannot accumulate an infinite number of jobs. Only most recent 300 jobs
    "!    (system configurable)<br/>
    "!   will be preserved. Older jobs will be purged by the system.<br/>
    "!
    "!
    "! @parameter I_SPACE_ID |
    "!   Retrieves the deployment jobs that belong to this space.
    "! @parameter I_TAG_VALUE |
    "!   Retrieves only the jobs with these tags (comma separated).
    "! @parameter I_STATE |
    "!   Filter based on on the deployment job state: queued, running, completed, failed
    "!    etc.
    "! @parameter I_DEPLOYMENT_ID |
    "!   Filter based on the deployment_id.
    "! @parameter I_INCLUDE |
    "!   Retrieves only fields from `decision_optimization` and `scoring` section
    "!    mentioned as comma separated values as output response fields. Retrieves all
    "!    the fields if not mentioned.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_JOBS_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENT_JOBS_LIST
    importing
      !I_SPACE_ID type STRING
      !I_TAG_VALUE type STRING optional
      !I_STATE type STRING optional
      !I_DEPLOYMENT_ID type STRING optional
      !I_INCLUDE type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_JOBS_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Start an asynchronous deployment job</p>
    "!   Start a deployment job asynchronously. This can perform batch scoring,
    "!    streaming, or other types of batch<br/>
    "!   operations, such as solving a Decision Optimization problem.<br/>
    "!   Depending on the `version` date passed, the `platform_jobs` section in the
    "!    response may or may not be populated.<br/>
    "!   Use the GET call to retrieve the deployment job, this GET call will eventually
    "!    populate the `platform_jobs` section.<br/>
    "!   Refer to the `version date` description for more details.<br/>
    "!
    "!
    "! @parameter I_JOBENTITYREQUEST |
    "!   The request body contains information about the batch deployment job that is
    "!    described in more detail below.<br/>
    "!   <br/>
    "!   The `deployment` is a reference to the deployment associated with the deployment
    "!    job or deployment job definition.<br/>
    "!   <br/>
    "!   The `scoring` and `decision_optimization` properties are mutually exclusive.
    "!    Specify only one of these when submitting a batch deployment job, one of these
    "!    fields must be defined.<br/>
    "!   <br/>
    "!   Use `hybrid_pipeline_hardware_specs` only in a batch deployment job of a hybrid
    "!    pipeline in order to specify compute configuration for each pipeline node. For
    "!    all other cases use `hardware_spec` to specify compute configuration.<br/>
    "!   <br/>
    "!   In case of output data references where the data asset is a remote database,
    "!    users can specify if the batch deployment output must be appended to the table
    "!    or if the table is to be truncated and output data updated. The
    "!    `output_data_references.location.write_mode` parameter can be used to for this
    "!    purpose. The values `truncate` or `append` can be specified for
    "!    `output_data_references.location.write_mode` parameter.<br/>
    "!   * Specifying `truncate` as value will truncate the table and the batch output
    "!    data will be inserted.<br/>
    "!   * Specifying `append` as value will insert the batch output data to the remote
    "!    database table.<br/>
    "!   * The `write_mode` parameter is applicable only for `output_data_references`
    "!    parameter.<br/>
    "!   * The `write_mode` parameter will be applicable only for remote database related
    "!    data assets. This parameter will not be applicable for local data assets or a
    "!    COS based data asset.
    "! @parameter I_RETENTION |
    "!   Defines number of days to retain the job meta. Job meta will be auto deleted
    "!    after that. Value &apos;-1&apos; sets the meta to be never auto deleted.
    "!    accepted values are positive integer and &apos;-1&apos;. The default value if
    "!    the parameter is not passed is &apos;30&apos; days.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_JOBS_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENT_JOBS_CREATE
    importing
      !I_JOBENTITYREQUEST type T_JOB_ENTITY_REQUEST
      !I_RETENTION type STRING optional
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_JOBS_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Cancel the deployment job</p>
    "!   Cancel the specified deployment job.<br/>
    "!
    "!
    "! @parameter I_JOB_ID |
    "!   The id of the job.
    "! @parameter I_SPACE_ID |
    "!   Cancel the deployment job that belong to this space.
    "! @parameter I_HARD_DELETE |
    "!   Set to true in order to also delete the job metadata information.
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENT_JOBS_DELETE
    importing
      !I_JOB_ID type STRING
      !I_SPACE_ID type STRING
      !I_HARD_DELETE type BOOLEAN optional
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the deployment job</p>
    "!   Retrieve the deployment job. The predicted data bound to this job_id is going
    "!    to<br/>
    "!   be kept around for a limited time based on the service configuration.<br/>
    "!
    "!
    "! @parameter I_JOB_ID |
    "!   The id of the job.
    "! @parameter I_SPACE_ID |
    "!   Retrieve the deployment job that belong to this space.
    "! @parameter I_INCLUDE |
    "!   Retrieves only fields from `decision_optimization` and `scoring` section
    "!    mentioned as comma separated values as output response fields. Retrieves all
    "!    the fields if not mentioned.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_JOBS_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENT_JOBS_GET
    importing
      !I_JOB_ID type STRING
      !I_SPACE_ID type STRING
      !I_INCLUDE type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_JOBS_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .

    "! <p class="shorttext synchronized" lang="en">Create a new deployment job definition</p>
    "!   Create a new deployment job definition with the given payload. A deployment job
    "!    definition represents the deployment metadata information in order to create a
    "!    batch job in WML. This contains the same metadata used by the
    "!    /ml/v4/deployment_jobs endpoint. This means that when submitting batch
    "!    deployment jobs the user can either provide the job definition inline or
    "!    reference a job definition in a query parameter.<br/>
    "!
    "!
    "! @parameter I_JOBENTITYREQUEST |
    "!   Payload for creating the deployment job definition.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_JOB_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENT_JOB_DEF_CREATE
    importing
      !I_JOBENTITYREQUEST type T_JOB_ENTITY_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_JOB_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the deployment job definitions</p>
    "!   Retrieve the deployment job definitions for the specified space.<br/>
    "!
    "!
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource.
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
    "!   Service return value of type T_JOB_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENT_JOB_DEF_LIST
    importing
      !I_SPACE_ID type STRING
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_TAG_VALUE type STRING optional
      !I_SEARCH type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_JOB_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the deployment job definition</p>
    "!   Retrieve the deployment job definition with the specified identifier. If `rev`
    "!    query parameter is provided,<br/>
    "!   `rev=latest` will fetch the latest revision. A call with
    "!    `rev=&#123;revision_number&#125;` will fetch the given<br/>
    "!   revision_number record.<br/>
    "!
    "!
    "! @parameter I_JOB_DEFINITION_ID |
    "!   Deployment job definition identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource.
    "! @parameter I_REV |
    "!   The revision number of the resource.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_JOB_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENT_JOB_DEFINITIONS_GET
    importing
      !I_JOB_DEFINITION_ID type STRING
      !I_SPACE_ID type STRING
      !I_REV type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_JOB_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Update the deployment job definition</p>
    "!   Update the deployment job definition with the provided patch data.<br/>
    "!   The following fields can be patched:<br/>
    "!   - `/tags`<br/>
    "!   - `/name`<br/>
    "!   - `/description`<br/>
    "!   - `/custom`<br/>
    "!   - `/deployment`<br/>
    "!
    "!
    "! @parameter I_JOB_DEFINITION_ID |
    "!   Deployment job definition identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource.
    "! @parameter I_JSON_PATCH |
    "!   Input For Patch. This is the patch body which corresponds to the JavaScript
    "!    Object Notation (JSON) Patch standard (RFC 6902).
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_JOB_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENT_JOB_DEF_UPDATE
    importing
      !I_JOB_DEFINITION_ID type STRING
      !I_SPACE_ID type STRING
      !I_JSON_PATCH type TT_JSON_PATCH_OPERATION
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_JOB_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Delete the deployment job definition</p>
    "!   Delete the deployment job definition with the specified identifier. This will
    "!    delete all revisions of<br/>
    "!   this deployment job definition as well. For each revision all attachments will
    "!    also be deleted.<br/>
    "!
    "!
    "! @parameter I_JOB_DEFINITION_ID |
    "!   Deployment job definition identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource.
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENT_JOB_DEF_DELETE
    importing
      !I_JOB_DEFINITION_ID type STRING
      !I_SPACE_ID type STRING
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Create a new deployment job definition revision</p>
    "!   Create a new deployment job definition revision.<br/>
    "!   The current metadata and content for<br/>
    "!   job_definition_id will be taken and a new revision created.<br/>
    "!
    "!
    "! @parameter I_JOB_DEFINITION_ID |
    "!   Deployment job definition identifier.
    "! @parameter I_JOBREVISIONENTITYREQUEST |
    "!   No documentation available.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_JOB_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENT_JOB_DEF_CRE_REV
    importing
      !I_JOB_DEFINITION_ID type STRING
      !I_JOBREVISIONENTITYREQUEST type T_JOB_REVISION_ENTITY_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_JOB_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the deployment job definition revisions</p>
    "!   Retrieve the deployment job definition revisions.<br/>
    "!
    "!
    "! @parameter I_JOB_DEFINITION_ID |
    "!   Deployment job definition identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource.
    "! @parameter I_START |
    "!   Token required for token-based pagination. This token cannot be determined by
    "!    end user. It is generated by the service and it is set in the href available in
    "!    the `next` field.
    "! @parameter I_LIMIT |
    "!   How many resources should be returned. By default limit is 100. Max limit
    "!    allowed is 200.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_JOB_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods DEPLOYMENT_JOB_DEF_LST_REV
    importing
      !I_JOB_DEFINITION_ID type STRING
      !I_SPACE_ID type STRING
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_JOB_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .

    "! <p class="shorttext synchronized" lang="en">Create a new experiment</p>
    "!   Create a new experiment with the given payload. An experiment represents an
    "!    asset that captures a set of `pipeline` or `model definition` assets that will
    "!    be trained at the same time on the same data set.<br/>
    "!
    "!
    "! @parameter I_EXPERIMENTENTITYREQUEST |
    "!   Payload for creating the experiment. Either `space_id` or `project_id` has to be
    "!    provided and is mandatory.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_EXPERIMENT_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods EXPERIMENTS_CREATE
    importing
      !I_EXPERIMENTENTITYREQUEST type T_EXPERIMENT_ENTITY_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_EXPERIMENT_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the experiments</p>
    "!   Retrieve the experiments for the specified space or project.<br/>
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
    "!   Service return value of type T_EXPERIMENT_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods EXPERIMENTS_LIST
    importing
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_TAG_VALUE type STRING optional
      !I_SEARCH type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_EXPERIMENT_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the experiment</p>
    "!   Retrieve the experiment with the specified identifier. If `rev` query parameter
    "!    is provided,<br/>
    "!   `rev=latest` will fetch the latest revision. A call with
    "!    `rev=&#123;revision_number&#125;` will fetch the given<br/>
    "!   revision_number record. Either `space_id` or `project_id` has to be provided and
    "!    is mandatory.<br/>
    "!
    "!
    "! @parameter I_EXPERIMENT_ID |
    "!   Experiment identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_REV |
    "!   The revision number of the resource.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_EXPERIMENT_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods EXPERIMENTS_GET
    importing
      !I_EXPERIMENT_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_REV type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_EXPERIMENT_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Update the experiment</p>
    "!   Update the experiment with the provided patch data.<br/>
    "!   The following fields can be patched:<br/>
    "!   - `/tags`<br/>
    "!   - `/name`<br/>
    "!   - `/description`<br/>
    "!   - `/custom`<br/>
    "!
    "!
    "! @parameter I_EXPERIMENT_ID |
    "!   Experiment identifier.
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
    "!   Service return value of type T_EXPERIMENT_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods EXPERIMENTS_UPDATE
    importing
      !I_EXPERIMENT_ID type STRING
      !I_JSON_PATCH type TT_JSON_PATCH_OPERATION
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_EXPERIMENT_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Delete the experiment</p>
    "!   Delete the experiment with the specified identifier. This will delete all
    "!    revisions of<br/>
    "!   this experiment as well. For each revision all attachments will also be
    "!    deleted.<br/>
    "!
    "!
    "! @parameter I_EXPERIMENT_ID |
    "!   Experiment identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods EXPERIMENTS_DELETE
    importing
      !I_EXPERIMENT_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Create a new experiment revision</p>
    "!   Create a new experiment revision.<br/>
    "!   The current metadata and content for<br/>
    "!   experiment_id will be taken and a new revision created.<br/>
    "!   Either `space_id` or `project_id` has to be provided and is mandatory.<br/>
    "!
    "!
    "! @parameter I_EXPERIMENT_ID |
    "!   Experiment identifier.
    "! @parameter I_EXPRMNTRVSNNTTYRQST |
    "!   No documentation available.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_EXPERIMENT_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods EXPERIMENTS_CREATE_REVISION
    importing
      !I_EXPERIMENT_ID type STRING
      !I_EXPRMNTRVSNNTTYRQST type T_EXPERIMENT_REV_ENTITY_REQ
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_EXPERIMENT_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the experiment revisions</p>
    "!   Retrieve the experiment revisions.<br/>
    "!
    "!
    "! @parameter I_EXPERIMENT_ID |
    "!   Experiment identifier.
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
    "!   Service return value of type T_EXPERIMENT_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods EXPERIMENTS_LIST_REVISIONS
    importing
      !I_EXPERIMENT_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_EXPERIMENT_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .

    "! <p class="shorttext synchronized" lang="en">Create a new function</p>
    "!   Create a new function with the given payload. A function is some code that can
    "!    be deployed as an online, or batch deployment.<br/>
    "!
    "!
    "! @parameter I_FUNCTIONENTITYREQUEST |
    "!   Payload for creating the function. Either `space_id` or `project_id` has to be
    "!    provided and is mandatory.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_FUNCTION_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods FUNCTIONS_CREATE
    importing
      !I_FUNCTIONENTITYREQUEST type T_FUNCTION_ENTITY_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_FUNCTION_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the functions</p>
    "!   Retrieve the functions for the specified space or project.<br/>
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
    "!   Service return value of type T_FUNCTION_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods FUNCTIONS_LIST
    importing
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_TAG_VALUE type STRING optional
      !I_SEARCH type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_FUNCTION_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the function</p>
    "!   Retrieve the function with the specified identifier. If `rev` query parameter is
    "!    provided,<br/>
    "!   `rev=latest` will fetch the latest revision. A call with
    "!    `rev=&#123;revision_number&#125;` will fetch the given<br/>
    "!   revision_number record. Either `space_id` or `project_id` has to be provided and
    "!    is mandatory.<br/>
    "!
    "!
    "! @parameter I_FUNCTION_ID |
    "!   Function identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_REV |
    "!   The revision number of the resource.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_FUNCTION_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods FUNCTIONS_GET
    importing
      !I_FUNCTION_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_REV type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_FUNCTION_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Update the function</p>
    "!   Update the function with the provided patch data.<br/>
    "!   The following fields can be patched:<br/>
    "!   - `/tags`<br/>
    "!   - `/name`<br/>
    "!   - `/description`<br/>
    "!   - `/custom`<br/>
    "!
    "!
    "! @parameter I_FUNCTION_ID |
    "!   Function identifier.
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
    "!   Service return value of type T_FUNCTION_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods FUNCTIONS_UPDATE
    importing
      !I_FUNCTION_ID type STRING
      !I_JSON_PATCH type TT_JSON_PATCH_OPERATION
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_FUNCTION_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Delete the function</p>
    "!   Delete the function with the specified identifier. This will delete all
    "!    revisions of<br/>
    "!   this function as well. For each revision all attachments will also be
    "!    deleted.<br/>
    "!
    "!
    "! @parameter I_FUNCTION_ID |
    "!   Function identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods FUNCTIONS_DELETE
    importing
      !I_FUNCTION_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Create a new function revision</p>
    "!   Create a new function revision.<br/>
    "!   The current metadata and content for<br/>
    "!   function_id will be taken and a new revision created.<br/>
    "!   Either `space_id` or `project_id` has to be provided and is mandatory.<br/>
    "!
    "!
    "! @parameter I_FUNCTION_ID |
    "!   Function identifier.
    "! @parameter I_FNCTNRVSNNTTYRQST |
    "!   No documentation available.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_FUNCTION_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods FUNCTIONS_CREATE_REVISION
    importing
      !I_FUNCTION_ID type STRING
      !I_FNCTNRVSNNTTYRQST type T_FUNC_REVISION_ENTITY_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_FUNCTION_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the function revisions</p>
    "!   Retrieve the function revisions.<br/>
    "!
    "!
    "! @parameter I_FUNCTION_ID |
    "!   Function identifier.
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
    "!   Service return value of type T_FUNCTION_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods FUNCTIONS_LIST_REVISIONS
    importing
      !I_FUNCTION_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_FUNCTION_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Upload the function code</p>
    "!   Upload the function code. Functions expect a zip file that contains a python
    "!    file     that make up the function. Python functions specify what needs to be
    "!    run when     the function is deployed and what needs to be run when the scoring
    "!    function is     called. In other words, you are able to customize what
    "!    preparation WML does in     the environment when you deploy the function, as
    "!    well as what steps WML takes to     generate the output when you call the API
    "!    later on. The function consists of the     outer function (any place that is
    "!    not within the score function) and the inner     score function. The code that
    "!    sits in the outer function runs when the function     is deployed, and the
    "!    environment is then frozen and ready to be used whenever     the online scoring
    "!    or batch inline job processing API is called. The code that     sits in the
    "!    inner score function runs when the online scoring or batch inline     job
    "!    processing API is called, in the environment customized by the outer function.
    "!       See [Deploying Python
    "!    function](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/ml-d
    "!   eploy-py-function.html?context=cpdaas$&#123;content_description&#125;audience=wd
    "!   p) for more details.         This is illustrated in the example below:
    "!    &lt;pre&gt; &lt;br /&gt;     ...python code used to set up the environment...
    "!    &lt;br /&gt; &lt;br /&gt;     def score(payload): &lt;br /&gt;
    "!    df_payload = pd.DataFrame(payload[values]) &lt;br /&gt;
    "!    df_payload.columns = payload[fields] &lt;br /&gt;         ... &lt;br /&gt;
    "!       output = &#123;result : res&#125; &lt;br /&gt;         return output &lt;br
    "!    /&gt;     &lt;br /&gt;     return score &lt;br /&gt; &lt;/pre&gt;<br/>
    "!
    "!
    "! @parameter I_FUNCTION_ID |
    "!   Function identifier.
    "! @parameter I_UPLOAD_CODE |
    "!   A gzip file containing code files.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_CONTENT_METADATA
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods FUNCTIONS_UPLOAD_CODE
    importing
      !I_FUNCTION_ID type STRING
      !I_UPLOAD_CODE type FILE
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_contenttype type string default 'application/gzip'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_CONTENT_METADATA
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Download the function code</p>
    "!   Download the function code.<br/>
    "!   It is possible to get the `code` for a given<br/>
    "!   revision of the `function`.<br/>
    "!   Functions expect a zip file that contains a python file     that make up the
    "!    function. Python functions specify what needs to be run when     the function
    "!    is deployed and what needs to be run when the scoring function is     called.
    "!    In other words, you are able to customize what preparation WML does in     the
    "!    environment when you deploy the function, as well as what steps WML takes to
    "!     generate the output when you call the API later on. The function consists of
    "!    the     outer function (any place that is not within the score function) and
    "!    the inner     score function. The code that sits in the outer function runs
    "!    when the function     is deployed, and the environment is then frozen and ready
    "!    to be used whenever     the online scoring or batch inline job processing API
    "!    is called. The code that     sits in the inner score function runs when the
    "!    online scoring or batch inline job processing API is called, in the environment
    "!    customized by the outer function.     See [Deploying Python
    "!    function](https://dataplatform.cloud.ibm.com/docs/content/wsj/analyze-data/ml-d
    "!   eploy-py-function.html?context=cpdaas$&#123;content_description&#125;audience=wd
    "!   p) for more details.         This is illustrated in the example below:
    "!    &lt;pre&gt; &lt;br /&gt;     ...python code used to set up the environment...
    "!    &lt;br /&gt; &lt;br /&gt;     def score(payload): &lt;br /&gt;
    "!    df_payload = pd.DataFrame(payload[values]) &lt;br /&gt;
    "!    df_payload.columns = payload[fields] &lt;br /&gt;         ... &lt;br /&gt;
    "!       output = &#123;result : res&#125; &lt;br /&gt;         return output &lt;br
    "!    /&gt;     &lt;br /&gt;     return score &lt;br /&gt; &lt;/pre&gt;<br/>
    "!
    "!
    "! @parameter I_FUNCTION_ID |
    "!   Function identifier.
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
  methods FUNCTIONS_DOWNLOAD_CODE
    importing
      !I_FUNCTION_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_REV type STRING optional
      !I_accept      type string default 'application/zip'
    exporting
      !E_RESPONSE type FILE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .

    "! <p class="shorttext synchronized" lang="en">Retrieve the service instances</p>
    "!   Retrieve the service instances. Either `space_id` or `project_id` query
    "!    parameter is mandatory but both can be provided.
    "!
    "! @parameter I_SPACE_ID |
    "!   Return resources pertaining to any space_id listed.  Either `space_id` or
    "!    `project_id` query parameter is mandatory but both can be provided.
    "! @parameter I_PROJECT_ID |
    "!   Return resources pertaining to any project_id listed.  Either `space_id` or
    "!    `project_id` query parameter is mandatory but both can be provided.
    "! @parameter I_START |
    "!   Token required for token-based pagination. This token cannot be determined by
    "!    end user. It is generated by the service and it is set in the href available in
    "!    the `next` field.
    "! @parameter I_LIMIT |
    "!   How many resources should be returned. By default limit is 100. Max limit
    "!    allowed is 200.
    "! @parameter I_CONSUMPTION_DETAILS |
    "!   Only if `consumption_details` is set to `true` each instance
    "!    `entity.consumption.details` part is available in response.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_INSTANCE_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods INSTANCES_LIST
    importing
      !I_SPACE_ID type TT_STRING optional
      !I_PROJECT_ID type TT_STRING optional
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_CONSUMPTION_DETAILS type BOOLEAN default c_boolean_false
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_INSTANCE_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the service instance</p>
    "!   Retrieve the service instance details.<br/>
    "!
    "!
    "! @parameter I_INSTANCE_ID |
    "!   The instance identifier.
    "! @parameter I_SPACE_ID |
    "!   Defines authorization context that allows a space member to perform this
    "!    operation.
    "! @parameter I_PROJECT_ID |
    "!   Defines authorization context that allows a project member to perform this
    "!    operation.
    "! @parameter I_CONSUMPTION_DETAILS |
    "!   Only if `consumption_details` is set to `true` the instance
    "!    `entity.consumption.details` part is available in response.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_INSTANCE_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods INSTANCES_GET
    importing
      !I_INSTANCE_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_CONSUMPTION_DETAILS type BOOLEAN default c_boolean_false
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_INSTANCE_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .

    "! <p class="shorttext synchronized" lang="en">Create a new model</p>
    "!   Create a new model with the given payload. A model represents a machine learning
    "!    model asset.<br/>
    "!   If a `202` status is returned then the model will be ready when the<br/>
    "!   `content_import_state` in the model<br/>
    "!   status (/ml/v4/models/&#123;model_id&#125;) is `completed`.<br/>
    "!   If `content_import_state` is not used then a `201` status is returned.<br/>
    "!
    "!
    "! @parameter I_MODELENTITYREQUEST |
    "!   Payload for creating the model. Either `space_id` or `project_id` has to be
    "!    provided and is mandatory. A software specification is required for all model
    "!    types except curated models.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_MODEL_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods MODELS_CREATE
    importing
      !I_MODELENTITYREQUEST type T_MODEL_ENTITY_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_MODEL_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the models</p>
    "!   Retrieve the models for the specified space or project.<br/>
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
    "!   Service return value of type T_MODEL_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods MODELS_LIST
    importing
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_TAG_VALUE type STRING optional
      !I_SEARCH type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_MODEL_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the model</p>
    "!   Retrieve the model with the specified identifier. If `rev` query parameter is
    "!    provided,<br/>
    "!   `rev=latest` will fetch the latest revision. A call with
    "!    `rev=&#123;revision_number&#125;` will fetch the given<br/>
    "!   revision_number record. Either `space_id` or `project_id` has to be provided and
    "!    is mandatory.<br/>
    "!
    "!
    "! @parameter I_MODEL_ID |
    "!   Model identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_REV |
    "!   The revision number of the resource.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_MODEL_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods MODELS_GET
    importing
      !I_MODEL_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_REV type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_MODEL_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Update the model</p>
    "!   Update the model with the provided patch data.<br/>
    "!   The following fields can be patched:<br/>
    "!   - `/tags`<br/>
    "!   - `/name`<br/>
    "!   - `/description`<br/>
    "!   - `/custom`<br/>
    "!   - `/software_spec` (operation `replace` only)<br/>
    "!   - `/model_version` (operation `add` and `replace` only)<br/>
    "!
    "!
    "! @parameter I_MODEL_ID |
    "!   Model identifier.
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
    "!   Service return value of type T_MODEL_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods MODELS_UPDATE
    importing
      !I_MODEL_ID type STRING
      !I_JSON_PATCH type TT_JSON_PATCH_OPERATION
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_MODEL_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Delete the model</p>
    "!   Delete the model with the specified identifier. This will delete all revisions
    "!    of<br/>
    "!   this model as well. For each revision all attachments will also be deleted.<br/>
    "!
    "!
    "! @parameter I_MODEL_ID |
    "!   Model identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods MODELS_DELETE
    importing
      !I_MODEL_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Create a new model revision</p>
    "!   Create a new model revision.<br/>
    "!   The current metadata and content for<br/>
    "!   model_id will be taken and a new revision created.<br/>
    "!   Either `space_id` or `project_id` has to be provided and is mandatory.<br/>
    "!
    "!
    "! @parameter I_MODEL_ID |
    "!   Model identifier.
    "! @parameter I_MODELREVISIONENTITYREQUEST |
    "!   No documentation available.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_MODEL_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods MODELS_CREATE_REVISION
    importing
      !I_MODEL_ID type STRING
      !I_MODELREVISIONENTITYREQUEST type T_MODEL_REV_ENTITY_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_MODEL_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the model revisions</p>
    "!   Retrieve the model revisions.<br/>
    "!
    "!
    "! @parameter I_MODEL_ID |
    "!   Model identifier.
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
    "!   Service return value of type T_MODEL_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods MODELS_LIST_REVISIONS
    importing
      !I_MODEL_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_MODEL_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the model content metadata list</p>
    "!   Retrieve the content metadata list for the specified model attachments.<br/>
    "!
    "!
    "! @parameter I_MODEL_ID |
    "!   Model identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_REV |
    "!   The revision number of the resource.
    "! @parameter I_NAME |
    "!   List only attachments with the given name.
    "! @parameter I_CONTENT_FORMAT |
    "!   This is the format of the content. Any value can be used for the format and is
    "!    there to be able to easily find content by format.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_ALL_CONTENT_METADATA
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods MODELS_LIST_ATTACHMENTS
    importing
      !I_MODEL_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_REV type STRING optional
      !I_NAME type STRING optional
      !I_CONTENT_FORMAT type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_ALL_CONTENT_METADATA
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Upload the model content</p>
    "!   Upload the content for the specified model.<br/>
    "!
    "!
    "! @parameter I_MODEL_ID |
    "!   Model identifier.
    "! @parameter I_CONTENT_FORMAT |
    "!   This is the format of the content. Any value can be used for the format and is
    "!    there to be able to easily find content by format.
    "! @parameter I_UPLOAD_CONTENT |
    "!   models file.
    "! @parameter I_CONTENT_TYPE |
    "!   The type of the input. A character encoding can be specified by including a
    "!    `charset` parameter. For example, &apos;text/plain;charset=utf-8&apos;.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PIPELINE_NODE_ID |
    "!   Returns only resources that match this `pipeline_node_id`, this is only relevant
    "!    if `content_format` is `pipeline-node`.
    "! @parameter I_DEPLOYMENT_ID |
    "!   Returns only resources that match this `deployment_id`, this is only relevant if
    "!    `content_format` is `coreml`.
    "! @parameter I_NAME |
    "!   Provide the name of the attachment.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_CONTENT_METADATA
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods MODELS_UPLOAD_CONTENT
    importing
      !I_MODEL_ID type STRING
      !I_CONTENT_FORMAT type STRING
      !I_UPLOAD_CONTENT type JSONOBJECT
      !I_CONTENT_TYPE type STRING default 'application/json'
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_PIPELINE_NODE_ID type STRING optional
      !I_DEPLOYMENT_ID type STRING optional
      !I_NAME type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_CONTENT_METADATA
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Download the model content</p>
    "!   Download the model content.<br/>
    "!
    "!
    "! @parameter I_MODEL_ID |
    "!   Model identifier.
    "! @parameter I_ATTACHMENT_ID |
    "!   Identifier for the attachment for resources that support separate content.
    "! @parameter I_ACCEPT |
    "!   The type of the response: application/zip, application/gzip, application/json,
    "!    text/plain, or application/xml. A character encoding can be specified by
    "!    including a `charset` parameter. For example,
    "!    &apos;text/plain;charset=utf-8&apos;.
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
  methods MODELS_DOWNLOAD_CONTENT
    importing
      !I_MODEL_ID type STRING
      !I_ATTACHMENT_ID type STRING
      !I_ACCEPT type STRING optional
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_REV type STRING optional
    exporting
      !E_RESPONSE type FILE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Delete the model content</p>
    "!   Delete the content for the specified model.<br/>
    "!
    "!
    "! @parameter I_MODEL_ID |
    "!   Model identifier.
    "! @parameter I_ATTACHMENT_ID |
    "!   Identifier for the attachment for resources that support separate content.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods MODELS_DELETE_CONTENT
    importing
      !I_MODEL_ID type STRING
      !I_ATTACHMENT_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Download the model content that matches a certain criteria</p>
    "!   Download the model content identified by the provided criteria.<br/>
    "!   If more than one attachment is found for the given filter then a<br/>
    "!   `400` error is returned. If there are no attachments that match the<br/>
    "!   filter then a `404` error is returned. If there are no filters then,<br/>
    "!   if there is a single attachment, the attachment content will<br/>
    "!   be returned otherwise a `400` or `404` error will be returned as<br/>
    "!   described above.<br/>
    "!   This method is just a shortcut for getting the attachment metadata<br/>
    "!   and then downloading by attachment id.<br/>
    "!
    "!
    "! @parameter I_MODEL_ID |
    "!   Model identifier.
    "! @parameter I_ACCEPT |
    "!   The type of the response: application/zip, application/gzip, application/json,
    "!    text/plain, or application/xml. A character encoding can be specified by
    "!    including a `charset` parameter. For example,
    "!    &apos;text/plain;charset=utf-8&apos;.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_REV |
    "!   The revision number of the resource.
    "! @parameter I_PIPELINE_NODE_ID |
    "!   Returns only resources that match this `pipeline_node_id`, this is only relevant
    "!    if `content_format` is `pipeline-node`.
    "! @parameter I_DEPLOYMENT_ID |
    "!   Returns only resources that match this `deployment_id`, this is only relevant if
    "!    `content_format` is `coreml`.
    "! @parameter I_NAME |
    "!   Match an attachment with this name.
    "! @parameter I_CONTENT_FORMAT |
    "!   This is the format of the content. Any value can be used for the format and is
    "!    there to be able to easily find content by format.
    "! @parameter E_RESPONSE |
    "!   Service return value of type FILE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods MODELS_FILTERED_DOWNLOAD
    importing
      !I_MODEL_ID type STRING
      !I_ACCEPT type STRING optional
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_REV type STRING optional
      !I_PIPELINE_NODE_ID type STRING optional
      !I_DEPLOYMENT_ID type STRING optional
      !I_NAME type STRING optional
      !I_CONTENT_FORMAT type STRING optional
    exporting
      !E_RESPONSE type FILE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .

    "! <p class="shorttext synchronized" lang="en">Create a new model definition</p>
    "!   Create a new model definition with the given payload. A model definition
    "!    represents the code that is used to train one or more models.<br/>
    "!
    "!
    "! @parameter I_MODELDEFINITIONENTITYREQUEST |
    "!   Payload for creating the model definition. Either `space_id` or `project_id` has
    "!    to be provided and is mandatory.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_MODEL_DEFINITION_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods MODEL_DEFINITIONS_CREATE
    importing
      !I_MODELDEFINITIONENTITYREQUEST type T_MODEL_DEF_ENTITY_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_MODEL_DEFINITION_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the model definitions</p>
    "!   Retrieve the model definitions for the specified space or project.<br/>
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
    "!   Service return value of type T_MODEL_DEFINITION_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods MODEL_DEFINITIONS_LIST
    importing
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_TAG_VALUE type STRING optional
      !I_SEARCH type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_MODEL_DEFINITION_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the model definition</p>
    "!   Retrieve the model definition with the specified identifier. If `rev` query
    "!    parameter is provided,<br/>
    "!   `rev=latest` will fetch the latest revision. A call with
    "!    `rev=&#123;revision_number&#125;` will fetch the given<br/>
    "!   revision_number record. Either `space_id` or `project_id` has to be provided and
    "!    is mandatory.<br/>
    "!
    "!
    "! @parameter I_MODEL_DEFINITION_ID |
    "!   Model definition identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_REV |
    "!   The revision number of the resource.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_MODEL_DEFINITION_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods MODEL_DEFINITIONS_GET
    importing
      !I_MODEL_DEFINITION_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_REV type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_MODEL_DEFINITION_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Update the model definition</p>
    "!   Update the model definition with the provided patch data.<br/>
    "!   The following fields can be patched:<br/>
    "!   - `/tags`<br/>
    "!   - `/name`<br/>
    "!   - `/description`<br/>
    "!   - `/custom`<br/>
    "!
    "!
    "! @parameter I_MODEL_DEFINITION_ID |
    "!   Model definition identifier.
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
    "!   Service return value of type T_MODEL_DEFINITION_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods MODEL_DEFINITIONS_UPDATE
    importing
      !I_MODEL_DEFINITION_ID type STRING
      !I_JSON_PATCH type TT_JSON_PATCH_OPERATION
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_MODEL_DEFINITION_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Delete the model definition</p>
    "!   Delete the model definition with the specified identifier. This will delete all
    "!    revisions of<br/>
    "!   this model definition as well. For each revision all attachments will also be
    "!    deleted.<br/>
    "!
    "!
    "! @parameter I_MODEL_DEFINITION_ID |
    "!   Model definition identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods MODEL_DEFINITIONS_DELETE
    importing
      !I_MODEL_DEFINITION_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Create a new model definition revision</p>
    "!   Create a new model definition revision.<br/>
    "!   The current metadata and content for<br/>
    "!   model_definition_id will be taken and a new revision created.<br/>
    "!   Either `space_id` or `project_id` has to be provided and is mandatory.<br/>
    "!
    "!
    "! @parameter I_MODEL_DEFINITION_ID |
    "!   Model definition identifier.
    "! @parameter I_MDLDFNTNRVSNNTTYRQST |
    "!   No documentation available.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_MODEL_DEFINITION_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods MODEL_DEF_CREATE_REVISION
    importing
      !I_MODEL_DEFINITION_ID type STRING
      !I_MDLDFNTNRVSNNTTYRQST type T_MODEL_DEF_REV_ENTITY_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_MODEL_DEFINITION_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the model definition revisions</p>
    "!   Retrieve the model definition revisions.<br/>
    "!
    "!
    "! @parameter I_MODEL_DEFINITION_ID |
    "!   Model definition identifier.
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
    "!   Service return value of type T_MODEL_DEFINITION_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods MODEL_DEF_LIST_REVISIONS
    importing
      !I_MODEL_DEFINITION_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_MODEL_DEFINITION_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Upload the model definition model</p>
    "!   Upload the model definition model. Model definitions for Deep Learning accept a
    "!    zip file that contains one or more     python files organized in any directory
    "!    structure.<br/>
    "!
    "!
    "! @parameter I_MODEL_DEFINITION_ID |
    "!   Model definition identifier.
    "! @parameter I_UPLOAD_MODEL |
    "!   A gzip file containing code files.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_CONTENT_METADATA
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods MODEL_DEFINITIONS_UPLOAD_MODEL
    importing
      !I_MODEL_DEFINITION_ID type STRING
      !I_UPLOAD_MODEL type FILE
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_contenttype type string default 'application/gzip'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_CONTENT_METADATA
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Download the model definition model</p>
    "!   Download the model definition model.<br/>
    "!   It is possible to get the `model` for a given<br/>
    "!   revision of the `model definition`.<br/>
    "!   Model definitions for Deep Learning accept a zip file that contains one or more
    "!       python files organized in any directory structure.<br/>
    "!
    "!
    "! @parameter I_MODEL_DEFINITION_ID |
    "!   Model definition identifier.
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
  methods MODEL_DEF_DOWNLOAD_MODEL
    importing
      !I_MODEL_DEFINITION_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_REV type STRING optional
      !I_accept      type string default 'application/zip'
    exporting
      !E_RESPONSE type FILE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .

    "! <p class="shorttext synchronized" lang="en">Create a new pipeline</p>
    "!   Create a new pipeline with the given payload. A pipeline represents a
    "!    hybrid-pipeline, as a JSON document, that is used to train one or more
    "!    models.<br/>
    "!
    "!
    "! @parameter I_PIPELINEENTITYREQUEST |
    "!   Payload for creating the pipeline. Either `space_id` or `project_id` has to be
    "!    provided and is mandatory.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_PIPELINE_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods PIPELINES_CREATE
    importing
      !I_PIPELINEENTITYREQUEST type T_PIPELINE_ENTITY_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_PIPELINE_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the pipelines</p>
    "!   Retrieve the pipelines for the specified space or project.<br/>
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
    "!   Service return value of type T_PIPELINE_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods PIPELINES_LIST
    importing
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_TAG_VALUE type STRING optional
      !I_SEARCH type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_PIPELINE_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the pipeline</p>
    "!   Retrieve the pipeline with the specified identifier. If `rev` query parameter is
    "!    provided,<br/>
    "!   `rev=latest` will fetch the latest revision. A call with
    "!    `rev=&#123;revision_number&#125;` will fetch the given<br/>
    "!   revision_number record. Either `space_id` or `project_id` has to be provided and
    "!    is mandatory.<br/>
    "!
    "!
    "! @parameter I_PIPELINE_ID |
    "!   Pipeline identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_REV |
    "!   The revision number of the resource.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_PIPELINE_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods PIPELINES_GET
    importing
      !I_PIPELINE_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_REV type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_PIPELINE_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Update the pipeline</p>
    "!   Update the pipeline with the provided patch data.<br/>
    "!   The following fields can be patched:<br/>
    "!   - `/tags`<br/>
    "!   - `/name`<br/>
    "!   - `/description`<br/>
    "!   - `/custom`<br/>
    "!
    "!
    "! @parameter I_PIPELINE_ID |
    "!   Pipeline identifier.
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
    "!   Service return value of type T_PIPELINE_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods PIPELINES_UPDATE
    importing
      !I_PIPELINE_ID type STRING
      !I_JSON_PATCH type TT_JSON_PATCH_OPERATION
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_PIPELINE_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Delete the pipeline</p>
    "!   Delete the pipeline with the specified identifier. This will delete all
    "!    revisions of<br/>
    "!   this pipeline as well. For each revision all attachments will also be
    "!    deleted.<br/>
    "!
    "!
    "! @parameter I_PIPELINE_ID |
    "!   Pipeline identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods PIPELINES_DELETE
    importing
      !I_PIPELINE_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Create a new pipeline revision</p>
    "!   Create a new pipeline revision.<br/>
    "!   The current metadata and content for<br/>
    "!   pipeline_id will be taken and a new revision created.<br/>
    "!   Either `space_id` or `project_id` has to be provided and is mandatory.<br/>
    "!
    "!
    "! @parameter I_PIPELINE_ID |
    "!   Pipeline identifier.
    "! @parameter I_PPLNRVSNNTTYRQST |
    "!   No documentation available.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_PIPELINE_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods PIPELINES_CREATE_REVISION
    importing
      !I_PIPELINE_ID type STRING
      !I_PPLNRVSNNTTYRQST type T_PIPELINE_REV_ENTITY_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_PIPELINE_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the pipeline revisions</p>
    "!   Retrieve the pipeline revisions.<br/>
    "!
    "!
    "! @parameter I_PIPELINE_ID |
    "!   Pipeline identifier.
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
    "!   Service return value of type T_PIPELINE_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods PIPELINES_LIST_REVISIONS
    importing
      !I_PIPELINE_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_PIPELINE_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .

    "! <p class="shorttext synchronized" lang="en">Create a new remote training system</p>
    "!   Create a new remote training system with the given payload. A remote training
    "!    system represents a remote system used by Federated Learning. This definition
    "!    is necessary to control who can register to a federated learning job.<br/>
    "!
    "!
    "! @parameter I_RMTTRNNGSYSTMNTTYRQST |
    "!   Payload for creating the remote training system. Either `space_id` or
    "!    `project_id` has to be provided and is mandatory.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_REMOTE_TRAIN_SYSTEM_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods REMOTE_TRAINING_SYSTEMS_CREATE
    importing
      !I_RMTTRNNGSYSTMNTTYRQST type T_REMOTE_TRAIN_SYS_ENTITY_REQ
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_REMOTE_TRAIN_SYSTEM_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the remote training systems</p>
    "!   Retrieve the remote training systems for the specified space or project.<br/>
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
    "!   Service return value of type T_REMOTE_TRAIN_SYS_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods REMOTE_TRAINING_SYSTEMS_LIST
    importing
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_TAG_VALUE type STRING optional
      !I_SEARCH type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_REMOTE_TRAIN_SYS_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the remote training system</p>
    "!   Retrieve the remote training system with the specified identifier. If `rev`
    "!    query parameter is provided,<br/>
    "!   `rev=latest` will fetch the latest revision. A call with
    "!    `rev=&#123;revision_number&#125;` will fetch the given<br/>
    "!   revision_number record. Either `space_id` or `project_id` has to be provided and
    "!    is mandatory.<br/>
    "!
    "!
    "! @parameter I_REMOTE_TRAINING_SYSTEM_ID |
    "!   Remote training system identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_REV |
    "!   The revision number of the resource.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_REMOTE_TRAIN_SYSTEM_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods REMOTE_TRAINING_SYSTEMS_GET
    importing
      !I_REMOTE_TRAINING_SYSTEM_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_REV type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_REMOTE_TRAIN_SYSTEM_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Update the remote training system</p>
    "!   Update the remote training system with the provided patch data.<br/>
    "!   The following fields can be patched:<br/>
    "!   - `/tags`<br/>
    "!   - `/name`<br/>
    "!   - `/description`<br/>
    "!   - `/custom`<br/>
    "!   - `/organization`<br/>
    "!   - `/allowed_identities`<br/>
    "!   - `/remote_admin`<br/>
    "!
    "!
    "! @parameter I_REMOTE_TRAINING_SYSTEM_ID |
    "!   Remote training system identifier.
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
    "!   Service return value of type T_REMOTE_TRAIN_SYSTEM_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods REMOTE_TRAINING_SYSTEMS_UPDATE
    importing
      !I_REMOTE_TRAINING_SYSTEM_ID type STRING
      !I_JSON_PATCH type TT_JSON_PATCH_OPERATION
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_REMOTE_TRAIN_SYSTEM_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Delete the remote training system</p>
    "!   Delete the remote training system with the specified identifier. This will
    "!    delete all revisions of<br/>
    "!   this remote training system as well. For each revision all attachments will also
    "!    be deleted.<br/>
    "!
    "!
    "! @parameter I_REMOTE_TRAINING_SYSTEM_ID |
    "!   Remote training system identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods REMOTE_TRAINING_SYSTEMS_DELETE
    importing
      !I_REMOTE_TRAINING_SYSTEM_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Create a new remote training system revision</p>
    "!   Create a new remote training system revision.<br/>
    "!   The current metadata and content for<br/>
    "!   remote_training_system_id will be taken and a new revision created.<br/>
    "!   Either `space_id` or `project_id` has to be provided and is mandatory.<br/>
    "!
    "!
    "! @parameter I_REMOTE_TRAINING_SYSTEM_ID |
    "!   Remote training system identifier.
    "! @parameter I_RMTTRNNGSYSTMRVSNNTTYRQST |
    "!   No documentation available.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_REMOTE_TRAIN_SYSTEM_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods REMOTE_TRAIN_SYS_CRE_REVISION
    importing
      !I_REMOTE_TRAINING_SYSTEM_ID type STRING
      !I_RMTTRNNGSYSTMRVSNNTTYRQST type T_RMT_TRAIN_SYS_REV_ENTITY_REQ
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_REMOTE_TRAIN_SYSTEM_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the remote training system revisions</p>
    "!   Retrieve the remote training system revisions.<br/>
    "!
    "!
    "! @parameter I_REMOTE_TRAINING_SYSTEM_ID |
    "!   Remote training system identifier.
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
    "!   Service return value of type T_REMOTE_TRAIN_SYS_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods REMOTE_TRAIN_SYS_LST_REVISIONS
    importing
      !I_REMOTE_TRAINING_SYSTEM_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_REMOTE_TRAIN_SYS_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .

    "! <p class="shorttext synchronized" lang="en">Create a new WML training</p>
    "!   Create a new WML training.<br/>
    "!
    "!
    "! @parameter I_TRNNGRSRCNTTYRQST |
    "!   No documentation available.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_TRAINING_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TRAININGS_CREATE
    importing
      !I_TRNNGRSRCNTTYRQST type T_TRAIN_RESRC_ENTITY_REQUEST
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
    "!   How many resources should be returned. Default value is 100. Max value is 200.
    "! @parameter I_TOTAL_COUNT |
    "!   Compute the total count. May have performance impact.
    "! @parameter I_TAG_VALUE |
    "!   Return only the resources with the given tag value.
    "! @parameter I_TYPE |
    "!   Filter based on &apos;pipeline&apos; or &apos;experiment&apos; trainings.
    "!    Example: `type=pipeline`. If not provided, returns all the trainings.
    "! @parameter I_STATE |
    "!   Filter based on on the training job state: queued, running, completed, failed
    "!    etc.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PARENT_ID |
    "!   Return the training jobs that are sub-jobs of this parent_id job. The parent_id
    "!    can be the experiment job ID.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_TRAINING_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TRAININGS_LIST
    importing
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_TOTAL_COUNT type BOOLEAN optional
      !I_TAG_VALUE type STRING optional
      !I_TYPE type STRING optional
      !I_STATE type STRING optional
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_PARENT_ID type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_TRAINING_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the training</p>
    "!   Retrieve the training with the specified identifier. This call supports
    "!    Web-Socket upgrade.<br/>
    "!   However in order to preserve bandwidth, web-socket messages are not context
    "!    complete.<br/>
    "!   Meaning that a single web-socket message only reflects a message or metric
    "!    happening in the<br/>
    "!   context of a training job or sub-job (in case of experiment trainings or
    "!    HPO/AutoML trainings). Hence the metadata property of a<br/>
    "!   web-socket message contains a parent with the href information of the parent job
    "!    that triggered this particular job.<br/>
    "!   Also the metrics will be provided as they arrive from the backend runtime, and
    "!    not as a cumulative list.<br/>
    "!   In order to get the full view of the running training job the caller should do a
    "!    regular GET call.<br/>
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

    "! <p class="shorttext synchronized" lang="en">Create a new training definition</p>
    "!   Create a new training definition with the given payload. A training definition
    "!    represents the training meta-data necessary to start a training job.<br/>
    "!
    "!
    "! @parameter I_TRNNGDFNTNNTTYRQST |
    "!   Payload for creating the training definition. Either `space_id` or `project_id`
    "!    has to be provided and is mandatory.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_TRAINING_DEFINITION_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TRAINING_DEFINITIONS_CREATE
    importing
      !I_TRNNGDFNTNNTTYRQST type T_TRAIN_DEF_ENTITY_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_TRAINING_DEFINITION_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the training definitions</p>
    "!   Retrieve the training definitions for the specified space or project.<br/>
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
    "!   Service return value of type T_TRAIN_DEFINITION_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TRAINING_DEFINITIONS_LIST
    importing
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_TAG_VALUE type STRING optional
      !I_SEARCH type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_TRAIN_DEFINITION_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the training definition</p>
    "!   Retrieve the training definition with the specified identifier. If `rev` query
    "!    parameter is provided,<br/>
    "!   `rev=latest` will fetch the latest revision. A call with
    "!    `rev=&#123;revision_number&#125;` will fetch the given<br/>
    "!   revision_number record. Either `space_id` or `project_id` has to be provided and
    "!    is mandatory.<br/>
    "!
    "!
    "! @parameter I_TRAINING_DEFINITION_ID |
    "!   Training definition identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_REV |
    "!   The revision number of the resource.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_TRAINING_DEFINITION_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TRAINING_DEFINITIONS_GET
    importing
      !I_TRAINING_DEFINITION_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_REV type STRING optional
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_TRAINING_DEFINITION_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Update the training definition</p>
    "!   Update the training definition with the provided patch data.<br/>
    "!   The following fields can be patched:<br/>
    "!   - `/tags`<br/>
    "!   - `/name`<br/>
    "!   - `/description`<br/>
    "!   - `/custom`<br/>
    "!   - `/federated_learning`<br/>
    "!
    "!
    "! @parameter I_TRAINING_DEFINITION_ID |
    "!   Training definition identifier.
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
    "!   Service return value of type T_TRAINING_DEFINITION_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TRAINING_DEFINITIONS_UPDATE
    importing
      !I_TRAINING_DEFINITION_ID type STRING
      !I_JSON_PATCH type TT_JSON_PATCH_OPERATION
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_TRAINING_DEFINITION_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Delete the training definition</p>
    "!   Delete the training definition with the specified identifier. This will delete
    "!    all revisions of<br/>
    "!   this training definition as well. For each revision all attachments will also be
    "!    deleted.<br/>
    "!
    "!
    "! @parameter I_TRAINING_DEFINITION_ID |
    "!   Training definition identifier.
    "! @parameter I_SPACE_ID |
    "!   The space that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @parameter I_PROJECT_ID |
    "!   The project that contains the resource. Either `space_id` or `project_id` query
    "!    parameter has to be given.
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TRAINING_DEFINITIONS_DELETE
    importing
      !I_TRAINING_DEFINITION_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Create a new training definition revision</p>
    "!   Create a new training definition revision.<br/>
    "!   The current metadata and content for<br/>
    "!   training_definition_id will be taken and a new revision created.<br/>
    "!   Either `space_id` or `project_id` has to be provided and is mandatory.<br/>
    "!
    "!
    "! @parameter I_TRAINING_DEFINITION_ID |
    "!   Training definition identifier.
    "! @parameter I_TRNNGDFNTNRVSNNTTYRQST |
    "!   No documentation available.
    "! @parameter E_RESPONSE |
    "!   Service return value of type T_TRAINING_DEFINITION_RESOURCE
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TRAIN_DEF_CREATE_REVISION
    importing
      !I_TRAINING_DEFINITION_ID type STRING
      !I_TRNNGDFNTNRVSNNTTYRQST type T_TRAIN_DEF_REV_ENTITY_REQUEST
      !I_contenttype type string default 'application/json'
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_TRAINING_DEFINITION_RESOURCE
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Retrieve the training definition revisions</p>
    "!   Retrieve the training definition revisions.<br/>
    "!
    "!
    "! @parameter I_TRAINING_DEFINITION_ID |
    "!   Training definition identifier.
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
    "!   Service return value of type T_TRAIN_DEFINITION_RESOURCES
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
  methods TRAIN_DEF_LIST_REVISIONS
    importing
      !I_TRAINING_DEFINITION_ID type STRING
      !I_SPACE_ID type STRING optional
      !I_PROJECT_ID type STRING optional
      !I_START type STRING optional
      !I_LIMIT type INTEGER default 100
      !I_accept      type string default 'application/json'
    exporting
      !E_RESPONSE type T_TRAIN_DEFINITION_RESOURCES
    raising
      ZCX_IBMX_SERVICE_EXCEPTION .


protected section.

private section.

ENDCLASS.

class ZCL_IBMX_WML_V4 IMPLEMENTATION.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WML_V4->GET_APPNAME
* +-------------------------------------------------------------------------------------------------+
* | [<-()] E_APPNAME                      TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method GET_APPNAME.

    e_appname = 'watsonx.ai Runtime'  ##NO_TEXT.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_IBMX_WML_V4->GET_REQUEST_PROP
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
* | Instance Public Method ZCL_IBMX_WML_V4->GET_SDK_VERSION_DATE
* +-------------------------------------------------------------------------------------------------+
* | [<-()] E_SDK_VERSION_DATE             TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_sdk_version_date.

    e_sdk_version_date = '20250625'.

  endmethod.



* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WML_V4->DEPLOYMENTS_CREATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_DEPLOYMENTENTITYREQUEST        TYPE T_DEPLOYMENT_ENTITY_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_DEPLOYMENT_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DEPLOYMENTS_CREATE.

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
    lv_datatype = get_datatype( i_DEPLOYMENTENTITYREQUEST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_DEPLOYMENTENTITYREQUEST to <lv_text>.
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
          lv_bodyparam = abap_to_json( i_value = i_DEPLOYMENTENTITYREQUEST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'DeploymentEntityRequest' i_value = i_DEPLOYMENTENTITYREQUEST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_DEPLOYMENTENTITYREQUEST to <lv_text>.
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
* | Instance Public Method ZCL_IBMX_WML_V4->DEPLOYMENTS_LIST
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_SERVING_NAME        TYPE STRING (optional)
* | [--->] I_TAG_VALUE        TYPE STRING (optional)
* | [--->] I_ASSET_ID        TYPE STRING (optional)
* | [--->] I_NAME        TYPE STRING (optional)
* | [--->] I_TYPE        TYPE STRING (optional)
* | [--->] I_STATE        TYPE STRING (optional)
* | [--->] I_STATS        TYPE BOOLEAN (optional)
* | [--->] I_CONFLICT        TYPE BOOLEAN (default =c_boolean_false)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_DEPLOYMENT_RESOURCES
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DEPLOYMENTS_LIST.

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

    if i_STATS is supplied.
    lv_queryparam = i_STATS.
    add_query_parameter(
      exporting
        i_parameter  = `stats`
        i_value      = lv_queryparam
        i_is_boolean = c_boolean_true
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
* | Instance Public Method ZCL_IBMX_WML_V4->DEPLOYMENTS_GET
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_DEPLOYMENT_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING
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

    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.






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
* | Instance Public Method ZCL_IBMX_WML_V4->DEPLOYMENTS_DELETE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_DEPLOYMENT_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING
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

    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.






    " execute HTTP DELETE request
    lo_response = HTTP_DELETE( i_request_prop = ls_request_prop ).



endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WML_V4->DEPLOYMENTS_UPDATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_DEPLOYMENT_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING
* | [--->] I_JSON_PATCH        TYPE TT_JSON_PATCH_OPERATION
* | [--->] I_contenttype       TYPE string (default ='application/json')
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

    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.




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
* | Instance Public Method ZCL_IBMX_WML_V4->DEPLOYMENTS_COMPUTE_PREDICT
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_DEPLOYMENT_ID        TYPE STRING
* | [--->] I_SYNCSCORINGDATA        TYPE T_SYNC_SCORING_DATA
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_SYNC_SCORING_DATA_RESULTS
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DEPLOYMENTS_COMPUTE_PREDICT.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/deployments/{deployment_id}/predictions'.
    replace all occurrences of `{deployment_id}` in ls_request_prop-url-path with i_DEPLOYMENT_ID ignoring case.

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
    lv_datatype = get_datatype( i_SYNCSCORINGDATA ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_SYNCSCORINGDATA to <lv_text>.
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
          lv_bodyparam = abap_to_json( i_value = i_SYNCSCORINGDATA i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'SyncScoringData' i_value = i_SYNCSCORINGDATA ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_SYNCSCORINGDATA to <lv_text>.
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
* | Instance Public Method ZCL_IBMX_WML_V4->DEPLOYMENT_JOBS_LIST
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_SPACE_ID        TYPE STRING
* | [--->] I_TAG_VALUE        TYPE STRING (optional)
* | [--->] I_STATE        TYPE STRING (optional)
* | [--->] I_DEPLOYMENT_ID        TYPE STRING (optional)
* | [--->] I_INCLUDE        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_JOBS_RESOURCES
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DEPLOYMENT_JOBS_LIST.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/deployment_jobs'.

    " standard headers
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.

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

    if i_DEPLOYMENT_ID is supplied.
    lv_queryparam = escape( val = i_DEPLOYMENT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `deployment_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_INCLUDE is supplied.
    lv_queryparam = escape( val = i_INCLUDE format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `include`
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
* | Instance Public Method ZCL_IBMX_WML_V4->DEPLOYMENT_JOBS_CREATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_JOBENTITYREQUEST        TYPE T_JOB_ENTITY_REQUEST
* | [--->] I_RETENTION        TYPE STRING (optional)
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_JOBS_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DEPLOYMENT_JOBS_CREATE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/deployment_jobs'.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_RETENTION is supplied.
    lv_queryparam = escape( val = i_RETENTION format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `retention`
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
    lv_datatype = get_datatype( i_JOBENTITYREQUEST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_JOBENTITYREQUEST to <lv_text>.
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
          lv_bodyparam = abap_to_json( i_value = i_JOBENTITYREQUEST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'JobEntityRequest' i_value = i_JOBENTITYREQUEST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_JOBENTITYREQUEST to <lv_text>.
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
* | Instance Public Method ZCL_IBMX_WML_V4->DEPLOYMENT_JOBS_DELETE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_JOB_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING
* | [--->] I_HARD_DELETE        TYPE BOOLEAN (optional)
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DEPLOYMENT_JOBS_DELETE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/deployment_jobs/{job_id}'.
    replace all occurrences of `{job_id}` in ls_request_prop-url-path with i_JOB_ID ignoring case.

    " standard headers
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.

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
* | Instance Public Method ZCL_IBMX_WML_V4->DEPLOYMENT_JOBS_GET
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_JOB_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING
* | [--->] I_INCLUDE        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_JOBS_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DEPLOYMENT_JOBS_GET.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/deployment_jobs/{job_id}'.
    replace all occurrences of `{job_id}` in ls_request_prop-url-path with i_JOB_ID ignoring case.

    " standard headers
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.

    if i_INCLUDE is supplied.
    lv_queryparam = escape( val = i_INCLUDE format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `include`
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
* | Instance Public Method ZCL_IBMX_WML_V4->DEPLOYMENT_JOB_DEF_CREATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_JOBENTITYREQUEST        TYPE T_JOB_ENTITY_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_JOB_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DEPLOYMENT_JOB_DEF_CREATE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/deployment_job_definitions'.

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
    lv_datatype = get_datatype( i_JOBENTITYREQUEST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_JOBENTITYREQUEST to <lv_text>.
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
          lv_bodyparam = abap_to_json( i_value = i_JOBENTITYREQUEST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'JobEntityRequest' i_value = i_JOBENTITYREQUEST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_JOBENTITYREQUEST to <lv_text>.
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
* | Instance Public Method ZCL_IBMX_WML_V4->DEPLOYMENT_JOB_DEF_LIST
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_SPACE_ID        TYPE STRING
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_TAG_VALUE        TYPE STRING (optional)
* | [--->] I_SEARCH        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_JOB_RESOURCES
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DEPLOYMENT_JOB_DEF_LIST.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/deployment_job_definitions'.

    " standard headers
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.

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
* | Instance Public Method ZCL_IBMX_WML_V4->DEPLOYMENT_JOB_DEFINITIONS_GET
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_JOB_DEFINITION_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING
* | [--->] I_REV        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_JOB_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DEPLOYMENT_JOB_DEFINITIONS_GET.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/deployment_job_definitions/{job_definition_id}'.
    replace all occurrences of `{job_definition_id}` in ls_request_prop-url-path with i_JOB_DEFINITION_ID ignoring case.

    " standard headers
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.

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
* | Instance Public Method ZCL_IBMX_WML_V4->DEPLOYMENT_JOB_DEF_UPDATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_JOB_DEFINITION_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING
* | [--->] I_JSON_PATCH        TYPE TT_JSON_PATCH_OPERATION
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_JOB_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DEPLOYMENT_JOB_DEF_UPDATE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/deployment_job_definitions/{job_definition_id}'.
    replace all occurrences of `{job_definition_id}` in ls_request_prop-url-path with i_JOB_DEFINITION_ID ignoring case.

    " standard headers
    ls_request_prop-header_content_type = I_contenttype.
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.




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
* | Instance Public Method ZCL_IBMX_WML_V4->DEPLOYMENT_JOB_DEF_DELETE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_JOB_DEFINITION_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DEPLOYMENT_JOB_DEF_DELETE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/deployment_job_definitions/{job_definition_id}'.
    replace all occurrences of `{job_definition_id}` in ls_request_prop-url-path with i_JOB_DEFINITION_ID ignoring case.

    " standard headers
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.






    " execute HTTP DELETE request
    lo_response = HTTP_DELETE( i_request_prop = ls_request_prop ).



endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WML_V4->DEPLOYMENT_JOB_DEF_CRE_REV
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_JOB_DEFINITION_ID        TYPE STRING
* | [--->] I_JOBREVISIONENTITYREQUEST        TYPE T_JOB_REVISION_ENTITY_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_JOB_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DEPLOYMENT_JOB_DEF_CRE_REV.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/deployment_job_definitions/{job_definition_id}/revisions'.
    replace all occurrences of `{job_definition_id}` in ls_request_prop-url-path with i_JOB_DEFINITION_ID ignoring case.

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
    lv_datatype = get_datatype( i_JOBREVISIONENTITYREQUEST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_JOBREVISIONENTITYREQUEST to <lv_text>.
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
          lv_bodyparam = abap_to_json( i_value = i_JOBREVISIONENTITYREQUEST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'JobRevisionEntityRequest' i_value = i_JOBREVISIONENTITYREQUEST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_JOBREVISIONENTITYREQUEST to <lv_text>.
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
* | Instance Public Method ZCL_IBMX_WML_V4->DEPLOYMENT_JOB_DEF_LST_REV
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_JOB_DEFINITION_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_JOB_RESOURCES
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method DEPLOYMENT_JOB_DEF_LST_REV.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/deployment_job_definitions/{job_definition_id}/revisions'.
    replace all occurrences of `{job_definition_id}` in ls_request_prop-url-path with i_JOB_DEFINITION_ID ignoring case.

    " standard headers
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    lv_queryparam = escape( val = i_SPACE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.

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
* | Instance Public Method ZCL_IBMX_WML_V4->EXPERIMENTS_CREATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_EXPERIMENTENTITYREQUEST        TYPE T_EXPERIMENT_ENTITY_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_EXPERIMENT_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method EXPERIMENTS_CREATE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/experiments'.

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
    lv_datatype = get_datatype( i_EXPERIMENTENTITYREQUEST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_EXPERIMENTENTITYREQUEST to <lv_text>.
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
          lv_bodyparam = abap_to_json( i_value = i_EXPERIMENTENTITYREQUEST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'ExperimentEntityRequest' i_value = i_EXPERIMENTENTITYREQUEST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_EXPERIMENTENTITYREQUEST to <lv_text>.
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
* | Instance Public Method ZCL_IBMX_WML_V4->EXPERIMENTS_LIST
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_TAG_VALUE        TYPE STRING (optional)
* | [--->] I_SEARCH        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_EXPERIMENT_RESOURCES
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method EXPERIMENTS_LIST.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/experiments'.

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
* | Instance Public Method ZCL_IBMX_WML_V4->EXPERIMENTS_GET
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_EXPERIMENT_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_REV        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_EXPERIMENT_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method EXPERIMENTS_GET.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/experiments/{experiment_id}'.
    replace all occurrences of `{experiment_id}` in ls_request_prop-url-path with i_EXPERIMENT_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->EXPERIMENTS_UPDATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_EXPERIMENT_ID        TYPE STRING
* | [--->] I_JSON_PATCH        TYPE TT_JSON_PATCH_OPERATION
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_EXPERIMENT_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method EXPERIMENTS_UPDATE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/experiments/{experiment_id}'.
    replace all occurrences of `{experiment_id}` in ls_request_prop-url-path with i_EXPERIMENT_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->EXPERIMENTS_DELETE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_EXPERIMENT_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method EXPERIMENTS_DELETE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/experiments/{experiment_id}'.
    replace all occurrences of `{experiment_id}` in ls_request_prop-url-path with i_EXPERIMENT_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->EXPERIMENTS_CREATE_REVISION
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_EXPERIMENT_ID        TYPE STRING
* | [--->] I_EXPRMNTRVSNNTTYRQST        TYPE T_EXPERIMENT_REV_ENTITY_REQ
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_EXPERIMENT_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method EXPERIMENTS_CREATE_REVISION.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/experiments/{experiment_id}/revisions'.
    replace all occurrences of `{experiment_id}` in ls_request_prop-url-path with i_EXPERIMENT_ID ignoring case.

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
    lv_datatype = get_datatype( i_EXPRMNTRVSNNTTYRQST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_EXPRMNTRVSNNTTYRQST to <lv_text>.
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
          lv_bodyparam = abap_to_json( i_value = i_EXPRMNTRVSNNTTYRQST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'ExperimentRevisionEntityRequest' i_value = i_EXPRMNTRVSNNTTYRQST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_EXPRMNTRVSNNTTYRQST to <lv_text>.
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
* | Instance Public Method ZCL_IBMX_WML_V4->EXPERIMENTS_LIST_REVISIONS
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_EXPERIMENT_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_EXPERIMENT_RESOURCES
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method EXPERIMENTS_LIST_REVISIONS.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/experiments/{experiment_id}/revisions'.
    replace all occurrences of `{experiment_id}` in ls_request_prop-url-path with i_EXPERIMENT_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->FUNCTIONS_CREATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_FUNCTIONENTITYREQUEST        TYPE T_FUNCTION_ENTITY_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_FUNCTION_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method FUNCTIONS_CREATE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/functions'.

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
    lv_datatype = get_datatype( i_FUNCTIONENTITYREQUEST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_FUNCTIONENTITYREQUEST to <lv_text>.
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
          lv_bodyparam = abap_to_json( i_value = i_FUNCTIONENTITYREQUEST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'FunctionEntityRequest' i_value = i_FUNCTIONENTITYREQUEST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_FUNCTIONENTITYREQUEST to <lv_text>.
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
* | Instance Public Method ZCL_IBMX_WML_V4->FUNCTIONS_LIST
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_TAG_VALUE        TYPE STRING (optional)
* | [--->] I_SEARCH        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_FUNCTION_RESOURCES
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method FUNCTIONS_LIST.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/functions'.

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
* | Instance Public Method ZCL_IBMX_WML_V4->FUNCTIONS_GET
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_FUNCTION_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_REV        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_FUNCTION_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method FUNCTIONS_GET.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/functions/{function_id}'.
    replace all occurrences of `{function_id}` in ls_request_prop-url-path with i_FUNCTION_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->FUNCTIONS_UPDATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_FUNCTION_ID        TYPE STRING
* | [--->] I_JSON_PATCH        TYPE TT_JSON_PATCH_OPERATION
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_FUNCTION_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method FUNCTIONS_UPDATE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/functions/{function_id}'.
    replace all occurrences of `{function_id}` in ls_request_prop-url-path with i_FUNCTION_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->FUNCTIONS_DELETE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_FUNCTION_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method FUNCTIONS_DELETE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/functions/{function_id}'.
    replace all occurrences of `{function_id}` in ls_request_prop-url-path with i_FUNCTION_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->FUNCTIONS_CREATE_REVISION
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_FUNCTION_ID        TYPE STRING
* | [--->] I_FNCTNRVSNNTTYRQST        TYPE T_FUNC_REVISION_ENTITY_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_FUNCTION_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method FUNCTIONS_CREATE_REVISION.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/functions/{function_id}/revisions'.
    replace all occurrences of `{function_id}` in ls_request_prop-url-path with i_FUNCTION_ID ignoring case.

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
    lv_datatype = get_datatype( i_FNCTNRVSNNTTYRQST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_FNCTNRVSNNTTYRQST to <lv_text>.
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
          lv_bodyparam = abap_to_json( i_value = i_FNCTNRVSNNTTYRQST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'FunctionRevisionEntityRequest' i_value = i_FNCTNRVSNNTTYRQST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_FNCTNRVSNNTTYRQST to <lv_text>.
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
* | Instance Public Method ZCL_IBMX_WML_V4->FUNCTIONS_LIST_REVISIONS
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_FUNCTION_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_FUNCTION_RESOURCES
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method FUNCTIONS_LIST_REVISIONS.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/functions/{function_id}/revisions'.
    replace all occurrences of `{function_id}` in ls_request_prop-url-path with i_FUNCTION_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->FUNCTIONS_UPLOAD_CODE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_FUNCTION_ID        TYPE STRING
* | [--->] I_UPLOAD_CODE        TYPE FILE
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_contenttype       TYPE string (default ='application/gzip')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_CONTENT_METADATA
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method FUNCTIONS_UPLOAD_CODE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/functions/{function_id}/code'.
    replace all occurrences of `{function_id}` in ls_request_prop-url-path with i_FUNCTION_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->FUNCTIONS_DOWNLOAD_CODE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_FUNCTION_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_REV        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/zip')
* | [<---] E_RESPONSE                    TYPE        FILE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method FUNCTIONS_DOWNLOAD_CODE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/functions/{function_id}/code'.
    replace all occurrences of `{function_id}` in ls_request_prop-url-path with i_FUNCTION_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->INSTANCES_LIST
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_SPACE_ID        TYPE TT_STRING (optional)
* | [--->] I_PROJECT_ID        TYPE TT_STRING (optional)
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_CONSUMPTION_DETAILS        TYPE BOOLEAN (default =c_boolean_false)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_INSTANCE_RESOURCES
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method INSTANCES_LIST.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/instances'.

    " standard headers
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    if i_SPACE_ID is supplied.
    data:
      lv_item_SPACE_ID type STRING.
    clear: lv_queryparam, lv_sep.
    loop at i_SPACE_ID into lv_item_SPACE_ID.
      lv_queryparam = lv_queryparam && lv_sep && lv_item_SPACE_ID.
      lv_sep = ','.
    endloop.
    lv_queryparam = escape( val = lv_queryparam format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `space_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PROJECT_ID is supplied.
    data:
      lv_item_PROJECT_ID type STRING.
    clear: lv_queryparam, lv_sep.
    loop at i_PROJECT_ID into lv_item_PROJECT_ID.
      lv_queryparam = lv_queryparam && lv_sep && lv_item_PROJECT_ID.
      lv_sep = ','.
    endloop.
    lv_queryparam = escape( val = lv_queryparam format = cl_abap_format=>e_uri_full ).
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

    if i_CONSUMPTION_DETAILS is supplied.
    lv_queryparam = i_CONSUMPTION_DETAILS.
    add_query_parameter(
      exporting
        i_parameter  = `consumption_details`
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
* | Instance Public Method ZCL_IBMX_WML_V4->INSTANCES_GET
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_INSTANCE_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_CONSUMPTION_DETAILS        TYPE BOOLEAN (default =c_boolean_false)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_INSTANCE_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method INSTANCES_GET.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/instances/{instance_id}'.
    replace all occurrences of `{instance_id}` in ls_request_prop-url-path with i_INSTANCE_ID ignoring case.

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

    if i_CONSUMPTION_DETAILS is supplied.
    lv_queryparam = i_CONSUMPTION_DETAILS.
    add_query_parameter(
      exporting
        i_parameter  = `consumption_details`
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
* | Instance Public Method ZCL_IBMX_WML_V4->MODELS_CREATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_MODELENTITYREQUEST        TYPE T_MODEL_ENTITY_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_MODEL_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method MODELS_CREATE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/models'.

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
    lv_datatype = get_datatype( i_MODELENTITYREQUEST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_MODELENTITYREQUEST to <lv_text>.
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
          lv_bodyparam = abap_to_json( i_value = i_MODELENTITYREQUEST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'ModelEntityRequest' i_value = i_MODELENTITYREQUEST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_MODELENTITYREQUEST to <lv_text>.
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
* | Instance Public Method ZCL_IBMX_WML_V4->MODELS_LIST
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_TAG_VALUE        TYPE STRING (optional)
* | [--->] I_SEARCH        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_MODEL_RESOURCES
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method MODELS_LIST.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/models'.

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
* | Instance Public Method ZCL_IBMX_WML_V4->MODELS_GET
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_MODEL_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_REV        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_MODEL_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method MODELS_GET.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/models/{model_id}'.
    replace all occurrences of `{model_id}` in ls_request_prop-url-path with i_MODEL_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->MODELS_UPDATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_MODEL_ID        TYPE STRING
* | [--->] I_JSON_PATCH        TYPE TT_JSON_PATCH_OPERATION
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_MODEL_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method MODELS_UPDATE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/models/{model_id}'.
    replace all occurrences of `{model_id}` in ls_request_prop-url-path with i_MODEL_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->MODELS_DELETE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_MODEL_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method MODELS_DELETE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/models/{model_id}'.
    replace all occurrences of `{model_id}` in ls_request_prop-url-path with i_MODEL_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->MODELS_CREATE_REVISION
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_MODEL_ID        TYPE STRING
* | [--->] I_MODELREVISIONENTITYREQUEST        TYPE T_MODEL_REV_ENTITY_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_MODEL_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method MODELS_CREATE_REVISION.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/models/{model_id}/revisions'.
    replace all occurrences of `{model_id}` in ls_request_prop-url-path with i_MODEL_ID ignoring case.

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
    lv_datatype = get_datatype( i_MODELREVISIONENTITYREQUEST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_MODELREVISIONENTITYREQUEST to <lv_text>.
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
          lv_bodyparam = abap_to_json( i_value = i_MODELREVISIONENTITYREQUEST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'ModelRevisionEntityRequest' i_value = i_MODELREVISIONENTITYREQUEST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_MODELREVISIONENTITYREQUEST to <lv_text>.
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
* | Instance Public Method ZCL_IBMX_WML_V4->MODELS_LIST_REVISIONS
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_MODEL_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_MODEL_RESOURCES
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method MODELS_LIST_REVISIONS.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/models/{model_id}/revisions'.
    replace all occurrences of `{model_id}` in ls_request_prop-url-path with i_MODEL_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->MODELS_LIST_ATTACHMENTS
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_MODEL_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_REV        TYPE STRING (optional)
* | [--->] I_NAME        TYPE STRING (optional)
* | [--->] I_CONTENT_FORMAT        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_ALL_CONTENT_METADATA
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method MODELS_LIST_ATTACHMENTS.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/models/{model_id}/content'.
    replace all occurrences of `{model_id}` in ls_request_prop-url-path with i_MODEL_ID ignoring case.

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

    if i_NAME is supplied.
    lv_queryparam = escape( val = i_NAME format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `name`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_CONTENT_FORMAT is supplied.
    lv_queryparam = escape( val = i_CONTENT_FORMAT format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `content_format`
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
* | Instance Public Method ZCL_IBMX_WML_V4->MODELS_UPLOAD_CONTENT
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_MODEL_ID        TYPE STRING
* | [--->] I_CONTENT_FORMAT        TYPE STRING
* | [--->] I_UPLOAD_CONTENT        TYPE JSONOBJECT
* | [--->] I_CONTENT_TYPE        TYPE STRING (default ='application/json')
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_PIPELINE_NODE_ID        TYPE STRING (optional)
* | [--->] I_DEPLOYMENT_ID        TYPE STRING (optional)
* | [--->] I_NAME        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_CONTENT_METADATA
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method MODELS_UPLOAD_CONTENT.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/models/{model_id}/content'.
    replace all occurrences of `{model_id}` in ls_request_prop-url-path with i_MODEL_ID ignoring case.

    " standard headers
    ls_request_prop-header_accept = I_accept.
    set_default_query_parameters(
      changing
        c_url =  ls_request_prop-url ).

    " process query parameters
    data:
      lv_queryparam type string.

    lv_queryparam = escape( val = i_CONTENT_FORMAT format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `content_format`
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

    if i_PROJECT_ID is supplied.
    lv_queryparam = escape( val = i_PROJECT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `project_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PIPELINE_NODE_ID is supplied.
    lv_queryparam = escape( val = i_PIPELINE_NODE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `pipeline_node_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_DEPLOYMENT_ID is supplied.
    lv_queryparam = escape( val = i_DEPLOYMENT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `deployment_id`
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

    " process header parameters
    data:
      lv_headerparam type string  ##NEEDED.

    if i_CONTENT_TYPE is supplied.
    ls_request_prop-header_content_type = I_CONTENT_TYPE.
    endif.



    " process body parameters
    data:
      lv_body      type string,
      lv_bodyparam type string,
      lv_datatype  type char.
    field-symbols:
      <lv_text> type any.
    lv_separator = ''.
    lv_datatype = get_datatype( i_UPLOAD_CONTENT ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_UPLOAD_CONTENT to <lv_text>.
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
          lv_bodyparam = abap_to_json( i_value = i_UPLOAD_CONTENT i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'upload-content' i_value = i_UPLOAD_CONTENT ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_UPLOAD_CONTENT to <lv_text>.
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
* | Instance Public Method ZCL_IBMX_WML_V4->MODELS_DOWNLOAD_CONTENT
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_MODEL_ID        TYPE STRING
* | [--->] I_ATTACHMENT_ID        TYPE STRING
* | [--->] I_ACCEPT        TYPE STRING (optional)
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_REV        TYPE STRING (optional)
* | [<---] E_RESPONSE                    TYPE        FILE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method MODELS_DOWNLOAD_CONTENT.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/models/{model_id}/content/{attachment_id}'.
    replace all occurrences of `{model_id}` in ls_request_prop-url-path with i_MODEL_ID ignoring case.
    replace all occurrences of `{attachment_id}` in ls_request_prop-url-path with i_ATTACHMENT_ID ignoring case.

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

    if i_REV is supplied.
    lv_queryparam = escape( val = i_REV format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `rev`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    " process header parameters
    data:
      lv_headerparam type string  ##NEEDED.

    if i_ACCEPT is supplied.
    lv_headerparam = I_ACCEPT.
    add_header_parameter(
      exporting
        i_parameter  = 'Accept'
        i_value      = lv_headerparam
      changing
        c_headers    = ls_request_prop-headers )  ##NO_TEXT.
    endif.





    " execute HTTP GET request
    lo_response = HTTP_GET( i_request_prop = ls_request_prop ).


    " retrieve file data
    e_response = get_response_binary( lo_response ).

endmethod.

* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WML_V4->MODELS_DELETE_CONTENT
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_MODEL_ID        TYPE STRING
* | [--->] I_ATTACHMENT_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method MODELS_DELETE_CONTENT.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/models/{model_id}/content/{attachment_id}'.
    replace all occurrences of `{model_id}` in ls_request_prop-url-path with i_MODEL_ID ignoring case.
    replace all occurrences of `{attachment_id}` in ls_request_prop-url-path with i_ATTACHMENT_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->MODELS_FILTERED_DOWNLOAD
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_MODEL_ID        TYPE STRING
* | [--->] I_ACCEPT        TYPE STRING (optional)
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_REV        TYPE STRING (optional)
* | [--->] I_PIPELINE_NODE_ID        TYPE STRING (optional)
* | [--->] I_DEPLOYMENT_ID        TYPE STRING (optional)
* | [--->] I_NAME        TYPE STRING (optional)
* | [--->] I_CONTENT_FORMAT        TYPE STRING (optional)
* | [<---] E_RESPONSE                    TYPE        FILE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method MODELS_FILTERED_DOWNLOAD.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/models/{model_id}/download'.
    replace all occurrences of `{model_id}` in ls_request_prop-url-path with i_MODEL_ID ignoring case.

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

    if i_REV is supplied.
    lv_queryparam = escape( val = i_REV format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `rev`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_PIPELINE_NODE_ID is supplied.
    lv_queryparam = escape( val = i_PIPELINE_NODE_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `pipeline_node_id`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    if i_DEPLOYMENT_ID is supplied.
    lv_queryparam = escape( val = i_DEPLOYMENT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `deployment_id`
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

    if i_CONTENT_FORMAT is supplied.
    lv_queryparam = escape( val = i_CONTENT_FORMAT format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `content_format`
        i_value      = lv_queryparam
      changing
        c_url        = ls_request_prop-url )  ##NO_TEXT.
    endif.

    " process header parameters
    data:
      lv_headerparam type string  ##NEEDED.

    if i_ACCEPT is supplied.
    lv_headerparam = I_ACCEPT.
    add_header_parameter(
      exporting
        i_parameter  = 'Accept'
        i_value      = lv_headerparam
      changing
        c_headers    = ls_request_prop-headers )  ##NO_TEXT.
    endif.





    " execute HTTP GET request
    lo_response = HTTP_GET( i_request_prop = ls_request_prop ).


    " retrieve file data
    e_response = get_response_binary( lo_response ).

endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WML_V4->MODEL_DEFINITIONS_CREATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_MODELDEFINITIONENTITYREQUEST        TYPE T_MODEL_DEF_ENTITY_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_MODEL_DEFINITION_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method MODEL_DEFINITIONS_CREATE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/model_definitions'.

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
    lv_datatype = get_datatype( i_MODELDEFINITIONENTITYREQUEST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_MODELDEFINITIONENTITYREQUEST to <lv_text>.
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
          lv_bodyparam = abap_to_json( i_value = i_MODELDEFINITIONENTITYREQUEST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'ModelDefinitionEntityRequest' i_value = i_MODELDEFINITIONENTITYREQUEST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_MODELDEFINITIONENTITYREQUEST to <lv_text>.
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
* | Instance Public Method ZCL_IBMX_WML_V4->MODEL_DEFINITIONS_LIST
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_TAG_VALUE        TYPE STRING (optional)
* | [--->] I_SEARCH        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_MODEL_DEFINITION_RESOURCES
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method MODEL_DEFINITIONS_LIST.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/model_definitions'.

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
* | Instance Public Method ZCL_IBMX_WML_V4->MODEL_DEFINITIONS_GET
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_MODEL_DEFINITION_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_REV        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_MODEL_DEFINITION_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method MODEL_DEFINITIONS_GET.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/model_definitions/{model_definition_id}'.
    replace all occurrences of `{model_definition_id}` in ls_request_prop-url-path with i_MODEL_DEFINITION_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->MODEL_DEFINITIONS_UPDATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_MODEL_DEFINITION_ID        TYPE STRING
* | [--->] I_JSON_PATCH        TYPE TT_JSON_PATCH_OPERATION
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_MODEL_DEFINITION_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method MODEL_DEFINITIONS_UPDATE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/model_definitions/{model_definition_id}'.
    replace all occurrences of `{model_definition_id}` in ls_request_prop-url-path with i_MODEL_DEFINITION_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->MODEL_DEFINITIONS_DELETE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_MODEL_DEFINITION_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method MODEL_DEFINITIONS_DELETE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/model_definitions/{model_definition_id}'.
    replace all occurrences of `{model_definition_id}` in ls_request_prop-url-path with i_MODEL_DEFINITION_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->MODEL_DEF_CREATE_REVISION
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_MODEL_DEFINITION_ID        TYPE STRING
* | [--->] I_MDLDFNTNRVSNNTTYRQST        TYPE T_MODEL_DEF_REV_ENTITY_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_MODEL_DEFINITION_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method MODEL_DEF_CREATE_REVISION.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/model_definitions/{model_definition_id}/revisions'.
    replace all occurrences of `{model_definition_id}` in ls_request_prop-url-path with i_MODEL_DEFINITION_ID ignoring case.

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
    lv_datatype = get_datatype( i_MDLDFNTNRVSNNTTYRQST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_MDLDFNTNRVSNNTTYRQST to <lv_text>.
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
          lv_bodyparam = abap_to_json( i_value = i_MDLDFNTNRVSNNTTYRQST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'ModelDefinitionRevisionEntityRequest' i_value = i_MDLDFNTNRVSNNTTYRQST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_MDLDFNTNRVSNNTTYRQST to <lv_text>.
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
* | Instance Public Method ZCL_IBMX_WML_V4->MODEL_DEF_LIST_REVISIONS
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_MODEL_DEFINITION_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_MODEL_DEFINITION_RESOURCES
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method MODEL_DEF_LIST_REVISIONS.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/model_definitions/{model_definition_id}/revisions'.
    replace all occurrences of `{model_definition_id}` in ls_request_prop-url-path with i_MODEL_DEFINITION_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->MODEL_DEFINITIONS_UPLOAD_MODEL
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_MODEL_DEFINITION_ID        TYPE STRING
* | [--->] I_UPLOAD_MODEL        TYPE FILE
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_contenttype       TYPE string (default ='application/gzip')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_CONTENT_METADATA
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method MODEL_DEFINITIONS_UPLOAD_MODEL.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/model_definitions/{model_definition_id}/model'.
    replace all occurrences of `{model_definition_id}` in ls_request_prop-url-path with i_MODEL_DEFINITION_ID ignoring case.

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
    ls_request_prop-body_bin = i_UPLOAD_MODEL.

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
* | Instance Public Method ZCL_IBMX_WML_V4->MODEL_DEF_DOWNLOAD_MODEL
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_MODEL_DEFINITION_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_REV        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/zip')
* | [<---] E_RESPONSE                    TYPE        FILE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method MODEL_DEF_DOWNLOAD_MODEL.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/model_definitions/{model_definition_id}/model'.
    replace all occurrences of `{model_definition_id}` in ls_request_prop-url-path with i_MODEL_DEFINITION_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->PIPELINES_CREATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_PIPELINEENTITYREQUEST        TYPE T_PIPELINE_ENTITY_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_PIPELINE_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method PIPELINES_CREATE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/pipelines'.

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
    lv_datatype = get_datatype( i_PIPELINEENTITYREQUEST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_PIPELINEENTITYREQUEST to <lv_text>.
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
          lv_bodyparam = abap_to_json( i_value = i_PIPELINEENTITYREQUEST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'PipelineEntityRequest' i_value = i_PIPELINEENTITYREQUEST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_PIPELINEENTITYREQUEST to <lv_text>.
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
* | Instance Public Method ZCL_IBMX_WML_V4->PIPELINES_LIST
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_TAG_VALUE        TYPE STRING (optional)
* | [--->] I_SEARCH        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_PIPELINE_RESOURCES
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method PIPELINES_LIST.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/pipelines'.

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
* | Instance Public Method ZCL_IBMX_WML_V4->PIPELINES_GET
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_PIPELINE_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_REV        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_PIPELINE_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method PIPELINES_GET.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/pipelines/{pipeline_id}'.
    replace all occurrences of `{pipeline_id}` in ls_request_prop-url-path with i_PIPELINE_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->PIPELINES_UPDATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_PIPELINE_ID        TYPE STRING
* | [--->] I_JSON_PATCH        TYPE TT_JSON_PATCH_OPERATION
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_PIPELINE_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method PIPELINES_UPDATE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/pipelines/{pipeline_id}'.
    replace all occurrences of `{pipeline_id}` in ls_request_prop-url-path with i_PIPELINE_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->PIPELINES_DELETE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_PIPELINE_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method PIPELINES_DELETE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/pipelines/{pipeline_id}'.
    replace all occurrences of `{pipeline_id}` in ls_request_prop-url-path with i_PIPELINE_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->PIPELINES_CREATE_REVISION
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_PIPELINE_ID        TYPE STRING
* | [--->] I_PPLNRVSNNTTYRQST        TYPE T_PIPELINE_REV_ENTITY_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_PIPELINE_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method PIPELINES_CREATE_REVISION.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/pipelines/{pipeline_id}/revisions'.
    replace all occurrences of `{pipeline_id}` in ls_request_prop-url-path with i_PIPELINE_ID ignoring case.

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
    lv_datatype = get_datatype( i_PPLNRVSNNTTYRQST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_PPLNRVSNNTTYRQST to <lv_text>.
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
          lv_bodyparam = abap_to_json( i_value = i_PPLNRVSNNTTYRQST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'PipelineRevisionEntityRequest' i_value = i_PPLNRVSNNTTYRQST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_PPLNRVSNNTTYRQST to <lv_text>.
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
* | Instance Public Method ZCL_IBMX_WML_V4->PIPELINES_LIST_REVISIONS
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_PIPELINE_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_PIPELINE_RESOURCES
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method PIPELINES_LIST_REVISIONS.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/pipelines/{pipeline_id}/revisions'.
    replace all occurrences of `{pipeline_id}` in ls_request_prop-url-path with i_PIPELINE_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->REMOTE_TRAINING_SYSTEMS_CREATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_RMTTRNNGSYSTMNTTYRQST        TYPE T_REMOTE_TRAIN_SYS_ENTITY_REQ
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_REMOTE_TRAIN_SYSTEM_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method REMOTE_TRAINING_SYSTEMS_CREATE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/remote_training_systems'.

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
    lv_datatype = get_datatype( i_RMTTRNNGSYSTMNTTYRQST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_RMTTRNNGSYSTMNTTYRQST to <lv_text>.
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
          lv_bodyparam = abap_to_json( i_value = i_RMTTRNNGSYSTMNTTYRQST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'RemoteTrainingSystemEntityRequest' i_value = i_RMTTRNNGSYSTMNTTYRQST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_RMTTRNNGSYSTMNTTYRQST to <lv_text>.
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
* | Instance Public Method ZCL_IBMX_WML_V4->REMOTE_TRAINING_SYSTEMS_LIST
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_TAG_VALUE        TYPE STRING (optional)
* | [--->] I_SEARCH        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_REMOTE_TRAIN_SYS_RESOURCES
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method REMOTE_TRAINING_SYSTEMS_LIST.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/remote_training_systems'.

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
* | Instance Public Method ZCL_IBMX_WML_V4->REMOTE_TRAINING_SYSTEMS_GET
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_REMOTE_TRAINING_SYSTEM_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_REV        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_REMOTE_TRAIN_SYSTEM_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method REMOTE_TRAINING_SYSTEMS_GET.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/remote_training_systems/{remote_training_system_id}'.
    replace all occurrences of `{remote_training_system_id}` in ls_request_prop-url-path with i_REMOTE_TRAINING_SYSTEM_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->REMOTE_TRAINING_SYSTEMS_UPDATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_REMOTE_TRAINING_SYSTEM_ID        TYPE STRING
* | [--->] I_JSON_PATCH        TYPE TT_JSON_PATCH_OPERATION
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_REMOTE_TRAIN_SYSTEM_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method REMOTE_TRAINING_SYSTEMS_UPDATE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/remote_training_systems/{remote_training_system_id}'.
    replace all occurrences of `{remote_training_system_id}` in ls_request_prop-url-path with i_REMOTE_TRAINING_SYSTEM_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->REMOTE_TRAINING_SYSTEMS_DELETE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_REMOTE_TRAINING_SYSTEM_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method REMOTE_TRAINING_SYSTEMS_DELETE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/remote_training_systems/{remote_training_system_id}'.
    replace all occurrences of `{remote_training_system_id}` in ls_request_prop-url-path with i_REMOTE_TRAINING_SYSTEM_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->REMOTE_TRAIN_SYS_CRE_REVISION
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_REMOTE_TRAINING_SYSTEM_ID        TYPE STRING
* | [--->] I_RMTTRNNGSYSTMRVSNNTTYRQST        TYPE T_RMT_TRAIN_SYS_REV_ENTITY_REQ
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_REMOTE_TRAIN_SYSTEM_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method REMOTE_TRAIN_SYS_CRE_REVISION.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/remote_training_systems/{remote_training_system_id}/revisions'.
    replace all occurrences of `{remote_training_system_id}` in ls_request_prop-url-path with i_REMOTE_TRAINING_SYSTEM_ID ignoring case.

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
    lv_datatype = get_datatype( i_RMTTRNNGSYSTMRVSNNTTYRQST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_RMTTRNNGSYSTMRVSNNTTYRQST to <lv_text>.
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
          lv_bodyparam = abap_to_json( i_value = i_RMTTRNNGSYSTMRVSNNTTYRQST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'RemoteTrainingSystemRevisionEntityRequest' i_value = i_RMTTRNNGSYSTMRVSNNTTYRQST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_RMTTRNNGSYSTMRVSNNTTYRQST to <lv_text>.
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
* | Instance Public Method ZCL_IBMX_WML_V4->REMOTE_TRAIN_SYS_LST_REVISIONS
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_REMOTE_TRAINING_SYSTEM_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_REMOTE_TRAIN_SYS_RESOURCES
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method REMOTE_TRAIN_SYS_LST_REVISIONS.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/remote_training_systems/{remote_training_system_id}/revisions'.
    replace all occurrences of `{remote_training_system_id}` in ls_request_prop-url-path with i_REMOTE_TRAINING_SYSTEM_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->TRAININGS_CREATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_TRNNGRSRCNTTYRQST        TYPE T_TRAIN_RESRC_ENTITY_REQUEST
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
    lv_datatype = get_datatype( i_TRNNGRSRCNTTYRQST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_TRNNGRSRCNTTYRQST to <lv_text>.
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
          lv_bodyparam = abap_to_json( i_value = i_TRNNGRSRCNTTYRQST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'TrainingResourceEntityRequest' i_value = i_TRNNGRSRCNTTYRQST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_TRNNGRSRCNTTYRQST to <lv_text>.
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
* | Instance Public Method ZCL_IBMX_WML_V4->TRAININGS_LIST
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_TOTAL_COUNT        TYPE BOOLEAN (optional)
* | [--->] I_TAG_VALUE        TYPE STRING (optional)
* | [--->] I_TYPE        TYPE STRING (optional)
* | [--->] I_STATE        TYPE STRING (optional)
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_PARENT_ID        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_TRAINING_RESOURCES
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

    if i_PARENT_ID is supplied.
    lv_queryparam = escape( val = i_PARENT_ID format = cl_abap_format=>e_uri_full ).
    add_query_parameter(
      exporting
        i_parameter  = `parent_id`
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
* | Instance Public Method ZCL_IBMX_WML_V4->TRAININGS_GET
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
* | Instance Public Method ZCL_IBMX_WML_V4->TRAININGS_DELETE
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


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_WML_V4->TRAINING_DEFINITIONS_CREATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_TRNNGDFNTNNTTYRQST        TYPE T_TRAIN_DEF_ENTITY_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_TRAINING_DEFINITION_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method TRAINING_DEFINITIONS_CREATE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/training_definitions'.

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
    lv_datatype = get_datatype( i_TRNNGDFNTNNTTYRQST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_TRNNGDFNTNNTTYRQST to <lv_text>.
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
          lv_bodyparam = abap_to_json( i_value = i_TRNNGDFNTNNTTYRQST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'TrainingDefinitionEntityRequest' i_value = i_TRNNGDFNTNNTTYRQST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_TRNNGDFNTNNTTYRQST to <lv_text>.
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
* | Instance Public Method ZCL_IBMX_WML_V4->TRAINING_DEFINITIONS_LIST
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_TAG_VALUE        TYPE STRING (optional)
* | [--->] I_SEARCH        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_TRAIN_DEFINITION_RESOURCES
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method TRAINING_DEFINITIONS_LIST.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/training_definitions'.

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
* | Instance Public Method ZCL_IBMX_WML_V4->TRAINING_DEFINITIONS_GET
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_TRAINING_DEFINITION_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_REV        TYPE STRING (optional)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_TRAINING_DEFINITION_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method TRAINING_DEFINITIONS_GET.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/training_definitions/{training_definition_id}'.
    replace all occurrences of `{training_definition_id}` in ls_request_prop-url-path with i_TRAINING_DEFINITION_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->TRAINING_DEFINITIONS_UPDATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_TRAINING_DEFINITION_ID        TYPE STRING
* | [--->] I_JSON_PATCH        TYPE TT_JSON_PATCH_OPERATION
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_TRAINING_DEFINITION_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method TRAINING_DEFINITIONS_UPDATE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/training_definitions/{training_definition_id}'.
    replace all occurrences of `{training_definition_id}` in ls_request_prop-url-path with i_TRAINING_DEFINITION_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->TRAINING_DEFINITIONS_DELETE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_TRAINING_DEFINITION_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method TRAINING_DEFINITIONS_DELETE.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/training_definitions/{training_definition_id}'.
    replace all occurrences of `{training_definition_id}` in ls_request_prop-url-path with i_TRAINING_DEFINITION_ID ignoring case.

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
* | Instance Public Method ZCL_IBMX_WML_V4->TRAIN_DEF_CREATE_REVISION
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_TRAINING_DEFINITION_ID        TYPE STRING
* | [--->] I_TRNNGDFNTNRVSNNTTYRQST        TYPE T_TRAIN_DEF_REV_ENTITY_REQUEST
* | [--->] I_contenttype       TYPE string (default ='application/json')
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_TRAINING_DEFINITION_RESOURCE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method TRAIN_DEF_CREATE_REVISION.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/training_definitions/{training_definition_id}/revisions'.
    replace all occurrences of `{training_definition_id}` in ls_request_prop-url-path with i_TRAINING_DEFINITION_ID ignoring case.

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
    lv_datatype = get_datatype( i_TRNNGDFNTNRVSNNTTYRQST ).

    if lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-dataref or
      lv_datatype eq ZIF_IBMX_SERVICE_ARCH~c_datatype-x.
      assign i_TRNNGDFNTNRVSNNTTYRQST to <lv_text>.
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
          lv_bodyparam = abap_to_json( i_value = i_TRNNGDFNTNRVSNNTTYRQST i_dictionary = c_abapname_dictionary i_required_fields = c_required_fields ).
        else.
          lv_bodyparam = abap_to_json( i_name = 'TrainingDefinitionRevisionEntityRequest' i_value = i_TRNNGDFNTNRVSNNTTYRQST ).
        endif.
        lv_body = lv_body && lv_separator && lv_bodyparam.
      else.
        assign i_TRNNGDFNTNRVSNNTTYRQST to <lv_text>.
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
* | Instance Public Method ZCL_IBMX_WML_V4->TRAIN_DEF_LIST_REVISIONS
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_TRAINING_DEFINITION_ID        TYPE STRING
* | [--->] I_SPACE_ID        TYPE STRING (optional)
* | [--->] I_PROJECT_ID        TYPE STRING (optional)
* | [--->] I_START        TYPE STRING (optional)
* | [--->] I_LIMIT        TYPE INTEGER (default =100)
* | [--->] I_accept            TYPE string (default ='application/json')
* | [<---] E_RESPONSE                    TYPE        T_TRAIN_DEFINITION_RESOURCES
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
method TRAIN_DEF_LIST_REVISIONS.

    data:
      ls_request_prop type ts_request_prop,
      lv_separator(1) type c  ##NEEDED,
      lv_sep(1)       type c  ##NEEDED,
      lo_response     type to_rest_response,
      lv_json         type string  ##NEEDED.

    ls_request_prop-url-path = '/ml/v4/training_definitions/{training_definition_id}/revisions'.
    replace all occurrences of `{training_definition_id}` in ls_request_prop-url-path with i_TRAINING_DEFINITION_ID ignoring case.

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


ENDCLASS.
