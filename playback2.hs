-- scene 1
do
  hush
  d1 $ outside 4 loopFirst $ sew "0@3 1@3"
    (stack [s "{t ~ ~}%16" # amp 0.26906435173630144, s "{~ ~ ~ ~ ~ ~ t ~}%16"])
    (stack [s "{~ ~ ~ t}%16" # amp 0.5368693229529086, s "{~ ~ ~ ~ ~ ~ t}%16"]) # n 36
  d2 $ outside 5 loopFirst $ sew "0@2 1@4"
    (stack [s "{~ ~ ~ t ~ ~ ~ ~}%16" # amp 0.41713506233695585, s "{~ ~ ~ ~ t}%16"])
    (stack [s "{t ~ ~ ~ ~ ~ ~}%16" # amp 0.5204944201898516, s "{~ ~ ~ ~ ~ ~ t}%16"]) # n 36
  d4 $ outside 6 loopFirst $ sew "0@3 1@5"
    (stack [s "{~ ~ ~ t ~ ~ ~}%16" # amp 0.30481525695995004, s "{~ t}%16"])
    (stack [s "{t ~ ~ ~}%16" # amp 0.47059760722362715, s "{~ ~ ~ ~ ~ ~ t}%16"]) # n 36
