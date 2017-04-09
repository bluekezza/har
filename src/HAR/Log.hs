{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module HAR.Log where

import           Data.Aeson.Casing
import           Data.Aeson.TH
import           Data.Text     (Text)

import           HAR.Browser   (Browser)
import           HAR.Creator   (Creator)
import           HAR.Entry     (Entry)
import           HAR.Page      (Page)

data Log = Log { _logVersion :: Text
               , _logCreator :: Creator
               , _logBrowser :: Maybe Browser
               , _logPages   :: [Page]
               , _logEntries :: [Entry]
               , _logComment :: Maybe Text
               } deriving (Eq, Show)

$(deriveJSON
  (aesonDrop 4 camelCase)
  ''Log)
