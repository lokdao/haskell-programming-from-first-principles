# Chapter 13 - Notes

</br>

## Projects
- **Modules** contain datatypes, type synonyms, typeclasses instances and values that can be exported to other modules
  
- **Packages** are programs containing modules and dependencies (e.g.: libraries, documentation, tests, other packages).
  - **Cabal** (Common Architecture for Building Applications and Libraries) **is one of Haskell's Package Manager**
  - Cabal leverages `.cabal` files to describe a single package

- **Stack** is built on top of Cabal and **is used for developing Haskell projects**
  - Stack helps in managing projects with individual or multiple packages (e.g.: large libraries can be built only once and used across projects)

## do syntax
- The `do` syntax allows to sequence monadic actions
- It also allows to name values that are returned by monadic IO actions, meaning those values can then be used as inputs to actions
- `return` returns a value inside a monadic structure
  - `return (1 == 1)` will return an `IO Bool`
