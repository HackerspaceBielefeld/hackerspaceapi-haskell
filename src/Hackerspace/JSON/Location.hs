{-# LANGUAGE DeriveGeneric #-}
module Hackerspace.JSON.Location (Location(..)) where

import Data.Text (Text)
import Data.Aeson (FromJSON)
import GHC.Generics

data Location = Location { lat     :: Double
                         , lon     :: Double
                         , address :: Text
                         } deriving Generic

instance FromJSON Location
