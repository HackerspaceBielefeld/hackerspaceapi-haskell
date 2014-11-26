{-# LANGUAGE DeriveGeneric #-}
module Hackerspace.Space (Space(..)) where

import Data.Aeson (FromJSON)
import Data.Text (Text)
import GHC.Generics

import Hackerspace.Space.State (State)
import Hackerspace.Space.Location (Location)
import Hackerspace.Space.Contact (Contact)

data Space = Space { state    :: State
                   , location :: Location
                   , contact  :: Contact
                   , space    :: Text
                   , url      :: Text
                   , logo     :: Text
                   } deriving Generic

instance FromJSON Space
