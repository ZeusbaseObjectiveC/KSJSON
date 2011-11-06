//
//  KSJSONTests.m
//  KSJSONTests
//
//  Created by Karl Stenerud on 10/29/11.
//  Copyright (c) 2011 Karl Stenerud. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall remain in place
// in this source code.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import <SenTestingKit/SenTestingKit.h>

#import "KSJSON.h"

@interface KSJSONTests : SenTestCase {} @end

@implementation KSJSONTests

- (void)testSerializeDeserializeArrayEmpty
{
    NSError* error = (NSError*)self;
    NSString* expected = @"[]";
    id original = [NSArray array];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void) testSerializeDeserializeArrayNull
{
    NSError* error = (NSError*)self;
    NSString* expected = @"[null]";
    id original = [NSArray arrayWithObjects:
                   [NSNull null],
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void) testSerializeDeserializeArrayBoolTrue
{
    NSError* error = (NSError*)self;
    NSString* expected = @"[true]";
    id original = [NSArray arrayWithObjects:
                   [NSNumber numberWithBool:YES],
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void) testSerializeDeserializeArrayBoolFalse
{
    NSError* error = (NSError*)self;
    NSString* expected = @"[false]";
    id original = [NSArray arrayWithObjects:
                   [NSNumber numberWithBool:NO],
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void) testSerializeDeserializeArrayInteger
{
    NSError* error = (NSError*)self;
    NSString* expected = @"[1]";
    id original = [NSArray arrayWithObjects:
                   [NSNumber numberWithInt:1],
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void) testSerializeDeserializeArrayFloat
{
    NSError* error = (NSError*)self;
    NSString* expected = @"[-0.2]";
    id original = [NSArray arrayWithObjects:
                   [NSNumber numberWithFloat:-0.2f],
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEquals([[result objectAtIndex:0] floatValue], -0.2f, @"");
    // This always fails on NSNumber filled with float.
    //STAssertEqualObjects(result, original, @"");
}

- (void) testSerializeDeserializeArrayFloat2
{
    NSError* error = (NSError*)self;
    NSString* expected = @"[-2e-15]";
    id original = [NSArray arrayWithObjects:
                   [NSNumber numberWithFloat:-2e-15f],
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEquals([[result objectAtIndex:0] floatValue], -2e-15f, @"");
    // This always fails on NSNumber filled with float.
    //STAssertEqualObjects(result, original, @"");
}

- (void)testSerializeDeserializeArrayString
{
    NSError* error = (NSError*)self;
    NSString* expected = @"[\"One\"]";
    id original = [NSArray arrayWithObjects:
                   @"One",
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void)testSerializeDeserializeArrayMultipleEntries
{
    NSError* error = (NSError*)self;
    NSString* expected = @"[\"One\",1000,true]";
    id original = [NSArray arrayWithObjects:
                   @"One",
                   [NSNumber numberWithInt:1000],
                   [NSNumber numberWithBool:YES],
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void)testSerializeDeserializeArrayWithArray
{
    NSError* error = (NSError*)self;
    NSString* expected = @"[[]]";
    id original = [NSArray arrayWithObjects:
                   [NSArray array],
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void)testSerializeDeserializeArrayWithArray2
{
    NSError* error = (NSError*)self;
    NSString* expected = @"[[\"Blah\"]]";
    id original = [NSArray arrayWithObjects:
                   [NSArray arrayWithObjects:@"Blah", nil],
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void)testSerializeDeserializeArrayWithDictionary
{
    NSError* error = (NSError*)self;
    NSString* expected = @"[{}]";
    id original = [NSArray arrayWithObjects:
                   [NSDictionary dictionary],
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void)testSerializeDeserializeArrayWithDictionary2
{
    NSError* error = (NSError*)self;
    NSString* expected = @"[{\"Blah\":true}]";
    id original = [NSArray arrayWithObjects:
                   [NSDictionary dictionaryWithObjectsAndKeys:
                    [NSNumber numberWithBool:YES], @"Blah",
                    nil],
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}


- (void)testSerializeDeserializeDictionaryEmpty
{
    NSError* error = (NSError*)self;
    NSString* expected = @"{}";
    id original = [NSDictionary dictionary];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void) testSerializeDeserializeDictionaryNull
{
    NSError* error = (NSError*)self;
    NSString* expected = @"{\"One\":null}";
    id original = [NSDictionary dictionaryWithObjectsAndKeys:
                   [NSNull null], @"One",
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void) testSerializeDeserializeDictionaryBoolTrue
{
    NSError* error = (NSError*)self;
    NSString* expected = @"{\"One\":true}";
    id original = [NSDictionary dictionaryWithObjectsAndKeys:
                   [NSNumber numberWithBool:YES], @"One",
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void) testSerializeDeserializeDictionaryBoolFalse
{
    NSError* error = (NSError*)self;
    NSString* expected = @"{\"One\":false}";
    id original = [NSDictionary dictionaryWithObjectsAndKeys:
                   [NSNumber numberWithBool:NO], @"One",
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void) testSerializeDeserializeDictionaryInteger
{
    NSError* error = (NSError*)self;
    NSString* expected = @"{\"One\":1}";
    id original = [NSDictionary dictionaryWithObjectsAndKeys:
                   [NSNumber numberWithInt:1], @"One",
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void) testSerializeDeserializeDictionaryFloat
{
    NSError* error = (NSError*)self;
    NSString* expected = @"{\"One\":54.918}";
    id original = [NSDictionary dictionaryWithObjectsAndKeys:
                   [NSNumber numberWithFloat:54.918f], @"One",
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEquals([[result objectForKey:@"One"] floatValue], 54.918f, @"");
    // This always fails on NSNumber filled with float.
    //STAssertEqualObjects(result, original, @"");
}

- (void) testSerializeDeserializeDictionaryFloat2
{
    NSError* error = (NSError*)self;
    NSString* expected = @"{\"One\":5e+20}";
    id original = [NSDictionary dictionaryWithObjectsAndKeys:
                   [NSNumber numberWithFloat:5e20f], @"One",
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEquals([[result objectForKey:@"One"] floatValue], 5e20f, @"");
    // This always fails on NSNumber filled with float.
    //STAssertEqualObjects(result, original, @"");
}

- (void)testSerializeDeserializeDictionaryString
{
    NSError* error = (NSError*)self;
    NSString* expected = @"{\"One\":\"Value\"}";
    id original = [NSDictionary dictionaryWithObjectsAndKeys:
                   @"Value", @"One",
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void)testSerializeDeserializeDictionaryMultipleEntries
{
    NSError* error = (NSError*)self;
    NSString* expected = @"{\"One\":\"Value\",\"Two\":1000,\"Three\":true}";
    id original = [NSDictionary dictionaryWithObjectsAndKeys:
                   @"Value", @"One",
                   [NSNumber numberWithInt:1000], @"Two",
                   [NSNumber numberWithBool:YES], @"Three",
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void)testSerializeDeserializeDictionaryWithDictionary
{
    NSError* error = (NSError*)self;
    NSString* expected = @"{\"One\":{}}";
    id original = [NSDictionary dictionaryWithObjectsAndKeys:
                   [NSDictionary dictionary], @"One",
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void)testSerializeDeserializeDictionaryWithDictionary2
{
    NSError* error = (NSError*)self;
    NSString* expected = @"{\"One\":{\"Blah\":1}}";
    id original = [NSDictionary dictionaryWithObjectsAndKeys:
                   [NSDictionary dictionaryWithObjectsAndKeys:
                    [NSNumber numberWithInt:1], @"Blah",
                    nil], @"One",
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void)testSerializeDeserializeDictionaryWithArray
{
    NSError* error = (NSError*)self;
    NSString* expected = @"{\"Key\":[]}";
    id original = [NSDictionary dictionaryWithObjectsAndKeys:
                   [NSArray array], @"Key",
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void)testSerializeDeserializeDictionaryWithArray2
{
    NSError* error = (NSError*)self;
    NSString* expected = @"{\"Blah\":[true]}";
    id original = [NSDictionary dictionaryWithObjectsAndKeys:
                   [NSArray arrayWithObject:[NSNumber numberWithBool:YES]], @"Blah",
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void)testSerializeDeserializeBigDictionary
{
    NSError* error = (NSError*)self;
    id original = [NSDictionary dictionaryWithObjectsAndKeys:
                   @"0", @"0",
                   @"1", @"1",
                   @"2", @"2",
                   @"3", @"3",
                   @"4", @"4",
                   @"5", @"5",
                   @"6", @"6",
                   @"7", @"7",
                   @"8", @"8",
                   @"9", @"9",
                   @"10", @"10",
                   @"11", @"11",
                   @"12", @"12",
                   @"13", @"13",
                   @"14", @"14",
                   @"15", @"15",
                   @"16", @"16",
                   @"17", @"17",
                   @"18", @"18",
                   @"19", @"19",
                   @"20", @"20",
                   @"21", @"21",
                   @"22", @"22",
                   @"23", @"23",
                   @"24", @"24",
                   @"25", @"25",
                   @"26", @"26",
                   @"27", @"27",
                   @"28", @"28",
                   @"29", @"29",
                   @"30", @"30",
                   @"31", @"31",
                   @"32", @"32",
                   @"33", @"33",
                   @"34", @"34",
                   @"35", @"35",
                   @"36", @"36",
                   @"37", @"37",
                   @"38", @"38",
                   @"39", @"39",
                   @"40", @"40",
                   @"41", @"41",
                   @"42", @"42",
                   @"43", @"43",
                   @"44", @"44",
                   @"45", @"45",
                   @"46", @"46",
                   @"47", @"47",
                   @"48", @"48",
                   @"49", @"49",
                   @"50", @"50",
                   @"51", @"51",
                   @"52", @"52",
                   @"53", @"53",
                   @"54", @"54",
                   @"55", @"55",
                   @"56", @"56",
                   @"57", @"57",
                   @"58", @"58",
                   @"59", @"59",
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void) testDeserializeUnicode
{
    NSError* error = (NSError*)self;
    NSString* json = @"[\"\\u00dcOne\"]";
    NSString* expected = @"\u00dcOne";
    NSArray* result = [KSJSON deserializeString:json error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    NSString* value = [result objectAtIndex:0];
    STAssertEqualObjects(value, expected, @"");
}

- (void) testDeserializeUnicode2
{
    NSError* error = (NSError*)self;
    NSString* json = @"[\"\\u827e\\u5c0f\\u8587\"]";
    NSString* expected = @"\u827e\u5c0f\u8587";
    NSArray* result = [KSJSON deserializeString:json error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    NSString* value = [result objectAtIndex:0];
    STAssertEqualObjects(value, expected, @"");
}

- (void) testDeserializeControlChars
{
    NSError* error = (NSError*)self;
    NSString* json = @"[\"\\b\\f\\n\\r\\t\"]";
    NSString* expected = @"\b\f\n\r\t";
    NSArray* result = [KSJSON deserializeString:json error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    NSString* value = [result objectAtIndex:0];
    STAssertEqualObjects(value, expected, @"");
}

- (void) testSerializeDeserializeControlChars2
{
    NSError* error = (NSError*)self;
    NSString* expected = @"[\"\\b\\f\\n\\r\\t\"]";
    id original = [NSArray arrayWithObjects:
                   @"\b\f\n\r\t",
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void) testSerializeDeserializeEscapedChars
{
    NSError* error = (NSError*)self;
    NSString* expected = @"[\"\\\"\\\\\"]";
    id original = [NSArray arrayWithObjects:
                   @"\"\\",
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void) testSerializeDeserializeFloat
{
    NSError* error = (NSError*)self;
    NSString* expected = @"[1.2]";
    id original = [NSArray arrayWithObjects:
                   [NSNumber numberWithFloat:1.2f],
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertTrue([[result objectAtIndex:0] floatValue] ==  [[original objectAtIndex:0] floatValue], @"");
}

- (void) testSerializeDeserializeDouble
{
    NSError* error = (NSError*)self;
    NSString* expected = @"[1.2]";
    id original = [NSArray arrayWithObjects:
                   [NSNumber numberWithDouble:1.2f],
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertTrue([[result objectAtIndex:0] floatValue] ==  [[original objectAtIndex:0] floatValue], @"");
}

- (void) testSerializeDeserializeChar
{
    NSError* error = (NSError*)self;
    NSString* expected = @"[20]";
    id original = [NSArray arrayWithObjects:
                   [NSNumber numberWithChar:20],
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void) testSerializeDeserializeShort
{
    NSError* error = (NSError*)self;
    NSString* expected = @"[2000]";
    id original = [NSArray arrayWithObjects:
                   [NSNumber numberWithShort:2000],
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void) testSerializeDeserializeLong
{
    NSError* error = (NSError*)self;
    NSString* expected = @"[2000000000]";
    id original = [NSArray arrayWithObjects:
                   [NSNumber numberWithLong:2000000000],
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void) testSerializeDeserializeLongLong
{
    NSError* error = (NSError*)self;
    NSString* expected = @"[200000000000]";
    id original = [NSArray arrayWithObjects:
                   [NSNumber numberWithLongLong:200000000000],
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void) testSerializeDeserializeNegative
{
    NSError* error = (NSError*)self;
    NSString* expected = @"[-2000]";
    id original = [NSArray arrayWithObjects:
                   [NSNumber numberWithInt:-2000],
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void) testSerializeDeserialize0
{
    NSError* error = (NSError*)self;
    NSString* expected = @"[0]";
    id original = [NSArray arrayWithObjects:
                   [NSNumber numberWithInt:0],
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void) testSerializeDeserializeEmptyString
{
    NSError* error = (NSError*)self;
    NSString* string = @"";
    NSString* expected = @"[\"\"]";
    id original = [NSArray arrayWithObjects:
                   string,
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}


- (void) testSerializeDeserializeBigString
{
    NSError* error = (NSError*)self;
    NSString* string =
    @"01234567890123456789012345678901234567890123456789"
    @"01234567890123456789012345678901234567890123456789"
    @"01234567890123456789012345678901234567890123456789"
    @"01234567890123456789012345678901234567890123456789"
    @"01234567890123456789012345678901234567890123456789"
    @"01234567890123456789012345678901234567890123456789"
    @"01234567890123456789012345678901234567890123456789"
    @"01234567890123456789012345678901234567890123456789"
    @"01234567890123456789012345678901234567890123456789"
    @"01234567890123456789012345678901234567890123456789"
    @"01234567890123456789012345678901234567890123456789"
    @"01234567890123456789012345678901234567890123456789"
    @"01234567890123456789012345678901234567890123456789"
    @"01234567890123456789012345678901234567890123456789"
    @"01234567890123456789012345678901234567890123456789"
    @"01234567890123456789012345678901234567890123456789"
    @"01234567890123456789012345678901234567890123456789"
    @"01234567890123456789012345678901234567890123456789"
    @"01234567890123456789012345678901234567890123456789"
    @"01234567890123456789012345678901234567890123456789"
    @"01234567890123456789012345678901234567890123456789";

    NSString* expected = [NSString stringWithFormat:@"[\"%@\"]", string];
    id original = [NSArray arrayWithObjects:
                   string,
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(jsonString, expected, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void) testSerializeDeserializeHugeString
{
    NSError* error = (NSError*)self;
    char buff[100000];
    memset(buff, '2', sizeof(buff));
    buff[sizeof(buff)-1] = 0;
    NSString* string = [NSString stringWithCString:buff encoding:NSUTF8StringEncoding];
    
    id original = [NSArray arrayWithObjects:
                   string,
                   nil];
    NSString* jsonString = [KSJSON serializeObject:original error:&error];
    STAssertNotNil(jsonString, @"");
    STAssertNil(error, @"");
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
    STAssertEqualObjects(result, original, @"");
}

- (void) testDeserializeArrayMissingTerminator
{
    NSError* error = (NSError*)self;
    NSString* json = @"[\"blah\"";
    NSArray* result = [KSJSON deserializeString:json error:&error];
    STAssertNil(result, @"");
    STAssertNotNil(error, @"");
}

- (void) testSerializeBadTopLevelType
{
    NSError* error = (NSError*)self;
    id source = @"Blah";
    NSString* result = [KSJSON serializeObject:source error:&error];
    STAssertNil(result, @"");
    STAssertNotNil(error, @"");
}

- (void) testSerializeArrayBadType
{
    NSError* error = (NSError*)self;
    id source = [NSArray arrayWithObject:[NSValue valueWithPointer:NULL]];
    NSString* result = [KSJSON serializeObject:source error:&error];
    STAssertNil(result, @"");
    STAssertNotNil(error, @"");
}

- (void) testSerializeDictionaryBadType
{
    NSError* error = (NSError*)self;
    id source = [NSDictionary dictionaryWithObject:[NSValue valueWithPointer:NULL] forKey:@"blah"];
    NSString* result = [KSJSON serializeObject:source error:&error];
    STAssertNil(result, @"");
    STAssertNotNil(error, @"");
}

- (void) testSerializeDictionaryBadCharacter
{
    NSError* error = (NSError*)self;
    id source = [NSDictionary dictionaryWithObject:@"blah" forKey:@"blah\x01blah"];
    NSString* result = [KSJSON serializeObject:source error:&error];
    STAssertNil(result, @"");
    STAssertNotNil(error, @"");
}

- (void) testSerializeArrayBadCharacter
{
    NSError* error = (NSError*)self;
    id source = [NSArray arrayWithObject:@"test\x01ing"];
    NSString* result = [KSJSON serializeObject:source error:&error];
    STAssertNil(result, @"");
    STAssertNotNil(error, @"");
}

- (void)testDeserializeArrayInvalidUnicodeSequence
{
    NSError* error = (NSError*)self;
    NSString* jsonString = @"[\"One\\ubarfTwo\"]";
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNil(result, @"");
    STAssertNotNil(error, @"");
}

- (void)testDeserializeArrayUnterminatedEscape
{
    NSError* error = (NSError*)self;
    NSString* jsonString = @"[\"One\\u123\"]";
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNil(result, @"");
    STAssertNotNil(error, @"");
}

- (void)testDeserializeArrayUnterminatedEscape2
{
    NSError* error = (NSError*)self;
    NSString* jsonString = @"[\"One\\\"]";
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNil(result, @"");
    STAssertNotNil(error, @"");
}

- (void)testDeserializeArrayInvalidEscape
{
    NSError* error = (NSError*)self;
    NSString* jsonString = @"[\"One\\qTwo\"]";
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNil(result, @"");
    STAssertNotNil(error, @"");
}

- (void)testDeserializeArrayUnterminatedString
{
    NSError* error = (NSError*)self;
    NSString* jsonString = @"[\"One]";
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNil(result, @"");
    STAssertNotNil(error, @"");
}

- (void)testDeserializeArrayTruncatedFalse
{
    NSError* error = (NSError*)self;
    NSString* jsonString = @"[f]";
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNil(result, @"");
    STAssertNotNil(error, @"");
}

- (void)testDeserializeArrayInvalidFalse
{
    NSError* error = (NSError*)self;
    NSString* jsonString = @"[falst]";
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNil(result, @"");
    STAssertNotNil(error, @"");
}

- (void)testDeserializeArrayTruncatedTrue
{
    NSError* error = (NSError*)self;
    NSString* jsonString = @"[t]";
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNil(result, @"");
    STAssertNotNil(error, @"");
}

- (void)testDeserializeArrayInvalidTrue
{
    NSError* error = (NSError*)self;
    NSString* jsonString = @"[ture]";
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNil(result, @"");
    STAssertNotNil(error, @"");
}

- (void)testDeserializeArrayTruncatedNull
{
    NSError* error = (NSError*)self;
    NSString* jsonString = @"[n]";
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNil(result, @"");
    STAssertNotNil(error, @"");
}

- (void)testDeserializeArrayInvalidNull
{
    NSError* error = (NSError*)self;
    NSString* jsonString = @"[nlll]";
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNil(result, @"");
    STAssertNotNil(error, @"");
}

- (void)testDeserializeArrayInvalidElement
{
    NSError* error = (NSError*)self;
    NSString* jsonString = @"[-blah]";
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNil(result, @"");
    STAssertNotNil(error, @"");
}

- (void)testDeserializeArrayNumberOverflow
{
    NSError* error = (NSError*)self;
    NSString* jsonString = @"[123456789012345678901234567890]";
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNotNil(result, @"");
    STAssertNil(error, @"");
}

- (void)testDeserializeDictionaryInvalidKey
{
    NSError* error = (NSError*)self;
    NSString* jsonString = @"{blah:\"blah\"}";
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNil(result, @"");
    STAssertNotNil(error, @"");
}

- (void)testDeserializeDictionaryMissingSeparator
{
    NSError* error = (NSError*)self;
    NSString* jsonString = @"{\"blah\"\"blah\"}";
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNil(result, @"");
    STAssertNotNil(error, @"");
}

- (void)testDeserializeDictionaryBadElement
{
    NSError* error = (NSError*)self;
    NSString* jsonString = @"{\"blah\":blah\"}";
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNil(result, @"");
    STAssertNotNil(error, @"");
}

- (void)testDeserializeDictionaryUnterminated
{
    NSError* error = (NSError*)self;
    NSString* jsonString = @"{\"blah\":\"blah\"";
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNil(result, @"");
    STAssertNotNil(error, @"");
}

- (void)testDeserializeInvalidData
{
    NSError* error = (NSError*)self;
    NSString* jsonString = @"X{\"blah\":\"blah\"}";
    id result = [KSJSON deserializeString:jsonString error:&error];
    STAssertNil(result, @"");
    STAssertNotNil(error, @"");
}


@end
