{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module HAR.Entry
       (
         Entry(..)
       ) where

import           Data.Aeson.Casing
import           Data.Aeson.TH
import           Data.Text     (Text)

import           HAR.Cache     (Cache)
import           HAR.Request   (Request)
import           HAR.Response  (Response)
import           HAR.Timings   (Timings)

data Entry = Entry { _entryPageRef         :: Maybe Text
                   , _entryStartedDateTime :: Text
                   , _entryTime            :: Double
                   , _entryRequest         :: Request
                   , _entryResponse        :: Response
                   , _entryCache           :: Maybe Cache
                   , _entryTimings         :: Timings
                   , _entryServerIpAddress :: Maybe Text
                   , _entryConnection      :: Maybe Text
                   , _entryComment         :: Maybe Text
                   } deriving (Eq, Show)

$(deriveJSON
  (aesonDrop 6 camelCase)
  ''Entry)
