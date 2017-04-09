{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module HAR.Creator
       (
         Creator(..)
       ) where

import           Data.Aeson.Casing
import           Data.Aeson.TH
import           Data.Text     (Text)

data Creator = Creator { _creatorName    :: Text
                       , _creatorVersion :: Text
                       , _creatorComment :: Maybe Text
                       } deriving (Eq, Show)

$(deriveJSON
  (aesonDrop 8 camelCase)
  ''Creator)
