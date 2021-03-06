// Copyright (c) 2019 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.


# Type for value that can be cloned.
# This is the same as in lang.value, but is copied here to avoid a dependency.

type Cloneable readonly|xml|Cloneable[]|map<Cloneable>|table<map<Cloneable>>;

# The type to which error detail records must belong.
public type Detail record {|
   ...Cloneable;
|};

# A type parameter that is a subtype of error `Detail` record type.
# Has the special semantic that when used in a declaration
# all uses in the declaration must refer to same type.
@typeParam
type DetailType Detail;

# Returns the error's message.
#
# + e - the error value
# + return - error message
public isolated function message(error e) returns string = external;

# Returns the error's cause.
#
# + e - the error value
# + return - error cause
public isolated function cause(error e) returns error? = external;

# Returns the error's detail record.
# The returned value will be immutable.
# + e - the error value
# + return - error detail value
public isolated function detail(error<DetailType> e) returns readonly & DetailType = external;

# Returns an object representing the stack trace of the error.
#
# + e - the error value
# + return - a new object representing the stack trace of the error value
public isolated function stackTrace(error e) returns readonly & object { } = external;

# Converts an error to a string.
#
# + e - the error to be converted to a string
# + return - a string resulting from the conversion
#
# The details of the conversion are specified by the ToString abstract operation
# defined in the Ballerina Language Specification, using the direct style.
public isolated function toString(error e) returns string = external;

# Converts an error to a string that describes the value in Ballerina syntax.
# + e - the error to be converted to a string
# + return - a string resulting from the conversion
#
# The details of the conversion are specified by the ToString abstract operation
# defined in the Ballerina Language Specification, using the expression style.
public isolated function toBalString(error e) returns string = external;
