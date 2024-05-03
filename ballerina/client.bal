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

import ballerina/http;
import ballerina/mime;

# This specifies a **RESTful API** for Service Catalog.
# 
# # Authentication
# Our REST APIs are protected using OAuth2 and access control is achieved through scopes. Before you start invoking
# the the API you need to obtain an access token with the required scopes. This guide will walk you through the steps
# that you will need to follow to obtain an access token.
# First you need to obtain the consumer key/secret key pair by calling the dynamic client registration (DCR) endpoint. You can add your preferred grant types
# in the payload. A Sample payload is shown below.
# ```
#   {
#   "callbackUrl":"www.google.lk",
#   "clientName":"rest_api_service_catalog",
#   "owner":"admin",
#   "grantType":"client_credentials password refresh_token",
#   "saasApp":true
#   }
# ```
# Create a file (payload.json) with the above sample payload, and use the cURL shown bellow to invoke the DCR endpoint. Authorization header of this should contain the
# base64 encoded admin username and password.
# **Format of the request**
# ```
#   curl -X POST -H "Authorization: Basic Base64(admin_username:admin_password)" -H "Content-Type: application/json"
#   \ -d @payload.json https://<host>:<servlet_port>/client-registration/v0.17/register
# ```
# **Sample request**
# ```
#   curl -X POST -H "Authorization: Basic YWRtaW46YWRtaW4=" -H "Content-Type: application/json"
#   \ -d @payload.json https://localhost:9443/client-registration/v0.17/register
# ```
# Following is a sample response after invoking the above curl.
# ```
# {
# "clientId": "fOCi4vNJ59PpHucC2CAYfYuADdMa",
# "clientName": "rest_api_service_catalog",
# "callBackURL": "www.google.lk",
# "clientSecret": "a4FwHlq0iCIKVs2MPIIDnepZnYMa",
# "isSaasApplication": true,
# "appOwner": "admin",
# "jsonString": "{\"grant_types\":\"client_credentials password refresh_token\",\"redirect_uris\":\"www.google.lk\",\"client_name\":\"rest_api123\"}",
# "jsonAppAttribute": "{}",
# "tokenType": null
# }
# ```
# Next you must use the above client id and secret to obtain the access token.
# We will be using the password grant type for this, you can use any grant type you desire.
# You also need to add the proper **scope** when getting the access token. All possible scopes for Service Catalog REST API can be viewed in **OAuth2 Security** section
# of this document and scope for each resource is given in **authorization** section of resource documentation.
# Following is the format of the request if you are using the password grant type.
# ```
# curl -k -d "grant_type=password&username=<admin_username>&password=<admin_passowrd>&scope=<scopes seperated by space>"
# \ -H "Authorization: Basic base64(cliet_id:client_secret)"
# \ https://<host>:<servlet_port>/oauth2/token
# ```
# **Sample request**
# ```
# curl https://localhost:9443/oauth2/token -k \
# -H "Authorization: Basic Zk9DaTR2Tko1OVBwSHVjQzJDQVlmWXVBRGRNYTphNEZ3SGxxMGlDSUtWczJNUElJRG5lcFpuWU1h" \
# -d "grant_type=password&username=admin&password=admin&scope=service_catalog:service_view service_catalog:service_write"
# ```
# Shown below is a sample response to the above request.
# ```
# {
# "access_token": "e79bda48-3406-3178-acce-f6e4dbdcbb12",
# "refresh_token": "a757795d-e69f-38b8-bd85-9aded677a97c",
# "scope": "service_catalog:service_view service_catalog:service_write",
# "token_type": "Bearer",
# "expires_in": 3600
# }
# ```
# Now you have a valid access token, which you can use to invoke an API.
# Navigate through the API descriptions to find the required API, obtain an access token as described above and invoke the API with the authentication header.
# If you use a different authentication mechanism, this process may change.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://apis.wso2.com/api/service-catalog/v1") returns error? {
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Retrieve/search services
    #
    # + name - Filter services by the name of the service
    # + version - Filter services by version of the service
    # + definitionType - Filter services by definitionType
    # + 'key - Comma seperated keys of the services to check
    # + shrink - If this set to true, a minimal set of fields will be provided for each service including the md5
    # + 'limit - Maximum limit of items to return.
    # + offset - Starting point within the complete list of items qualified.
    # + return - Paginated matched list of services returned. 
    resource isolated function get services(string? name = (), string? version = (), "OAS"|"WSDL1"|"WSDL2"|"GRAPHQL_SDL"|"ASYNC_API"? definitionType = (), string? 'key = (), boolean shrink = false, "name"|"definitionType"? sortBy = (), "asc"|"desc"? sortOrder = (), int 'limit = 25, int offset = 0) returns ServiceList|error {
        string resourcePath = string `/services`;
        map<anydata> queryParam = {"name": name, "version": version, "definitionType": definitionType, "key": 'key, "shrink": shrink, "sortBy": sortBy, "sortOrder": sortOrder, "limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ServiceList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add a new service to Service Catalog
    #
    # + return - Created. Successful response with the newly created service as the response payload 
    resource isolated function post services(ServiceSchema payload) returns Service|error {
        string resourcePath = string `/services`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        Service response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get details of a service
    #
    # + serviceId - uuid of the service
    # + return - Requested service in the service catalog is returned. 
    resource isolated function get services/[string serviceId]() returns Service|error {
        string resourcePath = string `/services/${getEncodedUri(serviceId)}`;
        Service response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a service
    #
    # + serviceId - uuid of the service
    # + return - Updated. Successful response with the newly updated service as entity in the body. 
    resource isolated function put services/[string serviceId](ServiceSchema payload) returns Service|error {
        string resourcePath = string `/services/${getEncodedUri(serviceId)}`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        Service response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a service
    #
    # + serviceId - uuid of the service
    # + return - Successfully deleted the catalog entry. 
    resource isolated function delete services/[string serviceId]() returns http:Response|error {
        string resourcePath = string `/services/${getEncodedUri(serviceId)}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Retrieve a service definition
    #
    # + serviceId - uuid of the service
    # + return - Successful response with the definition file as entity in the body. 
    resource isolated function get services/[string serviceId]/definition() returns string|error {
        string resourcePath = string `/services/${getEncodedUri(serviceId)}/definition`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the API Info that use the given service
    #
    # + serviceId - uuid of the service
    # + return - List of APIs that uses the service in the service catalog is returned. 
    resource isolated function get services/[string serviceId]/usage() returns APIList|error {
        string resourcePath = string `/services/${getEncodedUri(serviceId)}/usage`;
        APIList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Import a service
    #
    # + overwrite - Whether to overwrite if there is any existing service with the same name and version.
    # + return - Successful response with the imported service metadata. 
    resource isolated function post services/'import(Services_import_body payload, boolean overwrite = false) returns ServiceInfoList|error {
        string resourcePath = string `/services/import`;
        map<anydata> queryParam = {"overwrite": overwrite};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        ServiceInfoList response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Export a service
    #
    # + name - Name of the service to export
    # + version - Version of the service to export
    # + return - Successful response as the exported service as a zipped archive. 
    resource isolated function get services/export(string name, string version) returns byte[]|error {
        string resourcePath = string `/services/export`;
        map<anydata> queryParam = {"name": name, "version": version};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        byte[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve service catalog API settings
    #
    # + return - OK. Settings returned 
    resource isolated function get settings() returns Settings|error {
        string resourcePath = string `/settings`;
        Settings response = check self.clientEp->get(resourcePath);
        return response;
    }
}
