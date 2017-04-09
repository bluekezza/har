{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module HAR.QueryString where

import           Data.Aeson.Casing
import           Data.Aeson.TH
import           Data.Text     (Text)

data QueryString = QueryString { _queryStringName    :: Text
                               , _queryStringValue   :: Text
                               , _queryStringComment :: Maybe Text
                               } deriving (Eq, Show)

$(deriveJSON
  (aesonDrop 12 camelCase)
  ''QueryString)
