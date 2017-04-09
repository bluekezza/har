{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module HAR.Cookie where

import           Data.Aeson.Casing
import           Data.Aeson.TH
import           Data.Text     (Text)

data Cookie = Cookie { _cookieName       :: Text
                       , _cookieValue    :: Text
                       , _cookiePath     :: Maybe Text
                       , _cookieDomain   :: Maybe Text
                       , _cookieExpires  :: Maybe Text
                       , _cookieHttpOnly :: Maybe Bool
                       , _cookieSecure   :: Maybe Bool
                       , _cookieComment  :: Maybe Text
                       } deriving (Eq, Show)

$(deriveJSON
  (aesonDrop 7 camelCase)
  ''Cookie)
