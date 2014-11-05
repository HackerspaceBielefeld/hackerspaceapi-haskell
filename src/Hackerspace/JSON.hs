{-# LANGUAGE DeriveGeneric #-}
module Hackerspace.JSON (Space(..)) where

import Data.Aeson (FromJSON)
import Data.Text (Text)
import GHC.Generics

import Hackerspace.JSON.State (State)
import Hackerspace.JSON.Location (Location)
import Hackerspace.JSON.Contact (Contact)

data Space = Space { state    :: State
                   , location :: Location
                   , contact  :: Contact
                   , space    :: Text
                   , url      :: Text
                   , logo     :: Text
                   } deriving Generic

instance FromJSON Space
