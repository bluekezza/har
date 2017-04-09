{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module HAR.QueryString where

import           Data.Aeson.TH
import           Data.Text     (Text)

data QueryString = QueryString { name    :: Text
                               , value   :: Text
                               , comment :: Maybe Text
                               } deriving (Eq, Show)

$(deriveJSON defaultOptions ''QueryString)
