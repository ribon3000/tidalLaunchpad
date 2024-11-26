-- section 1
do
  hush
  d1 $ "bd sd"

-- section 2
do
  hush
  let val1 = pF "val1"
      val2 = pF "val2"
  d1 $ "bd(3,8)"
  d2 $ stack [ -- streams are still monophonic in max, which could actually be cool for breakbeats
              -- later lines overwrite preceding ones of events fall into the same place
              distrib ["9",16,"3 7"] $ s "hdh" # n "36",
              n "46(3,8)" # s "hvh",
              n "39(2,4,1)" # s "hhd",
              n "38(<0 0 0 1>,16,1)" # s "hsh",
              distrib ["9 11",16,"<5 3> 9"] $ n "42" # s "hrh"
              ]
  d3 $ s "sdklfjd" # n ("[55,62,69,76,83]" + "<0 0 2 5>")
  d4 $ outside 8 (loopFirst) $ fast 1 $ struct ("t({11 11 9 5 7}%16,16,{0 0 -1}%8)") $ s "sdfhk" # n (43 + "{0 0 0 12 0 -12 0}%16" + "0 5 -2 7") # legato "{1 0.2 2 1 1 3 0.5}%16" # amp "{0.2 0.2 1 0.2 0.2}%4" # val1 "{0 1 0 0.25 0.5}%8" # val2 (segment 16 $ rand)
-- section 3

do
    hush
    let val1 = pF "val1"
        val2 = pF "val2"
        val3 = pF "val3"
        val4 = pF "val4"
    let pat = slow 1 $
              sometimesBy 0.0 (ply (irand 4)) $ outside 2 (degradeBy 0.3) 
              $ inside 8 palindrome $ fast 2 $ every "<2!8 4!8>" (rev) $ "t(3,8)"
    d1 $ stack [
              struct pat $ s "bd" # n "<30!3 <50 20>>" # legato 1.5 # amp "0.5 1 0.8",
              struct (inv pat) $ s "bd" # n "37" # legato 0.5 # amp "1 0.5" # val4 "0.5 0.1 1" # val1 "<0.1 0.3 0.8>" # val2 "0.5 <0.0 0.9 0.1 0.5 -0.44> 1.0" # val3 (segment 32 rand)
              ]
    d2 $ every 8 (struct pat) $ s "bd*4" # n "36" # amp 1 # velocity 127
    d3 $ s "bd/4" # n ("[60,67,75]" + (slow 4 "<0 5 -2 7>" - 12))
    
-- section 4

do
  hush
  d1 $ s "bd*8" # amp 0.2
  d3 $ s "bd/2" # n ("[60,67,75]" + (slow 4 "<0 5 -2 2 7>" - 24))

-- section 5

do
  hush
  d1 $ s "sdfshssdddk"
  d2 $ s "miessde"
  d5 $ s "sdkesd"

-- section 6

do
  hush

-- section 7

do
  hush
  d1 $ s "bddfd"
  d2 $ s "hs"
  d8 $ s "sdlfdjk"