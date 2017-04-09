{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module HAR.Response where

import           Data.Aeson.Casing
import           Data.Aeson.TH
import           Data.Text     (Text)

import           HAR.Content   (Content)
import           HAR.Cookie    (Cookie)
import           HAR.Header    (Header)

data Response = Response { _responseStatus      :: Integer
                         , _responseStatusText  :: Text
                         , _responseHttpVersion :: Text
                         , _responseCookies     :: [Cookie]
                         , _responseHeaders     :: [Header]
                         , _responseContent     :: Content
                         , _responseRedirectURL :: Text
                         , _responseHeadersSize :: Integer
                         , _responseBodySize    :: Integer
                         , _responseComment     :: Maybe Text
                       } deriving (Eq, Show)

$(deriveJSON
  (aesonDrop 9 camelCase)
  ''Response)
