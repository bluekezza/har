{-# LANGUAGE TemplateHaskell   #-}

module HAR.Browser where

import           Data.Aeson.TH
import           Data.Text     (Text)

data Browser = Browser { _browserName    :: Text
                       , _browserVersion :: Text
                       , _browserComment :: Maybe Text
                       } deriving (Eq, Show)

$(deriveJSON defaultOptions ''Browser)
