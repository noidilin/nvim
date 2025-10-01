; extends

; Type annotations (variable: Type, parameter: Type, etc.)
; (type_annotation
;   ":"
;   [
;     (predefined_type)
;     (generic_type)
;     (object_type)
;     (array_type)
;     (union_type)
;     (intersection_type)
;     (tuple_type)
;     (function_type)
;     (type_identifier)
;   ] @type.inner) @type.outer

; Generic type arguments (<Type, Type>)
; (type_arguments
;   "<"
;   [
;     (predefined_type)
;     (generic_type)
;     (object_type)
;     (array_type)
;     (union_type)
;     (intersection_type)
;     (tuple_type)
;     (function_type)
;     (type_identifier)
;   ] @type.inner
;   ">") @type.outer

; Function return type annotations
; (function_signature
;   "=>"
;   [
;     (predefined_type)
;     (generic_type)
;     (object_type)
;     (array_type)
;     (union_type)
;     (intersection_type)
;     (tuple_type)
;     (function_type)
;     (type_identifier)
;   ] @type.inner) @type.outer
