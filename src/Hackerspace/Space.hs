{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TemplateHaskell #-}
module Hackerspace.Space
  ( Space
  , state
  , location
  , contact
  , space
  , url
  , logo
  , module Hackerspace.Space.State
  , module Hackerspace.Space.Location
  , module Hackerspace.Space.Contact
  )
where

import Control.Lens.TH

import Data.Aeson.Extended (FromJSON(parseJSON), lensJSONParser)
import Data.Text (Text)

import GHC.Generics

import Hackerspace.Space.State
import Hackerspace.Space.Location
import Hackerspace.Space.Contact

data Space = Space { _state    :: State
                   , _location :: Location
                   , _contact  :: Contact
                   , _space    :: Text
                   , _url      :: Text
                   , _logo     :: Text
                   } deriving Generic

makeLenses ''Space

instance FromJSON Space where
  parseJSON = lensJSONParser
