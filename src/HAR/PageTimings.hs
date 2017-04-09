{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module HAR.PageTimings
       (
         PageTimings(..)
       ) where

import           Data.Aeson.TH
import           Data.Text     (Text)

data PageTimings = PageTimings
                   { _pagetimingsOnContentLoad :: Maybe Double
                   , _pagetimingsOnLoad        :: Maybe Double
                   , _pagetimingsComment       :: Maybe Text
                   } deriving (Eq, Show)

$(deriveJSON defaultOptions ''PageTimings)
