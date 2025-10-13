# Archived Snippets

This folder contains snippet files that are no longer actively used but are preserved for reference or potential future use.

## Files

### react-prop-type.json
**Archived:** 2025-10-14  
**Reason:** PropTypes are deprecated in favor of TypeScript

PropTypes provide runtime type checking for React components, but the React team now recommends using TypeScript for type safety. TypeScript provides:
- Compile-time type checking (faster feedback)
- Better IDE support and autocomplete
- No runtime overhead
- More powerful type system

**When to restore:**
- Working on legacy React projects that use PropTypes
- Maintaining libraries with PropTypes support
- Teaching React fundamentals where PropTypes are still relevant

**TypeScript Alternative:**
Instead of PropTypes, use TypeScript type definitions:

```typescript
// OLD: PropTypes
Component.propTypes = {
  name: PropTypes.string.isRequired,
  age: PropTypes.number,
  onClick: PropTypes.func
}

// NEW: TypeScript
type Props = {
  name: string
  age?: number
  onClick?: () => void
}

function Component({ name, age, onClick }: Props) { ... }
```

## Restoring Archived Snippets

To restore a snippet file:

1. Move the file back to `javascript/` folder:
   ```
   move archived\react-prop-type.json javascript\
   ```

2. Update `package.json` to include the snippet reference:
   ```json
   {
     "language": ["typescriptreact", "javascriptreact", "jsx-attr", "tsx-attr"],
     "path": "./javascript/react-prop-type.json"
   }
   ```

3. Reload your editor to activate the snippets
