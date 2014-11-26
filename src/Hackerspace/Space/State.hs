{-# LANGUAGE DeriveGeneric #-}
module Hackerspace.Space.State(State(..)) where

import Data.Aeson (FromJSON)
import GHC.Generics

data State = State { open :: Bool }
  deriving Generic

instance FromJSON State
