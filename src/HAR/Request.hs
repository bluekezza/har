{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module HAR.Request where

import           Data.Aeson.Casing
import           Data.Aeson.TH
import           Data.Text       (Text)

import           HAR.Cookie      (Cookie)
import           HAR.Header      (Header)
import           HAR.PostData    (PostData)
import           HAR.QueryString (QueryString)

type URL = Text

data Request = Request { _requestMethod      :: Text
                       , _requestUrl         :: URL
                       , _requestHttpVersion :: Text
                       , _requestCookies     :: [Cookie]
                       , _requestHeaders     :: [Header]
                       , _requestQueryString :: [QueryString]
                       , _requestPostData    :: Maybe PostData
                       , _requestHeadersSize :: Integer
                       , _requestBodySize    :: Integer
                       , _requestComment     :: Maybe Text
                       } deriving (Eq, Show)

$(deriveJSON
  (aesonDrop 8 camelCase)
  ''Request)
