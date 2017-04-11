{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

module HAR.PostData where

import           Control.Applicative
import           Control.Monad
import           Data.Aeson
import           Data.Text     (Text)

import           HAR.Param

data PostDataBody
  = PostParams [Param]
  | PostText Text
  deriving (Eq, Show)

data PostData = PostData { _postdataMimeType :: Text
                         , _postdataBody   :: PostDataBody
                         , _postdataComment  :: Maybe Text
                         } deriving (Eq, Show)

-- $(deriveJSON defaultOptions ''PostData)

instance FromJSON PostData where
  parseJSON (Object o) =
    PostData <$> o .: "mimeType" <*>
    ((PostParams <$> (parseJSON =<< o .: "params")) <|>
     (PostText <$> o .: "text")) <*>
    o .: "comment"
  parseJSON _ = mzero

instance ToJSON PostData where
  toJSON PostData {..} =
    let body =
          case _postdataBody of
            PostParams ps -> ["params" .= toJSON ps]
            PostText t -> ["text" .= t]
    in object
         (body ++
          ["mimeType" .= _postdataMimeType, "comment" .= _postdataComment])
