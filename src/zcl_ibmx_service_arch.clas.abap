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
class ZCL_IBMX_SERVICE_ARCH definition
  public
  create public .

  public section.

    interfaces ZIF_IBMX_SERVICE_ARCH .

    types to_http_client type ref to if_http_client .
    types to_rest_client type ref to cl_rest_http_client .
    types to_http_entity type ref to if_http_entity .
    types to_rest_entity type ref to if_rest_entity .
    types to_rest_request type ref to if_rest_entity .
    types to_rest_response type ref to if_rest_entity .
    types to_form_part type ref to if_http_entity .
    types:
      begin of ts_client,
        http type to_http_client,
        rest type to_rest_client,
      end of ts_client .
    types ts_http_status type ZIF_IBMX_SERVICE_ARCH~ts_http_status .
    types ts_header type ZIF_IBMX_SERVICE_ARCH~ts_header .
    types tt_header type ZIF_IBMX_SERVICE_ARCH~tt_header .
    types ts_url type ZIF_IBMX_SERVICE_ARCH~ts_url .
    types ts_access_token type ZIF_IBMX_SERVICE_ARCH~ts_access_token .
    types ts_request_prop type ZIF_IBMX_SERVICE_ARCH~ts_request_prop .

    "! <p class="shorttext synchronized" lang="en">Returns a HTTP response header.</p>
    "!
    "! @parameter I_RESPONSE | HTTP/REST response
    "! @parameter I_HEADER_FIELD | Header field name
    "! @parameter E_VALUE | Header field value
    "!
    class-methods get_response_header
      importing
        !i_response     type to_rest_response
        !i_header_field type string
      returning
        value(e_value)  type string .
    "! <p class="shorttext synchronized" lang="en">Returns the user's time zone.</p>
    "!
    "! @parameter E_TIMEZONE | user's time zone
    "!
    class-methods get_timezone
      returning
        value(e_timezone) type ZIF_IBMX_SERVICE_ARCH~ty_timezone .
    "! <p class="shorttext synchronized" lang="en">Returns an ABAP module identifier.</p>
    "!
    "! @parameter E_PROGNAME | ABAP module identifier
    "!
    class-methods get_progname
      returning
        value(e_progname) type string .
    "! <p class="shorttext synchronized" lang="en">Decodes base64 encoded data to binary.</p>
    "!
    "! @parameter I_BASE64 | Base64-encoded binary
    "! @parameter E_BINARY | Binary data
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
    class-methods base64_decode
      importing
        !i_base64       type string
      returning
        value(e_binary) type xstring
      raising
        ZCX_IBMX_service_exception .
    "! <p class="shorttext synchronized" lang="en">Encodes a string to base64 format.</p>
    "!
    "! @parameter I_UNENCODED | String, unencoded
    "! @parameter E_ENCODED | Base64-encoded string
    "!
    class-methods base64_encode
      importing
        !i_unencoded type string
      returning
        value(e_encoded) type string .
    "! <p class="shorttext synchronized" lang="en">Returns a HTTP/REST client based on an URL.</p>
    "!
    "! @parameter I_URL | URL
    "! @parameter I_REQUEST_PROP | Request parameters
    "! @parameter E_CLIENT | HTTP/REST client
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
    class-methods create_client_by_url
      importing
        !i_url          type string
        !i_request_prop type ts_request_prop
      exporting
        !e_client       type ts_client
      raising
        ZCX_IBMX_service_exception .
    "! <p class="shorttext synchronized" lang="en">Returns a HTTP/REST client based on an DESTINATION.</p>
    "!
    "! @parameter I_REQUEST_PROP | Request parameters
    "! @parameter E_CLIENT | HTTP/REST client
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
    CLASS-METHODS create_client_by_destination
      IMPORTING
        !i_request_prop TYPE ts_request_prop
      EXPORTING
        !e_client       TYPE ts_client
      RAISING
        ZCX_IBMX_service_exception .
    "! <p class="shorttext synchronized" lang="en">Returns a HTTP/REST client based on COMMUNICATION SCENARIO.</p>
    "!
    "! @parameter I_REQUEST_PROP | Request parameters
    "! @parameter E_CLIENT | HTTP/REST client
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
    CLASS-METHODS create_client_by_scenario
      IMPORTING
        !i_request_prop TYPE ts_request_prop
      EXPORTING
        !e_client       TYPE ts_client
      RAISING
        ZCX_IBMX_service_exception .
    "! <p class="shorttext synchronized" lang="en">Generates a multi-part request body.</p>
    "!
    "! @parameter I_CLIENT | HTTP/REST client
    "! @parameter IT_FORM_PART | Table of form parts
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
    methods add_form_part
      importing
        !i_client     type ts_client
        !it_form_part type ZIF_IBMX_SERVICE_ARCH=>tt_form_part
      raising
        ZCX_IBMX_service_exception .
    "! <p class="shorttext synchronized" lang="en">Returns the default proxy host and port.</p>
    "!
    "! @parameter I_URL | target URL
    "! @parameter E_PROXY_HOST | Proxy host
    "! @parameter E_PROXY_PORT | Proxy port
    "!
    class-methods get_default_proxy
      importing
        !i_url        type ts_url optional
      exporting
        !e_proxy_host type string
        !e_proxy_port type string .
    "! <p class="shorttext synchronized" lang="en">Sets request header for basic authentication.</p>
    "!
    "! @parameter I_CLIENT | HTTP/REST client
    "! @parameter I_USERNAME | User name
    "! @parameter I_PASSWORD | Password
    "!
    class-methods set_authentication_basic
      importing
        !i_client   type ts_client
        !i_username type string
        !i_password type string .
    "! <p class="shorttext synchronized" lang="en">Sets a HTTP header.</p>
    "!
    "! @parameter I_CLIENT | HTTP/REST client
    "! @parameter I_NAME | Header field name
    "! @parameter I_VALUE | Header field value
    "!
    class-methods set_request_header
      importing
        !i_client type ts_client
        !i_name   type string
        !i_value  type string .
    "! <p class="shorttext synchronized" lang="en">Sets the URI for a HTTP request.</p>
    "!
    "! @parameter I_CLIENT | HTTP/REST client
    "! @parameter I_URI | URI
    "!
    class-methods set_request_uri
      importing
        !i_client type ts_client
        !i_uri    type string .
    "! <p class="shorttext synchronized" lang="en">Executes a HTTP request.</p>
    "!
    "! @parameter I_CLIENT | HTTP/REST client
    "! @parameter I_METHOD | HTTP method (GET,POST,PUT,DELETE)
    "! @parameter E_RESPONSE | Response of the request
    "! @raising ZCX_IBMX_SERVICE_EXCEPTION | Exception being raised in case of an error.
    "!
    class-methods execute
      importing
        !i_client         type ts_client
        !i_method         type ZIF_IBMX_SERVICE_ARCH~char default ZIF_IBMX_SERVICE_ARCH~c_method_get
      returning
        value(e_response) type to_rest_response
      raising
        ZCX_IBMX_service_exception .
    "! <p class="shorttext synchronized" lang="en">Reads character data from a HTTP response.</p>
    "!
    "! @parameter I_RESPONSE | HTTP response
    "! @parameter E_DATA | Character data
    "!
    class-methods get_response_string
      importing
        !i_response   type to_rest_response
      returning
        value(e_data) type string .
    "! <p class="shorttext synchronized" lang="en">Set character data for the body of a HTTP request.</p>
    "!
    "! @parameter I_CLIENT | HTTP/REST client
    "! @parameter I_DATA | Character data
    "!
    class-methods set_request_body_cdata
      importing
        !i_client type ts_client
        !i_data   type string .
    "! <p class="shorttext synchronized" lang="en">Set binary data for the body of a HTTP request.</p>
    "!
    "! @parameter I_CLIENT | HTTP/REST client
    "! @parameter I_DATA | Binary data
    "!
    class-methods set_request_body_xdata
      importing
        !i_client type ts_client
        !i_data   type xstring .
    "! <p class="shorttext synchronized" lang="en">Reads binary data from a HTTP response.</p>
    "!
    "! @parameter I_RESPONSE | HTTP response
    "! @parameter E_DATA | Binary data
    "!
    class-methods get_response_binary
      importing
        !i_response   type to_rest_response
      returning
        value(e_data) type xstring .
    "! <p class="shorttext synchronized" lang="en">Returns a request object from a HTTP client object.</p>
    "!
    "! @parameter I_CLIENT | HTTP/REST client
    "! @parameter E_REST_REQUEST | REST request object
    "!
    class-methods get_rest_request
      importing
        !i_client             type ts_client
      returning
        value(e_rest_request) type to_rest_request .
    "! <p class="shorttext synchronized" lang="en">Returns the status of a REST response.</p>
    "!
    "! @parameter I_REST_RESPONSE | HTTP/REST response
    "! @parameter E_STATUS | HTTP status
    "!
    class-methods get_http_status
      importing
        !i_rest_response type to_rest_response
      returning
        value(e_status)  type ts_http_status .
    "! <p class="shorttext synchronized" lang="en">Converts STRING data to UTF8 encoded XSTRING.</p>
    "!
    "! @parameter I_STRING | STRING data
    "! @parameter E_UTF8 | UTF8-encoded data
    "!
    class-methods convert_string_to_utf8
      importing
        !i_string     type string
      returning
        value(e_utf8) type xstring
      raising
        ZCX_IBMX_service_exception .
    "! <p class="shorttext synchronized" lang="en">Finds (and replaces) a regular expression.</p>
    "!
    "! @parameter I_REGEX | Regular expression
    "! @parameter I_WITH | Replacement (if omitted, FIND is performed)
    "! @parameter I_ALL_OCCURRENCES | 'X' if ALL OCCURRENCES OF should be used
    "! @parameter I_IGNORING_CASE | 'X', if IGNORING CASE should be used
    "! @parameter I_IN | String to be searched
    "! @parameter E_OFFSET | Returns position of occurrence
    "! @parameter C_SUBMATCH1 | 1st submatch
    "! @parameter C_SUBMATCH2 | 2nd submatch
    "! @parameter C_SUBMATCH3 | 3rd submatch
    "! @parameter C_IN | String to be searched and returned
    "! @parameter E_SUBRC | sy-subrc of FIND / REPLACE
    "!
    class-methods find_regex
      importing
        !i_regex           type string
        !i_with            type string optional
        !i_all_occurrences type ZIF_IBMX_SERVICE_ARCH=>boolean default 'X'
        !i_ignoring_case   type ZIF_IBMX_SERVICE_ARCH=>boolean optional
        !i_in              type string optional
      exporting
        !e_offset          type int4
      changing
        !c_submatch1       type string optional
        !c_submatch2       type string optional
        !c_submatch3       type string optional
        !c_in              type string optional
      returning
        value(e_subrc)     type sysubrc .
  protected section.
  private section.

    class-methods http_patch
      importing
        !i_client type ts_client .

ENDCLASS.



CLASS ZCL_IBMX_SERVICE_ARCH IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_IBMX_SERVICE_ARCH->ADD_FORM_PART
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_CLIENT                       TYPE        TS_CLIENT
* | [--->] IT_FORM_PART                   TYPE        ZIF_IBMX_SERVICE_ARCH=>TT_FORM_PART
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method add_form_part.

    data:
      ls_form_part type ZIF_IBMX_SERVICE_ARCH=>ts_form_part,
      lo_part      type to_form_part.

    loop at it_form_part into ls_form_part.
      lo_part = i_client-http->request->if_http_entity~add_multipart( ). "form_part_add( i_client = i_client ).
      if not ls_form_part-content_type is initial.
        lo_part->set_header_field( name = 'Content-Type' value = ls_form_part-content_type ) ##NO_TEXT.
        "form_part_set_header( i_form_part = lo_part i_name = 'Content-Type' i_value = ls_form_part-content_type )  ##NO_TEXT.
      endif.
      if not ls_form_part-content_disposition is initial.
        lo_part->set_header_field( name = 'Content-Disposition' value = ls_form_part-content_disposition ) ##NO_TEXT.
        "form_part_set_header( i_form_part = lo_part i_name = 'Content-Disposition' i_value = ls_form_part-content_disposition )  ##NO_TEXT.
      endif.
      if not ls_form_part-xdata is initial.
        data(lv_length) = xstrlen( ls_form_part-xdata ).
        lo_part->set_data( data = ls_form_part-xdata offset = 0 length = lv_length ).
        "form_part_set_xdata( i_form_part = lo_part i_data = ls_form_part-xdata ).
      endif.
      if not ls_form_part-cdata is initial.
        lo_part->append_cdata( data = ls_form_part-cdata ).
        "form_part_set_cdata( i_form_part = lo_part i_data = ls_form_part-cdata ).
      endif.
    endloop.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_IBMX_SERVICE_ARCH=>BASE64_DECODE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_BASE64                       TYPE        STRING
* | [<-()] E_BINARY                       TYPE        XSTRING
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method base64_decode.

    call function 'SCMS_BASE64_DECODE_STR'
      exporting
        input  = i_base64
      importing
        output = e_binary
      exceptions
        failed = 1
        others = 2.

    if sy-subrc <> 0.
      ZCL_IBMX_service=>raise_exception( i_msgno = '030' ).  " Decoding of base64 string failed
    endif.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_IBMX_SERVICE_ARCH=>BASE64_ENCODE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_UNENCODED                    TYPE        STRING
* | [<-()] E_ENCODED                      TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method base64_encode.

    e_encoded = cl_http_utility=>encode_base64(
      exporting
        unencoded = i_unencoded
    ).

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_IBMX_SERVICE_ARCH=>CONVERT_STRING_TO_UTF8
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_STRING                       TYPE        STRING
* | [<-()] E_UTF8                         TYPE        XSTRING
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method convert_string_to_utf8.

    data:
      lv_codepage type cpcodepage,
      lv_encoding type abap_encoding.

    clear e_utf8.
    call function 'SCP_CODEPAGE_BY_EXTERNAL_NAME'
      exporting
        external_name = 'UTF-8'
      importing
        sap_codepage  = lv_codepage
      exceptions
        not_found     = 1
        others        = 2.
    if sy-subrc <> 0.
      ZCL_IBMX_service=>raise_exception( i_text = 'Cannot determine UTF-8 codepage' )  ##NO_TEXT.
    endif.
    lv_encoding = lv_codepage.
    call function 'SCMS_STRING_TO_XSTRING'
      exporting
        text     = i_string
        encoding = lv_encoding
      importing
        buffer   = e_utf8
      exceptions
        failed   = 1
        others   = 2.
    if sy-subrc <> 0.
      ZCL_IBMX_service=>raise_exception( i_text = 'Cannot convert string to UTF-8' )  ##NO_TEXT.
    endif.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_IBMX_SERVICE_ARCH=>CREATE_CLIENT_BY_URL
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_URL                          TYPE        STRING
* | [--->] I_REQUEST_PROP                 TYPE        TS_REQUEST_PROP
* | [<---] E_CLIENT                       TYPE        TS_CLIENT
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method create_client_by_url.

    data:
      lv_text type string.

    cl_http_client=>create_by_url(
      exporting
        url                = i_url
        proxy_host         = i_request_prop-proxy_host       " proxy server (w/o protocol prefix)
        proxy_service      = i_request_prop-proxy_port       " proxy port
        ssl_id             = i_request_prop-ssl_id
      importing
        client             = e_client-http
      exceptions
        argument_not_found = 1
        plugin_not_active  = 2
        internal_error     = 3
        others             = 99 )  ##NUMBER_OK.
    if sy-subrc <> 0.
      case sy-subrc.
        when 1.
          lv_text = 'Argument not found'  ##NO_TEXT.
        when 2.
          lv_text = 'Plugin not active'  ##NO_TEXT.
        when others.
          lv_text = 'Internal error'  ##NO_TEXT.
      endcase.
      lv_text = `HTTP client cannot be created: ` && lv_text  ##NO_TEXT.
      ZCL_IBMX_service=>raise_exception( i_text = lv_text ).
    endif.

    " set http protocol version
    e_client-http->request->set_version( if_http_request=>co_protocol_version_1_1 ).
    e_client-http->propertytype_logon_popup = if_http_client=>co_disabled.

    " create REST client instance from http client instance
    create object e_client-rest
      exporting
        io_http_client = e_client-http.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_IBMX_SERVICE_ARCH=>CREATE_CLIENT_BY_DESTINATION
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_REQUEST_PROP                 TYPE        TS_REQUEST_PROP
* | [<---] E_CLIENT                       TYPE        TS_CLIENT
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method create_client_by_destination.

    data:
      lv_text type string.

    cl_http_client=>create_by_destination(
      exporting
        destination              = i_request_prop-destination
      importing
        client                   = e_client-http
      exceptions
        argument_not_found       = 1
        destination_not_found    = 2
        destination_no_authority = 3
        plugin_not_active        = 4
        internal_error           = 5
        others                   = 99 )  ##NUMBER_OK.
    if sy-subrc <> 0.
      case sy-subrc.
        when 1.
          lv_text = 'Argument not found'  ##NO_TEXT.
        when 2.
          lv_text = 'Destination not found'  ##NO_TEXT.
        when 3.
          lv_text = 'Destination no authority'  ##NO_TEXT.
        when 4.
          lv_text = 'Plugin not active'  ##NO_TEXT.
        when others.
          lv_text = 'Internal error'  ##NO_TEXT.
      endcase.
      lv_text = `HTTP client cannot be created: ` && lv_text  ##NO_TEXT.
      ZCL_IBMX_service=>raise_exception( i_text = lv_text ).
    endif.

    " set http protocol version
    e_client-http->request->set_version( if_http_request=>co_protocol_version_1_1 ).
    e_client-http->propertytype_logon_popup = if_http_client=>co_disabled.

    " create REST client instance from http client instance
    create object e_client-rest
      exporting
        io_http_client = e_client-http.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_IBMX_SERVICE_ARCH=>CREATE_CLIENT_BY_SCENARIO
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_REQUEST_PROP                 TYPE        TS_REQUEST_PROP
* | [<---] E_CLIENT                       TYPE        TS_CLIENT
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method create_client_by_scenario.
    data(lv_text) = `Communication scenarios not supported in this environment.`  ##NO_TEXT.
    ZCL_IBMX_SERVICE=>raise_exception( i_text = lv_text ).
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_IBMX_SERVICE_ARCH=>EXECUTE
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_CLIENT                       TYPE        TS_CLIENT
* | [--->] I_METHOD                       TYPE        ZIF_IBMX_SERVICE_ARCH~CHAR (default =ZIF_IBMX_SERVICE_ARCH~C_METHOD_GET)
* | [<-()] E_RESPONSE                     TYPE        TO_REST_RESPONSE
* | [!CX!] ZCX_IBMX_SERVICE_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method execute.

    data:
      lo_request   type to_rest_request,
      lv_method    type string,
      lv_text      type string,
      lo_exception type ref to cx_rest_client_exception.

    try.
        case i_method.
          when ZIF_IBMX_SERVICE_ARCH~c_method_get.
            lv_method = 'GET'  ##NO_TEXT.
            i_client-rest->if_rest_client~get( ).
          when ZIF_IBMX_SERVICE_ARCH~c_method_post.
            lv_method = 'POST'  ##NO_TEXT.
            lo_request = get_rest_request( i_client = i_client ).
            i_client-rest->if_rest_client~post( lo_request ).
          when ZIF_IBMX_SERVICE_ARCH~c_method_put.
            lv_method = 'PUT'  ##NO_TEXT.
            lo_request = get_rest_request( i_client = i_client ).
            i_client-rest->if_rest_client~put( lo_request ).
          when ZIF_IBMX_SERVICE_ARCH~c_method_delete.
            lv_method = 'DELETE'  ##NO_TEXT.
            i_client-rest->if_rest_client~delete( ).
          when ZIF_IBMX_SERVICE_ARCH~c_method_patch.
            lv_method = 'PATCH'  ##NO_TEXT.
            http_patch( i_client = i_client ).
          when others.
            lv_method = ZIF_IBMX_SERVICE_ARCH~c_not_supported.
        endcase.
      catch cx_rest_client_exception into lo_exception.
        lv_text = lo_exception->get_text( ).
        lv_text = `HTTP ` && lv_method && ` request failed: ` && lv_text  ##NO_TEXT.
        ZCL_IBMX_service=>raise_exception( i_text = lv_text i_previous = lo_exception ).
    endtry.

    if lv_method eq ZIF_IBMX_SERVICE_ARCH~c_not_supported.
      ZCL_IBMX_service=>raise_exception( i_text = ZIF_IBMX_SERVICE_ARCH~c_not_supported ).
    endif.

    e_response = i_client-rest->if_rest_client~get_response_entity( ).

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_IBMX_SERVICE_ARCH=>GET_DEFAULT_PROXY
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_URL                          TYPE        TS_URL(optional)
* | [<---] E_PROXY_HOST                   TYPE        STRING
* | [<---] E_PROXY_PORT                   TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_default_proxy.

    data:
      ls_proxy    type pproxy_c,
      lv_protocol type i.
    if i_url-protocol eq 'https' or i_url-protocol eq 'HTTPS'.
      lv_protocol = 2.
    else.
      lv_protocol = 1.
    endif.
    call function 'ICF_READ_PROXY_CONFIGURATION'
      exporting
        authority_check               = space
        mandant                       = sy-mandt
        protocol                      = lv_protocol
        hostname                      = i_url-host
      importing
        proxy_configuraion            = ls_proxy
      exceptions
        authority_not_available       = 1
        proxy_invalid_protocol        = 2
        proxy_entry_not_available     = 3
        proxy_entry_not_active        = 4
        proxy_parameter_not_available = 5
        proxy_not_necessary           = 6
        proxy_no_authority            = 7
        proxy_exit_erroneous          = 8
        others                        = 9.
    if sy-subrc <> 0.
    else.
      e_proxy_host = ls_proxy-host.
      e_proxy_port = ls_proxy-port.
    endif.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_IBMX_SERVICE_ARCH=>GET_HTTP_STATUS
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_REST_RESPONSE                TYPE        TO_REST_RESPONSE
* | [<-()] E_STATUS                       TYPE        TS_HTTP_STATUS
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_http_status.

    e_status-code   = i_rest_response->get_header_field( '~status_code' ).
    e_status-reason = i_rest_response->get_header_field( '~status_reason' ).
    e_status-json   = i_rest_response->get_string_data( ).

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_IBMX_SERVICE_ARCH=>GET_PROGNAME
* +-------------------------------------------------------------------------------------------------+
* | [<-()] E_PROGNAME                     TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_progname.

    e_progname = sy-cprog.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_IBMX_SERVICE_ARCH=>GET_RESPONSE_BINARY
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_RESPONSE                     TYPE        TO_REST_RESPONSE
* | [<-()] E_DATA                         TYPE        XSTRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_response_binary.

    e_data = i_response->get_binary_data( ).

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_IBMX_SERVICE_ARCH=>GET_RESPONSE_HEADER
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_RESPONSE                     TYPE        TO_REST_RESPONSE
* | [--->] I_HEADER_FIELD                 TYPE        STRING
* | [<-()] E_VALUE                        TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_response_header.

    e_value = i_response->get_header_field( iv_name = i_header_field ).

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_IBMX_SERVICE_ARCH=>GET_RESPONSE_STRING
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_RESPONSE                     TYPE        TO_REST_RESPONSE
* | [<-()] E_DATA                         TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_response_string.

    e_data = i_response->get_string_data( ).

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_IBMX_SERVICE_ARCH=>GET_REST_REQUEST
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_CLIENT                       TYPE        TS_CLIENT
* | [<-()] E_REST_REQUEST                 TYPE        TO_REST_REQUEST
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_rest_request.

    e_rest_request = i_client-rest->if_rest_client~create_request_entity( ).

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_IBMX_SERVICE_ARCH=>GET_TIMEZONE
* +-------------------------------------------------------------------------------------------------+
* | [<-()] E_TIMEZONE                     TYPE        ZIF_IBMX_SERVICE_ARCH~TY_TIMEZONE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_timezone.

    e_timezone = sy-zonlo.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Private Method ZCL_IBMX_SERVICE_ARCH=>HTTP_PATCH
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_CLIENT                       TYPE        TS_CLIENT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method http_patch.

    i_client-http->request->set_method( 'PATCH' ).

    i_client-http->send(
      exceptions
        http_communication_failure = 1
        http_invalid_state         = 2
        http_processing_failed     = 3
        http_invalid_timeout       = 4
        others                     = 5 ).

    if sy-subrc = 0.
      i_client-http->receive(
        exceptions
          http_communication_failure = 1
          http_invalid_state         = 2
          http_processing_failed     = 3
          others                     = 5 ).
    endif.

    if sy-subrc <> 0.

      data lv_textid like cx_rest_client_exception=>http_client_comm_failure.

      case sy-subrc.
        when 1.
          lv_textid = cx_rest_client_exception=>http_client_comm_failure.
        when 2.
          lv_textid = cx_rest_client_exception=>http_client_invalid_state.
        when 3.
          lv_textid = cx_rest_client_exception=>http_client_processing_failed.
        when 4.
          lv_textid = cx_rest_client_exception=>http_client_invalid_timeout.
        when 5.
          raise exception type cx_rest_client_exception.
      endcase.

      raise exception type cx_rest_client_exception exporting textid = lv_textid.

    endif.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_IBMX_SERVICE_ARCH=>SET_AUTHENTICATION_BASIC
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_CLIENT                       TYPE        TS_CLIENT
* | [--->] I_USERNAME                     TYPE        STRING
* | [--->] I_PASSWORD                     TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method set_authentication_basic.

    i_client-http->authenticate( username = i_username password = i_password ).

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_IBMX_SERVICE_ARCH=>SET_REQUEST_BODY_CDATA
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_CLIENT                       TYPE        TS_CLIENT
* | [--->] I_DATA                         TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method set_request_body_cdata.

    i_client-http->request->if_http_entity~set_cdata( data = i_data ).

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_IBMX_SERVICE_ARCH=>SET_REQUEST_BODY_XDATA
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_CLIENT                       TYPE        TS_CLIENT
* | [--->] I_DATA                         TYPE        XSTRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method set_request_body_xdata.

    i_client-http->request->if_http_entity~set_data( data = i_data ).

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_IBMX_SERVICE_ARCH=>SET_REQUEST_HEADER
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_CLIENT                       TYPE        TS_CLIENT
* | [--->] I_NAME                         TYPE        STRING
* | [--->] I_VALUE                        TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method set_request_header.

    i_client-rest->if_rest_client~set_request_header( iv_name = i_name iv_value = i_value ) .

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_IBMX_SERVICE_ARCH=>SET_REQUEST_URI
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_CLIENT                       TYPE        TS_CLIENT
* | [--->] I_URI                          TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method set_request_uri.

    cl_http_utility=>set_request_uri(
      exporting
        request = i_client-http->request
        uri     = i_uri ).

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_IBMX_SERVICE_ARCH=>FIND_REGEX
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_REGEX                        TYPE        STRING
* | [--->] I_WITH                         TYPE        STRING(optional)
* | [--->] I_ALL_OCCURRENCES              TYPE        BOOLEAN (default ='X')
* | [--->] I_IGNORING_CASE                TYPE        BOOLEAN(optional)
* | [--->] I_IN                           TYPE        STRING(optional)
* | [<---] E_OFFSET                       TYPE        INT4
* | [<-->] C_SUBMATCH1                    TYPE        STRING(optional)
* | [<-->] C_SUBMATCH2                    TYPE        STRING(optional)
* | [<-->] C_SUBMATCH3                    TYPE        STRING(optional)
* | [<-->] C_IN                           TYPE        STRING
* | [<-()] E_SUBRC                        TYPE        SYSUBRC
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method find_regex.

    data:
      l_in type string.

    if not i_with is supplied.
      " FIND
      if i_in is supplied.
        l_in = i_in.
      else.
        l_in = c_in.
      endif.
      if c_submatch3 is supplied.
        if i_ignoring_case eq 'X'.
          find regex i_regex in l_in match offset e_offset ignoring case submatches c_submatch1 c_submatch2 c_submatch3.
        else.
          find regex i_regex in l_in match offset e_offset submatches c_submatch1 c_submatch2 c_submatch3.
        endif.
      elseif c_submatch2 is supplied.
        if i_ignoring_case eq 'X'.
          find regex i_regex in l_in match offset e_offset ignoring case submatches c_submatch1 c_submatch2.
        else.
          find regex i_regex in l_in match offset e_offset submatches c_submatch1 c_submatch2.
        endif.
      elseif c_submatch1 is supplied.
        if i_ignoring_case eq 'X'.
          find regex i_regex in l_in match offset e_offset ignoring case submatches c_submatch1.
        else.
          find regex i_regex in l_in match offset e_offset submatches c_submatch1.
        endif.
      else.
        if i_ignoring_case eq 'X'.
          find regex i_regex in c_in match offset e_offset ignoring case.
        else.
          find regex i_regex in c_in match offset e_offset.
        endif.
      endif.

    else.
      " REPLACE
      e_offset = 0.
      if i_all_occurrences eq 'X'.
        if i_ignoring_case eq 'X'.
          replace all occurrences of regex i_regex in c_in with i_with ignoring case.
        else.
          replace all occurrences of regex i_regex in c_in with i_with.
        endif.
      else.
        if i_ignoring_case eq 'X'.
          replace first occurrence of regex i_regex in c_in with i_with ignoring case.
        else.
          replace first occurrence of regex i_regex in c_in with i_with.
        endif.
      endif.

    endif.

    e_subrc = sy-subrc.

  endmethod.
ENDCLASS.
