{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}
module Main where

import qualified Network.Browser as Browser
import qualified Network.HTTP    as HTTP
import qualified Data.Aeson      as Aeson
import qualified Network.URI     as URI
import qualified Data.Text.IO    as Text (putStrLn)

import qualified Hackerspace.Space.State    as State
import qualified Hackerspace.Space.Location as Location

import Network.URI (URI)
import Data.Maybe (fromMaybe)
import Hackerspace.Space (Space(..))
import Data.Bool (bool)

hackerspace :: URI
hackerspace =
  let uri = "http://hackerspace-bielefeld.de/status.json" in
      fromMaybe URI.nullURI $ URI.parseURI uri

showInfo :: Space -> IO ()
showInfo Space {..} = do
  Text.putStrLn   space
  Text.putStrLn $ Location.address location
  Text.putStrLn $ "closed" `bool` "open" $ State.open state

main :: IO ()
main = do
  (_, rsp) <- Browser.browse $ do
    Browser.setOutHandler (const $ return ())
    Browser.request $ HTTP.mkRequest HTTP.GET hackerspace

  case Aeson.eitherDecode (HTTP.rspBody rsp) of
       Right space -> showInfo space
       Left  err   -> putStrLn $ "<error>: " ++ err
