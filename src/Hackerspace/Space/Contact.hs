{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TemplateHaskell #-}
module Hackerspace.Space.Contact
  ( Contact
  , phone
  , jabber
  , ml
  , twitter
  , email
  , facebook
  )
where

import Control.Lens.TH

import Data.Aeson.Extended (FromJSON(parseJSON), lensJSONParser)
import Data.Text (Text)

import GHC.Generics

data Contact = Contact { _phone    :: Maybe Text
                       , _jabber   :: Maybe Text
                       , _ml       :: Maybe Text
                       , _twitter  :: Maybe Text
                       , _email    :: Maybe Text
                       , _facebook :: Maybe Text
                       } deriving Generic

makeLenses ''Contact

instance FromJSON Contact where
  parseJSON = lensJSONParser
