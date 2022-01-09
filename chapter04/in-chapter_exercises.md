# Chapter 4 - In-chapter exercises
</br>

## 4.3 Exercises: Mood Swing (p.90-91)

</br>

**Data type** 
```haskell
data Mood = Blah | Woot deriving Show
```
1. What is the type constructor, or name of this type? **Mood**
2. If the function requires a Mood value, what are the values you could possibly use? **Blah** or **Woot**
3. [...] So far, we’ve written a type signature `changeMood :: Mood -> Woot`. What’s wrong with that? It should be written as: **`changeMood :: Mood -> Mood`**
4. [...] Fix any mistakes and complete the function:
```haskell
-- Original
changeMood Mood = Woot
changeMood    _ = Blah

-- Replace "Mood" with "Blah"
changeMood Blah = Woot
changeMood    _ = Blah

```

</br>

## 4.6 Exercises: Find the Mistakes (p.101)
The following lines of code may have mistakes — some of them won’t compile! You know what you need to do.

1. `not True && true` -> **`not True && True`**
2. `not (x = 6)` ->  **`not (x == 6)`**
3. `(1 * 2) > 5` ->  **OK**
4. `[Merry] > [Happy]` -> **`"Merry" > "Happy"`**
5. `[1, 2, 3] ++ "look at me!"` -> **`"1, 2, 3 " ++ "look at me!"`**

