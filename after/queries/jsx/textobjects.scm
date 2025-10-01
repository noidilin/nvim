; extends
; JSX/TSX attributes
(jsx_attribute
  (property_identifier) @attribute.lhs
  "="
  [
    (string)
    (jsx_expression)
  ] @attribute.rhs @attribute.inner) @attribute.outer

; Self-closing JSX/TSX attribute (boolean attributes)
(jsx_attribute
  (property_identifier) @attribute.inner) @attribute.outer
