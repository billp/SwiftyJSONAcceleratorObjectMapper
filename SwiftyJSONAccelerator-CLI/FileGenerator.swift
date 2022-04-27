//
//  FileGenerator.swift
//  SwiftyJSONAccelerator
//
//  Created by Karthik on 27/12/2016.
//  Copyright © 2016 Karthikeya Udupa K M. All rights reserved.
//

import Foundation

/// Since we cannot have resources in the CLI we need to store strings here.
struct FileGenerator {

    /**
     Fetch the template for creating model.swift files.
     
     - parameter filename: Name of the file to be loaded
     
     - returns: String containing the template.
     */
    static func loadFileWith(_ filename: String) -> String {
        do {
            let content = try stringFor(filename: filename)
            return content
        } catch { }

        return ""
    }

    static func stringFor(filename: String) throws -> String {
        switch filename {
        case "MarshalTemplate":
            return "\t// MARK: Marshal Initializers\n\n\t/// Map a JSON object to this class using Marshal.\n\t///\n\t/// - parameter object: A mapping from ObjectMapper\n\tpublic{REQUIRED}init(object: MarshaledObject) {\n{INITIALIZER}\n\t}\n"
        case "ObjectMapperTemplate":
            return "\t// MARK: ObjectMapper Initializers\n\t/// Map a JSON object to this class using ObjectMapper.\n\t///\n\t/// - parameter map: A mapping from ObjectMapper.\n\tpublic{REQUIRED}init?(map: Map){\n\n\t}\n\n\t/// Map a JSON object to this class using ObjectMapper.\n\t///\n\t/// - parameter map: A mapping from ObjectMapper.\n\tpublic func mapping(map: Map) {\n{INITIALIZER}\n\t}\n"
        case "SwiftyJSONTemplate":
            return "\t// MARK: SwiftyJSON Initializers\n\t/// Initiates the instance based on the object.\n\t///\n\t/// - parameter object: The object of either Dictionary or Array kind that was passed.\n\t/// - returns: An initialized instance of the class.\n\tpublic convenience init(object: Any) {\n\t  self.init(json: JSON(object))\n\t}\n\n\t/// Initiates the instance based on the JSON that was passed.\n\t///\n\t/// - parameter json: JSON object from SwiftyJSON.\n\tpublic{REQUIRED}init(json: JSON) {\n{INITIALIZER}\n\t}\n"
        case "BaseTemplate":
            return "//\n//  {OBJECT_NAME}.swift\n//\n//  Created by __NAME__ on {DATE}\n//  Copyright (c) __MyCompanyName__. All rights reserved.\n//\n\nimport Foundation{INCLUDE_HEADER}\n\npublic{IS_FINAL}{OBJECT_KIND} {OBJECT_NAME}{EXTENDED_OBJECT_COLON}{EXTEND_FROM} {\n\n\t// MARK: Declaration for string constants to be used to decode and also serialize.\n\tprivate struct SerializationKeys {\n{STRING_CONSTANT}\n\t}\n\n\t// MARK: Properties\n{DECLARATION}\n\n{JSON_PARSER_LIBRARY_BODY}\n\n{NSCODING_SUPPORT}\n}\n"
        case "NSCodingTemplate":
            return "\n\t// MARK: NSCoding Protocol\n\trequired public init(coder aDecoder: NSCoder) {\n{DECODERS}\n\t}\n\n\tpublic func encode(with aCoder: NSCoder) {\n{ENCODERS}\n\t}\n"
        default:
            throw NSError.init(domain: "SwiftyJSONAccelerator", code: 0, userInfo: nil)
        }
    }
}
