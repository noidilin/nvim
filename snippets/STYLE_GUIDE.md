# Snippet Style Guide

Comprehensive guide for creating and maintaining VSCode-compatible snippets in Neovim.

## Table of Contents

- [Core Principles](#core-principles)
- [Naming Conventions](#naming-conventions)
- [Body Format](#body-format)
- [Prefixes](#prefixes)
- [Descriptions](#descriptions)
- [Tabstops and Placeholders](#tabstops-and-placeholders)
- [Variables](#variables)
- [Best Practices](#best-practices)
- [Template](#template)
- [TypeScript Alternatives](#typescript-alternatives)
- [Examples](#examples)

---

## Core Principles

### 1. Consistency
All snippets follow a standardized format to ensure predictable behavior across different contexts and editors.

### 2. Simplicity
Avoid overly complex variable transformations and regex patterns that may not work consistently with Neovim's snippet API.

### 3. Clarity
Every snippet should be self-documenting with clear names and descriptive descriptions.

### 4. Compatibility
Snippets follow VSCode snippet format to ensure maximum compatibility across editors.

---

## Naming Conventions

### Rule: Use `snake_case` for all snippet names

**Rationale:** Snake_case provides:
- Clear word separation
- Consistency across the codebase
- Easy-to-read and searchable names
- Compatibility with JSON key naming

### ✅ Correct

```json
{
  "use_state_hook": { ... },
  "import_module": { ... },
  "console_log": { ... },
  "arrow_function": { ... }
}
```

### ❌ Incorrect

```json
{
  "UseStateHook": { ... },       // PascalCase
  "import-module": { ... },       // kebab-case
  "consoleLog": { ... },          // camelCase
  "ARROW_FUNCTION": { ... }       // SCREAMING_SNAKE_CASE
}
```

### Naming Patterns

- **Hooks:** `use_<hook_name>_hook` (e.g., `use_state_hook`, `use_effect_hook`)
- **Imports:** `import_<variant>` (e.g., `import_module`, `import_module_as`)
- **Console:** `console_<method>` (e.g., `console_log`, `console_error`)
- **PropTypes:** `prop_type_<type>` (e.g., `prop_type_string`, `prop_type_array`)
- **React Components:** `<type>_<variant>_component` (e.g., `react_functional_component`)
- **JSX:** `jsx_<element_type>` (e.g., `jsx_element`, `jsx_elements_map`)

### Proximity and Similarity

For snippets with similar use cases, their names and prefixes should be named similarly, and they should be placed near each other in the same file.

**Rationale:**
- Improves discoverability when browsing snippet files
- Makes maintenance easier by grouping related functionality
- Creates logical patterns that are easier to remember
- Helps users find variants of the same snippet

**Example:**

```json
{
  "use_state_hook": {
    "prefix": "ush",
    "body": "const [${1:state}, set${2:State}] = useState(${3:initialState});${0}",
    "description": "useState hook"
  },
  "typed_use_state_hook": {
    "prefix": "tush",
    "body": "const [${1:state}, set${2:State}] = useState<${3:type}>(${0});",
    "description": "Typed useState hook"
  }
}
```

In this example:
- The typed variant follows immediately after the base variant
- Both share a similar prefix pattern (`ush` → `tush`)
- Names clearly indicate the relationship (`use_state_hook` → `typed_use_state_hook`)

---

## Body Format

### Rule: Use strings for single-line, arrays for multi-line

**Rationale:**
- Single-line strings are more readable and compact
- Multi-line arrays provide better control over formatting
- Consistent formatting improves maintainability

### Single-Line Snippets (String Format)

Use a simple string when the snippet body fits on one line.

```json
{
  "import_module": {
    "prefix": "im",
    "body": "import ${2:module} from '${1:path}'",
    "description": "Import module"
  }
}
```

### Multi-Line Snippets (Array Format)

Use an array of strings when the snippet spans multiple lines. Each array element represents one line.

```json
{
  "try_catch": {
    "prefix": "tc",
    "body": [
      "try {",
      "\t${0}",
      "} catch (${1:error}) {",
      "\t",
      "}"
    ],
    "description": "Try-catch block"
  }
}
```

### ✅ Correct

```json
// Single line
"export": {
  "body": "export ${1:value}"
}

// Multi-line
"const_object": {
  "body": [
    "const ${1:name} = {",
    "\t${0}",
    "}"
  ]
}
```

### ❌ Incorrect

```json
// Don't use array for single line
"export": {
  "body": ["export ${1:value}"]
}

// Don't use string for multi-line
"const_object": {
  "body": "const ${1:name} = {\n\t${0}\n}"
}
```

---

## Prefixes

### Rule: Short, memorable, and unique

**Rationale:**
- Quick to type → increased productivity
- Easy to remember → better user experience
- Unique → avoids conflicts

### Guidelines

1. **Length:** 2-6 characters preferred
2. **Memorable:** Use abbreviations or acronyms
3. **Unique:** Avoid conflicts with other snippets
4. **Logical:** Related to the snippet's purpose

### ✅ Correct

```json
{
  "use_state_hook": {
    "prefix": "ush",           // Abbreviation of useState hook
    "description": "React useState() hook"
  },
  "console_log": {
    "prefix": "clg",           // console.log
    "description": "Log message"
  },
  "import_module": {
    "prefix": "im",            // short for import
    "description": "Import module"
  }
}
```

### ❌ Incorrect

```json
{
  "use_state_hook": {
    "prefix": "useStateHook", // Too long
  },
  "console_log": {
    "prefix": "c",            // Too vague, not unique
  },
  "import_module": {
    "prefix": "import",       // Conflicts with keyword
  }
}
```

### Common Prefix Patterns

| Pattern | Example | Meaning |
|---------|---------|---------|
| `u<x>h` | `ush`, `ueh`, `urh` | use[X]hook |
| `c<x>` | `clg`, `cwa`, `cer` | console.[x] |
| `im<x>` | `im`, `ima`, `imd` | import [variant] |
| `pt<x>` | `pts`, `pta`, `ptf` | PropTypes.[type] |
| `<x>fc` | `rfc`, `trfc` | [variant] functional component |
| `jsx<x>` | `jsx`, `jsxc`, `jsxmap` | JSX [variant] |

---

## Descriptions

### Rule: Every snippet must have a descriptive description

**Rationale:**
- Helps users understand the snippet's purpose
- Provides context in autocomplete menus
- Serves as inline documentation

### Guidelines

1. **Concise:** Keep descriptions short but informative
2. **Clear:** Explain what the snippet does
3. **Actionable:** Use imperative mood when appropriate
4. **Context:** Add helpful details for complex snippets

### ✅ Correct

```json
{
  "use_effect_hook": {
    "description": "React useEffect() hook"
  },
  "for_of": {
    "description": "For-of loop: iterating over property values of iterable objects"
  },
  "console_assert": {
    "description": "If the specified expression is false, the message is written to the console along with a stack trace"
  }
}
```

### ❌ Incorrect

```json
{
  "use_effect_hook": {
    "description": "hook"              // Too vague
  },
  "for_of": {
    // Missing description               // No description
  },
  "console_assert": {
    "description": "assert"            // Not descriptive
  }
}
```

---

## Tabstops and Placeholders

### Tabstops

Tabstops define cursor positions when navigating through a snippet.

- `$1`, `$2`, `$3`, ... → ordered tabstops
- `$0` → final cursor position

### Placeholders

Placeholders provide default text that can be modified.

- `${1:default}` → tabstop with placeholder text
- `${1:array}` → suggests what should be entered

### Guidelines

1. **Order:** Number tabstops in the logical order of completion
2. **Final Position:** Always use `$0` for the final cursor position
3. **Meaningful Placeholders:** Use descriptive placeholder text
4. **Optional:** End with `$0` after semicolon for statement completion
5. **Consistent Format:** All tabstops MUST be wrapped with `{}` for consistency

### Tabstop Consistency Rule

**Rule:** All tabstops must be wrapped with `{}`, even when they don't have placeholders. Whenever possible, provide a descriptive placeholder to better illustrate the purpose of that tabstop.

**Rationale:**
- Improves code readability and consistency
- Makes placeholders easier to add later
- Helps users understand what should be filled in
- Provides better visual distinction between tabstops and regular code

### ✅ Correct

```json
{
  "import_module": {
    "body": "import ${2:module} from '${1:path}'",
    "description": "Import module"
  },
  "arrow_function": {
    "body": "(${1:param}) => ${0}",
    "description": "Arrow function with arguments"
  },
  "for_loop": {
    "body": [
      "for (let ${1:index} = 0; ${1:index} < ${2:array}.length; ${1:index}++) {",
      "\t${0}",
      "}"
    ]
  },
  "use_state_hook": {
    "body": "const [${1:state}, set${2:State}] = useState(${3:initialState});${0}",
    "description": "useState hook"
  }
}
```

### ❌ Incorrect

```json
{
  "import_module": {
    "body": "import $2 from '$1'",        // Missing braces and placeholders
  },
  "arrow_function": {
    "body": "($1) => $0",                 // Missing braces and placeholder
  },
  "for_loop": {
    "body": [
      "for (let ${1:x} = 0; ${1:x} < ${2:y}.length; ${1:x}++) {",
      "",                                 // No $0 marker
      "}"
    ]
  },
  "use_state_hook": {
    "body": "const [$1, set$2] = useState($3);$0"  // Missing braces and placeholders
  }
}
```

---

## Variables

### Built-in Variables

VSCode snippet variables provide dynamic content. Use sparingly and only when well-supported.

**Commonly Supported:**
- `${TM_FILENAME_BASE}` - filename without extension
- `${TM_FILENAME}` - full filename
- `${TM_DIRECTORY}` - directory path

### ⚠️ Avoid Complex Transformations

**Rationale:** Complex regex transformations don't work consistently with Neovim's snippet API.

### ✅ Correct

```json
{
  "react_functional_component": {
    "body": [
      "export default function ${1:${TM_FILENAME_BASE}}() {",
      "  return (",
      "    <div>${0}</div>",
      "  )",
      "}"
    ]
  }
}
```

### ❌ Incorrect

```json
{
  "component_with_transformation": {
    "body": [
      "export default function ${1/(.*)/${1:/capitalize}/}() {",
      "  return <div />",
      "}"
    ]
  }
}
```

**Why it fails:**
- `/capitalize` modifier not supported
- Complex regex patterns unreliable
- Behavior differs between snippet engines

---

## Best Practices

### 1. Indentation

Use `\t` (tab character) for indentation to respect user's tab settings.

```json
{
  "const_object": {
    "body": [
      "const ${1:name} = {",
      "\t${0}",        // Use \t, not spaces
      "}"
    ]
  }
}
```

### 2. Semicolons

Include semicolons for statements, append `${0}` after for cursor positioning.

```json
{
  "use_state_hook": {
    "body": "const [${1:state}, set${2:State}] = useState(${3:initialState});${0}"
  }
}
```

### 3. Consistent Spacing

Follow JavaScript/TypeScript conventions for spacing.

```json
// Good spacing
"arrow_function": {
  "body": "(${1:param}) => ${0}"
}

// Function calls
"console_log": {
  "body": "console.log(${1:message})"
}
```

### 4. Logical Grouping

Group related snippets in the same file based on functionality and category.

**Current Directory Structure:**

- `javascript/` - Main JavaScript snippets
  - `console.json` - Console methods (log, warn, error, etc.)
  - `function.json` - Function patterns (arrow, async, named)
  - `syntax.json` - General JavaScript syntax (loops, conditionals, imports)
  - `react/` - React-specific snippets
    - `component.json` - React components and JSX elements
    - `hook.json` - React hooks (useState, useEffect, etc.)
    - `syntax.json` - React/JSX syntax patterns
- `archived/` - Deprecated snippets (PropTypes, old patterns)

### 5. Deprecation Handling

For deprecated snippets (like PropTypes):
- Keep for backward compatibility
- Document preferred alternatives
- Consider adding TypeScript variants

### 6. Empty Lines

For snippets with multiple sections, include empty lines for readability.

```json
{
  "typescript_react_functional_export_component": {
    "body": [
      "type Props = {}",
      "",                    // Empty line for separation
      "function ${TM_FILENAME_BASE}({}: Props) {",
      "  return (",
      "    <div>${0}</div>",
      "  )",
      "}",
      "",                    // Empty line before export
      "export default ${TM_FILENAME_BASE}"
    ]
  }
}
```

---

## Template

Use this template when creating new snippets:

```json
{
  "snippet_name_in_snake_case": {
    "prefix": "short",
    "body": "single line snippet with ${1:placeholder} and ${0}",
    "description": "Clear description of what this snippet does"
  },
  "multi_line_snippet_name": {
    "prefix": "ml",
    "body": [
      "line one with ${1:placeholder}",
      "\tindented line",
      "\t${0}",
      "closing line"
    ],
    "description": "Multi-line snippet description"
  }
}
```

### Checklist for New Snippets

- [ ] Name uses `snake_case`
- [ ] Prefix is 2-6 characters and unique
- [ ] Body format matches line count (string vs array)
- [ ] Includes descriptive description
- [ ] Tabstops are numbered logically
- [ ] All tabstops are wrapped with `{}`
- [ ] Placeholders provided where appropriate
- [ ] Similar snippets are placed adjacently
- [ ] Final cursor position uses `${0}`
- [ ] Indentation uses `\t`
- [ ] No complex regex transformations
- [ ] Follows spacing conventions
- [ ] Tested in Neovim

---

## TypeScript Alternatives

### Migrating from PropTypes to TypeScript

PropTypes are deprecated in favor of TypeScript for type checking. Here are the modern alternatives:

#### PropTypes → TypeScript Type Mapping

| PropTypes | TypeScript Type | Example |
|-----------|----------------|---------|
| `PropTypes.string` | `string` | `name: string` |
| `PropTypes.number` | `number` | `age: number` |
| `PropTypes.bool` | `boolean` | `active: boolean` |
| `PropTypes.array` | `any[]` or `T[]` | `items: string[]` |
| `PropTypes.object` | `object` or `T` | `data: { id: number }` |
| `PropTypes.func` | `() => void` | `onClick: () => void` |
| `PropTypes.node` | `React.ReactNode` | `children: React.ReactNode` |
| `PropTypes.element` | `React.ReactElement` | `icon: React.ReactElement` |
| `PropTypes.instanceOf(X)` | `X` | `date: Date` |
| `.isRequired` | Required (default) | `name: string` |
| Optional prop | `?` modifier | `age?: number` |

#### Example: Before (PropTypes)

```javascript
import PropTypes from 'prop-types'

function UserCard({ name, age, isActive }) {
  return <div>{name}</div>
}

UserCard.propTypes = {
  name: PropTypes.string.isRequired,
  age: PropTypes.number,
  isActive: PropTypes.bool
}
```

#### Example: After (TypeScript)

```typescript
type Props = {
  name: string
  age?: number
  isActive?: boolean
}

function UserCard({ name, age, isActive }: Props) {
  return <div>{name}</div>
}
```

### TypeScript Component Snippets

Use these modern TypeScript snippets instead of PropTypes:

```json
{
  "typescript_react_functional_component": {
    "prefix": "trfc",
    "body": [
      "type Props = {}",
      "",
      "export default function ${TM_FILENAME_BASE}({}: Props) {",
      "  return (",
      "    <div>${0}</div>",
      "  )",
      "}"
    ],
    "description": "Creates a React Functional Component with TypeScript"
  }
}
```

### TypeScript Props Pattern

For complex props:

```typescript
type Props = {
  // Primitives
  name: string
  age?: number
  isActive: boolean
  
  // Objects
  user: {
    id: number
    email: string
  }
  
  // Arrays
  tags: string[]
  items: Array<{ id: number; name: string }>
  
  // Functions
  onClick: () => void
  onChange: (value: string) => void
  onSubmit: (data: FormData) => Promise<void>
  
  // React specific
  children: React.ReactNode
  icon?: React.ReactElement
  
  // Union types
  status: 'pending' | 'success' | 'error'
  
  // Generic types
  data: Record<string, unknown>
}
```

---

## Examples

### Complete Snippet File Example

```json
{
  "import_module": {
    "prefix": "im",
    "body": "import ${2:module} from '${1:path}'",
    "description": "Import module"
  },
  "import_module_destructured": {
    "prefix": "imd",
    "body": "import { ${2:exports} } from '${1:path}'",
    "description": "Import module with destructuring"
  },
  "arrow_function": {
    "prefix": "afa",
    "body": "(${1:param}) => ${0}",
    "description": "Arrow function with arguments"
  },
  "constant_arrow_function": {
    "prefix": "caf",
    "body": "const ${1:name} = (${2:params}) => ${0}",
    "description": "Constant arrow function"
  },
  "try_catch": {
    "prefix": "tc",
    "body": [
      "try {",
      "\t${0}",
      "} catch (${1:error}) {",
      "\t",
      "}"
    ],
    "description": "Try-catch block"
  }
}
```

### Common Patterns

#### 1. Hook Pattern
```json
{
  "use_state_hook": {
    "prefix": "ush",
    "body": "const [${1:state}, set${2:State}] = useState(${3:initialState});${0}",
    "description": "React useState() hook"
  }
}
```

#### 2. Import Pattern
```json
{
  "import_module": {
    "prefix": "im",
    "body": "import ${2:module} from '${1:path}'",
    "description": "Import module"
  }
}
```

#### 3. Block Pattern
```json
{
  "try_catch": {
    "prefix": "tc",
    "body": [
      "try {",
      "\t${0}",
      "} catch (${1:error}) {",
      "\t",
      "}"
    ],
    "description": "Try-catch block"
  }
}
```

#### 4. Component Pattern
```json
{
  "typescript_react_functional_component": {
    "prefix": "trfc",
    "body": [
      "type Props = {}",
      "",
      "export default function ${TM_FILENAME_BASE}({}: Props) {",
      "  return (",
      "    <div>${0}</div>",
      "  )",
      "}"
    ],
    "description": "Creates a React Functional Component with TypeScript"
  }
}
```

---

## Related Files

- **Snippet Files:**
  - `javascript/console.json` - Console method snippets (log, warn, error, etc.)
  - `javascript/function.json` - Function patterns (arrow, async, named)
  - `javascript/syntax.json` - General JavaScript syntax (loops, conditionals, imports)
  - `javascript/react/component.json` - React components and JSX elements
  - `javascript/react/hook.json` - React hooks (useState, useEffect, etc.)
  - `javascript/react/syntax.json` - React/JSX syntax patterns
  - `archived/javascript.json` - Archived general JavaScript snippets
  - `archived/react.json` - Archived React snippets (includes PropTypes)
  
- **Configuration:**
  - `package.json` - Snippet registration and language mapping
  - `STYLE_GUIDE.md` - This comprehensive style guide

---

## Contributing

When adding new snippets:

1. Follow all style rules in this guide
2. Test the snippet in Neovim
3. Add to the appropriate file based on category
4. Update this guide if introducing new patterns
5. Run `stylua --check .` to ensure formatting (if applicable)

---

## Version History

- **v1.1** - Structure and consistency updates (Oct 2025)
  - Added proximity and similarity rule for related snippets
  - Enforced tabstop consistency with `{}` wrapping
  - Updated directory structure documentation
  - Enhanced all examples with proper placeholders
  - Expanded checklist for new snippets

- **v1.0** - Initial standardization (Oct 2025)
  - Established snake_case naming convention
  - Standardized body format (string vs array)
  - Documented prefix guidelines
  - Added TypeScript migration guide
  - Created comprehensive examples

---

## References

- [VSCode Snippet Syntax](https://code.visualstudio.com/docs/editor/userdefinedsnippets)
- [Neovim Snippet API](https://neovim.io/doc/user/lua.html#vim.snippet)
- [TypeScript React Cheatsheet](https://react-typescript-cheatsheet.netlify.app/)
