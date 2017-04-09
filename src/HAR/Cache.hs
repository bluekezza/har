{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module HAR.Cache where

import           Data.Aeson.TH
import           Data.Text     (Text)

newtype Cache = Cache { _cacheComment :: Maybe Text
                   } deriving (Eq, Show)

$(deriveJSON defaultOptions ''Cache)
