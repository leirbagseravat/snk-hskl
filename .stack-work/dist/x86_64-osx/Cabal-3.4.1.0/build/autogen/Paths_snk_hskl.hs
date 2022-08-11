{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_snk_hskl (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/gatavares/leib-projects/functional_programming/snk-hskl/.stack-work/install/x86_64-osx/0f709fa7303764b3eb84a77e64b4a625cd71b5b634194606150b936bc4b347ac/9.0.2/bin"
libdir     = "/Users/gatavares/leib-projects/functional_programming/snk-hskl/.stack-work/install/x86_64-osx/0f709fa7303764b3eb84a77e64b4a625cd71b5b634194606150b936bc4b347ac/9.0.2/lib/x86_64-osx-ghc-9.0.2/snk-hskl-0.1.0.0-8n5pgmOzuiYJ66ZIqP6QAX"
dynlibdir  = "/Users/gatavares/leib-projects/functional_programming/snk-hskl/.stack-work/install/x86_64-osx/0f709fa7303764b3eb84a77e64b4a625cd71b5b634194606150b936bc4b347ac/9.0.2/lib/x86_64-osx-ghc-9.0.2"
datadir    = "/Users/gatavares/leib-projects/functional_programming/snk-hskl/.stack-work/install/x86_64-osx/0f709fa7303764b3eb84a77e64b4a625cd71b5b634194606150b936bc4b347ac/9.0.2/share/x86_64-osx-ghc-9.0.2/snk-hskl-0.1.0.0"
libexecdir = "/Users/gatavares/leib-projects/functional_programming/snk-hskl/.stack-work/install/x86_64-osx/0f709fa7303764b3eb84a77e64b4a625cd71b5b634194606150b936bc4b347ac/9.0.2/libexec/x86_64-osx-ghc-9.0.2/snk-hskl-0.1.0.0"
sysconfdir = "/Users/gatavares/leib-projects/functional_programming/snk-hskl/.stack-work/install/x86_64-osx/0f709fa7303764b3eb84a77e64b4a625cd71b5b634194606150b936bc4b347ac/9.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "snk_hskl_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "snk_hskl_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "snk_hskl_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "snk_hskl_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "snk_hskl_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "snk_hskl_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
