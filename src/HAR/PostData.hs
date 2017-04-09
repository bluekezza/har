{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module HAR.PostData where

import           Data.Aeson.TH
import           Data.Text     (Text)

import           HAR.Param

data PostData = PostData { _postdataMimeType :: Text
                         , _postdataParams   :: [Param]
                         , _postdataText     :: Text
                         , _postdataComment  :: Maybe Text
                         } deriving (Eq, Show)

$(deriveJSON defaultOptions ''PostData)
