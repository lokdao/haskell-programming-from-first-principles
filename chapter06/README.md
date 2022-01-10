# Chapter 6 - Notes
</br>

## Typeclasses
- A typeclass defines how a set of types is consumed or used in computations
- Typeclasses may have a hierarchy / inherit from other typeclasses
  - For instance, all `Fractional` numbers implement the `Num` typeclass, but not all `Num` are `Fractional`
- Typeclasses can be derived or instanciated

**Example**
```haskell
-- Deriving the Eq typeclass
data Dog = SHIBA | TECKEL
  deriving Eq

-- Instanciating the Eq typeclass
data Dog' = SHIBA | TECKEL
instance Eq Dog' where
    (==) SHIBA SHIBA = True
    (==) TECKEL TECKEL = True
    (==) _ _ = False
```
### Ord vs Enum
- `Ord` typeclass covers types that can be ordered (duh...)
- `Enum` typeclass covers types that have known predecessors and successors (e.g.: numbers, characters) 

### Show vs Read
- `Show` is a typeclass that takes things and creates a `String`
- `Read` is a typeclass that takes a `String` and creates a thing

Usage of **`Read`** should be avoided given there are no certainty that a `String` can be converted to anything, i.e.: `read "Hi there" :: Integer` will definitely fail and return an error.
