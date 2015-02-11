{-# LANGUAGE FlexibleContexts #-}
module Data.Aeson.Extended
  ( module Data.Aeson
  , lensJSONParser
  )
where

import Data.Aeson
import Data.Aeson.Types

import GHC.Generics

lensParserOptions :: Options
lensParserOptions = defaultOptions { fieldLabelModifier = drop 1 }

lensJSONParser :: (Generic a, GFromJSON (Rep a)) => Value -> Parser a
lensJSONParser = genericParseJSON lensParserOptions
