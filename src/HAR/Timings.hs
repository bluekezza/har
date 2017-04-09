{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module HAR.Timings
       (
         Timings(..)
       ) where

import           Data.Aeson.Casing
import           Data.Aeson.TH
import           Data.Text     (Text)

data Timings = Timings { _timingsBlocked :: Double
                       , _timingsDns     :: Double
                       , _timingsConnect :: Double
                       , _timingsSend    :: Double
                       , _timingsWait    :: Double
                       , _timingsReceive :: Double
                       , _timingsSsl     :: Double
                       , _timingsComment :: Maybe Text
                       } deriving (Eq, Show)

$(deriveJSON
  (aesonDrop 8 camelCase)
  ''Timings)
