{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module HAR.Param where

import           Data.Aeson.TH
import           Data.Text     (Text)

data Param = Param { _paramName        :: Text
                   , _paramValue       :: Maybe Text
                   , _paramFileName    :: Maybe Text
                   , _paramContentType :: Maybe Text
                   , _paramComment     :: Maybe Text
                   } deriving (Eq, Show)

$(deriveJSON defaultOptions ''Param)
