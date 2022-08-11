{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

module Lib where

import SDL
import Linear

run :: IO ()
run = do
        initializeAll
        window <- createWindow "Funcional Snake" defaultWindow { windowInitialSize = V2 1200 800 }
        renderer <- createRenderer window (-1) defaultRenderer
        appLoop renderer initialGameState

data GameState =
  GameState
  { _x :: Int
  , _y :: Int
  }

initialGameState :: GameState
initialGameState = GameState { _x = 4, _y = 10 }

appLoop :: Renderer -> GameState -> IO ()
appLoop renderer state@GameState {..}  = do
  rendererDrawColor renderer $= V4 0 0 0 255
  clear renderer
  present renderer
  appLoop renderer state
