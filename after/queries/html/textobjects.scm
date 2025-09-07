; extends

; HTML attributes
(attribute
  (attribute_name) @attribute.lhs
  [
    "="
    (quoted_attribute_value)
    (attribute_value)
  ]? @attribute.rhs) @attribute.outer

; Inner attribute value (without quotes)
(quoted_attribute_value
  (attribute_value) @attribute.inner)

; Unquoted attribute value
(attribute_value) @attribute.inner