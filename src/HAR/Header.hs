{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module HAR.Header where

import           Data.Aeson.Casing
import           Data.Aeson.TH
import           Data.Text     (Text)

data Header = Header { _headerName    :: Text
                     , _headerValue   :: Text
                     , _headerComment :: Maybe Text
                     } deriving (Eq, Show)

$(deriveJSON
  (aesonDrop 7 camelCase)
  ''Header)
