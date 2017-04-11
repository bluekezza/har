{-# LANGUAGE GADTs #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE QuasiQuotes #-}

{-# OPTIONS_GHC -fno-warn-orphans #-}

module HARSpec where

import Data.Aeson
import Data.Aeson.QQ
import Data.Aeson.Types
import Prelude hiding (log)
import Test.Hspec
import Test.Hspec.QuickCheck
import Test.QuickCheck
import Test.QuickCheck.Instances ()

import HAR

instance Arbitrary HAR where
  arbitrary = HAR <$> arbitrary

instance Arbitrary Log where
  arbitrary =
    Log <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary <*>
    arbitrary

instance Arbitrary Creator where
  arbitrary = Creator <$> arbitrary <*> arbitrary <*> arbitrary

instance Arbitrary Browser where
  arbitrary = Browser <$> arbitrary <*> arbitrary <*> arbitrary

instance Arbitrary Page where
  arbitrary =
    Page <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary

instance Arbitrary Entry where
  arbitrary =
    Entry <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary <*>
    arbitrary <*>
    arbitrary <*>
    arbitrary <*>
    arbitrary <*>
    arbitrary

instance Arbitrary PageTimings where
  arbitrary = PageTimings <$> arbitrary <*> arbitrary <*> arbitrary

instance Arbitrary Request where
  arbitrary =
    Request <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary <*>
    arbitrary <*>
    arbitrary <*>
    arbitrary <*>
    arbitrary <*>
    arbitrary <*>
    arbitrary

instance Arbitrary Response where
  arbitrary =
    Response <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary <*>
    arbitrary <*>
    arbitrary <*>
    arbitrary <*>
    arbitrary <*>
    arbitrary <*>
    arbitrary

instance Arbitrary Cache where
  arbitrary = Cache <$> arbitrary

instance Arbitrary Timings where
  arbitrary =
    Timings <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary <*>
    arbitrary <*>
    arbitrary <*>
    arbitrary <*>
    arbitrary

instance Arbitrary Cookie where
  arbitrary =
    Cookie <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary <*>
    arbitrary <*>
    arbitrary <*>
    arbitrary

instance Arbitrary Header where
  arbitrary =
    Header <$> arbitrary <*> arbitrary <*> arbitrary

instance Arbitrary QueryString where
  arbitrary = QueryString <$> arbitrary <*> arbitrary <*> arbitrary

instance Arbitrary PostData where
  arbitrary = PostData <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary

instance Arbitrary Content where
  arbitrary =
    Content <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary <*>
    arbitrary <*>
    arbitrary

instance Arbitrary Param where
  arbitrary =
    Param <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary

main :: IO ()
main = hspec spec

{-# ANN spec ("HLint: ignore Redundant do" :: String) #-}
spec :: Spec
spec = do
  describe "HAR" $ do
    modifyMaxSize (const 30) $ do
      it "decode . encode == id" $
        property $ \har ->
          eitherDecode (encode har) `shouldBe` (Right har :: Either String HAR)
    it "parses a simple value" $
      fromJSON harJson `shouldBe` Data.Aeson.Types.Success harVal
  return undefined

harVal :: HAR
harVal =
  HAR
  { _harLog =
      Log
      { _logVersion = "1.2"
      , _logCreator =
          Creator
          { _creatorName = "WebInspector"
          , _creatorVersion = "537.36"
          , _creatorComment = Nothing
          }
      , _logBrowser = Nothing
      , _logPages =
          [ Page
            { _pageStartedDateTime = "2017-04-07T17:57:41.438Z"
            , _pageId = "page_1"
            , _pageTitle = "https://example.com/"
            , _pagePageTimings =
                PageTimings
                { _pagetimingsOnContentLoad = Nothing
                , _pagetimingsOnLoad = Nothing
                , _pagetimingsComment = Nothing
                }
            , _pageComment = Nothing
            }
          ]
      , _logEntries =
          [ Entry
            { _entryPageRef = Nothing
            , _entryStartedDateTime = "2017-04-07T17:57:41.438Z"
            , _entryTime = 72.6410000006581
            , _entryRequest =
                Request
                { _requestMethod = "GET"
                , _requestUrl = "https://example.com/"
                , _requestHttpVersion = "unknown"
                , _requestCookies =
                    [ Cookie
                      { _cookieName = "test"
                      , _cookieValue = "1"
                      , _cookiePath = Nothing
                      , _cookieDomain = Nothing
                      , _cookieExpires = Nothing
                      , _cookieHttpOnly = Just False
                      , _cookieSecure = Just False
                      , _cookieComment = Nothing
                      }
                    ]
                , _requestHeaders =
                    [ Header
                      { _headerName = ":path"
                      , _headerValue = "/"
                      , _headerComment = Nothing
                      }
                    , Header
                      { _headerName = "accept-encoding"
                      , _headerValue = "gzip, deflate, sdch, br"
                      , _headerComment = Nothing
                      }
                    , Header
                      { _headerName = "accept-language"
                      , _headerValue = "en-US;q=0.8,en;q=0.6"
                      , _headerComment = Nothing
                      }
                    , Header
                      { _headerName = "upgrade-insecure-requests"
                      , _headerValue = "1"
                      , _headerComment = Nothing
                      }
                    , Header
                      { _headerName = "user-agent"
                      , _headerValue =
                          "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36"
                      , _headerComment = Nothing
                      }
                    , Header
                      { _headerName = "accept"
                      , _headerValue =
                          "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
                      , _headerComment = Nothing
                      }
                    , Header
                      { _headerName = "cache-control"
                      , _headerValue = "max-age=0"
                      , _headerComment = Nothing
                      }
                    , Header
                      { _headerName = ":authority"
                      , _headerValue = "example.com"
                      , _headerComment = Nothing
                      }
                    , Header
                      { _headerName = ":scheme"
                      , _headerValue = "https"
                      , _headerComment = Nothing
                      }
                    , Header
                      { _headerName = ":method"
                      , _headerValue = "GET"
                      , _headerComment = Nothing
                      }
                    ]
                , _requestQueryString = []
                , _requestPostData = Nothing
                , _requestHeadersSize = -1
                , _requestBodySize = 0
                , _requestComment = Nothing
                }
            , _entryResponse =
                Response
                { _responseStatus = 304
                , _responseStatusText = ""
                , _responseHttpVersion = "unknown"
                , _responseCookies = []
                , _responseHeaders =
                    [ Header
                      { _headerName = "status"
                      , _headerValue = "304"
                      , _headerComment = Nothing
                      }
                    , Header
                      { _headerName = "date"
                      , _headerValue = "Mon, 01 Jan 19700 00:00:00 GMT"
                      , _headerComment = Nothing
                      }
                    , Header
                      { _headerName = "server"
                      , _headerValue = "nginx/1.10.0"
                      , _headerComment = Nothing
                      }
                    ]
                , _responseContent =
                    Content
                    { _contentSize = 20
                    , _contentCompression = Nothing
                    , _contentMimeType = "text/html"
                    , _contentText = Just "<h1>Hello Wordl</h1>"
                    , _contentEncoding = Nothing
                    , _contentComment = Nothing
                    }
                , _responseRedirectURL = ""
                , _responseHeadersSize = -1
                , _responseBodySize = 0
                , _responseComment = Nothing
                }
            , _entryCache = Just Cache {_cacheComment = Nothing}
            , _entryTimings =
                Timings
                { _timingsBlocked = 0.602000000071712
                , _timingsDns = -1.0
                , _timingsConnect = -1.0
                , _timingsSend = 1.179999999294528
                , _timingsWait = 67.87600000097886
                , _timingsReceive = 2.983000000312998
                , _timingsSsl = -1.0
                , _timingsComment = Nothing
                }
            , _entryServerIpAddress = Nothing
            , _entryConnection = Just "1"
            , _entryComment = Nothing
            }
          ]
      , _logComment = Nothing
      }
  }


harJson :: Value
harJson = [aesonQQ|
{
  "log": {
    "version": "1.2",
    "creator": {
      "name": "WebInspector",
      "version": "537.36"
    },
    "pages": [
      {
        "startedDateTime": "2017-04-07T17:57:41.438Z",
        "id": "page_1",
        "title": "https://example.com/",
        "pageTimings": {
          "onContentLoad": 591.909000000669,
          "onLoad": 815.7919999994192
        }
      }
    ],
    "entries": [
      {
        "startedDateTime": "2017-04-07T17:57:41.438Z",
        "time": 72.6410000006581,
        "request": {
          "method": "GET",
          "url": "https://example.com/",
          "httpVersion": "unknown",
          "headers": [
            {
              "name": ":path",
              "value": "/"
            },
            {
              "name": "accept-encoding",
              "value": "gzip, deflate, sdch, br"
            },
            {
              "name": "accept-language",
              "value": "en-US;q=0.8,en;q=0.6"
            },
            {
              "name": "upgrade-insecure-requests",
              "value": "1"
            },
            {
              "name": "user-agent",
              "value": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36"
            },
            {
              "name": "accept",
              "value": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
            },
            {
              "name": "cache-control",
              "value": "max-age=0"
            },
            {
              "name": ":authority",
              "value": "example.com"
            },
            {
              "name": ":scheme",
              "value": "https"
            },
            {
              "name": ":method",
              "value": "GET"
            }
          ],
          "queryString": [],
          "cookies": [
            {
              "name": "test",
              "value": "1",
              "expires": null,
              "httpOnly": false,
              "secure": false
            }
          ],
          "headersSize": -1,
          "bodySize": 0
        },
        "response": {
          "status": 304,
          "statusText": "",
          "httpVersion": "unknown",
          "headers": [
            {
              "name": "status",
              "value": "304"
            },
            {
              "name": "date",
              "value": "Mon, 01 Jan 19700 00:00:00 GMT"
            },
            {
              "name": "server",
              "value": "nginx/1.10.0"
            }
          ],
          "cookies": [],
          "content": {
            "size": 20,
            "mimeType": "text/html",
            "text": "<h1>Hello Wordl</h1>"
          },
          "redirectURL": "",
          "headersSize": -1,
          "bodySize": 0
        },
        "cache": {},
        "timings": {
          "blocked": 0.602000000071712,
          "dns": -1,
          "connect": -1,
          "send": 1.179999999294528,
          "wait": 67.87600000097886,
          "receive": 2.983000000312998,
          "ssl": -1
        },
        "serverIPAddress": "1.2.3.4",
        "connection": "1",
        "pageref": "page_1"
      }
    ]
  }
}
|]
