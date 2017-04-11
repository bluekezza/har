module Data.Time.ISO8601 where

import           Control.Monad
import           Data.Aeson
import           Data.Monoid
import qualified Data.Text as Text
import           Data.Time

newtype ISO8601 = ISO8601
  { unISO8601 :: UTCTime
  } deriving (Eq, Show)

iso8601Format :: String
iso8601Format = iso8601DateFormat (Just "%H:%M:%S%QZ")

parseISO8601 :: (Monad m, ParseTime t) => String -> m t
parseISO8601 = parseTimeM True defaultTimeLocale iso8601Format

parseISO8601OrError :: ParseTime t => String -> t
parseISO8601OrError s =
  case parseISO8601 s of
    Right t -> t
    Left _ -> error $ "parseIso8601OrError: unable to parse " <> s

formatISO8601 :: FormatTime t => t -> String
formatISO8601 = formatTime defaultTimeLocale iso8601Format

instance FromJSON ISO8601 where
  parseJSON (String s) = ISO8601 <$> (parseISO8601 . Text.unpack $ s)
  parseJSON _ = mzero

instance ToJSON ISO8601 where
  toJSON (ISO8601 t) =
    String . Text.pack . formatISO8601 $ t
