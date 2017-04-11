{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE NoImplicitPrelude  #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell  #-}

module HAR
  ( HAR (..)
  , Log  (..)
  , Browser (..)
  , Cache (..)
  , Content (..)
  , Cookie (..)
  , Creator (..)
  , Entry (..)
  , Header (..)
  , Page (..)
  , PageTimings (..)
  , Param (..)
  , PostDataBody (..)
  , PostData (..)
  , QueryString (..)
  , Request (..)
  , Response (..)
  , Timings (..)
  , HasLog (..)
  , HasName (..)
  , HasComment (..)
  , HasValue (..)
  , HasVersion (..)
  , HasText (..)
  , HasSize (..)
  , HasMimeType (..)
  , HasEncoding (..)
  , HasCompression (..)
  , HasSecure (..)
  , HasPath (..)
  , HasHttpOnly (..)
  , HasExpires (..)
  , HasDomain (..)
  , HasTimings (..)
  , HasTime (..)
  , HasStartedDateTime (..)
  , HasServerIpAddress (..)
  , HasResponse (..)
  , HasRequest (..)
  , HasPageRef (..)
  , HasConnection (..)
  , HasCache (..)
  , HasPages (..)
  , HasEntries (..)
  , HasCreator (..)
  , HasBrowser (..)
  , HasTitle (..)
  , HasPageTimings (..)
  , HasId (..)
  , HasFileName (..)
  , HasContentType (..)
  , HasUrl (..)
  , HasQueryString (..)
  , HasPostData (..)
  , HasMethod (..)
  , HasHttpVersion (..)
  , HasHeadersSize (..)
  , HasHeaders (..)
  , HasCookies (..)
  , HasBodySize (..)
  , HasStatusText (..)
  , HasStatus (..)
  , HasRedirectURL (..)
  , HasContent (..)
  , HasWait (..)
  , HasSsl (..)
  , HasSend (..)
  , HasReceive (..)
  , HasDns (..)
  , HasConnect (..)
  , HasBlocked (..)
  )
where

import           Control.Lens
import           Data.Aeson.Casing
import           Data.Aeson.TH
import           Prelude hiding (id, log)

import           HAR.Log
import           HAR.Browser
import           HAR.Cache
import           HAR.Content
import           HAR.Cookie
import           HAR.Creator
import           HAR.Entry
import           HAR.Header
import           HAR.Page
import           HAR.PageTimings
import           HAR.Param
import           HAR.PostData
import           HAR.QueryString
import           HAR.Request
import           HAR.Response
import           HAR.Timings

data HAR = HAR { _harLog :: Log }
         deriving (Eq, Show)

$(deriveJSON
  (aesonDrop 4 camelCase)
  ''HAR)

-- for some reason makeFIelds doesn't generate anything for HAR
makeLensesWith abbreviatedFields ''HAR
makeFields ''QueryString
makeFields ''Browser
makeFields ''Cache
makeFields ''Content
makeFields ''Cookie
makeFields ''Creator
makeFields ''Entry
makeFields ''Header
makeFields ''Log
makeFields ''Page
makeFields ''PageTimings
makeFields ''Param
makeFields ''PostData
makeFields ''Request
makeFields ''Response
makeFields ''Timings
