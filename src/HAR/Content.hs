{-# LANGUAGE TemplateHaskell   #-}

module HAR.Content where

import           Data.Aeson.Casing
import           Data.Aeson.TH
import           Data.Text     (Text)

data Content = Content { _contentSize        :: Integer
                       , _contentCompression :: Maybe Integer
                       , _contentMimeType    :: Text
                       , _contentText        :: Maybe Text
                       , _contentEncoding    :: Maybe Text
                       , _contentComment     :: Maybe Text
                       } deriving (Eq, Show)

$(deriveJSON
  (aesonDrop 8 camelCase)
  ''Content)

