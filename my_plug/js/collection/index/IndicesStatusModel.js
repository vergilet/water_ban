/*
 Copyright 2013 Roy Russo

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.

 Latest Builds: https://github.com/royrusso/elasticsearch-HQ
 */

var IndicesStatusModel = Backbone.Collection.extend({
    model:IndexSimple,
    initialize:function (args) {
        console.log("Inside IndicesStatusModel");
    },
    url:function () {
        return '/_stats';
    },
    parse:function (data) {

        // indices are keyed by their id, so we need to get the key and add it to the value object foreach
        var indices = data.indices;

        var indexKeys = _.keys(indices);
        var indexValues = _.values(indices);
        for (var i = 0; i < indexKeys.length; i++) {
            indexValues[i].id = indexKeys[i];
        }
        return indexValues;
    }
});