:set -XOverloadedStrings
:set prompt ""

import Sound.Tidal.Context

import System.IO (hSetEncoding, stdout, utf8)
hSetEncoding stdout utf8
-- :{
-- let max = Target {
--         oName="max",
--         oAddress="127.0.0.1",
--         oPort=8000,
--         oLatency=0.2,
--         oSchedule=Live,
--         oWindow=Nothing,
--         oHandshake = False,     -- SuperDirt specific
--         oBusPort = Nothing      -- Also SuperDirt specific
--         }
-- :}

tidal <- startTidal (superdirtTarget {oLatency = 0.3, oAddress = "127.0.0.1", oPort = 8000}) (defaultConfig {cVerbose = True, cFrameTimespan = 1/20})

--tidal <- startTidal (superdirtTarget {oLatency = 0.05, oAddress = "127.0.0.1", oPort = 57120}) (defaultConfig {cVerbose = True, cFrameTimespan = 1/20})

:{
let only = (hush >>)
    p = streamReplace tidal
    hush = streamHush tidal
    panic = do hush
               once $ sound "superpanic"
    list = streamList tidal
    mute = streamMute tidal
    unmute = streamUnmute tidal
    unmuteAll = streamUnmuteAll tidal
    unsoloAll = streamUnsoloAll tidal
    solo = streamSolo tidal
    unsolo = streamUnsolo tidal
    once = streamOnce tidal
    first = streamFirst tidal
    asap = once
    nudgeAll = streamNudgeAll tidal
    all = streamAll tidal
    resetCycles = streamResetCycles tidal
    setCycle = streamSetCycle tidal
    setcps = asap . cps
    getcps = streamGetcps tidal
    getnow = streamGetnow tidal
    xfade i = transition tidal True (Sound.Tidal.Transition.xfadeIn 4) i
    xfadeIn i t = transition tidal True (Sound.Tidal.Transition.xfadeIn t) i
    histpan i t = transition tidal True (Sound.Tidal.Transition.histpan t) i
    wait i t = transition tidal True (Sound.Tidal.Transition.wait t) i
    waitT i f t = transition tidal True (Sound.Tidal.Transition.waitT f t) i
    jump i = transition tidal True (Sound.Tidal.Transition.jump) i
    jumpIn i t = transition tidal True (Sound.Tidal.Transition.jumpIn t) i
    jumpIn' i t = transition tidal True (Sound.Tidal.Transition.jumpIn' t) i
    jumpMod i t = transition tidal True (Sound.Tidal.Transition.jumpMod t) i
    jumpMod' i t p = transition tidal True (Sound.Tidal.Transition.jumpMod' t p) i
    mortal i lifespan release = transition tidal True (Sound.Tidal.Transition.mortal lifespan release) i
    interpolate i = transition tidal True (Sound.Tidal.Transition.interpolate) i
    interpolateIn i t = transition tidal True (Sound.Tidal.Transition.interpolateIn t) i
    clutch i = transition tidal True (Sound.Tidal.Transition.clutch) i
    clutchIn i t = transition tidal True (Sound.Tidal.Transition.clutchIn t) i
    anticipate i = transition tidal True (Sound.Tidal.Transition.anticipate) i
    anticipateIn i t = transition tidal True (Sound.Tidal.Transition.anticipateIn t) i
    forId i t = transition tidal False (Sound.Tidal.Transition.mortalOverlay t) i
    d1 = p 1 . (|< orbit 0)
    d2 = p 2 . (|< orbit 1)
    d3 = p 3 . (|< orbit 2)
    d4 = p 4 . (|< orbit 3)
    d5 = p 5 . (|< orbit 4)
    d6 = p 6 . (|< orbit 5)
    d7 = p 7 . (|< orbit 6)
    d8 = p 8 . (|< orbit 7)
    d9 = p 9 . (|< orbit 8)
    d10 = p 10 . (|< orbit 9)
    d11 = p 11 . (|< orbit 10)
    d12 = p 12 . (|< orbit 11)
    d13 = p 13
    d14 = p 14
    d15 = p 15
    d16 = p 16
:}


:{
let loopAt = loopFirstAt
    loopFirstAt :: Pattern Time -> Pattern a -> Pattern a
    loopFirstAt = tParam _loopFirstAt
    _loopFirstAt :: Time -> Pattern a -> Pattern a
    _loopFirstAt offset p = splitQueries $ p { query = f }
      where
        f st = map
                (\(Event c w p' v) ->
                   Event c (plus <$> w) (plus p') v) $
                query p (st { arc = adjustArc $ arc st })
          where
            s     = start $ arc st
            delta = sam s - offset
            adjustArc = fmap (subtract delta)
            plus = fmap (+ delta)
:}

:{
let val1 = pF "val1"
    val2 = pF "val2"
    val3 = pF "val3"
    val4 = pF "val4"
:}

:{
let loopAt = loopFirstAt
    loopFirstAt :: Pattern Time -> Pattern a -> Pattern a
    loopFirstAt = tParam _loopFirstAt
    _loopFirstAt :: Time -> Pattern a -> Pattern a
    _loopFirstAt offset p = splitQueries $ p { query = f }
      where
        f st = map
                (\(Event c w p' v) ->
                   Event c (plus <$> w) (plus p') v) $
                query p (st { arc = adjustArc $ arc st })
          where
            s     = start $ arc st
            delta = sam s - offset
            adjustArc = fmap (subtract delta)
            plus = fmap (+ delta)
:}

:{
let getState = streamGet tidal
    setI = streamSetI tidal
    setF = streamSetF tidal
    setS = streamSetS tidal
    setR = streamSetR tidal
    setB = streamSetB tidal
:}

:set prompt "tidal> "
:set prompt-cont ""

default (Pattern String, Integer, Double)