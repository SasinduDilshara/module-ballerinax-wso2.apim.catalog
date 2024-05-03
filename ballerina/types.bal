// Copyright (c) 2024, WSO2 LLC. (https://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the License for the
// specific language governing permissions and limitations
// under the License.

// AUTO-GENERATED FILE. DO NOT MODIFY.
// This file is auto-generated by the Ballerina OpenAPI tool.

import ballerina/constraint;
import ballerina/http;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    OAuth2PasswordGrantConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

# OAuth2 Password Grant Configs
public type OAuth2PasswordGrantConfig record {|
    *http:OAuth2PasswordGrantConfig;
    # Token URL
    string tokenUrl = "https://localhost:9443/oauth2/token";
|};

public type ServiceInfoList record {
    # MD5 hashes of services returned.
    int count?;
    ServiceInfo[] list?;
};

public type ServiceList record {
    Service[] list?;
    Pagination pagination?;
};

public type ErrorListItem record {
    string code;
    # Description about individual errors occurred
    string message;
    # A detail description about the error message.
    string description?;
};

public type APIInfo record {
    string id?;
    string name?;
    string context?;
    string version?;
    string provider?;
};

public type Service record {
    string id?;
    @constraint:String {maxLength: 255, minLength: 1, pattern: re `^[^\*]+$`}
    string name;
    @constraint:String {maxLength: 1024}
    string description?;
    @constraint:String {maxLength: 30, minLength: 1}
    string version;
    @constraint:String {maxLength: 512}
    string serviceKey?;
    string serviceUrl;
    # The type of the provided API definition
    "OAS2"|"OAS3"|"WSDL1"|"WSDL2"|"GRAPHQL_SDL"|"ASYNC_API" definitionType;
    # The security type of the endpoint
    "BASIC"|"DIGEST"|"OAUTH2"|"X509"|"API_KEY"|"NONE" securityType = "NONE";
    # Whether Mutual SSL is enabled for the endpoint
    boolean mutualSSLEnabled = false;
    # Number of usages of the service in APIs
    int usage?;
    string createdTime?;
    string lastUpdatedTime?;
    string md5?;
    string definitionUrl?;
};

public type Error record {
    int code;
    # Error message.
    string message;
    # A detail description about the error message.
    string description?;
    # Preferably an url with more details about the error.
    string moreInfo?;
    # If there are more than one error list them out.
    # For example, list out validation errors by each field.
    ErrorListItem[] 'error?;
};

public type Services_import_body record {
    # Zip archive consisting of exported Application Configuration.
    record {byte[] fileContent; string fileName;} file;
    string verifier?;
};

public type Verifier record {
    @constraint:String {pattern: re `^[^\*]+$`}
    string 'key;
    string md5;
};

public type ServiceInfo record {
    string id?;
    @constraint:String {pattern: re `^[^\*]+$`}
    string name?;
    string 'key?;
    string version?;
    string md5?;
};

public type Pagination record {
    int offset?;
    int 'limit?;
    int total?;
    # Link to the next subset of resources qualified.
    # Empty if no more resources are to be returned.
    string next?;
    # Link to the previous subset of resources qualified.
    # Empty if current subset is the first subset returned.
    string previous?;
};

public type ServiceSchema record {
    Service serviceMetadata;
    record {byte[] fileContent; string fileName;} definitionFile?;
    # Inline content of the document
    string inlineContent?;
};

public type APIList record {
    # Number of APIs returned.
    int count?;
    APIInfo[] list?;
};

public type ServiceListExpanded record {
    # MD5 hashes of services returned.
    int count?;
    Service[] list?;
    Pagination pagination?;
};

public type Settings record {
    string[] scopes?;
};

public annotation ServiceCatalogMetaData ServiceCatalogConfig on service;

public type ServiceCatalogMetaData record {|
    byte[] openApiDefinition = [];
|};

public type ServiceArtifact record {|
    string name;
    string description = "";
    string version = "_";
    string serviceKey;
    string serviceUrl;
    DefinitionType definitionType;
    SecurityType securityType = "BASIC";
    boolean mutualSSLEnabled = false;
    int usage = 1;
    string createdTime;
    string lastUpdatedTime;
    string md5;
    string definitionUrl;
    string definitionFileContent = "";
|};

public enum DefinitionType {
    OAS2,
    OAS3,
    WSDL1,
    WSDL2,
    GRAPHQL_SDL,
    ASYNC_API
};

public enum SecurityType {
    BASIC,
    DIGEST,
    OAUTH2,
    X509,
    API_KEY,
    NONE
};