{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module HAR.Log where

import           Data.Aeson.TH
import           Data.Text     (Text)

import           HAR.Browser   (Browser)
import           HAR.Creator   (Creator)
import           HAR.Entry     (Entry)
import           HAR.Page      (Page)

data Log = Log { version :: Text
               , creator :: Creator
               , browser :: Maybe Browser
               , pages   :: [Page]
               , entries :: [Entry]
               , comment :: Maybe Text
               } deriving (Eq, Show)

$(deriveJSON defaultOptions ''Log)
