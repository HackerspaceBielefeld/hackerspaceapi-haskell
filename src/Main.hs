{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Lens

import Data.Bool (bool)
import Data.Maybe (fromMaybe)
import Data.Text (Text)

import Network.URI (URI)

import Hackerspace.Space

import qualified Network.Browser as Browser
import qualified Network.HTTP    as HTTP
import qualified Network.URI     as URI

import qualified Data.Aeson      as Aeson
import qualified Data.Text       as Text (intercalate)
import qualified Data.Text.IO    as Text (putStrLn)

hackerspace :: URI
hackerspace =
  let uri = "http://hackerspace-bielefeld.de/status.json" in
      fromMaybe URI.nullURI $ URI.parseURI uri

spaceInfo :: Space -> Text
spaceInfo s =
  Text.intercalate "\n"
    [ view space s
    , view (location . address) s
    , "closed" `bool` "open" $ view (state . open) s
    , fromMaybe "" $ view (contact . phone) s
    ]

main :: IO ()
main = do
  (_, rsp) <- Browser.browse $ do
    Browser.setOutHandler (const $ return ())
    Browser.request $ HTTP.mkRequest HTTP.GET hackerspace

  either
    (putStrLn . ("<error>: " ++))
    (Text.putStrLn . spaceInfo)
    (Aeson.eitherDecode (HTTP.rspBody rsp))
