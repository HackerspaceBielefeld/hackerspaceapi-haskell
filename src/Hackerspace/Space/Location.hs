{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TemplateHaskell #-}
module Hackerspace.Space.Location
  ( Location
  , lat
  , lon
  , address
  )
where

import Control.Lens.TH

import Data.Text (Text)
import Data.Aeson.Extended (FromJSON(parseJSON), lensJSONParser)

import GHC.Generics

data Location = Location { _lat     :: Double
                         , _lon     :: Double
                         , _address :: Text
                         } deriving Generic

makeLenses ''Location

instance FromJSON Location where
  parseJSON = lensJSONParser
