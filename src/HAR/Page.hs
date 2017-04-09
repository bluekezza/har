{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module HAR.Page
       (
         Page(..)
       ) where

import           Data.Aeson.Casing
import           Data.Aeson.TH
import           Data.Text       (Text)

import           HAR.PageTimings
data Page = Page { _pageStartedDateTime :: Text
                 , _pageId              :: Text
                 , _pageTitle           :: Text
                 , _pagePageTimings     :: PageTimings
                 , _pageComment         :: Maybe Text
                 } deriving (Eq, Show)

$(deriveJSON
  (aesonDrop 5 camelCase)
  ''Page)
