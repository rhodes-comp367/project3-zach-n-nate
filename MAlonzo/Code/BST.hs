{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.BST where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Bool
import qualified MAlonzo.Code.Data.Nat.Base

name2 = "BST.BST"
d2 = ()
data T2 = C4 | C12 T2 Integer T2
name14 = "BST.All≤"
d14 :: Integer -> T2 -> ()
d14 = erased
name26 = "BST.All≥"
d26 :: Integer -> T2 -> ()
d26 = erased
name38 = "BST.BSTValid"
d38 a0 = ()
data T38 = C40 | C48 T38 T38 AgdaAny AgdaAny
name50 = "BST.lookup"
d50 :: Integer -> T2 -> Bool
d50 v0 v1
  = case coe v1 of
      C4 -> coe MAlonzo.Code.Agda.Builtin.Bool.C8
      C12 v2 v3 v4
        -> let v5 = MAlonzo.Code.Data.Nat.Base.d242 (coe v0) (coe v3) in
           case coe v5 of
             MAlonzo.Code.Data.Nat.Base.C226 v7 -> coe d50 (coe v0) (coe v2)
             MAlonzo.Code.Data.Nat.Base.C230
               -> coe MAlonzo.Code.Agda.Builtin.Bool.C10
             MAlonzo.Code.Data.Nat.Base.C236 v7
               -> coe
                    d50
                    (coe addInt (coe addInt (coe (1 :: Integer)) (coe v3)) (coe v7))
                    (coe v4)
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name90 = "BST.insert"
d90 :: Integer -> T2 -> T2
d90 v0 v1
  = case coe v1 of
      C4 -> coe C12 (coe v1) (coe v0) (coe v1)
      C12 v2 v3 v4
        -> let v5 = MAlonzo.Code.Data.Nat.Base.d242 (coe v0) (coe v3) in
           case coe v5 of
             MAlonzo.Code.Data.Nat.Base.C226 v7
               -> coe
                    C12 (coe d90 (coe v0) (coe v2))
                    (coe addInt (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v7))
                    (coe v4)
             MAlonzo.Code.Data.Nat.Base.C230
               -> coe C12 (coe v2) (coe v0) (coe v4)
             MAlonzo.Code.Data.Nat.Base.C236 v7
               -> coe
                    C12 (coe v2) (coe v3)
                    (coe
                       d90
                       (coe addInt (coe addInt (coe (1 :: Integer)) (coe v3)) (coe v7))
                       (coe v4))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name130 = "BST.exampleTree"
d130 :: T2
d130
  = coe
      d90 (coe (5 :: Integer))
      (coe
         d90 (coe (3 :: Integer)) (coe d90 (coe (7 :: Integer)) (coe C4)))
name132 = "BST.exampleSearch"
d132 :: Bool
d132 = coe d50 (coe (3 :: Integer)) (coe d130)
