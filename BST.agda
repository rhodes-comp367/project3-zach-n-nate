--This is our project file
--This file is used to define the project and its dependencies
open import Agda.Builtin.Equality
open import Agda.Builtin.Nat
open import Agda.Builtin.Bool
open import Agda.Builtin.Unit
open import Relation.Binary.PropositionalEquality as Eq using (_≡_; refl)
open import Data.Nat using (ℕ; _≤_; _<_; _≥_; _>_; compare; less; equal; greater)
open import Data.Maybe using (Maybe; just; nothing)
open import Relation.Nullary using (Dec; yes; no)
open import Data.Product using (_×_; _,_)
open import Data.Unit using (⊤; tt)


data BST : Set where
  empty : BST
  node  : (left : BST) → (val : ℕ) → (right : BST) → BST

--Used AI towrite the All≤ and All≥ functions that
--proved the all elements in the left subtree and less than 
--the value of the node and all elements in the right
--subtree is greater than.
All≤ : ℕ → BST → Set
All≤ x empty = ⊤
All≤ x (node l v r) = (v ≤ x) × All≤ x l × All≤ x r

All≥ : ℕ → BST → Set
All≥ x empty = ⊤
All≥ x (node l v r) = (x ≤ v) × All≥ x l × All≥ x r


data BSTValid : BST → Set where
  empty : BSTValid empty
  validNode :
    ∀ (left : BST) (val : ℕ) (right : BST)
    → BSTValid left
    → BSTValid right
    → All≤ val left
    → All≥ val right
    → BSTValid (node left val right)

lookup : ℕ → BST → Bool
lookup x empty = false
lookup x (node left val right) with compare x val
... | less _ _   = lookup x left
... | equal _   = true
... | greater _ _ = lookup x right


insert : ℕ → BST → BST
insert x empty = node empty x empty
insert x (node left val right) with compare x val
... | less _ _    = node (insert x left) val right
... | equal _ = node left val right
... | greater _ _ = node left val (insert x right)

--lookup-insert : lookup n t (insert n t) ≡ true
--lookup-insert = ?

exampleTree : BST
exampleTree = insert 5 (insert 3 (insert 7 empty))

exampleSearch : Bool
exampleSearch = lookup 3 exampleTree  -- should return true

