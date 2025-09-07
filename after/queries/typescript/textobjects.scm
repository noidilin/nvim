; TASK 01: whether there are intersection_type or not
; (type_annotation
;   [
;    (generic_type)*
;    (predefined_type)*
;    (object_type)*
;    ] @type)

; TASK 02: handle one or more arguments and parameters
; arguments
; (call_expression
;   (member_expression)
;   (arguments)* @argument)

; function parameters
; (formal_parameters
;   [(required_parameter
;      pattern: (identifier)
;      value: (identifier) @parameter.inner)* @parameter.outer
;    (optional_parameter
;      pattern: (identifier)
;      value: (identifier) @parameter.inner)* @parameter.outer
;    ])
