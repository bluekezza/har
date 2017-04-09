{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module HAR where

import           Data.Aeson.TH

import           HAR.Log

data HAR = HAR { log :: Log }
         deriving (Eq, Show)

$(deriveJSON defaultOptions ''HAR)
