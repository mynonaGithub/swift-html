//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 07. 23..
//

import Foundation

public extension Node {

    static func map(_ children: [Node] = []) -> Node {
        Node(type: .standard, name: "map", children: children)
    }
}

/// The <map> tag is used to define an image map. An image map is an image with clickable areas.
///
/// The required name attribute of the <map> element is associated with the <img>'s usemap attribute and creates a relationship between the image and the map.
///
/// The <map> element contains a number of <area> elements, that defines the clickable areas in the image map.
public struct Map: Tag {
    public var node: Node

    public init(_ node: Node) {
        self.node = node
    }
    
    public init(name: String, _ children: [Node] = []) {
        self.node = .map(children)
        self.node.attributes.append(Attribute(key: "name", value: name))
    }

    public init(name: String, @TagBuilder _ builder: () -> [Tag]) {
        self.init(name: name, builder().map(\.node))
    }
    
    /// Specifies the name of an <input> element
    public func name(_ value: String) -> Self {
        .init(node.addOrReplace(Attribute(key: "name", value: value)))
    }
}

