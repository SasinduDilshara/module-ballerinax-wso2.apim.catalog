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

import ballerina/http;
import ballerinax/wso2.apim.catalog as _;
import ballerinax/wso2.apim.catalog as catalog;

@catalog:ServiceCatalogConfig {}
service /sales0 on new http:Listener(9300) {
}

@catalog:ServiceCatalogConfig {
    openApiDefinition: []
}
service /sales0 on new http:Listener(9301) {
}

@catalog:ServiceCatalogConfig {
    openApiDefinition: "ABCDEF".toBytes()
}
service /sales0 on new http:Listener(9302) {
}

