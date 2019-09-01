{-# LANGUAGE TypeApplications #-}

module Lib (main) where

import Data.Compact
import Data.Compact.Serialize
import System.Directory (doesFileExist)
import Control.Monad

main :: IO ()
main = do
  let file = "flintstones.compact"
  exists <- doesFileExist file
  unless exists $ do
    putStrLn $ "Writing " <> file
    orig_c <- compact ("Fred Flintstone", ["Wilma", "Barney"])
    writeCompact file orig_c
  putStrLn $ "Reading " <> file
  res <- unsafeReadCompact @(String, [String]) file
  case res of
    Left err -> fail err
    Right c -> print (getCompact c)
