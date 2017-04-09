{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module HAR.Creator
       (
         Creator(..)
       ) where

import           Data.Aeson.TH
import           Data.Text     (Text)

data Creator = Creator { name    :: Text
                       , version :: Text
                       , comment :: Maybe Text
                       } deriving (Eq, Show)

$(deriveJSON defaultOptions ''Creator)
