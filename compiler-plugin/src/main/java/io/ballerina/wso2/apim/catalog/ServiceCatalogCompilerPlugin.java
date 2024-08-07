/*
 * Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com) All Rights Reserved.
 *
 * WSO2 LLC. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package io.ballerina.wso2.apim.catalog;

import io.ballerina.projects.plugins.CompilerPlugin;
import io.ballerina.projects.plugins.CompilerPluginContext;
import io.ballerina.wso2.apim.catalog.codemodifier.ServiceCatalogModifier;

/**
 * Compiler plugin for WSO2 API manager service catalog client.
 *
 * @since 0.1.0
 */
public class ServiceCatalogCompilerPlugin extends CompilerPlugin {
    @Override
    public void init(CompilerPluginContext compilerPluginContext) {
        compilerPluginContext.addCodeModifier(new ServiceCatalogModifier());
    }
}
