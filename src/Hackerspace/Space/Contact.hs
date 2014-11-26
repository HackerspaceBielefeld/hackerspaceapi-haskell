{-# LANGUAGE DeriveGeneric #-}
module Hackerspace.Space.Contact (Contact(..)) where

import Data.Aeson (FromJSON)
import Data.Text (Text)
import GHC.Generics

data Contact = Contact { phone    :: Maybe Text
                       , jabber   :: Maybe Text
                       , ml       :: Maybe Text
                       , twitter  :: Maybe Text
                       , email    :: Maybe Text
                       , facebook :: Maybe Text
                       } deriving Generic

instance FromJSON Contact
