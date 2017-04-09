{-# LANGUAGE TemplateHaskell   #-}

module HAR.Content where

import           Data.Aeson.TH
import           Data.Text     (Text)

data Content = Content { size        :: Integer
                       , compression :: Maybe Integer
                       , mimetype    :: Text
                       , text        :: Maybe Text
                       , encoding    :: Maybe Text
                       , comment     :: Maybe Text
                       } deriving (Eq, Show)

$(deriveJSON defaultOptions ''Content)

