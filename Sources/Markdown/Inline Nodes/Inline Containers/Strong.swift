/*
 This source file is part of the Swift.org open source project

 Copyright (c) 2021 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception

 See https://swift.org/LICENSE.txt for license information
 See https://swift.org/CONTRIBUTORS.txt for Swift project authors
*/

/// An element that tags inline elements with strong emphasis.
public struct Strong: RecurringInlineMarkup, BasicInlineContainer {
  public var _data: _MarkupData
  init(_ raw: RawMarkup) throws {
    guard case .strong = raw.data else {
      throw RawMarkup.Error.concreteConversionError(from: raw, to: Strong.self)
    }
    let absoluteRaw = AbsoluteRawMarkup(
      markup: raw, metadata: MarkupMetadata(id: .newRoot(), indexInParent: 0))
    self.init(_MarkupData(absoluteRaw))
  }
  init(_ data: _MarkupData) {
    self._data = data
  }
}

// MARK: - Public API

extension Strong {
  // MARK: BasicInlineContainer

  public init<Children>(_ newChildren: Children)
  where Children: Sequence, Children.Element == InlineMarkup {
    try! self.init(.strong(parsedRange: nil, newChildren.map { $0.raw.markup }))
  }

  // MARK: PlainTextConvertibleMarkup

  public var plainText: String {
    let childrenPlainText = children.compactMap {
      return ($0 as? InlineMarkup)?.plainText
    }.joined()
    return "\(childrenPlainText)"
  }

  // MARK: Visitation

  public func accept<V: MarkupVisitor>(_ visitor: inout V) -> V.Result {
    return visitor.visitStrong(self)
  }
}
