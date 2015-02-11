{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TemplateHaskell #-}
module Hackerspace.Space.State
  ( State
  , open
  )
where

import Control.Lens.TH

import Data.Aeson.Extended (FromJSON(parseJSON), lensJSONParser)

import GHC.Generics

data State = State { _open :: Bool }
  deriving Generic

makeLenses ''State

instance FromJSON State where
  parseJSON = lensJSONParser
