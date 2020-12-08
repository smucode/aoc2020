module Data exposing (..)

import Array


bootcode =
    [ ( "acc", -7 )
    , ( "acc", 2 )
    , ( "acc", 20 )
    , ( "acc", 14 )
    , ( "jmp", 191 )
    , ( "acc", 47 )
    , ( "nop", 339 )
    , ( "acc", 49 )
    , ( "jmp", 104 )
    , ( "jmp", 629 )
    , ( "jmp", 374 )
    , ( "acc", 24 )
    , ( "jmp", 220 )
    , ( "nop", 474 )
    , ( "acc", 25 )
    , ( "jmp", 340 )
    , ( "acc", 16 )
    , ( "acc", 3 )
    , ( "acc", 41 )
    , ( "jmp", 566 )
    , ( "jmp", 296 )
    , ( "acc", 15 )
    , ( "jmp", 452 )
    , ( "acc", 21 )
    , ( "jmp", 129 )
    , ( "acc", 10 )
    , ( "acc", -8 )
    , ( "acc", 39 )
    , ( "jmp", 396 )
    , ( "acc", 5 )
    , ( "acc", -4 )
    , ( "acc", 0 )
    , ( "jmp", 496 )
    , ( "nop", 181 )
    , ( "acc", 48 )
    , ( "acc", 7 )
    , ( "jmp", 1 )
    , ( "jmp", 370 )
    , ( "acc", 16 )
    , ( "acc", -18 )
    , ( "acc", 47 )
    , ( "acc", 48 )
    , ( "jmp", 99 )
    , ( "nop", 17 )
    , ( "acc", 25 )
    , ( "acc", -15 )
    , ( "jmp", 285 )
    , ( "nop", 545 )
    , ( "nop", 147 )
    , ( "nop", 479 )
    , ( "acc", -4 )
    , ( "jmp", 386 )
    , ( "acc", 36 )
    , ( "acc", -12 )
    , ( "jmp", 50 )
    , ( "acc", 37 )
    , ( "nop", 133 )
    , ( "acc", 11 )
    , ( "acc", 20 )
    , ( "jmp", 32 )
    , ( "jmp", 1 )
    , ( "nop", 210 )
    , ( "acc", -15 )
    , ( "acc", -6 )
    , ( "jmp", 446 )
    , ( "acc", 25 )
    , ( "acc", 1 )
    , ( "acc", 17 )
    , ( "acc", -4 )
    , ( "jmp", 355 )
    , ( "acc", -4 )
    , ( "jmp", 292 )
    , ( "acc", 16 )
    , ( "acc", 44 )
    , ( "acc", 26 )
    , ( "jmp", 157 )
    , ( "acc", -18 )
    , ( "acc", 15 )
    , ( "acc", -8 )
    , ( "acc", -3 )
    , ( "jmp", 46 )
    , ( "acc", 30 )
    , ( "acc", 16 )
    , ( "jmp", -7 )
    , ( "acc", 34 )
    , ( "jmp", 515 )
    , ( "acc", 11 )
    , ( "acc", -8 )
    , ( "acc", -9 )
    , ( "acc", -3 )
    , ( "jmp", 548 )
    , ( "jmp", 278 )
    , ( "nop", 332 )
    , ( "acc", -19 )
    , ( "acc", 49 )
    , ( "jmp", 536 )
    , ( "acc", -9 )
    , ( "acc", 46 )
    , ( "jmp", 124 )
    , ( "acc", 41 )
    , ( "acc", 47 )
    , ( "acc", -5 )
    , ( "acc", -13 )
    , ( "jmp", 41 )
    , ( "nop", 178 )
    , ( "acc", 12 )
    , ( "acc", 45 )
    , ( "jmp", 461 )
    , ( "acc", 37 )
    , ( "acc", 12 )
    , ( "acc", 38 )
    , ( "jmp", -68 )
    , ( "acc", -6 )
    , ( "nop", 494 )
    , ( "acc", -9 )
    , ( "jmp", -63 )
    , ( "acc", 42 )
    , ( "acc", 16 )
    , ( "acc", 30 )
    , ( "jmp", 70 )
    , ( "acc", 13 )
    , ( "jmp", 1 )
    , ( "acc", -18 )
    , ( "jmp", 528 )
    , ( "acc", 48 )
    , ( "jmp", 493 )
    , ( "nop", 402 )
    , ( "jmp", 381 )
    , ( "acc", -8 )
    , ( "jmp", 372 )
    , ( "acc", 20 )
    , ( "acc", 25 )
    , ( "jmp", 425 )
    , ( "acc", -10 )
    , ( "jmp", 510 )
    , ( "jmp", 439 )
    , ( "nop", 78 )
    , ( "acc", 36 )
    , ( "acc", 7 )
    , ( "nop", 281 )
    , ( "jmp", 504 )
    , ( "jmp", -108 )
    , ( "acc", 40 )
    , ( "jmp", -122 )
    , ( "acc", 23 )
    , ( "acc", -2 )
    , ( "acc", 7 )
    , ( "jmp", 370 )
    , ( "acc", 25 )
    , ( "nop", -5 )
    , ( "acc", 33 )
    , ( "acc", 37 )
    , ( "jmp", 70 )
    , ( "acc", -6 )
    , ( "nop", 336 )
    , ( "jmp", 34 )
    , ( "jmp", 1 )
    , ( "acc", -18 )
    , ( "jmp", 473 )
    , ( "jmp", 1 )
    , ( "acc", 20 )
    , ( "acc", 4 )
    , ( "acc", 25 )
    , ( "jmp", -87 )
    , ( "acc", -12 )
    , ( "acc", 47 )
    , ( "acc", 49 )
    , ( "jmp", 323 )
    , ( "jmp", 1 )
    , ( "jmp", 1 )
    , ( "jmp", 167 )
    , ( "acc", -10 )
    , ( "acc", 45 )
    , ( "jmp", 355 )
    , ( "acc", 32 )
    , ( "acc", 38 )
    , ( "acc", 2 )
    , ( "jmp", -93 )
    , ( "acc", 8 )
    , ( "acc", 20 )
    , ( "acc", 4 )
    , ( "acc", -1 )
    , ( "jmp", 108 )
    , ( "nop", 164 )
    , ( "acc", 41 )
    , ( "jmp", 440 )
    , ( "acc", -16 )
    , ( "acc", 47 )
    , ( "jmp", 355 )
    , ( "acc", -13 )
    , ( "acc", 29 )
    , ( "acc", 50 )
    , ( "jmp", -101 )
    , ( "acc", -8 )
    , ( "jmp", 316 )
    , ( "acc", 27 )
    , ( "acc", 31 )
    , ( "nop", -29 )
    , ( "jmp", 1 )
    , ( "jmp", 250 )
    , ( "acc", 12 )
    , ( "acc", -13 )
    , ( "jmp", 73 )
    , ( "jmp", 72 )
    , ( "acc", 36 )
    , ( "acc", 44 )
    , ( "jmp", 1 )
    , ( "jmp", -33 )
    , ( "acc", -18 )
    , ( "acc", 16 )
    , ( "acc", -8 )
    , ( "acc", 6 )
    , ( "jmp", 104 )
    , ( "jmp", 295 )
    , ( "acc", 10 )
    , ( "nop", -80 )
    , ( "jmp", 74 )
    , ( "acc", -13 )
    , ( "jmp", 1 )
    , ( "acc", 22 )
    , ( "acc", 50 )
    , ( "jmp", 280 )
    , ( "jmp", 265 )
    , ( "jmp", 278 )
    , ( "acc", 46 )
    , ( "acc", -14 )
    , ( "acc", -17 )
    , ( "jmp", -19 )
    , ( "acc", 39 )
    , ( "acc", 31 )
    , ( "acc", -11 )
    , ( "jmp", 400 )
    , ( "jmp", 80 )
    , ( "acc", 0 )
    , ( "acc", 27 )
    , ( "nop", 209 )
    , ( "jmp", -184 )
    , ( "acc", 12 )
    , ( "acc", 21 )
    , ( "acc", 23 )
    , ( "jmp", 352 )
    , ( "acc", 29 )
    , ( "jmp", -5 )
    , ( "acc", 15 )
    , ( "acc", 7 )
    , ( "jmp", 6 )
    , ( "acc", 31 )
    , ( "acc", -5 )
    , ( "nop", 83 )
    , ( "acc", 31 )
    , ( "jmp", -239 )
    , ( "acc", 8 )
    , ( "acc", -2 )
    , ( "acc", 49 )
    , ( "acc", -12 )
    , ( "jmp", -52 )
    , ( "acc", -15 )
    , ( "acc", -14 )
    , ( "jmp", 126 )
    , ( "jmp", 385 )
    , ( "acc", 30 )
    , ( "acc", -5 )
    , ( "acc", 6 )
    , ( "jmp", -187 )
    , ( "acc", 39 )
    , ( "acc", 40 )
    , ( "acc", 0 )
    , ( "acc", 6 )
    , ( "jmp", 24 )
    , ( "acc", 20 )
    , ( "jmp", 131 )
    , ( "jmp", -127 )
    , ( "acc", 8 )
    , ( "acc", 30 )
    , ( "jmp", -265 )
    , ( "acc", -2 )
    , ( "jmp", -265 )
    , ( "acc", 22 )
    , ( "acc", -19 )
    , ( "acc", -9 )
    , ( "nop", 10 )
    , ( "jmp", 148 )
    , ( "acc", -14 )
    , ( "acc", 38 )
    , ( "acc", 50 )
    , ( "acc", -7 )
    , ( "jmp", 197 )
    , ( "acc", 11 )
    , ( "acc", 22 )
    , ( "jmp", 201 )
    , ( "jmp", -155 )
    , ( "jmp", -32 )
    , ( "acc", 48 )
    , ( "nop", -50 )
    , ( "jmp", -99 )
    , ( "jmp", -5 )
    , ( "acc", 11 )
    , ( "acc", -18 )
    , ( "jmp", -186 )
    , ( "acc", 6 )
    , ( "acc", 43 )
    , ( "jmp", 159 )
    , ( "jmp", 249 )
    , ( "acc", 44 )
    , ( "acc", 29 )
    , ( "nop", 313 )
    , ( "acc", 23 )
    , ( "jmp", 311 )
    , ( "jmp", 152 )
    , ( "acc", 0 )
    , ( "acc", 41 )
    , ( "jmp", -251 )
    , ( "jmp", 102 )
    , ( "nop", -17 )
    , ( "nop", 176 )
    , ( "jmp", 40 )
    , ( "acc", 28 )
    , ( "jmp", -21 )
    , ( "acc", -4 )
    , ( "acc", -10 )
    , ( "acc", -19 )
    , ( "acc", -15 )
    , ( "jmp", 23 )
    , ( "nop", 144 )
    , ( "acc", 9 )
    , ( "acc", 18 )
    , ( "jmp", 141 )
    , ( "acc", -19 )
    , ( "acc", -10 )
    , ( "acc", 48 )
    , ( "jmp", -7 )
    , ( "acc", 46 )
    , ( "acc", -9 )
    , ( "jmp", -174 )
    , ( "acc", 30 )
    , ( "acc", 30 )
    , ( "jmp", -201 )
    , ( "acc", 34 )
    , ( "acc", 24 )
    , ( "acc", 37 )
    , ( "acc", 44 )
    , ( "jmp", -158 )
    , ( "acc", 4 )
    , ( "acc", 39 )
    , ( "jmp", -52 )
    , ( "jmp", -329 )
    , ( "jmp", 68 )
    , ( "acc", 25 )
    , ( "nop", -105 )
    , ( "acc", -15 )
    , ( "acc", 34 )
    , ( "jmp", -6 )
    , ( "jmp", 1 )
    , ( "acc", 1 )
    , ( "jmp", 163 )
    , ( "nop", -285 )
    , ( "acc", 8 )
    , ( "acc", 48 )
    , ( "jmp", 143 )
    , ( "acc", -3 )
    , ( "nop", -269 )
    , ( "acc", -16 )
    , ( "jmp", -310 )
    , ( "acc", -5 )
    , ( "jmp", -304 )
    , ( "acc", 45 )
    , ( "nop", -231 )
    , ( "jmp", 1 )
    , ( "jmp", 245 )
    , ( "nop", -243 )
    , ( "jmp", 187 )
    , ( "acc", -6 )
    , ( "acc", 7 )
    , ( "acc", 17 )
    , ( "acc", 6 )
    , ( "jmp", -111 )
    , ( "acc", 24 )
    , ( "acc", -10 )
    , ( "acc", 21 )
    , ( "jmp", -97 )
    , ( "jmp", 1 )
    , ( "acc", -12 )
    , ( "acc", 10 )
    , ( "jmp", 127 )
    , ( "acc", 0 )
    , ( "jmp", -211 )
    , ( "acc", -11 )
    , ( "acc", 36 )
    , ( "acc", 45 )
    , ( "acc", -19 )
    , ( "jmp", -182 )
    , ( "jmp", -366 )
    , ( "acc", 38 )
    , ( "acc", -11 )
    , ( "acc", 32 )
    , ( "jmp", -260 )
    , ( "acc", 6 )
    , ( "acc", 31 )
    , ( "jmp", 3 )
    , ( "acc", 5 )
    , ( "jmp", 101 )
    , ( "jmp", -64 )
    , ( "acc", 48 )
    , ( "acc", 5 )
    , ( "nop", 40 )
    , ( "acc", -13 )
    , ( "jmp", 95 )
    , ( "nop", 76 )
    , ( "acc", 44 )
    , ( "acc", 43 )
    , ( "acc", 43 )
    , ( "jmp", 196 )
    , ( "acc", 34 )
    , ( "jmp", 161 )
    , ( "acc", 5 )
    , ( "acc", 45 )
    , ( "acc", 7 )
    , ( "jmp", 20 )
    , ( "acc", 13 )
    , ( "jmp", -127 )
    , ( "acc", 5 )
    , ( "acc", 18 )
    , ( "jmp", -239 )
    , ( "jmp", -76 )
    , ( "nop", 214 )
    , ( "jmp", -284 )
    , ( "acc", 10 )
    , ( "acc", -8 )
    , ( "jmp", -81 )
    , ( "acc", 48 )
    , ( "acc", -3 )
    , ( "jmp", -55 )
    , ( "nop", -288 )
    , ( "acc", 37 )
    , ( "acc", 1 )
    , ( "acc", -12 )
    , ( "jmp", 1 )
    , ( "nop", 91 )
    , ( "acc", 20 )
    , ( "acc", 18 )
    , ( "jmp", 4 )
    , ( "acc", -7 )
    , ( "acc", -10 )
    , ( "jmp", -229 )
    , ( "nop", -230 )
    , ( "nop", 45 )
    , ( "acc", 37 )
    , ( "jmp", 127 )
    , ( "jmp", 69 )
    , ( "jmp", -153 )
    , ( "acc", -15 )
    , ( "acc", -19 )
    , ( "acc", 32 )
    , ( "jmp", -33 )
    , ( "nop", 164 )
    , ( "acc", 32 )
    , ( "jmp", -133 )
    , ( "acc", 20 )
    , ( "acc", -8 )
    , ( "jmp", 8 )
    , ( "acc", -11 )
    , ( "nop", 82 )
    , ( "acc", 7 )
    , ( "acc", 40 )
    , ( "jmp", 79 )
    , ( "acc", 0 )
    , ( "jmp", 159 )
    , ( "acc", 4 )
    , ( "acc", -8 )
    , ( "acc", 20 )
    , ( "nop", 143 )
    , ( "jmp", -351 )
    , ( "acc", -7 )
    , ( "jmp", 78 )
    , ( "acc", 0 )
    , ( "acc", 4 )
    , ( "jmp", 20 )
    , ( "jmp", -3 )
    , ( "acc", 2 )
    , ( "acc", 23 )
    , ( "jmp", -256 )
    , ( "acc", 33 )
    , ( "jmp", -473 )
    , ( "acc", 29 )
    , ( "acc", -13 )
    , ( "jmp", 77 )
    , ( "jmp", 158 )
    , ( "acc", -16 )
    , ( "jmp", -10 )
    , ( "jmp", -181 )
    , ( "jmp", -135 )
    , ( "nop", -95 )
    , ( "acc", 46 )
    , ( "acc", 39 )
    , ( "acc", -3 )
    , ( "jmp", -94 )
    , ( "jmp", -67 )
    , ( "acc", 49 )
    , ( "nop", -78 )
    , ( "nop", -9 )
    , ( "jmp", 107 )
    , ( "acc", -19 )
    , ( "acc", -1 )
    , ( "acc", 0 )
    , ( "acc", -4 )
    , ( "jmp", -189 )
    , ( "acc", 11 )
    , ( "jmp", -106 )
    , ( "jmp", -200 )
    , ( "jmp", 122 )
    , ( "acc", 8 )
    , ( "acc", 48 )
    , ( "acc", 15 )
    , ( "acc", 0 )
    , ( "jmp", -493 )
    , ( "acc", 13 )
    , ( "jmp", -8 )
    , ( "acc", 36 )
    , ( "acc", -10 )
    , ( "jmp", 1 )
    , ( "acc", 9 )
    , ( "jmp", 7 )
    , ( "jmp", 85 )
    , ( "acc", 22 )
    , ( "acc", -8 )
    , ( "nop", -124 )
    , ( "jmp", -517 )
    , ( "jmp", -338 )
    , ( "acc", 39 )
    , ( "nop", -438 )
    , ( "acc", -11 )
    , ( "jmp", 69 )
    , ( "acc", 8 )
    , ( "acc", 34 )
    , ( "acc", 34 )
    , ( "acc", -9 )
    , ( "jmp", -205 )
    , ( "nop", -528 )
    , ( "jmp", -495 )
    , ( "acc", 47 )
    , ( "acc", 40 )
    , ( "acc", 30 )
    , ( "jmp", -328 )
    , ( "acc", -2 )
    , ( "acc", 41 )
    , ( "jmp", -475 )
    , ( "acc", 42 )
    , ( "acc", 48 )
    , ( "acc", 2 )
    , ( "acc", 7 )
    , ( "jmp", -415 )
    , ( "nop", -249 )
    , ( "acc", -3 )
    , ( "jmp", 65 )
    , ( "acc", 23 )
    , ( "nop", -4 )
    , ( "jmp", -254 )
    , ( "acc", -12 )
    , ( "acc", 22 )
    , ( "acc", 27 )
    , ( "jmp", -176 )
    , ( "jmp", -408 )
    , ( "acc", -15 )
    , ( "acc", 14 )
    , ( "acc", 30 )
    , ( "acc", 0 )
    , ( "jmp", -363 )
    , ( "jmp", -426 )
    , ( "acc", 38 )
    , ( "nop", -425 )
    , ( "jmp", -440 )
    , ( "jmp", 1 )
    , ( "acc", 22 )
    , ( "jmp", -63 )
    , ( "jmp", -406 )
    , ( "nop", -445 )
    , ( "acc", -5 )
    , ( "acc", 34 )
    , ( "nop", -425 )
    , ( "jmp", 65 )
    , ( "acc", 33 )
    , ( "jmp", -91 )
    , ( "acc", -12 )
    , ( "jmp", 1 )
    , ( "jmp", -541 )
    , ( "nop", -489 )
    , ( "jmp", -490 )
    , ( "acc", 20 )
    , ( "acc", 20 )
    , ( "acc", 38 )
    , ( "acc", -18 )
    , ( "jmp", -548 )
    , ( "acc", 43 )
    , ( "acc", -7 )
    , ( "jmp", -351 )
    , ( "acc", -9 )
    , ( "acc", 50 )
    , ( "acc", 1 )
    , ( "nop", -587 )
    , ( "jmp", -230 )
    , ( "jmp", 1 )
    , ( "nop", 43 )
    , ( "jmp", -65 )
    , ( "acc", 31 )
    , ( "acc", 5 )
    , ( "acc", 1 )
    , ( "jmp", -105 )
    , ( "nop", -477 )
    , ( "acc", 21 )
    , ( "nop", -92 )
    , ( "jmp", -263 )
    , ( "acc", 28 )
    , ( "jmp", -265 )
    , ( "jmp", -311 )
    , ( "acc", 2 )
    , ( "acc", 23 )
    , ( "acc", 50 )
    , ( "jmp", -4 )
    , ( "acc", 42 )
    , ( "acc", 42 )
    , ( "acc", 31 )
    , ( "jmp", -167 )
    , ( "acc", 49 )
    , ( "acc", 46 )
    , ( "jmp", -73 )
    , ( "nop", -135 )
    , ( "acc", 43 )
    , ( "jmp", -236 )
    , ( "acc", -14 )
    , ( "acc", -3 )
    , ( "jmp", -406 )
    , ( "acc", 2 )
    , ( "acc", -3 )
    , ( "acc", 47 )
    , ( "jmp", -420 )
    , ( "acc", -8 )
    , ( "acc", 18 )
    , ( "jmp", -604 )
    , ( "jmp", -218 )
    , ( "acc", 37 )
    , ( "acc", -16 )
    , ( "nop", -278 )
    , ( "acc", -15 )
    , ( "jmp", -214 )
    , ( "acc", -6 )
    , ( "acc", 18 )
    , ( "acc", 7 )
    , ( "acc", 0 )
    , ( "jmp", -252 )
    , ( "acc", 14 )
    , ( "jmp", -266 )
    , ( "acc", 27 )
    , ( "acc", -16 )
    , ( "nop", -533 )
    , ( "nop", -534 )
    , ( "jmp", 1 )
    ]


bags =
    [ "dim silver bags contain 3 posh fuchsia bags."
    , "wavy olive bags contain 1 striped olive bag, 1 dull cyan bag."
    , "dull coral bags contain 1 dim olive bag, 5 muted violet bags, 2 dark gray bags."
    , "bright olive bags contain 3 light indigo bags, 3 dark coral bags."
    , "clear lavender bags contain 1 dark olive bag."
    , "dim lime bags contain 3 dotted red bags."
    , "drab indigo bags contain 5 striped coral bags, 2 muted bronze bags."
    , "striped orange bags contain 5 wavy fuchsia bags, 5 clear red bags, 3 plaid red bags."
    , "dotted indigo bags contain 2 plaid white bags, 1 wavy gold bag, 1 plaid silver bag."
    , "posh crimson bags contain 3 clear crimson bags, 5 dotted silver bags, 3 dull crimson bags, 5 wavy violet bags."
    , "mirrored tan bags contain 1 plaid white bag, 3 vibrant beige bags, 3 drab silver bags, 1 pale blue bag."
    , "dull turquoise bags contain 5 plaid magenta bags, 3 bright aqua bags, 1 dim purple bag, 1 wavy orange bag."
    , "dark tomato bags contain 1 plaid gray bag."
    , "shiny red bags contain 4 vibrant maroon bags, 5 faded bronze bags."
    , "clear tan bags contain 4 pale lime bags, 4 faded plum bags."
    , "mirrored plum bags contain 1 wavy silver bag, 4 dim purple bags, 3 dim coral bags."
    , "dotted orange bags contain 4 pale aqua bags, 3 dotted aqua bags, 4 clear beige bags."
    , "wavy lime bags contain 5 dim salmon bags, 4 dark violet bags, 4 clear turquoise bags."
    , "faded gray bags contain 2 dotted lime bags, 5 plaid tomato bags."
    , "pale orange bags contain 5 faded maroon bags."
    , "shiny lime bags contain 3 striped olive bags, 5 light fuchsia bags, 1 pale crimson bag, 1 pale salmon bag."
    , "drab red bags contain 5 muted chartreuse bags, 4 clear purple bags, 4 drab silver bags, 3 posh green bags."
    , "plaid plum bags contain 2 dim blue bags, 1 dim coral bag."
    , "clear red bags contain 3 plaid teal bags, 4 vibrant orange bags, 1 pale red bag."
    , "dark yellow bags contain 5 mirrored lavender bags, 5 dull bronze bags, 4 pale salmon bags, 5 wavy crimson bags."
    , "clear violet bags contain 5 clear turquoise bags, 3 clear beige bags, 4 dim plum bags."
    , "plaid cyan bags contain no other bags."
    , "light salmon bags contain 3 dull yellow bags, 2 vibrant violet bags, 2 dark orange bags, 1 light magenta bag."
    , "dim indigo bags contain 2 vibrant orange bags, 3 drab teal bags, 4 plaid indigo bags."
    , "shiny magenta bags contain 1 dark salmon bag, 4 shiny gray bags, 2 mirrored purple bags."
    , "drab coral bags contain 5 pale crimson bags, 1 mirrored aqua bag, 4 light red bags."
    , "muted blue bags contain 1 dark green bag, 5 muted salmon bags, 4 posh beige bags, 4 pale salmon bags."
    , "plaid salmon bags contain 5 striped white bags, 4 posh fuchsia bags, 5 faded turquoise bags."
    , "vibrant bronze bags contain 1 bright orange bag, 2 bright plum bags."
    , "dull salmon bags contain 2 pale crimson bags, 3 dark tan bags, 5 light plum bags."
    , "striped magenta bags contain 4 wavy yellow bags, 3 bright chartreuse bags, 5 plaid cyan bags."
    , "light olive bags contain 5 vibrant beige bags, 3 faded tomato bags, 1 dark indigo bag."
    , "faded turquoise bags contain 2 shiny salmon bags, 3 wavy crimson bags, 5 dim yellow bags, 1 posh salmon bag."
    , "pale fuchsia bags contain 2 posh blue bags, 4 mirrored blue bags, 3 wavy silver bags, 2 wavy crimson bags."
    , "dotted tomato bags contain 2 dotted lime bags, 1 wavy teal bag, 1 mirrored black bag, 3 dull gold bags."
    , "shiny maroon bags contain 5 striped salmon bags."
    , "vibrant gray bags contain 5 clear tan bags, 5 plaid crimson bags, 3 striped cyan bags, 1 dark gold bag."
    , "muted tomato bags contain 1 dull salmon bag."
    , "striped salmon bags contain 4 plaid white bags, 5 dim salmon bags, 4 vibrant lime bags."
    , "light tan bags contain 2 posh lavender bags, 5 shiny aqua bags."
    , "wavy brown bags contain 2 posh lavender bags."
    , "drab beige bags contain 5 plaid coral bags, 3 bright turquoise bags, 5 dark purple bags, 3 mirrored black bags."
    , "bright tomato bags contain 1 bright teal bag, 2 bright tan bags, 2 dotted salmon bags."
    , "dim tan bags contain 2 striped cyan bags, 5 wavy green bags, 3 drab beige bags."
    , "light plum bags contain 4 clear silver bags, 1 vibrant chartreuse bag."
    , "light black bags contain 1 muted tan bag, 2 dim yellow bags."
    , "clear orange bags contain 5 mirrored violet bags, 1 wavy salmon bag, 3 dim plum bags."
    , "bright gray bags contain 5 dim blue bags, 1 dotted red bag, 5 mirrored aqua bags."
    , "striped cyan bags contain 4 striped teal bags, 1 dark tan bag, 1 dim green bag."
    , "shiny olive bags contain 1 dark aqua bag, 2 muted lime bags."
    , "clear brown bags contain 5 dark salmon bags."
    , "dotted tan bags contain 2 plaid brown bags."
    , "light green bags contain 5 plaid silver bags, 5 posh aqua bags, 3 dull green bags, 5 faded red bags."
    , "posh coral bags contain 1 muted teal bag."
    , "drab green bags contain 1 dotted blue bag."
    , "dark fuchsia bags contain 2 wavy tomato bags, 3 faded plum bags."
    , "vibrant purple bags contain 3 posh tomato bags, 4 dim purple bags, 5 plaid brown bags, 4 dotted red bags."
    , "vibrant tomato bags contain 5 wavy orange bags, 1 striped teal bag."
    , "faded coral bags contain 5 dotted maroon bags, 2 light tan bags, 1 plaid black bag, 4 dark indigo bags."
    , "posh gold bags contain 4 mirrored plum bags."
    , "muted beige bags contain 2 pale brown bags, 4 dull black bags, 4 vibrant blue bags."
    , "dull green bags contain 3 drab silver bags, 5 dotted red bags, 3 mirrored violet bags, 3 bright black bags."
    , "dark lime bags contain 5 light chartreuse bags, 3 pale magenta bags, 1 dull indigo bag."
    , "dark orange bags contain 1 dark crimson bag, 2 clear turquoise bags, 2 dotted silver bags."
    , "muted yellow bags contain 2 pale salmon bags, 3 bright plum bags, 3 shiny aqua bags, 5 plaid cyan bags."
    , "vibrant white bags contain 5 dim coral bags, 5 dim bronze bags."
    , "posh white bags contain 2 wavy blue bags, 3 clear chartreuse bags, 1 wavy coral bag, 5 drab turquoise bags."
    , "faded violet bags contain 4 dim bronze bags."
    , "bright yellow bags contain 5 pale violet bags, 2 striped fuchsia bags."
    , "dim blue bags contain 2 posh salmon bags, 4 posh red bags, 5 clear turquoise bags, 4 muted lavender bags."
    , "plaid olive bags contain no other bags."
    , "posh plum bags contain 2 drab turquoise bags, 4 bright fuchsia bags, 4 drab indigo bags."
    , "posh violet bags contain 3 plaid olive bags, 2 posh teal bags, 1 posh purple bag."
    , "pale beige bags contain 4 wavy crimson bags, 5 shiny gold bags."
    , "shiny turquoise bags contain 5 dark gray bags, 4 clear brown bags."
    , "clear bronze bags contain 1 dull coral bag, 1 mirrored cyan bag, 2 dotted orange bags, 1 plaid magenta bag."
    , "dark magenta bags contain 3 vibrant orange bags, 1 dull lime bag, 1 dim plum bag."
    , "light silver bags contain 2 posh coral bags."
    , "drab gold bags contain 5 mirrored gold bags, 1 bright blue bag."
    , "dull fuchsia bags contain 3 pale blue bags."
    , "muted brown bags contain 4 drab fuchsia bags, 4 plaid bronze bags."
    , "bright coral bags contain 2 dull crimson bags."
    , "clear black bags contain 5 striped brown bags."
    , "mirrored coral bags contain 2 striped brown bags, 4 clear coral bags."
    , "dull purple bags contain 1 plaid green bag, 5 shiny gold bags."
    , "drab brown bags contain 4 striped coral bags, 1 muted magenta bag, 4 faded red bags."
    , "faded plum bags contain 5 shiny orange bags."
    , "vibrant violet bags contain 1 drab gold bag, 1 light violet bag."
    , "clear salmon bags contain 5 posh orange bags, 1 wavy fuchsia bag, 5 mirrored yellow bags."
    , "dull yellow bags contain 5 light orange bags, 4 striped purple bags."
    , "striped olive bags contain 1 plaid beige bag, 1 shiny turquoise bag, 2 drab gold bags, 1 pale lime bag."
    , "clear beige bags contain no other bags."
    , "mirrored fuchsia bags contain 1 clear olive bag, 3 pale aqua bags."
    , "posh turquoise bags contain 5 pale crimson bags, 3 dull cyan bags."
    , "dull lime bags contain 3 plaid chartreuse bags."
    , "wavy black bags contain 3 dull salmon bags, 5 plaid teal bags."
    , "dim lavender bags contain 1 dark gray bag, 2 muted indigo bags."
    , "wavy yellow bags contain 2 striped turquoise bags."
    , "striped gray bags contain 3 drab white bags."
    , "dotted magenta bags contain 3 plaid white bags, 4 clear beige bags, 1 faded maroon bag, 3 muted lavender bags."
    , "vibrant coral bags contain 5 shiny olive bags, 2 pale brown bags."
    , "dim aqua bags contain 5 striped crimson bags, 3 bright lavender bags."
    , "pale lavender bags contain 3 vibrant tan bags."
    , "bright fuchsia bags contain 2 dotted fuchsia bags."
    , "dark black bags contain 5 drab purple bags, 3 striped yellow bags, 2 posh tan bags."
    , "dark teal bags contain 3 plaid white bags, 5 bright cyan bags, 1 posh blue bag, 4 mirrored magenta bags."
    , "plaid brown bags contain 3 bright plum bags, 1 muted magenta bag, 4 clear gray bags, 2 clear crimson bags."
    , "mirrored magenta bags contain no other bags."
    , "light brown bags contain 4 wavy red bags, 2 faded white bags."
    , "dotted purple bags contain 2 pale lime bags."
    , "clear teal bags contain 3 plaid red bags, 3 striped coral bags, 4 mirrored black bags, 2 posh red bags."
    , "striped gold bags contain 3 bright plum bags, 2 mirrored gold bags."
    , "dotted black bags contain 2 clear crimson bags, 1 dark violet bag, 2 clear teal bags, 3 mirrored purple bags."
    , "dim gray bags contain 1 dotted salmon bag, 2 dim silver bags, 5 wavy black bags, 2 dotted green bags."
    , "shiny black bags contain 3 plaid bronze bags, 5 dim plum bags, 3 muted teal bags, 5 muted magenta bags."
    , "plaid orange bags contain 5 plaid crimson bags, 4 muted white bags, 4 dark lime bags, 5 plaid cyan bags."
    , "striped fuchsia bags contain 1 dull bronze bag, 1 wavy aqua bag, 1 plaid salmon bag, 2 faded cyan bags."
    , "wavy white bags contain 4 posh beige bags."
    , "dull teal bags contain 1 vibrant blue bag, 1 light red bag, 3 striped brown bags."
    , "vibrant chartreuse bags contain 1 shiny aqua bag, 4 clear crimson bags, 1 faded red bag, 1 dull crimson bag."
    , "wavy cyan bags contain 5 striped red bags, 1 shiny magenta bag."
    , "vibrant olive bags contain 3 light fuchsia bags, 5 pale tan bags, 5 light tomato bags."
    , "dotted fuchsia bags contain 5 clear silver bags, 5 light aqua bags, 5 posh beige bags."
    , "wavy tomato bags contain 2 wavy tan bags, 3 muted lavender bags, 2 pale salmon bags."
    , "posh lime bags contain 4 drab lime bags, 4 dull lavender bags."
    , "shiny white bags contain 1 plaid olive bag, 2 faded white bags, 2 dull salmon bags."
    , "bright plum bags contain 1 dotted salmon bag, 4 plaid red bags, 1 mirrored purple bag, 3 shiny aqua bags."
    , "dotted lavender bags contain 1 light green bag, 3 light magenta bags."
    , "bright gold bags contain 4 dim blue bags, 5 dark salmon bags, 2 posh crimson bags."
    , "striped violet bags contain 4 posh plum bags, 1 drab crimson bag, 2 faded orange bags, 3 dotted green bags."
    , "dull plum bags contain 1 dark maroon bag."
    , "striped tomato bags contain 5 striped maroon bags, 1 plaid turquoise bag."
    , "muted bronze bags contain 1 plaid red bag."
    , "dull lavender bags contain 2 plaid white bags."
    , "dark bronze bags contain 1 clear turquoise bag, 5 dim purple bags, 2 bright turquoise bags, 2 striped coral bags."
    , "muted green bags contain 3 plaid white bags, 5 pale blue bags, 3 plaid tan bags, 2 clear turquoise bags."
    , "mirrored bronze bags contain 2 faded white bags, 3 bright teal bags, 2 clear red bags, 2 clear crimson bags."
    , "clear silver bags contain 5 dim yellow bags, 2 striped brown bags, 1 muted magenta bag."
    , "dark indigo bags contain 3 faded maroon bags, 3 mirrored purple bags."
    , "posh silver bags contain 3 dotted maroon bags, 1 striped indigo bag, 1 faded red bag."
    , "light teal bags contain 1 vibrant beige bag, 1 striped plum bag, 4 dim salmon bags."
    , "dull orange bags contain 2 shiny teal bags, 5 muted teal bags, 1 dark fuchsia bag, 4 bright magenta bags."
    , "muted red bags contain 2 mirrored magenta bags."
    , "dotted gray bags contain 3 dull maroon bags, 4 mirrored blue bags, 3 mirrored red bags."
    , "light lime bags contain 5 plaid fuchsia bags, 4 posh plum bags."
    , "pale coral bags contain 3 shiny gray bags, 2 plaid beige bags."
    , "dim brown bags contain 1 faded gray bag."
    , "drab tan bags contain 5 dotted crimson bags."
    , "clear chartreuse bags contain 4 faded maroon bags, 5 plaid white bags."
    , "posh maroon bags contain 1 clear beige bag, 5 light black bags."
    , "mirrored blue bags contain 4 faded gray bags, 5 mirrored olive bags, 1 pale lime bag."
    , "clear coral bags contain 1 plaid fuchsia bag, 4 drab yellow bags, 4 light bronze bags."
    , "mirrored orange bags contain 4 mirrored lavender bags, 3 faded orange bags, 4 mirrored gold bags, 3 dim silver bags."
    , "pale bronze bags contain 4 plaid orange bags, 3 wavy chartreuse bags, 2 clear red bags."
    , "faded yellow bags contain 2 posh green bags."
    , "light magenta bags contain 3 clear silver bags, 3 pale magenta bags."
    , "clear aqua bags contain 2 dark tan bags."
    , "clear yellow bags contain 5 dim violet bags, 5 drab bronze bags."
    , "plaid yellow bags contain 4 dotted salmon bags."
    , "pale salmon bags contain 2 plaid olive bags, 5 clear beige bags."
    , "bright magenta bags contain 2 shiny maroon bags, 1 bright maroon bag, 5 shiny white bags."
    , "dull brown bags contain 4 posh fuchsia bags, 2 dotted tan bags."
    , "muted magenta bags contain no other bags."
    , "muted lavender bags contain 5 light aqua bags, 1 faded maroon bag, 4 plaid lavender bags."
    , "dotted violet bags contain 2 pale red bags, 3 mirrored magenta bags."
    , "wavy gray bags contain 5 dark indigo bags, 3 dim yellow bags, 3 posh lime bags, 1 wavy yellow bag."
    , "posh beige bags contain 4 mirrored magenta bags, 1 striped brown bag, 1 mirrored aqua bag, 5 dotted silver bags."
    , "drab crimson bags contain 2 faded coral bags, 4 light indigo bags, 4 dark indigo bags."
    , "wavy magenta bags contain 5 clear gold bags, 4 dim purple bags, 3 pale green bags."
    , "dim fuchsia bags contain 2 drab teal bags, 4 plaid brown bags, 5 faded orange bags."
    , "faded indigo bags contain 2 faded orange bags, 4 striped turquoise bags, 4 pale salmon bags, 4 bright cyan bags."
    , "posh yellow bags contain 2 pale gold bags, 3 posh coral bags, 1 dotted tan bag."
    , "muted chartreuse bags contain 5 plaid brown bags, 3 dull green bags."
    , "dotted plum bags contain 4 mirrored purple bags, 1 drab tan bag, 3 striped white bags."
    , "clear plum bags contain 3 posh green bags."
    , "striped red bags contain 1 striped tomato bag, 1 wavy fuchsia bag, 3 clear yellow bags."
    , "striped aqua bags contain 4 posh teal bags, 2 bright beige bags."
    , "dim gold bags contain 5 dull salmon bags, 3 mirrored red bags, 1 mirrored black bag."
    , "mirrored brown bags contain 1 mirrored salmon bag."
    , "wavy plum bags contain 3 shiny yellow bags, 5 light crimson bags, 5 dotted silver bags."
    , "striped coral bags contain no other bags."
    , "dark gray bags contain 4 dotted salmon bags, 2 clear brown bags, 2 posh crimson bags, 5 mirrored plum bags."
    , "posh chartreuse bags contain 2 wavy fuchsia bags, 4 mirrored beige bags."
    , "dotted gold bags contain 1 dark lavender bag, 1 striped black bag."
    , "posh green bags contain 3 dotted salmon bags, 4 pale salmon bags, 3 posh red bags, 4 dim green bags."
    , "plaid blue bags contain 2 posh green bags, 3 dim cyan bags, 5 dull bronze bags."
    , "light lavender bags contain 5 muted green bags, 1 light violet bag, 5 muted plum bags."
    , "pale plum bags contain 5 muted lavender bags, 5 light bronze bags, 4 plaid crimson bags."
    , "mirrored indigo bags contain 4 dark violet bags, 2 wavy purple bags, 5 plaid tan bags."
    , "dim violet bags contain 4 mirrored black bags, 4 dull lime bags, 3 posh crimson bags, 1 pale brown bag."
    , "shiny coral bags contain 1 light aqua bag, 5 plaid olive bags, 4 bright turquoise bags."
    , "dotted cyan bags contain 4 shiny olive bags, 4 light bronze bags, 2 dim plum bags."
    , "mirrored teal bags contain 5 dim violet bags."
    , "shiny purple bags contain 4 dim magenta bags, 2 clear white bags, 3 posh silver bags, 1 shiny turquoise bag."
    , "shiny gray bags contain 5 pale lavender bags, 3 vibrant turquoise bags, 1 faded maroon bag, 1 bright cyan bag."
    , "mirrored chartreuse bags contain 2 clear white bags."
    , "light beige bags contain 5 mirrored turquoise bags, 5 plaid maroon bags, 3 light silver bags."
    , "dull tomato bags contain 1 shiny gold bag, 4 pale blue bags."
    , "plaid teal bags contain 1 dim purple bag, 3 striped turquoise bags, 3 light indigo bags, 2 faded red bags."
    , "vibrant aqua bags contain 3 mirrored turquoise bags, 1 light plum bag, 5 clear teal bags, 1 dull blue bag."
    , "dotted turquoise bags contain 5 bright fuchsia bags, 5 dim blue bags, 3 posh green bags, 3 wavy red bags."
    , "dark lavender bags contain 1 mirrored lime bag, 2 plaid red bags, 2 striped white bags, 1 plaid tomato bag."
    , "plaid tan bags contain 5 plaid white bags."
    , "pale olive bags contain 1 clear salmon bag."
    , "wavy indigo bags contain 1 plaid black bag, 1 wavy teal bag, 3 mirrored salmon bags."
    , "drab chartreuse bags contain 2 light lime bags, 3 drab yellow bags."
    , "drab blue bags contain 3 vibrant brown bags."
    , "muted purple bags contain 2 shiny yellow bags."
    , "muted aqua bags contain 4 striped white bags."
    , "mirrored violet bags contain 3 wavy violet bags, 4 mirrored aqua bags."
    , "bright cyan bags contain 3 wavy fuchsia bags, 2 dark coral bags, 1 shiny orange bag."
    , "posh teal bags contain 5 bright gray bags, 4 faded gray bags, 2 plaid turquoise bags."
    , "muted lime bags contain 2 striped coral bags, 1 dark tan bag, 4 plaid cyan bags."
    , "mirrored crimson bags contain 4 faded violet bags, 1 posh purple bag."
    , "light blue bags contain 2 dotted blue bags, 2 dark gold bags, 5 bright cyan bags, 1 light crimson bag."
    , "dull beige bags contain 2 dark turquoise bags, 5 mirrored violet bags, 1 muted crimson bag."
    , "dark cyan bags contain 5 muted blue bags."
    , "dim turquoise bags contain 3 shiny silver bags, 1 pale yellow bag, 3 plaid chartreuse bags, 1 posh bronze bag."
    , "faded brown bags contain 3 dim silver bags, 2 mirrored bronze bags."
    , "wavy bronze bags contain 3 shiny tomato bags, 3 dim salmon bags."
    , "pale brown bags contain 3 pale tan bags, 2 plaid olive bags, 2 posh lavender bags, 1 shiny aqua bag."
    , "dull white bags contain 1 dull red bag, 5 dark gold bags, 3 striped magenta bags, 2 muted green bags."
    , "plaid crimson bags contain 5 drab bronze bags, 2 pale blue bags."
    , "bright lavender bags contain 1 dark bronze bag."
    , "plaid red bags contain 3 striped turquoise bags, 4 dull crimson bags, 1 striped brown bag, 2 clear crimson bags."
    , "muted gold bags contain 5 dotted black bags, 1 striped salmon bag, 3 drab purple bags, 5 bright red bags."
    , "striped silver bags contain 3 posh black bags."
    , "bright aqua bags contain 4 light orange bags, 3 wavy blue bags, 3 dull lime bags."
    , "plaid fuchsia bags contain 2 shiny orange bags."
    , "bright violet bags contain 1 drab turquoise bag, 1 dim cyan bag, 4 pale blue bags, 3 wavy blue bags."
    , "dim white bags contain 1 plaid black bag, 5 plaid violet bags, 2 light gray bags."
    , "bright tan bags contain 5 bright gold bags, 3 shiny salmon bags, 2 muted magenta bags, 1 dotted black bag."
    , "shiny bronze bags contain 3 light aqua bags, 4 clear crimson bags, 1 light beige bag, 4 clear blue bags."
    , "muted silver bags contain 4 striped lavender bags."
    , "dull red bags contain 1 dim coral bag, 1 faded plum bag, 4 plaid red bags."
    , "wavy aqua bags contain 2 dotted fuchsia bags, 2 mirrored tomato bags."
    , "dark olive bags contain 4 muted yellow bags, 2 shiny gold bags, 2 posh crimson bags."
    , "dark crimson bags contain 3 shiny aqua bags, 1 wavy black bag."
    , "dark brown bags contain 2 drab lavender bags, 5 posh green bags, 4 pale turquoise bags."
    , "pale blue bags contain 2 striped coral bags, 2 shiny gold bags."
    , "vibrant blue bags contain 1 mirrored lavender bag, 4 dark aqua bags, 5 wavy coral bags."
    , "posh cyan bags contain 1 dull lavender bag, 3 striped gray bags, 1 vibrant orange bag."
    , "faded red bags contain 1 posh crimson bag, 1 wavy coral bag, 5 clear beige bags, 3 dotted silver bags."
    , "vibrant gold bags contain 3 drab lavender bags, 5 dim magenta bags, 2 bright tomato bags, 4 light magenta bags."
    , "shiny chartreuse bags contain 5 vibrant turquoise bags."
    , "clear gray bags contain 4 wavy coral bags, 2 dark salmon bags, 3 dark indigo bags."
    , "pale maroon bags contain 4 posh tomato bags, 5 bright tan bags."
    , "light turquoise bags contain 3 drab fuchsia bags, 4 bright silver bags, 5 light green bags."
    , "muted crimson bags contain 1 dim yellow bag, 4 wavy fuchsia bags, 2 mirrored magenta bags, 2 clear beige bags."
    , "dull gray bags contain 2 posh green bags."
    , "light fuchsia bags contain 5 dark gold bags, 3 plaid black bags, 2 bright lavender bags."
    , "striped green bags contain 2 striped fuchsia bags, 5 dull tomato bags, 2 posh crimson bags."
    , "mirrored purple bags contain 2 posh crimson bags, 2 mirrored magenta bags, 3 wavy violet bags, 1 striped coral bag."
    , "vibrant black bags contain 3 clear magenta bags, 4 muted salmon bags, 5 posh blue bags."
    , "plaid beige bags contain 2 dark black bags, 5 plaid yellow bags, 2 bright violet bags."
    , "pale teal bags contain 3 pale crimson bags."
    , "striped turquoise bags contain no other bags."
    , "dim purple bags contain 2 dull crimson bags, 5 bright red bags."
    , "faded cyan bags contain 5 posh aqua bags, 4 dull green bags, 3 dark olive bags."
    , "mirrored cyan bags contain 5 plaid salmon bags, 4 dim salmon bags, 4 posh tomato bags."
    , "striped purple bags contain 2 faded salmon bags, 2 bright tan bags, 4 drab white bags."
    , "bright blue bags contain 3 light purple bags, 1 pale yellow bag."
    , "faded bronze bags contain 1 light indigo bag, 3 plaid green bags, 5 posh orange bags."
    , "striped white bags contain 4 drab indigo bags, 5 wavy tomato bags, 5 dotted fuchsia bags, 2 dim silver bags."
    , "clear lime bags contain 2 dotted magenta bags, 5 striped magenta bags, 3 bright coral bags, 3 mirrored silver bags."
    , "bright white bags contain 3 dim lavender bags."
    , "dim crimson bags contain 1 posh black bag, 1 mirrored silver bag."
    , "clear olive bags contain 4 vibrant purple bags, 3 drab lavender bags, 2 pale violet bags."
    , "light coral bags contain 2 dotted green bags, 2 wavy aqua bags, 4 dark salmon bags, 3 light gold bags."
    , "muted plum bags contain 5 plaid tan bags, 1 mirrored silver bag, 3 vibrant turquoise bags."
    , "dim plum bags contain 4 bright plum bags."
    , "drab bronze bags contain 1 light indigo bag, 3 striped brown bags, 3 clear gold bags, 3 clear gray bags."
    , "plaid maroon bags contain 1 dotted orange bag, 5 light magenta bags, 4 faded salmon bags, 3 pale yellow bags."
    , "wavy violet bags contain 2 dotted silver bags, 3 dull crimson bags, 5 mirrored aqua bags, 4 striped brown bags."
    , "pale crimson bags contain 3 bright chartreuse bags, 4 light turquoise bags, 1 bright gray bag, 1 muted bronze bag."
    , "mirrored aqua bags contain no other bags."
    , "clear crimson bags contain 2 pale salmon bags, 4 mirrored magenta bags, 1 striped coral bag, 5 plaid olive bags."
    , "dark tan bags contain 4 wavy silver bags, 4 dark aqua bags."
    , "wavy maroon bags contain 3 clear gray bags."
    , "light crimson bags contain 3 clear silver bags."
    , "vibrant green bags contain 1 clear magenta bag, 1 dim white bag, 4 plaid black bags."
    , "bright bronze bags contain 2 light brown bags."
    , "light maroon bags contain 5 bright red bags, 2 bright tan bags, 5 dim silver bags, 4 pale salmon bags."
    , "dark coral bags contain 2 light crimson bags."
    , "pale silver bags contain 2 mirrored magenta bags, 3 posh red bags, 1 muted yellow bag, 5 dark salmon bags."
    , "dotted crimson bags contain 4 faded salmon bags, 4 vibrant beige bags, 5 dim beige bags."
    , "dull silver bags contain 1 striped brown bag, 2 shiny magenta bags."
    , "striped beige bags contain 4 clear crimson bags."
    , "faded orange bags contain 2 drab white bags, 3 striped salmon bags, 5 bright chartreuse bags."
    , "drab olive bags contain 4 clear purple bags."
    , "dull maroon bags contain 3 dotted magenta bags."
    , "vibrant lavender bags contain 2 light tomato bags, 1 shiny teal bag."
    , "dotted chartreuse bags contain 4 faded white bags, 2 light brown bags."
    , "drab cyan bags contain 2 pale coral bags, 3 light purple bags, 2 drab bronze bags, 1 dim beige bag."
    , "bright teal bags contain 2 vibrant plum bags, 2 dull tan bags, 1 dim tomato bag, 5 dark violet bags."
    , "wavy fuchsia bags contain 1 dim green bag, 2 wavy violet bags."
    , "drab black bags contain 3 striped tomato bags, 4 light salmon bags, 4 dim yellow bags, 3 shiny black bags."
    , "dark green bags contain 5 dark tan bags."
    , "clear tomato bags contain 4 mirrored gold bags, 4 dark gold bags."
    , "plaid aqua bags contain 5 dotted coral bags, 1 muted white bag."
    , "plaid white bags contain 3 clear crimson bags, 3 wavy gold bags, 3 pale lime bags, 2 striped brown bags."
    , "muted black bags contain 1 wavy tan bag, 4 mirrored turquoise bags."
    , "faded aqua bags contain 5 dull turquoise bags, 1 vibrant tan bag."
    , "vibrant brown bags contain 5 pale silver bags, 3 drab orange bags, 1 clear olive bag."
    , "pale cyan bags contain 2 faded cyan bags, 1 mirrored tan bag, 3 vibrant aqua bags, 3 light gold bags."
    , "shiny salmon bags contain 5 posh red bags, 5 light chartreuse bags, 2 striped brown bags."
    , "plaid lime bags contain 4 dim gold bags, 1 clear magenta bag."
    , "drab tomato bags contain 5 clear orange bags."
    , "faded beige bags contain 3 dark crimson bags, 2 mirrored tan bags."
    , "vibrant crimson bags contain 4 wavy blue bags, 5 clear gray bags."
    , "dotted maroon bags contain 5 dotted red bags, 4 wavy silver bags, 1 drab brown bag, 3 dark black bags."
    , "striped indigo bags contain 3 striped orange bags."
    , "dim orange bags contain 1 wavy lavender bag, 5 drab brown bags, 1 dull salmon bag."
    , "posh olive bags contain 3 faded indigo bags, 1 plaid white bag."
    , "striped lavender bags contain 1 bright red bag."
    , "muted violet bags contain 3 bright tan bags, 5 striped coral bags, 1 drab bronze bag."
    , "wavy tan bags contain 1 striped brown bag, 3 dim salmon bags, 1 posh fuchsia bag, 4 mirrored violet bags."
    , "dull magenta bags contain 1 clear red bag, 4 dull green bags, 2 posh lime bags, 5 mirrored gold bags."
    , "dotted red bags contain 1 mirrored black bag, 3 dull bronze bags, 2 dim salmon bags."
    , "drab turquoise bags contain 5 muted yellow bags, 1 light indigo bag, 5 dotted black bags."
    , "faded purple bags contain 5 dim orange bags, 3 dark red bags."
    , "faded teal bags contain 1 bright fuchsia bag."
    , "plaid gray bags contain 5 pale aqua bags."
    , "bright black bags contain 4 wavy violet bags."
    , "dim green bags contain 3 mirrored aqua bags, 1 light chartreuse bag, 1 light indigo bag."
    , "dark gold bags contain 2 mirrored red bags, 2 bright lavender bags, 3 pale crimson bags."
    , "dark plum bags contain 2 pale salmon bags."
    , "wavy orange bags contain 2 light tan bags, 1 pale yellow bag, 2 shiny aqua bags, 4 vibrant orange bags."
    , "bright chartreuse bags contain 5 dark salmon bags, 1 plaid olive bag."
    , "wavy purple bags contain 4 faded coral bags, 2 vibrant orange bags."
    , "shiny violet bags contain 3 plaid chartreuse bags, 2 plaid brown bags."
    , "posh indigo bags contain 1 posh salmon bag."
    , "clear indigo bags contain 3 light violet bags."
    , "plaid purple bags contain 1 clear blue bag, 2 muted gold bags, 1 dull brown bag."
    , "posh lavender bags contain 1 plaid black bag, 3 shiny orange bags, 3 posh red bags, 4 plaid cyan bags."
    , "wavy silver bags contain 3 plaid cyan bags, 1 plaid olive bag."
    , "posh salmon bags contain 3 clear gray bags, 5 dotted silver bags, 4 shiny aqua bags."
    , "faded lavender bags contain 4 drab chartreuse bags, 4 plaid magenta bags, 1 vibrant tomato bag."
    , "pale red bags contain 4 bright red bags, 4 pale lime bags, 3 striped turquoise bags."
    , "bright purple bags contain 3 muted lavender bags."
    , "dim magenta bags contain 1 plaid teal bag, 3 posh lavender bags."
    , "posh magenta bags contain 3 pale teal bags, 5 mirrored tomato bags, 2 striped gold bags, 2 bright tomato bags."
    , "bright brown bags contain 1 dark fuchsia bag, 4 pale yellow bags, 5 shiny crimson bags."
    , "light red bags contain 1 wavy teal bag."
    , "pale turquoise bags contain 3 mirrored yellow bags."
    , "vibrant magenta bags contain 4 dark gold bags."
    , "dotted salmon bags contain 3 wavy violet bags, 4 shiny aqua bags, 4 dull bronze bags."
    , "mirrored gray bags contain 3 dark plum bags, 3 striped gray bags, 4 plaid violet bags."
    , "dim yellow bags contain 3 striped turquoise bags, 2 pale salmon bags, 4 mirrored magenta bags, 5 striped brown bags."
    , "drab lavender bags contain 2 faded maroon bags, 2 shiny orange bags."
    , "muted maroon bags contain 1 wavy tomato bag, 2 drab red bags."
    , "clear gold bags contain 3 mirrored olive bags, 3 striped turquoise bags."
    , "light bronze bags contain 1 muted lavender bag."
    , "dotted bronze bags contain 2 dotted turquoise bags."
    , "pale tomato bags contain 3 shiny beige bags, 1 mirrored tomato bag, 2 dotted maroon bags, 2 wavy teal bags."
    , "pale chartreuse bags contain 5 plaid silver bags."
    , "drab magenta bags contain 5 wavy tomato bags, 1 drab brown bag, 2 posh maroon bags, 5 mirrored teal bags."
    , "posh blue bags contain 3 muted lime bags, 1 mirrored tomato bag, 5 shiny aqua bags."
    , "posh purple bags contain 5 dull maroon bags."
    , "posh bronze bags contain 2 mirrored orange bags, 2 pale violet bags, 2 plaid gray bags."
    , "pale gold bags contain 4 striped brown bags, 2 muted green bags."
    , "faded crimson bags contain 5 drab salmon bags, 2 posh crimson bags, 3 light purple bags, 5 clear red bags."
    , "vibrant fuchsia bags contain 2 posh beige bags, 4 dotted indigo bags, 5 pale silver bags, 4 clear black bags."
    , "faded lime bags contain 3 posh plum bags, 3 shiny aqua bags, 4 dull chartreuse bags."
    , "shiny fuchsia bags contain 4 shiny salmon bags, 3 pale chartreuse bags."
    , "wavy lavender bags contain 2 dark blue bags, 5 muted salmon bags."
    , "pale indigo bags contain 1 wavy gold bag, 1 clear silver bag, 3 dim blue bags."
    , "drab violet bags contain 4 muted yellow bags."
    , "shiny plum bags contain 3 bright black bags, 5 pale teal bags, 5 light red bags, 2 plaid magenta bags."
    , "shiny gold bags contain 1 vibrant chartreuse bag."
    , "wavy gold bags contain 5 posh beige bags, 1 mirrored aqua bag."
    , "dark salmon bags contain 3 light aqua bags, 3 posh red bags, 2 mirrored black bags, 1 posh crimson bag."
    , "pale tan bags contain 4 wavy coral bags."
    , "dull tan bags contain 4 bright cyan bags."
    , "clear maroon bags contain 4 dim magenta bags, 2 shiny lavender bags."
    , "light white bags contain 3 dark brown bags, 4 bright fuchsia bags."
    , "wavy red bags contain 4 dim red bags."
    , "dotted aqua bags contain 4 striped teal bags."
    , "bright beige bags contain 5 shiny tomato bags."
    , "plaid indigo bags contain 1 muted bronze bag."
    , "light yellow bags contain 2 striped black bags, 2 muted gold bags, 3 dotted tan bags, 5 dark coral bags."
    , "vibrant silver bags contain 2 dim blue bags."
    , "posh tomato bags contain 5 bright red bags, 3 posh red bags, 3 plaid olive bags, 4 clear crimson bags."
    , "pale magenta bags contain 3 mirrored blue bags, 5 dull maroon bags, 5 dark violet bags."
    , "light indigo bags contain 2 plaid olive bags, 1 plaid black bag, 3 dark indigo bags."
    , "shiny green bags contain 1 vibrant chartreuse bag, 4 bright lavender bags, 3 wavy crimson bags, 4 dull red bags."
    , "striped maroon bags contain 2 posh coral bags, 2 striped gray bags, 3 clear plum bags."
    , "posh fuchsia bags contain 2 wavy gold bags, 2 posh beige bags."
    , "dim coral bags contain 4 wavy gold bags, 4 muted lavender bags."
    , "faded maroon bags contain 5 dim purple bags, 4 bright red bags, 5 wavy violet bags, 1 mirrored aqua bag."
    , "striped black bags contain 4 plaid fuchsia bags, 5 bright lavender bags, 4 dull black bags."
    , "mirrored gold bags contain 3 dotted silver bags."
    , "light tomato bags contain 5 pale brown bags, 3 wavy coral bags."
    , "dark white bags contain 2 mirrored tomato bags, 1 striped orange bag, 1 dim olive bag, 2 dotted blue bags."
    , "dotted green bags contain 3 clear plum bags."
    , "dotted brown bags contain 1 clear magenta bag."
    , "muted orange bags contain 3 muted olive bags, 2 faded yellow bags, 2 faded turquoise bags, 3 muted violet bags."
    , "dull olive bags contain 2 dotted teal bags."
    , "mirrored lime bags contain 4 dark violet bags, 4 muted yellow bags."
    , "wavy green bags contain 5 bright lime bags."
    , "drab purple bags contain 2 striped turquoise bags, 4 clear silver bags, 1 muted lime bag."
    , "clear cyan bags contain 5 light lavender bags."
    , "dim black bags contain 3 dull black bags."
    , "posh gray bags contain 4 mirrored magenta bags."
    , "dotted yellow bags contain 4 light maroon bags, 1 clear blue bag, 5 dark maroon bags."
    , "mirrored olive bags contain 2 dark violet bags, 2 dull crimson bags, 5 dim salmon bags, 5 bright tan bags."
    , "dark blue bags contain 3 dull aqua bags, 1 dim teal bag."
    , "dull bronze bags contain 4 striped coral bags."
    , "drab maroon bags contain 2 dark bronze bags, 1 wavy blue bag."
    , "mirrored lavender bags contain 4 clear black bags."
    , "dim beige bags contain 3 shiny silver bags, 2 dark purple bags, 3 dull green bags."
    , "light violet bags contain 1 muted gray bag, 5 wavy tomato bags."
    , "striped chartreuse bags contain 3 dull tan bags, 1 dim salmon bag."
    , "posh red bags contain 2 clear crimson bags, 2 striped coral bags, 2 bright red bags."
    , "wavy beige bags contain 5 muted silver bags, 5 pale teal bags."
    , "light gray bags contain 5 drab indigo bags, 3 posh crimson bags, 1 dark tan bag, 2 pale red bags."
    , "muted white bags contain 3 wavy fuchsia bags."
    , "pale violet bags contain 4 wavy tan bags, 2 plaid yellow bags."
    , "drab fuchsia bags contain 1 plaid lavender bag, 2 pale lime bags."
    , "clear green bags contain 4 light indigo bags."
    , "vibrant turquoise bags contain 2 vibrant tan bags, 3 clear silver bags."
    , "faded green bags contain 5 striped orange bags, 4 bright fuchsia bags."
    , "striped tan bags contain 4 wavy silver bags."
    , "clear white bags contain 3 vibrant fuchsia bags, 2 pale silver bags, 1 vibrant indigo bag, 3 shiny silver bags."
    , "dim cyan bags contain 2 mirrored black bags, 2 plaid chartreuse bags, 4 bright gold bags."
    , "muted gray bags contain 3 mirrored violet bags, 4 dim yellow bags."
    , "mirrored maroon bags contain 5 clear crimson bags, 2 clear gray bags, 1 dotted salmon bag."
    , "dim bronze bags contain 2 striped plum bags, 2 bright orange bags."
    , "shiny tomato bags contain 4 dim yellow bags, 2 faded bronze bags, 1 drab maroon bag, 3 dim gold bags."
    , "muted olive bags contain 2 mirrored yellow bags, 4 bright olive bags."
    , "shiny brown bags contain 3 bright coral bags."
    , "clear blue bags contain 2 pale green bags, 2 light violet bags, 4 plaid crimson bags."
    , "faded tan bags contain 4 dim crimson bags, 3 mirrored turquoise bags, 3 drab gold bags."
    , "muted cyan bags contain 2 drab silver bags."
    , "mirrored red bags contain 1 bright gold bag."
    , "faded salmon bags contain 5 posh red bags, 4 dull crimson bags, 3 dotted salmon bags, 5 shiny olive bags."
    , "dark purple bags contain 5 dim magenta bags."
    , "dotted lime bags contain 4 posh fuchsia bags, 3 wavy tan bags, 2 mirrored aqua bags, 1 shiny aqua bag."
    , "posh tan bags contain 3 plaid tan bags, 2 drab fuchsia bags."
    , "dotted teal bags contain 4 dull crimson bags, 2 bright lavender bags, 2 wavy tan bags, 4 muted crimson bags."
    , "clear purple bags contain 4 shiny aqua bags, 1 dim cyan bag, 3 dotted black bags, 4 dull gray bags."
    , "light gold bags contain 2 dotted magenta bags, 5 dark olive bags, 3 dim cyan bags, 2 dark indigo bags."
    , "mirrored silver bags contain 2 plaid black bags, 3 vibrant beige bags, 3 mirrored purple bags, 3 dotted lime bags."
    , "posh black bags contain 4 wavy violet bags, 3 plaid teal bags."
    , "faded silver bags contain 2 vibrant purple bags, 5 shiny olive bags."
    , "drab teal bags contain 2 dotted salmon bags, 4 posh beige bags, 4 mirrored tan bags, 1 muted green bag."
    , "dark maroon bags contain 2 dark tan bags, 5 mirrored gold bags, 2 dim plum bags."
    , "striped plum bags contain 3 striped coral bags, 5 clear brown bags, 1 striped brown bag."
    , "striped bronze bags contain 4 drab yellow bags, 4 striped chartreuse bags, 5 posh plum bags, 3 clear blue bags."
    , "drab plum bags contain 1 shiny gold bag, 5 vibrant tan bags, 3 light gold bags."
    , "clear fuchsia bags contain 1 vibrant red bag."
    , "dark silver bags contain 5 clear salmon bags, 1 faded yellow bag, 1 shiny lavender bag, 3 wavy fuchsia bags."
    , "striped lime bags contain 2 dim tomato bags, 3 light fuchsia bags, 1 light lime bag."
    , "wavy salmon bags contain 1 shiny tomato bag, 1 light tomato bag."
    , "dim maroon bags contain 4 faded beige bags, 2 bright turquoise bags, 4 dull purple bags, 4 vibrant olive bags."
    , "faded chartreuse bags contain 4 mirrored blue bags, 5 posh white bags, 2 wavy magenta bags."
    , "clear magenta bags contain 2 muted bronze bags, 5 dim yellow bags, 2 dotted lime bags."
    , "bright silver bags contain 2 bright gold bags, 4 wavy yellow bags."
    , "dull violet bags contain 3 faded beige bags, 1 mirrored orange bag, 1 mirrored aqua bag."
    , "vibrant cyan bags contain 2 clear aqua bags, 2 dark maroon bags, 5 pale tan bags."
    , "light chartreuse bags contain 1 wavy gold bag, 2 posh tomato bags, 2 clear silver bags."
    , "dotted olive bags contain 5 wavy crimson bags, 1 drab tomato bag."
    , "posh aqua bags contain 3 striped brown bags."
    , "posh orange bags contain 2 wavy coral bags."
    , "dull cyan bags contain 1 dark tan bag, 5 dull gray bags, 3 drab turquoise bags, 4 shiny aqua bags."
    , "muted teal bags contain 4 dull blue bags."
    , "bright turquoise bags contain 5 dull bronze bags, 1 plaid lavender bag."
    , "plaid tomato bags contain 2 muted lime bags, 1 light indigo bag, 5 posh tomato bags."
    , "dim salmon bags contain 1 dark indigo bag, 5 plaid brown bags, 3 clear crimson bags, 4 clear silver bags."
    , "posh brown bags contain 3 clear silver bags, 5 faded cyan bags, 4 posh crimson bags."
    , "dark turquoise bags contain 1 drab crimson bag, 5 striped coral bags."
    , "dull crimson bags contain no other bags."
    , "striped teal bags contain 5 plaid lavender bags, 4 faded red bags."
    , "dotted blue bags contain 5 muted beige bags."
    , "vibrant plum bags contain 1 pale lime bag, 1 posh red bag, 1 dull bronze bag, 3 drab silver bags."
    , "wavy coral bags contain 4 mirrored magenta bags, 5 dim yellow bags, 4 bright red bags, 2 posh crimson bags."
    , "dark chartreuse bags contain 5 dotted fuchsia bags, 3 mirrored silver bags, 5 mirrored aqua bags, 4 dim cyan bags."
    , "vibrant teal bags contain 3 vibrant silver bags."
    , "shiny beige bags contain 5 posh teal bags."
    , "dim olive bags contain 3 clear gray bags, 4 wavy gold bags."
    , "drab yellow bags contain 4 light chartreuse bags, 3 striped crimson bags, 2 faded gray bags."
    , "dull chartreuse bags contain 1 light lavender bag."
    , "dotted silver bags contain no other bags."
    , "shiny blue bags contain 5 dull brown bags, 2 dark coral bags, 4 shiny crimson bags."
    , "mirrored black bags contain 5 mirrored magenta bags, 1 striped turquoise bag, 2 plaid cyan bags."
    , "dull black bags contain 4 dim purple bags, 4 dark salmon bags, 2 mirrored gold bags."
    , "mirrored beige bags contain 4 striped fuchsia bags, 4 plaid black bags, 5 dim red bags, 5 light green bags."
    , "dim chartreuse bags contain 4 shiny yellow bags."
    , "shiny teal bags contain 1 vibrant maroon bag."
    , "dim tomato bags contain 5 plaid tomato bags, 5 mirrored violet bags, 2 mirrored orange bags."
    , "vibrant beige bags contain 1 plaid black bag, 3 dotted salmon bags, 2 posh fuchsia bags."
    , "dull aqua bags contain 5 wavy tan bags, 3 bright olive bags."
    , "pale lime bags contain 5 bright turquoise bags, 5 dim yellow bags, 3 shiny orange bags."
    , "bright orange bags contain 4 muted gold bags, 1 clear white bag."
    , "drab salmon bags contain 2 dark fuchsia bags, 2 dull gray bags."
    , "mirrored salmon bags contain 3 posh plum bags, 1 dotted silver bag, 1 clear plum bag, 5 dull black bags."
    , "shiny silver bags contain 4 drab lavender bags, 2 dim violet bags, 5 dark aqua bags, 2 vibrant chartreuse bags."
    , "plaid coral bags contain 4 dim blue bags, 1 vibrant lime bag."
    , "mirrored white bags contain 2 pale gold bags, 3 shiny green bags, 5 striped white bags."
    , "pale gray bags contain 5 mirrored gold bags, 1 wavy silver bag, 5 posh green bags, 1 mirrored red bag."
    , "pale white bags contain 4 shiny turquoise bags, 4 bright plum bags, 5 dotted bronze bags."
    , "muted fuchsia bags contain 5 plaid turquoise bags, 2 dark aqua bags, 4 pale brown bags, 4 striped plum bags."
    , "striped yellow bags contain 5 posh red bags, 1 plaid black bag."
    , "plaid silver bags contain 2 dark indigo bags, 3 clear teal bags, 3 dotted black bags."
    , "plaid black bags contain 3 dull crimson bags."
    , "vibrant lime bags contain 1 dotted fuchsia bag, 4 dull bronze bags, 4 dark aqua bags, 1 dark salmon bag."
    , "dotted white bags contain 5 dim red bags."
    , "light aqua bags contain 5 mirrored aqua bags, 2 striped brown bags, 4 posh crimson bags."
    , "striped brown bags contain 1 dotted silver bag, 5 clear beige bags."
    , "vibrant red bags contain 3 bright olive bags, 3 plaid chartreuse bags, 3 light olive bags, 4 dim violet bags."
    , "dim teal bags contain 3 clear violet bags."
    , "bright lime bags contain 2 dull lavender bags, 4 pale turquoise bags."
    , "striped crimson bags contain 5 bright gray bags, 4 dark green bags, 4 posh plum bags, 5 shiny coral bags."
    , "mirrored tomato bags contain 1 wavy tan bag."
    , "dull blue bags contain 5 bright turquoise bags, 2 striped brown bags."
    , "mirrored yellow bags contain 4 vibrant purple bags, 4 faded bronze bags, 2 dull lavender bags, 3 light plum bags."
    , "plaid gold bags contain 5 striped olive bags, 5 dotted chartreuse bags."
    , "dotted coral bags contain 2 bright teal bags."
    , "wavy crimson bags contain 5 dotted salmon bags, 1 dull crimson bag."
    , "dark aqua bags contain 3 dull crimson bags, 5 light aqua bags, 3 mirrored purple bags, 1 striped brown bag."
    , "vibrant yellow bags contain 1 faded beige bag, 3 dark brown bags, 1 wavy bronze bag."
    , "wavy teal bags contain 5 dotted magenta bags."
    , "drab white bags contain 3 pale blue bags."
    , "muted salmon bags contain 4 posh salmon bags, 1 bright chartreuse bag."
    , "light purple bags contain 5 dark maroon bags."
    , "faded black bags contain 4 dull gold bags."
    , "muted turquoise bags contain 1 wavy silver bag, 4 clear purple bags."
    , "plaid chartreuse bags contain 1 posh crimson bag, 5 striped brown bags."
    , "vibrant tan bags contain 2 dull blue bags, 1 posh black bag, 1 faded red bag, 5 plaid magenta bags."
    , "shiny orange bags contain 5 vibrant chartreuse bags, 3 shiny gold bags."
    , "shiny lavender bags contain 2 posh teal bags."
    , "pale black bags contain 5 dark brown bags."
    , "shiny cyan bags contain 5 wavy tomato bags, 3 bright bronze bags, 3 faded crimson bags."
    , "faded olive bags contain 3 clear aqua bags."
    , "dark violet bags contain 4 faded red bags."
    , "light orange bags contain 1 posh aqua bag, 2 light crimson bags, 2 dark maroon bags."
    , "drab silver bags contain 1 pale blue bag."
    , "plaid bronze bags contain 5 mirrored orange bags, 4 plaid cyan bags, 1 dotted black bag."
    , "plaid violet bags contain 1 plaid fuchsia bag, 5 clear teal bags."
    , "clear turquoise bags contain 4 dim yellow bags, 5 plaid teal bags, 3 plaid red bags, 1 dotted salmon bag."
    , "plaid lavender bags contain 3 clear silver bags, 4 dull bronze bags."
    , "mirrored green bags contain 3 striped lavender bags."
    , "faded white bags contain 2 light chartreuse bags."
    , "bright crimson bags contain 2 mirrored purple bags."
    , "dotted beige bags contain 1 pale salmon bag, 5 dotted teal bags, 5 light lavender bags, 3 wavy violet bags."
    , "pale green bags contain 2 dark gold bags, 4 clear gray bags."
    , "dull indigo bags contain 2 striped brown bags, 3 plaid plum bags."
    , "shiny yellow bags contain 3 striped silver bags, 2 mirrored plum bags, 1 muted red bag, 5 clear gold bags."
    , "bright maroon bags contain 2 muted crimson bags, 2 plaid chartreuse bags, 1 dim violet bag, 1 plaid blue bag."
    , "vibrant orange bags contain 5 posh plum bags, 4 shiny gold bags."
    , "faded fuchsia bags contain 2 dotted aqua bags."
    , "bright indigo bags contain 3 shiny coral bags, 1 muted salmon bag, 2 clear white bags, 1 vibrant maroon bag."
    , "shiny indigo bags contain 4 dark red bags, 2 pale lime bags."
    , "light cyan bags contain 2 clear black bags, 2 mirrored aqua bags, 1 faded beige bag, 2 faded salmon bags."
    , "faded gold bags contain 5 muted lime bags, 3 plaid fuchsia bags."
    , "muted coral bags contain 2 faded indigo bags, 1 dim beige bag, 5 dotted orange bags, 4 posh black bags."
    , "drab gray bags contain 5 clear magenta bags, 5 bright tomato bags, 1 dull gold bag."
    , "vibrant salmon bags contain 4 bright gold bags."
    , "dark red bags contain 5 posh black bags, 4 faded teal bags."
    , "wavy blue bags contain 3 dim green bags, 4 dull green bags, 2 posh aqua bags."
    , "mirrored turquoise bags contain 5 dull lime bags, 4 dark gray bags, 1 striped cyan bag, 4 muted gold bags."
    , "wavy chartreuse bags contain 1 pale brown bag, 4 shiny chartreuse bags, 4 wavy fuchsia bags."
    , "dim red bags contain 1 bright blue bag, 3 clear purple bags, 2 wavy crimson bags, 5 shiny black bags."
    , "dull gold bags contain 4 wavy blue bags."
    , "faded blue bags contain 1 plaid turquoise bag, 2 vibrant indigo bags."
    , "shiny aqua bags contain 4 plaid cyan bags, 4 posh crimson bags."
    , "bright salmon bags contain 1 posh red bag, 1 shiny orange bag, 1 vibrant crimson bag."
    , "pale yellow bags contain 4 plaid cyan bags."
    , "plaid magenta bags contain 3 plaid brown bags, 5 pale yellow bags, 5 drab fuchsia bags, 1 clear black bag."
    , "vibrant maroon bags contain 4 dull tomato bags, 1 dotted indigo bag, 2 plaid teal bags, 2 shiny gold bags."
    , "drab orange bags contain 3 wavy coral bags."
    , "pale aqua bags contain 5 wavy lime bags, 5 drab turquoise bags."
    , "shiny crimson bags contain 3 posh black bags, 5 drab fuchsia bags, 1 plaid fuchsia bag, 4 posh plum bags."
    , "pale purple bags contain 2 clear green bags, 2 striped crimson bags, 4 drab indigo bags."
    , "faded magenta bags contain 5 light red bags."
    , "shiny tan bags contain 5 plaid silver bags, 3 light lavender bags, 4 wavy purple bags."
    , "vibrant indigo bags contain 5 plaid beige bags."
    , "wavy turquoise bags contain 4 dark teal bags, 2 dark cyan bags, 4 mirrored olive bags, 5 bright red bags."
    , "striped blue bags contain 1 vibrant lime bag, 3 vibrant indigo bags, 1 pale maroon bag, 2 dark white bags."
    , "faded tomato bags contain 3 plaid tan bags, 4 pale tan bags, 5 wavy violet bags, 3 pale lime bags."
    , "bright green bags contain 1 bright purple bag, 5 posh magenta bags."
    , "dark beige bags contain 4 light green bags, 4 light magenta bags, 5 dotted lime bags, 4 plaid salmon bags."
    , "plaid green bags contain 2 pale salmon bags."
    , "bright red bags contain 2 dotted silver bags."
    , "drab lime bags contain 3 dotted bronze bags."
    , "muted indigo bags contain 4 posh gray bags, 2 dark lavender bags, 2 plaid chartreuse bags, 2 pale red bags."
    , "muted tan bags contain 2 muted brown bags, 3 dull maroon bags."
    , "plaid turquoise bags contain 3 clear teal bags, 2 dull tomato bags, 5 dotted purple bags, 1 posh salmon bag."
    , "drab aqua bags contain 3 bright lime bags, 5 posh red bags."
    ]


customs =
    """psyjxulrdtfe
             jeusdrlxyftp
             ufdpjsxrlztye
             yeorabxsdnhftujlp
             pedfxtsryujl
             
             tauc
             bauptcr
             uact
             cuat
             tacu
             
             xyadvrniqso
             mquglwtczhvpnb
             bmfnuqkvz
             
             fzynq
             yqznf
             qfynz
             zfnqy
             
             kisfzpdjecowv
             rkivjpqwomzsced
             
             prjbzgwkhoqcyxvnd
             vfsietlaqmu
             
             jucif
             cukfsji
             jicduf
             ficuhj
             cfjiu
             
             netxwkjlgmv
             nxjkgdvle
             nxhbylvqjek
             
             ejpfqsc
             rvewqcpsjmond
             ejspcq
             qsecjp
             
             i
             mc
             s
             s
             
             kbem
             eqh
             ep
             ehfp
             
             fgjmp
             jgoac
             
             hrulfeqm
             rlmfeqc
             lerfmjbq
             lebmqsrf
             zxflemqdirkya
             
             zlhc
             lhv
             lcvgh
             hlrq
             
             xziquhkfsrylncvmtpwgj
             gpukziqsymrflvnxcjwh
             zmdbpgwernuckvshfjylxiq
             
             qlmcfudnpbiyswjxg
             xbigfmnojlqwudysvc
             
             ypiduglmtwfcesabvx
             vpyutxdblmcgseiw
             deuwlbptyomgvcis
             dpcbvglstiewymu
             csuekibypvwtmzhdlg
             
             wxvjktdrapozsmiuhnl
             hejtosyximkwvdlnpaurz
             rszxhjldoutmvankpqiw
             jzvuhistngdoxalrpwkmf
             
             ekpxlh
             lpx
             plkx
             mpl
             
             ohgs
             hsgo
             
             tsu
             tbx
             swltp
             
             dzapkcqlmbsrivuxhg
             bazpqwldgvmxkuchsr
             qgxzlhkpmbvrcdasu
             lghvqradxukpsbcmz
             
             mybfl
             mbylf
             ysufblr
             
             vys
             te
             
             cvxtqoduaehfwmk
             cudafwkqvehmt
             thecvmzuadygqkiw
             qucobmdwavekhrt
             ehxtqcwdmrakvu
             
             txsjiaz
             atxszji
             asijtxz
             itaxjsz
             
             qeyduhc
             jwypnasxd
             
             vcuwmrbqlfjnopsdai
             inbshapqowdmclvfjrk
             ijqvndbwcftsmlaopr
             
             bhwejdzlkxv
             wvhbnkjlxdze
             jlwxbhvkezd
             vzhelwijbkxd
             
             qzi
             kq
             
             lxn
             rkq
             dcb
             a
             
             zwkgexbplschumdfyj
             tgdqbkmujien
             
             xmweu
             exuzowpmdr
             xqjuwisvecm
             weuxmf
             xmwuep
             
             zaomvcbwjlf
             bovzfwlmcaj
             mwbcoljzavf
             
             c
             c
             i
             
             zcrwoth
             zcowhtr
             zhcnoxtrwm
             
             yxznr
             tly
             gyfu
             
             gathskpquvxlbdfzwymrcn
             cshxqkvmglupzbyantfdwr
             bmncqhpwkurxvzalgfdyst
             waqthsuymlxcrpgkbdvznf
             
             i
             k
             g
             c
             
             vwflxaboznkurhmteiqgyjsd
             dhkwlymqtuserjfviagoxbzn
             dgtwbjeivsxuraonkhfmzqly
             jkfaimruevlqwhzdoxgnbsyt
             ralekoxdqyusbnmziwvghftj
             
             nftacgp
             tgnpacf
             ftgpnca
             
             asfhqbkpegmtzy
             szybtehgqmfrau
             
             nbjoa
             aboydn
             dnok
             onj
             cxvhponeiuzq
             
             imqja
             qia
             aiq
             
             ugrpmslbyjnkaxewozhivq
             kchewafgoxpurzljvq
             
             b
             b
             b
             b
             bhq
             
             yadlonb
             usogla
             qjaephztclorvfk
             
             ojk
             jko
             kovj
             jko
             
             y
             y
             y
             y
             
             bxiqpkcthlargdzevfoyjms
             krzosbvldyhapfqxjgwtme
             ezybmpxvalqsgtjrofkhd
             vjygdkqsptfbhzlmexoar
             vqafhgpzmrtkdyjesolxb
             
             wfysdai
             fasyid
             fsyida
             dsafyi
             gsqdnytapif
             
             rhiblyqavfck
             ukmrhibavgyocpq
             tiakcsvdblqyrh
             
             xqmysnfjd
             msudyfqnx
             
             whbnqotf
             nbcqgfhouzt
             
             ltfhwgvr
             etwlhrgnsiyvmc
             rgtwvlh
             
             z
             z
             z
             z
             z
             
             uma
             emaz
             
             nwzmqseauhcgryvpdl
             kxouljhagsnizptbme
             
             gnyv
             fbaryql
             koyg
             
             lmdhgykqxctasziwofjr
             wmackqyodhszftirljgx
             udtmcroqiahkzlfxsgwjy
             oidthqzkwmfgasylcxjr
             
             ujrfbtywhdqxl
             rejqtudocw
             tnqjideumarw
             kqdtsurwja
             
             aerykhpxivfbnw
             bavyrunpkwxfihe
             kxnlrpemhwicfyasbj
             
             xvnwdzmbsuiqok
             pxmbkvouqwszie
             ukwimebxqozvs
             zbqymikxowvsu
             qmuvozsiwbxk
             
             rfmcnesybio
             crneimqbpuo
             mcdhbroineu
             
             xctagpmdyfnojvqebwrzk
             iufvoepqmhaxnbwjgd
             dbjmxlgfeawqsupovn
             
             edvljhxzntq
             qtzxvjnhedl
             vzexlqthjnd
             lvtexjhdznq
             
             hiucfmdg
             hksfm
             pmxfbhq
             
             ufjzdcxewvgohk
             dzjwcxouvkhegf
             jgvuchfdzoskexwb
             
             ipwomhynajekrvscx
             aycrdsuwftzl
             
             eurpabstvqyc
             lajpuvkfxsgwcqremt
             cqopetuavsr
             crepuqasitv
             vsyqeartpuc
             
             au
             jux
             
             ikq
             kqi
             qik
             ikq
             kiq
             
             yaunzghct
             ynkaszgucvdxtwlh
             
             pfmzvyxijn
             jmyixvfnpwz
             
             lptjedq
             edtjqpl
             ldejpqt
             dpljeqt
             
             omgvpsezljfhubtq
             htqeobmjusvwfldgz
             uhlbemqyvjgftzso
             
             phxinzkyefg
             iyefhzngpkx
             yfgkxpeiznh
             fxnhepiyzgk
             kfighxypzen
             
             qlwrtnk
             rn
             lnt
             zfynjcas
             lndg
             
             tb
             bhtv
             tyb
             
             fleoqjmhr
             soimqleh
             
             zuxcqljmesota
             jmtqexlso
             xqetljosm
             
             zj
             nzprayjw
             jzib
             zj
             zj
             
             ypt
             pl
             
             rogyzi
             ivlgry
             yotgriz
             zgiyr
             
             nehkpwdczqyos
             dqtmepyhow
             qhydwope
             eydhowqp
             ehdqpyow
             
             ylfkrg
             uforztyvqgik
             
             u
             u
             wup
             u
             
             bxv
             xv
             vx
             
             cpjumevoiwftxybgrhsq
             jipcqtsvmuygbfnrhxeow
             wibaegtruphzxsyfljqmcvo
             ubtrxfywgdpmichojqvse
             cmhrikfvpxjgyuoqnbswet
             
             rximbyhodvesjaglf
             rfhglesmbxdyvaoi
             ragexmboivhfdyls
             yiofrgxmvhalbsde
             
             mxcrsutkbpn
             priozstxcgekwdmq
             sckbtpxmrh
             
             ewtshjfmkcgrzdpuqai
             wsuknzpgmvhqyctrfadeji
             emusqdbtzpgoijaxrwkfcl
             qpsakdrijemwcgzfut
             
             b
             aeb
             b
             
             qmhink
             hliknpum
             
             yonuifpczr
             mwlbsdyhzn
             
             qbenu
             bnwue
             uebqn
             neub
             nebuz
             
             cjbw
             lcb
             wbci
             vbhcf
             
             xazglivb
             agbzlv
             balvgz
             
             ckto
             to
             
             nrmt
             snorm
             nhmur
             tonmr
             
             dqlmczefiv
             ifqmvldzce
             
             thdorm
             hgmto
             ahiytklqbsvcmn
             rhmt
             mpht
             
             wdeprhgimuxk
             idvhprxjgmkewu
             
             yqcozgdajfib
             uqgxafojiys
             ykjaqnfogrpi
             eiqwzfoaygj
             
             qxerb
             efsqz
             wynkpehjlct
             rxoe
             ue
             
             sowgyevzruikhnpadtl
             ylpinthwdouagresvzk
             srlwuaoidhtevgpnkyz
             kgowaehyztdpuvnslri
             nhafovisuyzdrtgpkewl
             
             d
             d
             d
             d
             
             mtqk
             tqfkrm
             fqkmt
             qknmt
             mktqco
             
             fz
             f
             f
             f
             f
             
             syebiqrg
             rism
             ikats
             musi
             
             nhavkyfexz
             zahynkfxve
             nyeafqzkhxv
             
             qtojrevdcakbm
             okcabmerdjt
             yjaurokmndfecbt
             braoedjmwzcklt
             
             mtrlehyj
             rjlhymetg
             ylmhjfet
             lmehytpj
             
             yvhdpojulfkenqwbrs
             zbpasjfwdnxroqvlgckhu
             dpsvbnkfrlqwoyhuj
             wtvjnulkdoqrpbhfs
             
             vxkumcely
             xlnfymecv
             
             rb
             g
             zr
             b
             
             fowha
             fawoh
             awohf
             wofha
             ohafw
             
             vcwfuq
             qvcufw
             wfqvsuc
             ucfwvqh
             
             vw
             renkxpcob
             iuwmz
             h
             
             jyqmoxfuw
             wmujf
             zpmish
             
             whcjsfniotabrlx
             aomjwtcrhfxnbeslv
             ortnjacxeblfwhzs
             qyagxnchbwjoustlprf
             kahtzfxwjorcbnsl
             
             vxjmbw
             gomxsiduv
             zcxfbvm
             
             agqivyh
             yqghviu
             
             b
             vrxznhel
             bgap
             itsp
             
             xqlfvnpyswztbekjaod
             jdtazvoswknelpiyxqb
             spyqvjeuznwlbcadtkxo
             
             anso
             dxywl
             
             abwgum
             amws
             avwjxym
             wam
             amw
             
             rqljdeuygocatmsxbkwfpvzi
             dzcvktpjlhaiyfbmowxuqgse
             qwligstokuezbcpyfjxavmd
             wujleyktvrsazodgqxbpfimc
             
             qdxcnywbr
             xznrtwvydcm
             cnydwrx
             
             yprzo
             bproyz
             sgzyorpx
             oyzqpr
             
             lirstyawhjgfvqnupe
             avfqphwejisygrunlt
             
             ndsirvcqkebtuofa
             cnraebdvfqpsikuot
             kivdusqtobarnfce
             rtanfusicoedbvkq
             
             mvexgca
             xgemoacv
             ygclvamex
             mvexgca
             
             pomdz
             exwczso
             
             edahvyqfitjrwgncsz
             knbeijqghsvcat
             scqphvejigtan
             qgjvxibnmthseuca
             
             jlirtpfkmosvbzcy
             mpthzsrkfgecilojabdy
             tnmsplqkfcyzbiroj
             mifnbykjrpclosxztq
             
             vdyfjmh
             zaclvhxfygj
             jmhvdfy
             fjhykv
             
             r
             q
             q
             q
             q
             
             mrtzwkpdhi
             bvqgfalrwoxsyi
             
             vuw
             bnhu
             otus
             mplu
             
             tjmg
             motyxj
             jgtm
             gmtj
             
             rujkcoblgzpdayntsmv
             okruvntghfpyajbcwlzsd
             dantscjogeurvbilkzyp
             xzojgystabcrdnvlpuk
             
             xohyfb
             pihs
             zutwh
             gakmdjnlv
             yrc
             
             xmbehuakcqvjrpzgfidsyl
             jpycigslahwxdemknofbuv
             
             hrxkzpm
             khxp
             hkxp
             hxkp
             
             x
             x
             x
             r
             x
             
             qrnatwkbsjy
             iatkwrysnq
             wncsqtuaryk
             
             uxtrvkzywdjnfsmhbogcpa
             nbuzrkagtwosvdfcyhmxpj
             mrokvgfhuwsjactdynpzxb
             ormjpzshwfcgdbkvxtunya
             tsjapmhwzkxyfrnduocvgb
             
             cwjibpntreofusqgadvhxzy
             tbpknsfvcrquegxoidahyzwj
             dfupeotczqwjahvxryngsib
             fmjrnipaqesxyvdcgwohutzb
             bipzvcqouynrhtwaxegdfsj
             
             efiuhbdrwpzltnkac
             mwditrhnebcukpzfl
             kricneuaftbwpgldhz
             tcilfzrunhwdepkb
             urkzhncdptbfleiw
             
             mcjpg
             rmijgtc
             
             bcpxuyqnemsgaihovwtl
             paylndcgohiqbewumvt
             
             jhviwnexrzftgy
             tfeudvzrnxgy
             pxstnzrgvefy
             
             majeinxgl
             lxajignem
             lnjgamveisx
             
             gmhvjqedu
             hqengldm
             ghuvqmed
             dewfhagrxqzm
             mdqhge
             
             vrlyo
             ywo
             woy
             woy
             
             rwzq
             ursqncgw
             wzqr
             wqr
             
             olci
             lc
             
             p
             p
             op
             p
             zp
             
             kpq
             skcu
             
             qxhjwce
             chjqewx
             wtjkchxeyq
             chwqexj
             hwxejqci
             
             anrbwkmdoylzpxg
             cqylitwdvmzej
             nhdsrwufxmyzl
             
             mhjkzey
             smrnqaljvp
             
             s
             sim
             sk
             sky
             bs
             
             q
             qd
             q
             q
             
             kbjqrfcsvledptazyhugoi
             wjsdvrqeailkftzuhbo
             
             ytxjunebqsg
             qyuazrtgejnbx
             xjunbtqkey
             xegubjtnyq
             yxbqrnjute
             
             msvygnzd
             lbnjotikdgz
             pfzgrhqnd
             xednagzv
             fwgdnrz
             
             xmnvd
             dmyqvnx
             
             abhdgjrcskfelp
             befplkcrhdsgja
             hjbcagsrdpklfe
             
             pkrtlvmzgxeoabwy
             olzregptyabxkmw
             
             kgmypdsiev
             yrgkvcme
             wrvhemakyg
             
             hapfkirztjdqslumxbnowecgvy
             minyfurqzahvkjplosecxwtg
             
             n
             uw
             n
             h
             
             gxfcnkbsqrehumoltjwdvyzia
             irwgvtzhkjomblyaxqedfucsn
             euztvnfrgxkalbwcidymhjosq
             bluaioskrzdyjwvxqhctnfgem
             ixuqesyavghrbfmokwndczjlt
             
             isyjneg
             zawfy
             psxchy
             iotbvqmly
             
             fatwxv
             xawftv
             vawxtlf
             aetfzvxw
             vtafwx
             
             oeunt
             tuone
             touen
             uetno
             otuenp
             
             nxfkocywbvez
             bkvecyonxzwf
             kyerboxqfcvzwn
             zovwkexycfbns
             cyfkonebwvxz
             
             iynqfrlcuxmkazwe
             nklazemyfuxwqir
             yiudaqzkeflwmrnx
             
             zuxleb
             euxowpyzl
             
             y
             y
             yj
             
             imn
             mni
             nim
             nmi
             imn
             
             zpdvmaonwslqf
             eiwlyrdnovzm
             dwomtlnv
             opvmdlbnw
             
             bymtkosevw
             jmbl
             lbm
             bm
             
             eziagcuksbvopnhlt
             hpknvzgetscalboui
             ozcsbehgkitlapuvn
             lzskitunbghveacop
             
             wcstlfkbdehizg
             bwfodtczgmesrkhalin
             iewgsdyfhzkbtcl
             fqztcgkhibelwsd
             
             uoajlenpdmgzwyxk
             nyguwlokxmdjazvfep
             yagkxwnezpdmlhouj
             aegxmwkslnpzoydju
             
             isewdj
             swedi
             dwsei
             
             muexcjgzwo
             ywmzonecgjxuq
             zgxjmwecou
             gwcxujezmo
             xowguimjezc
             
             nmkuglojyqt
             lb
             lv
             
             vnghbclojyatpe
             bkpaeucohvgfyw
             
             npi
             hyb
             t
             d
             
             jfwl
             lrwof
             
             aklzvcubyigjenfpordqtxswhm
             bzngdfkpshulwxqrvoytmiaejc
             
             ail
             gali
             
             hybtnavm
             mvbtn
             ktvnwmq
             anvtm
             
             ipzls
             spliz
             lspzi
             slpiz
             szilp
             
             u
             hv
             f
             f
             
             mbpdcfykahrwutezxsi
             wtzumakvibxyfpserhd
             
             m
             m
             m
             m
             m
             
             ahz
             ha
             ah
             
             b
             b
             b
             n
             b
             
             qfae
             efq
             eufq
             mqfe
             
             thkbevrxw
             bkwmlateh
             wkeqtbmuh
             wubktfejh
             tbghyemkw
             
             yphtjurbxwvfslk
             gozcmqakdnbeix
             
             smyokqtxgrzhu
             dsiugwamcrzfoqpt
             qosugtwzrjmv
             
             gyfhpxo
             bhpygx
             cpsxjhg
             xilgphw
             
             rt
             rt
             lrt
             rt
             rt
             
             pfiwlonuysmajxktqgrhv
             afwvuyrztinokxsdcqlhm
             lnqxtmrfvosayiwuhk
             
             enwyubthrivocskdaxp
             jhuelpncsmdtxovbik
             
             xfzlchwodr
             zwhcordxlf
             
             bqrad
             bafrd
             
             uvncdmyslxb
             scvmnuxldyb
             ynbmsuxlcvd
             cbmnsyluvdx
             lvscduxnmby
             
             miyruh
             uhzy
             yjvuh
             cuhy
             hnylugjpt
             
             xjncqoi
             cnojqitl
             
             qpvhxoyunblgfsikwdmtcaez
             ztgciowvrlshbqnfdeyukmxa
             vcuewhfomqnykbxajsdliztg
             
             wnrkvj
             wnjkr
             
             zbtaqcugymsiwdl
             ibwguqsytdmlczo
             txgceqirdmysbzuwl
             zlmxgqyswbtiucd
             zynlcqgtbdmhiwus
             
             jzedbcmwxfgpq
             kwmbfgjrqzxpod
             drxwjqbgtmpzfs
             
             vurqga
             vgquz
             qugv
             vqug
             vqugz
             
             nixusrfwado
             epiyljwrzxauqdonsf
             nashfixuwrod
             fawnusdxroi
             wduianrofsx
             
             ugqpkfsrnyj
             wnesyrlgiujzt
             
             x
             eu
             u
             
             zbetljwkx
             k
             fkvry
             hkurfo
             
             knfthjivoy
             ojyiknhtv
             vtyokinhj
             vhytkinoj
             ynhikptjvol
             
             csxfmtnoaqpyeidz
             xmpinfcdlgsyqve
             fiqupdebsynmxc
             faswcpiqdxetmyn
             
             svkjpxtfdqyhiolambzwn
             fkmzblstpaoxyjvdhqniw
             qfplwodkznmihjsxtvbay
             abowfdjshxikyzlmptqnv
             hfspbqyaxlznikotvdmwj
             
             rctfbgzp
             gbpftzrc
             fctzrgpb
             
             lejtpynh
             
             gf
             clfg
             gf
             fgk
             
             sodiucqmlafg
             unfhqboscpijgxmk
             
             ihevxjqsmlbpt
             mxlzbqhavjipyet
             jpihtrbevqgmu
             
             btlidxoenkagfjpw
             oeginalxpdjywfkbt
             wolapixjvuedbfktn
             
             vdabnqmywx
             mvsycjnxpwqb
             ixymnqvbw
             mxbknvywrq
             wymbnvgiqx
             
             yxjbdqsmuhwcgzpaknv
             jgazxpuymqbsdhkw
             
             sgnzovqr
             znrgq
             zbqdnga
             
             dgebpu
             pdgbeu
             
             lpxsdmwiv
             lgxociyzutpq
             ylcjiptx
             
             mevcwpxfakhiusdltb
             hvmguqyjzikbfropx
             
             bohqjkcugsyxzpa
             qkpsbxajoygcz
             qbgajkyxfzcpso
             kozhspajqxcybg
             
             ibzerqhvujslnocgpkfyd
             gfcqkhslpzemwtuvjdiryn
             kucpnszaivdfqlexrjghy
             
             ofjdnik
             fpgkiwj
             caemszlx
             rbvyti
             
             gt
             g
             
             u
             uwgvce
             u
             
             lewibuhsaxknqr
             ewjogalxqucnzbi
             
             psxczted
             pzetsf
             
             tidjmqweyhoglfxnsz
             sfeotrqlidhynw
             ldtiysqfwehuonr
             leqnvsdyofthuwi
             
             ipqkfou
             qgkioxpfu
             ipuoqkf
             ifoupkq
             kqfopui
             
             f
             u
             f
             f
             f
             
             xsipeov
             znhgawtb
             uk
             khlty
             
             cbtuslj
             tybslucjq
             sjcbdult
             
             ukqat
             qantk
             qkat
             ktaq
             
             zhbdtnvfqoyis
             guzixoynpqhmakec
             
             pjeiudch
             dcswpiohj
             vychkdjipbq
             
             mrah
             chmea
             mhar
             amh
             athmb
             
             icbodum
             mnuv
             ouim
             mhjaptgxwr
             
             tzrlebo
             zborelpt
             voektbzlr
             
             l
             l
             l
             l
             t
             
             mto
             whto
             
             hpeslaqyg
             zpiaqceyolhs
             ehaqlysp
             lshyegpaq
             elfyqpsha
             
             romucgitvqayb
             bhuvtqyciaogrdm
             
             xptnylg
             ylxngt
             aixymvtnlwgz
             xnytlg
             yxltjng
             
             eoarkfglncpbs
             rtpuasdcoxeifnm
             wseorahpfnc
             oqaekfsnrypcb
             
             xeuhcqm
             qewumgd
             
             jkadlsqztn
             tsqakjznl
             zjkqsantl
             ltakqjsnz
             
             xfgk
             dxg
             
             suothae
             osuahet
             aoethus
             
             vqetwh
             eqvhwld
             wxdnqhv
             ufvisjwpqahc
             hqnzvkmyw
             
             xgybrmwl
             myxibrwg
             
             umvjxpz
             xupvmjz
             svxbzpmju
             
             mefoyntbczkxvhusraqjl
             ehmtyaquvlskoxzbfncij
             jlxtpyqowbhecgzufmdnska
             
             nomjqcaegz
             agcnqomj
             goqjcman
             ngqcojma
             
             ylpachozbjsnwt
             ybtwjozpacnlhs
             lsnbacjohtwpy
             pbaoynhlscwtj
             nhjkwtlbcopasy
             
             wazkf
             zafkw
             kzfaw
             wfaskz
             zkwaf
             
             jdylcghes
             bvfuokra
             
             yhlrqgmtcuxpzk
             mhqoitkdcxgsfanzpyurjl
             uygpzqhrkcxlmt
             kgmcbhlzxyutrpq
             kqxuyrgczpmtlh
             
             vwp
             cwe
             
             cgvspqxmtbwyhiluafkrn
             vmrtwyzjqncgblpasfiohxd
             
             mdueyvnlqapjcfohr
             symlcwdurgvzehnfoikaqt
             
             tgroefs
             qwbak
             j
             ym
             
             yvse
             yecv
             
             ieacpfgu
             xsnkrhd
             
             vynuphbmfjdsqwgxe
             kozalcuqit
             
             hanez
             azpn
             nayzb
             nza
             
             dabv
             bga
             ba
             amckjbe
             
             epkdibuvzqaycjrmn
             zrcaevkujinpmd
             vukdparzimlfjcne
             
             ajxnmvql
             vlpeb
             elpvd
             krlspv
             
             nsqk
             kiq
             ikq
             
             vmqltdrubk
             nzrogdbqmu
             
             sraulgkqtjnib
             zvmahfecdypxjbrow
             
             tmdjh
             htmu
             htm
             
             qmzkaewsdyjvobrplxniuh
             hjecdsnkivbplaqurozyxm
             lbdsoyzhvxaipkmjcenruq
             uvdlshyrxeokqabipjznm
             
             mnwzxtdeh
             nphdzwe
             ehyxndwz
             dxnwhez
             dnwbhvez
             
             fizvsuln
             ifsnvzlu
             nlsuzfiv
             nsuivflz
             usfvnzil
             
             ouwnajlxteydmhcgqzk
             xqrhnkeywuclzgsatomvj
             wdfegyljbtzokaqnmxuhc
             uygnajlwfkotchdzqexm
             
             unrofzdxtmv
             klhzptxub
             tguxzb
             
             zijdyhupnbvmatxwk
             tnzhajkbxmuvpyiwd
             ynkjivupwhbtzmax
             pbwnfizkyhavtmujx
             nhjxyauvkimwpzbt
             
             kfsgo
             fgkos
             
             dyepsohmrqivg
             ohipsdrmevgq
             vhgodspmirke
             
             zpnfrtskxlemhji
             kxnlemufwyqcrpzhst
             
             nsvhxzcwb
             rbavizyc
             bknzmcxwvo
             zbvhc
             
             mejhsdcy
             bvaqg
             
             mrpzqycif
             iochazwfbp
             zipoecfb
             fiuzpcxsdj
             ficzptk
             
             jzkdfrleqiv
             qlrkmfdnyevc
             qsnvguxkfrdle
             fvdqgrelk
             wbeprdlqvohfkat
             
             nbuhmr
             xwgr
             
             sza
             hrzajd
             alzs
             xiaznbe
             wzah
             
             wcmshqoi
             qcds
             qflacs
             
             qkw
             wjqk
             qwk
             
             qgri
             qirg
             riqgw
             rqgi
             
             denb
             gen
             ne
             en
             wenh
             
             lzounafyd
             wbomsfldq
             vkoptil
             aroqwl
             
             jgd
             w
             
             xgzqwsdoeirvthlcmubyk
             rfemgxkvsnoydqzuwblcih
             cqwloikevzsxrudhgmby
             mlxtsvqwidzocgbeuykrh
             
             j
             h
             t
             j
             j
             
             li
             li
             il
             li
             
             olcqbjrgumixeyh
             bkluzohywiqgedtcr
             qheyrbiuolvgc
             urqcgeihobyl
             
             rdcluvht
             ofbymqpe
             qizjgxwasnk
             
             ucypvrob
             ocuvbpyr
             cryhuobqevp
             
             xdfazujoec
             efuocjd
             lcumyfjqwseokdv
             euofcjdh
             drecojuf
             
             tvxlf
             ftlxv
             lvxft
             cvxflt
             
             nuvxtjmdgzpwb
             xdbowmnpluzgt
             tpujdbnzxwgm
             dpryqkwbzahiugmfetxn
             wjgzbnudcplmxst
             
             vcehnodya
             voyaedhnc
             vncayeopdqh
             
             gouqjpnsdfxa
             xnafpjscqodu
             fsaxoqjdnpku
             updjqfxsnao
             ukxqpasfdoncj
             
             wmphdfsrqyoinzv
             ynaezscqgipwxkjbfol
             
             vpzah
             phzva
             zpavh
             zvaph
             
             rwnocdibptleasjq
             qrlbnhjpoxdaeic
             nijfklgduczorbyaqpe
             
             ihjbvfzxcdlsqrtymuga
             umyfgsijtrhvdbqlcaz
             rhjqmbgivsuaztlcfyd
             bujhfrdzavltgqicmys
             
             edgm
             ybfad
             d
             kd
             
             pzbqrskv
             zvpqb
             zapqvb
             pvzqwtb
             
             ngzjoelwdctkmxvuh
             svntuohjcxgezmlkwd
             zdvetunxmlgohwjck
             uhsxmgvdwktczejnol
             jcgevxomutwkzhydnl
             
             usoedqakicjflztnyrhx
             tfbnuxsajrhdecykzlo
             ozcvythnxefkarpsdmgwluj
             
             jlipyevhat
             idsojl
             
             xmity
             gytlmqw
             
             vjgrtichqsxl
             fkvlxhjqd
             qhbvjxyl
             
             iwzem
             ziw
             iwz
             zwi
             ziw
             
             dbtymjcu
             ymcbuh
             mreuycb
             copybum
             mcubyv
             
             fegictzvlnxdha
             tachdpvizolk
             lictdvazh
             aodhclztvi
             
             jcpnadfhwgeovbszky
             vpzosfkygcqndhjebwa
             vwkjsnfcbgdphzyeoa
             edpfvgbwczkohjsayn
             fdwaghepjbcksoynzv
             
             zlxqgoiumrakcjyst
             krigqszocyumlatjx
             qakilzgmtoyxjcsrbu
             
             zrviblt
             ltzbvi
             bizvlt
             bvlzuftsi
             vztrilba
             
             lud
             lue
             ul
             
             h
             h
             uh
             h
             
             uv
             q
             
             x
             glbh
             
             kvoencugyfl
             yofgcuvken
             
             txjinyudaqhr
             ienxjuythdqra
             tdiyhxnqjrua
             
             zatkjruqmnxevopigfdlwc
             gfwvqscpjxyzuatekodblnm
             exwvdgybocjaftulqkpmszn
             wscxtofveuzpjdlamgknqb
             
             vof
             fioncw
             uysxefgjlomr
             ofivabc
             nvafoik
             
             loydakqtwgchjm
             yguwltdkmoh
             
             apfvnouydmitbzh
             cztoiunfhdpab
             mdhniogptwufa
             uharxdnoitpfqj
             uydantfhgiop
             
             tforemnhabswydvlqpjcx
             znmxhvfesgorcdwil
             
             bauqdkxjhrmvnszlcwiy
             sywdqnlikmcvbuzjrha
             nlmdsvrijwzahycbquk
             mjswqhcbvyzliukndra
             
             axpmwjsdcub
             ljcfsarmw
             cawmjs
             xjwmcsab
             
             ohavrpzj
             jzampeor
             ejproza
             nkpjorza
             
             jhgdaqpbneoil
             ionpwbahjge
             jneozufshpbgrv
             hnoxgpebj
             hnoptygmbjek
             
             sgpmhdfckaoj
             gmdkhcjpouwa
             crhtpjzbkoadmg
             pmcaghdknoj
             dxgoawcmkhpj
             
             jakoipgcuf
             qpltxbn
             ypq
             mpyzdvr
             
             jmihyklq
             hlzjmkqyi
             qimhlkyj
             wjfdqlkihnymoa
             
             olydjnawrmbufk
             ozuydljmwrnfkb
             djyaokwbfmlnur
             oekynqmwcbsrdfuglj
             kunbyrwodfaljm
             
             ljdgkvry
             xyjrdgplk
             ibjlegkdsn
             
             hzydsqnfj
             qvsdtjflnhyz
             zdnyjsfqh
             dfqznhjsy
             
             oanzwhly
             zoyhna
             nhgzqkwyoa
             cuonyizvbhaepmr
             hzonaslyw
             
             rgcehqlozdsabvp
             hcarqvbo
             hrtcawbvioq
             
             eyqnwcxjla
             nqeljcwykt
             xcqlyejnw
             sqonewdcuijglyz
             wljcnqeyk
             
             gpx
             xp
             xp
             xp
             
             swxyijbnavmglekhuc
             jgbudhtzawekopqlnvmrs
             
             neim
             neim
             nmiec
             eixnm
             enhbmi
             
             kmbepxt
             runcgywfaqzlsvi
             
             zveliykpqndarsuftjbo
             xqihgkmcfopwylavb
             
             ghxcsv
             xshvgc
             gvscxh
             ghvxsc
             
             drlyqcunxwzgoms
             emfabsxcygwdikpnqujo
             uysdxnomwcqg
             
             zmvrealnydqkifu
             rknfzcuvapbxheyqsmg
             
             ompbxenhgvcs
             rwfjiylnkzpeuq
             
             groezxqwidf
             qbzltifrhywvnjs
             
             fsjagxk
             karfs
             silfakwyt
             sakfg
             kmafs
             
             e
             aez
             pae
             eykuv
             
             luhcwj
             iq
             iza
             
             nftsiawryqhecjkgzuxl
             rqtsygnzdufbjiwvhlocaxe
             phsrufmceijyqwtazgnlx
             tygruqxlchjwfseainz
             wxsncygeqihrzfjtlau
             
             bneaimfhlcygdxvkst
             fbvchledknxmgayits
             cnmbfxyhsvtegaikdl
             tilmfbnhvyedakxgjucs
             
             mqcp
             fmgtovedwzq
             qpam
             qnmaxl
             mq
             
             hmzpxtucfoysliqj
             huikytjzlmqcxfps
             zueifxqmjsylhpc
             
             zgduvyrija
             rakgzmjuyxv
             rzvgjuiyad
             
             xzvsbejcya
             xaslcze
             osumxhgrea
             qylasex
             
             rjyxncefiovtmqwhpugz
             ytqbcjzeoifhlkwmru
             sojeityfchaqmurz
             
             milysouzpfjc
             vadgrfkxunbm
             
             qfolardivwmhespxtzjgby
             dfpzlnrskmoebxgqjha
             
             aqpfzbmody
             mwzdqyboapf
             tafoqdmbzyp
             
             mcksuqprlojgynzhfdvwe
             qsmpukofcwxjhzgvlndery
             vkpmnzyqewhurtsgjfcldo
             prfjyelktwnhovucqgmzsd
             vcsmdjzkqgbyonleuhpfwr
             
             k
             kr
             k
             
             cbzktdsxpwlaue
             iycwaklqez
             
             skz
             ksyz
             izsk
             
             h
             h
             h
             h
             
             de
             de
             ed
             de
             de
             
             bwadco
             awtbo
             bwioap
             qbznswyoa
             
             eskapvxrho
             xbahknsvyl
             svhoxka
             ksaphtvex
             
             btyzvfnciklwus
             vimkgfjzbtysncw
             kbxfvtpsczwniy
             fziwkctnhsbyv
             nscftgkbzdwivy
             
             dayrklsxctwheum
             ztoliaksbgdw
             
             fbyp
             pby
             ybp
             
             gpoziqfbaduexlsyhtmnkjwv
             bnhxzldmpateywikosjru
             yndphlzjucowiatekxmbs
             esphdyumjiklwnxzoatb
             smohkpbnlaiewxdujzty
             
             hxv
             vxhr
             xhy
             iuhoeaxl
             dhxj
             
             gyedwfvmlahiqs
             dqwfgmvyiahsel
             awgmevsdlfhyqi
             clwkvdsazuhgyfqixme
             
             vozrdgsb
             bvxdr
             
             crvtd
             rvd
             vrd
             dvr
             
             o
             o
             yrod
             o
             co
             
             geis
             eligs
             segi
             
             ctfdiqwolp
             rqfdliwpc
             lxwdqafcpi
             fwcdriqlp
             
             dzrpwvt
             zvtd
             dztv
             vdfzt
             
             vpmrfhkcsgo
             vomscfpalhkg
             hcfdosgkempv
             
             ykdoewlf
             fdewloyuga
             wyeflovudi
             
             gjbrvulsdxtnz
             whmupycejovifkrdb
             
             f
             f
             jf
             fw
             
             fgaleupzcnkjovwqsx
             lguskvxoejfnwc
             
             py
             pe
             eap
             pe
             wp
             
             yomngtrvlacskfe
             nteloyckfgvsm
             elfgmtvsyconk
             zjcgteumkiflxoyhvndsqp
             
             caqimjtvgdkouplre
             vrdocqjilmpuktgae
             gcaulrmeipkqvdjto
             
             wpjfoqamdkgcveruzlsyhnbt
             vgpfqlrudkhbcjszmeonatwy
             
             no
             n
             icn
             icn
             iny
             
             wf
             fw
             
             nxubqrfzkywg
             spwarfxqv
             mwxrfq
             qewfrtsxv
             rfvxijtwhdcqo
             
             ocptwdlkmurya
             yuzkofdibmtar
             tmkvdoxnyuarq
             
             kavlyos
             oyskvfla
             jskivploaym
             olvyask
             
             fycgdv
             vgidfy
             dvgtzyf
             
             gnplci
             zsxvwjfqbd
             
             nfwzcm
             iwcfnmz
             mnzfjcdw
             wcminfz
             
             ikmlrbopfdtw
             nuqeghadpylzjs
             
             njlbv
             tbuljn
             
             fpnvdorgqzxsjbi
             wryihdaogqkfbjv
             ljfdqcexivrogb
             
             ngzrich
             ihzpklcu
             frxpczhl
             dozwymcevqbsht
             
             afljkmqeci
             yaflxehomcjkzi
             cftkeamilj
             nvijakmclef
             efjcklnmia
             
             felrqahy
             fyelaqhr
             arzhylqef
             afdyhtlqre
             
             kjrpum
             kujmpr
             mkjrup
             umakjrp
             jkpunrm
             
             gthfr
             gtfhr
             frthgv
             tgfhr
             hgftr
             
             p
             tmup
             p
             tp
             zfkip
             
             saqnxpjfuomebhkzdrtc
             uwhesdjtxkzcafpqn
             tdjvafusgheckzxnqp
             sngzjcedxpfhtakuqi
             xnpfhaduzscjetqky
             
             uyba
             ud
             ksu
             
             xclr
             xlcr
             rxcelu
             
             matkfjl
             jftlcke
             tkljef
             
             j
             sb
             p
             
             bozex
             qeonv
             agksmtwcihjfy
             
             pt
             pt
             ztusdnpi
             
             zoixnmev
             giqpnzumxodywveh
             ltivmaocexzn
             mozvkniex
             
             juzlnpekqvogxfism
             ejvcmtr
             vymhjaced
             
             wcruqjlgz
             wzqrjulcg
             zqujgrlwc
             jqgzucrlw
             rjqlwgucz
             
             bz
             z
             z
             z
             
             gdsv
             dfsvg
             ghvd
             vwjgtdc
             
             zbimajtohqr
             rmijqzohabt
             mrztioabqhgj
             
             mdclzgonjvhtrqp
             gvpdmnzlo
             onzgelmpvid
             vunzldgopmf
             
             rwjmlzcbnpyofhusqd
             erzoqkcfmsbhjnwpydul
             mbqwapzhsjluydvfrnco
             lozrnjwbhyqsmcpfdui
             
             aqdyf
             lzcg
             
             v
             vt
             v
             mebcrnx
             
             yvtdplhcbfkjasqguw
             hcbkdpyqfavuslwjtg
             suylhtkpbaqwcjgdfv
             qwvpzkstgjbnchlaudfy
             
             rjxqa
             dxps
             
             ca
             amu
             a
             ca
             
             givk
             uo
             wej
             ou
             
             ke
             e
             eu
             
             wtpikf
             ytifp
             pjedfin
             
             zscflyduhignp
             yres
             xybse
             ysw
             yswv
             
             cpqzwb
             ltzwgbj
             boinwz
             bwoz
             
             u
             u
             
             ozlven
             vezl
             
             jiyksqw
             eonjglysc
             
             ycperjbkoqvswlh
             xlzorbgcjwnesqahki
             
             zcwqxv
             cwvxl
             vwxcks
             lxvcgw
             znxlvgcw
             
             kyqum
             kyqu
             kuqy
             ykuq
             
             floctumsgrpbxkwzin
             uwklcbfmnorsji
             
             jlrhzxdne
             nhexdr
             
             jeyhcdlwikmsgorfazt
             jskralwmtozfchydgei
             lwefmrhagtckjyisoz
             mtlwfechgaojkzysir
             pqlfvwscekioxhmzjtgrnya
             
             obmkdeqsncriuxlwtvaphfzy
             luivhzwqpxodnkytfcmasreb
             efhnutspvqridkxlombyczgawj
             
             qnxafwkejo
             wmebyasu
             laweh
             eiwgbar
             
             bvuzjq
             qjvzbu
             juzqb
             tequjmbzk
             zbquj
             
             iv
             b
             w
             
             kfdtwyhglqasvpj
             qftakvgljspdhmy
             jkfqsphvdlgtya
             
             dotum
             dwmohcu
             tjauoedmx
             
             uofxvehmzc
             mzsufnhodjye
             ftqwpaibrhumlkg
             
             tusahzgfcm
             mtghslwynoacvzu
             uacmgzths
             
             wayjenb
             wneajby
             
             gcdowyeur
             agswcm
             fvgoacyrd
             bnzxcligh
             
             p
             hm
             ba
             a
             
             rspcoxftwlqgjahkunz
             aqcniervgdjpwzfxuoym
             
             edqsljvipbfycraw
             ceiqdwpajvslfr
             itlfxgmhdsajupcwvqr
             pwqblisvfcdarj
             
             colbzjkaqhu
             cfoqwhauskb
             aolpqkchubn
             rioydtgavxcuehbqk
             
             ez
             z
             maz
             a
             slfxnio"""


boardingPasses : List String
boardingPasses =
    [ "BBFFFFBRLL"
    , "BFBBBBFLLL"
    , "FBBBFBFLLR"
    , "BFBBBFBLRR"
    , "FBBFFBFLRR"
    , "FFBFFBFRRR"
    , "FBFBBBBLLL"
    , "BFFBFFFRLR"
    , "BFFBFFFRLL"
    , "BFBBFBFRRL"
    , "FBFFFFBLRR"
    , "BBFFBFBLLR"
    , "BBFBFFBRLR"
    , "BFBFBFFRLR"
    , "FBFFBFBRRL"
    , "BFFFFBFRLR"
    , "FFBBBBBRLR"
    , "BFFFBFBLLR"
    , "FBBBBBBRLL"
    , "FBBFBFBRRL"
    , "FBFBFBFLRL"
    , "FFBFBBFRLL"
    , "BFBFFBFRRL"
    , "FBBBBFBLLR"
    , "FFBBFBFLRR"
    , "BFBFBBFRRL"
    , "FBFFFBBLLR"
    , "FBBFFBFRRR"
    , "FFFBFBBLRL"
    , "FBBBBFBRRL"
    , "BFBFBBFLRL"
    , "BBFFBFBLRL"
    , "BBFFFFFLRL"
    , "BBFBBFFRLR"
    , "FFBFBBBRRL"
    , "FBFFFFFRLR"
    , "FFFBBFFLRR"
    , "BFFFBFFLRL"
    , "BFBFFFBRLR"
    , "BBFBFBFLRR"
    , "FBBBBFFRRR"
    , "FBFFFBFRLL"
    , "FBFFFFFLRL"
    , "BFFFFFBLRR"
    , "FFFBBBFLRL"
    , "FBFBBBFRLL"
    , "FFBFBBBLRR"
    , "FBFFFFFRLL"
    , "FFBFFFFLRR"
    , "BBFBFBBRRL"
    , "FFFBFBBLRR"
    , "BFFBFBBRRR"
    , "FFBBFFBLRL"
    , "BFBBBFFRRL"
    , "FFBBFFFRLL"
    , "FBFFBFBLRR"
    , "FBBFBBBRLL"
    , "FBBFFFBRLR"
    , "FBFFBFFLRL"
    , "FFFBFBBRRR"
    , "BBFFFBBRLL"
    , "BFBFBBBRRR"
    , "BBFFBFFLRR"
    , "FFBFFBBLLL"
    , "FFFBBBFLLL"
    , "FBBFBBBRRL"
    , "BBFBFBFLLR"
    , "BFBFFFFRLL"
    , "BFFBBFFRLR"
    , "BFBBFFFRLR"
    , "BBFFFBBRRL"
    , "BFBFFBFLRR"
    , "FBBFFFBRRR"
    , "FFBFFFBLLR"
    , "BFFFFBBRLR"
    , "BBFFBBFRRR"
    , "BFBBBFBLLL"
    , "FFBBBFBLRR"
    , "FFBFFBFLRL"
    , "FFFBBBBRLR"
    , "BFBFFFBRRR"
    , "BBFFBFFRRL"
    , "BFFBBFFLRR"
    , "FFFBFBBLLL"
    , "FBBBBBFLLL"
    , "BFBFFBFLLR"
    , "BBFBFBBRRR"
    , "FBFBBFBRLR"
    , "FBBFFBFRLL"
    , "BFBBFFBLRL"
    , "BFBBFFFRRL"
    , "FBFFBBFRLR"
    , "FBBFBBBLRL"
    , "FBFFBFFLLR"
    , "FFFBBFBRLR"
    , "FBBFFBBLLR"
    , "FFFBBBFRRL"
    , "BBFBBFFRRL"
    , "FFBBBFFRLR"
    , "BFFFFBBRRR"
    , "FBBBBBFRLR"
    , "BBFBFFBRRR"
    , "BFFBFBFRLL"
    , "BFBFFFFLRL"
    , "FBBBFFBRRR"
    , "FBBFBBFLLL"
    , "BFFFFBFLLR"
    , "BBFFFFBLLR"
    , "FFBFBFFLRR"
    , "FBBBFBBRRL"
    , "BFFFBBFLRL"
    , "FBFFFBFLLL"
    , "BBFFFFFRLR"
    , "FFFBBBFRLL"
    , "FFBBBFBRLL"
    , "BFFBFFBRLR"
    , "BBFFBBFLRR"
    , "FBBBBFBLRR"
    , "BFFBFFBLRL"
    , "FFBFFFFRLR"
    , "FBBBBBBRRL"
    , "FBBFFFBLLR"
    , "FBFFFFFLLR"
    , "FBBFBBFRLL"
    , "BFFBFFFRRL"
    , "FBBFFBFLLR"
    , "FFBBFFBLLR"
    , "FBBBFBBRLR"
    , "BFFBBBFLLR"
    , "FFBBFBFRRR"
    , "FFFBFBBRLL"
    , "FBFFFBBRRL"
    , "BFFFBBBLRL"
    , "BBFFBBBLLL"
    , "FBFBBFBLRL"
    , "BBFFFBBLRL"
    , "FBBBBFBLRL"
    , "BBFFBBFLLL"
    , "FBFBBFFRRR"
    , "BFBBFBFLRL"
    , "FBFFBBFLRL"
    , "BFBFBFBLRL"
    , "BFBBFBBLRL"
    , "FFFBBFBLLR"
    , "FFFBFBFRRL"
    , "FBBBFBFRRR"
    , "FBBBFFBLLR"
    , "BFFFBBFLRR"
    , "BFFFBFFLRR"
    , "BBFFFBFRRR"
    , "FFFBBFBLRR"
    , "BFFFFFFRRL"
    , "FBBFFFFLLR"
    , "BBFBFFFRRR"
    , "FBBBFFFRRR"
    , "BFBFFFFRLR"
    , "BFBBFFFRLL"
    , "FFBBBFBLLR"
    , "BFFBBBFLLL"
    , "FBFFFBFRRL"
    , "FFBFFFFRRR"
    , "FFBBBBFRRL"
    , "FFBFFFBLRR"
    , "FBBBBFBRRR"
    , "BBFFBFFLLL"
    , "FBBBBFFLLR"
    , "FBFFBBFLLL"
    , "BFBBBFBRLL"
    , "FBBFFFFRLL"
    , "FBBFBFBRLR"
    , "BFFBBFBLRR"
    , "FFBFBFBRLL"
    , "BBFFBBFRLL"
    , "FFBFBBFLLL"
    , "BFFBBFBLLL"
    , "FBFFFFFRRL"
    , "FBFFBFBLRL"
    , "FFBFFBFRLL"
    , "BFBBBBBRRR"
    , "FBFFBFBLLR"
    , "FFBFFFBLRL"
    , "FFBFFBBLRR"
    , "BFBFFBBRRL"
    , "FFBFBFBRLR"
    , "FFBFBFFLRL"
    , "BBFBBFFLRL"
    , "FFBFFBFLLR"
    , "FFFBBBBLRR"
    , "BFFBFBBRRL"
    , "FFBBFBBRLR"
    , "BFFBFBFLLR"
    , "FFBBFBBRRR"
    , "BBFFBBBRRR"
    , "BFFFBFFLLR"
    , "BFBBBFFRRR"
    , "BFBBFBBLLL"
    , "FFBBFBBLLL"
    , "FBFBFBBLLR"
    , "FFBBBFFLRR"
    , "FFBFFBFLLL"
    , "BFFBFFBLLL"
    , "FBFBBBFLLL"
    , "BBFBFBBRLL"
    , "FBFFBFBRRR"
    , "BBFBFFFRLL"
    , "BBFBFFFRRL"
    , "BFFFFBBLRL"
    , "BFBFFFFRRL"
    , "FFBFFBFRRL"
    , "FBBFBBFLRR"
    , "BFFFBBBRRL"
    , "FFBFFFBLLL"
    , "FFBBBBBLLR"
    , "BFBFBFBLRR"
    , "FFBBFFFLRL"
    , "FBBBBBBRRR"
    , "FBFBFFBLLL"
    , "FBFFBBBRRL"
    , "BFFBFFFRRR"
    , "BFBBFFBRRR"
    , "BBFBBFFLRR"
    , "BBFBFFBRRL"
    , "BBFFBBBLLR"
    , "FBFFFFBRLR"
    , "BBFFFFFRRR"
    , "BFBFFBFRLL"
    , "FBBBFBBRLL"
    , "FFBBFBFRLR"
    , "BFBFBFBRLR"
    , "FFBBBFFLLR"
    , "FBFFFFFLRR"
    , "FBFFBFFRLR"
    , "BFBBBBFRLR"
    , "FBFBBFBLRR"
    , "FBBBBFBRLR"
    , "BFBFFBBRLL"
    , "FFBBFBFLLL"
    , "FFBFBFBLLL"
    , "FFBFBFBRRR"
    , "BFBFBFBLLR"
    , "BFBBBBBRRL"
    , "FBBBBBFRRR"
    , "BBFBFFBLRL"
    , "FBBBBFFRLR"
    , "BBFFFFFLLR"
    , "FBBFFBBLRR"
    , "FBFFFFBRRR"
    , "BFFFBBFRLL"
    , "FBFBFFBLRR"
    , "BFBBFBBRRL"
    , "BFFFFBFRRL"
    , "FFBFFFBRRR"
    , "FFBFBBBRLL"
    , "BBFFFFFRRL"
    , "BFBBFBBLRR"
    , "FBBFBFFRRR"
    , "BFFBFFBLRR"
    , "BFFFBBFLLL"
    , "BFBFFFBRLL"
    , "BBFBBFBLLL"
    , "BFBFBFFRLL"
    , "FFFBBBFLLR"
    , "FBBBFFFRLL"
    , "BFBFFBFRRR"
    , "FFBBFFFRRR"
    , "BBFFFBBRRR"
    , "BFFFFBFLRR"
    , "BFFFFFFRRR"
    , "BBFFBFBLRR"
    , "FBBBBBBRLR"
    , "BBFFBFFLLR"
    , "BFFBBBBLLR"
    , "FBBBBFFLRR"
    , "FFBBBFFRRL"
    , "FBFBBFFLLL"
    , "BBFFBBBRLL"
    , "FBFFBFBLLL"
    , "BFFBFBBRLR"
    , "FBBFFFBLRL"
    , "FFBFBFFLLL"
    , "FBBBFBFLRL"
    , "FFFBBFFLRL"
    , "FBBBBFFRRL"
    , "BFBFBBBRRL"
    , "BFFFBBBLLR"
    , "FBFBFBBLRL"
    , "BFBBFFBLRR"
    , "BBFBFFFLRR"
    , "FBFFBBBLRR"
    , "FFBFFBBRLL"
    , "BFBFFFFLRR"
    , "BBFBFFBRLL"
    , "FBBBFBFRLL"
    , "BFBBBFFLRL"
    , "BFFBBBBRRL"
    , "BFFBBBBLRR"
    , "FFBBFBFRLL"
    , "FBFBFFFLLL"
    , "BFFFFFFLRL"
    , "BFBBBFBRRL"
    , "FFFBBBBRRL"
    , "FBFFFFBLRL"
    , "FBBBBBFRLL"
    , "FFBBFFFLRR"
    , "FBBFBBFLLR"
    , "BFBFBBFRLL"
    , "BFBFFFBLLR"
    , "BFBFBBBLRL"
    , "FFBFFFBRLR"
    , "BFFBBBFRRL"
    , "BFBBBBBLRR"
    , "FBFFFBBRLL"
    , "FBFBFBBRRR"
    , "FFFBFBBRLR"
    , "BFBFBBFLRR"
    , "FBFBFBBLLL"
    , "FFBBFFBRLL"
    , "FBBFBFBRRR"
    , "BFFFFFBRRL"
    , "FBBBFBBLLL"
    , "BBFBFFBLLL"
    , "FFBFBFBLLR"
    , "FFBBBFBRRL"
    , "FBFBFBFLLL"
    , "BFBFBBFRLR"
    , "FBBFBFFRLR"
    , "FFBFFBBRRR"
    , "BFFBFFBLLR"
    , "FBFFFBFLRL"
    , "FBFFFFFRRR"
    , "FFBBFBBRLL"
    , "FBFFBFFRLL"
    , "BBFFFBFLRR"
    , "BFBBBFFRLL"
    , "FBFBBBBLRL"
    , "FFFBBBBLLL"
    , "BBFFFFBRRR"
    , "FBBBBBBLLL"
    , "FFBFBFBLRL"
    , "BFFBFFBRRL"
    , "FFBBFBBLRR"
    , "BFBFFBFLLL"
    , "FBBBBFFRLL"
    , "FFFBBFBRLL"
    , "BFFFBFBLLL"
    , "BBFBBFBRLL"
    , "FFBFFBBLLR"
    , "BBFFFFBLRL"
    , "BBFBBBFLLR"
    , "BFBBFFBRLR"
    , "BFFFFBFLLL"
    , "BBFFBBFLLR"
    , "BBFBFFFLLL"
    , "FBBBFFFLLL"
    , "BFBBFBBRRR"
    , "FFBBBBFRRR"
    , "BBFBBFBRLR"
    , "BFBBFFFLLL"
    , "FFBFFFFLLR"
    , "FBFBFFBLLR"
    , "FBBBFFFLLR"
    , "BFBBBBFLRR"
    , "FBBFBFFLRR"
    , "FBFBBFBRRL"
    , "BFFBFFFLLL"
    , "FBBFBBFRRR"
    , "FBFFBBBRLL"
    , "FBFBBBBRRL"
    , "FFFBBBFRRR"
    , "FBFBFFBRRL"
    , "FFBBFBFLLR"
    , "BFBFBBBLLL"
    , "FFBFFBFLRR"
    , "BFBFBBFRRR"
    , "FBBBBBBLLR"
    , "BFFBFBFRRR"
    , "FBFFFBFRRR"
    , "BBFFFBFLLL"
    , "FBBFFBBRRR"
    , "BFBFBFBLLL"
    , "BBFFBBBLRR"
    , "FFBFFFFRRL"
    , "FFBFBBFLLR"
    , "FFFBBBFRLR"
    , "FFFBBFBLLL"
    , "FBFBBFFLLR"
    , "FBFBFBFRRR"
    , "BFBBFFFRRR"
    , "BFBFFBBRRR"
    , "FBFBBFFRLR"
    , "FFBFBBFRLR"
    , "BFFBBFFRRR"
    , "BFBFBBFLLL"
    , "FFFBBFBRRR"
    , "BFFBBFFRLL"
    , "FFBFFFFLLL"
    , "FFBBBFFRLL"
    , "BBFBBFBRRL"
    , "BBFBFFBLRR"
    , "FFBFFBBRRL"
    , "FBBFBBFRRL"
    , "BBFFFFBLLL"
    , "BFBBFFBRLL"
    , "FFBFBFFRLL"
    , "BFBBFFFLLR"
    , "FBBFFBBRLR"
    , "BFBFFBFLRL"
    , "BFBBFBBRLL"
    , "FFBBBFFRRR"
    , "FBFBBFFLRL"
    , "BFBBFBFRLR"
    , "FFBBFFBRRL"
    , "FBFFBBFLLR"
    , "FBFBBBFLLR"
    , "BFFFBBFRRL"
    , "FFFBBBBRRR"
    , "BFFFBBBRRR"
    , "FBBFBFFRRL"
    , "BBFFFFBRRL"
    , "BBFFFBBLLR"
    , "BFBBFBFRRR"
    , "BFFFFBBRRL"
    , "FBBFBBFLRL"
    , "FBBFBBBRLR"
    , "FBFBFFFLRL"
    , "BFFBFBFRRL"
    , "FBFBBBFLRL"
    , "BFBBBBBLRL"
    , "FFBFFFBRLL"
    , "BFFBBFBLRL"
    , "FBFBFBFRLR"
    , "BFFBBFFLLL"
    , "BFBBBBBLLL"
    , "FFBFBBFLRR"
    , "BBFBFBFRRR"
    , "FFFBBFFRRR"
    , "BFFFBFFRRL"
    , "BBFBFFFRLR"
    , "BBFBFFFLLR"
    , "BFFFFFFLRR"
    , "FBBFBBFRLR"
    , "FFBBBFFLRL"
    , "FBFBFFFRLR"
    , "FFBFBFFLLR"
    , "BFBFFBBLRR"
    , "BFFBBBFRLL"
    , "FBBFFBBLRL"
    , "BFBBFFBLLR"
    , "FBFFBFFRRR"
    , "BFFBBBFRLR"
    , "BFBFBBBLLR"
    , "BFFFFBBLLR"
    , "BFFBFBFLLL"
    , "BFBBFFFLRR"
    , "BFFFFFFRLR"
    , "BBFFBFFLRL"
    , "BFBFBFFLLR"
    , "BBFFFFFLRR"
    , "FFBFBBFLRL"
    , "FBFBFFBRRR"
    , "FFBBBBFRLR"
    , "BBFBBBFLLL"
    , "BFFFFBBRLL"
    , "FBFBBBFRRR"
    , "BFFBFBFRLR"
    , "FFFBBFFLLR"
    , "FBBFBFFLLL"
    , "FFFBFBBRRL"
    , "BFBBBBFLRL"
    , "FFBFFBFRLR"
    , "FBFFBFBRLL"
    , "FBBBFBFLRR"
    , "BBFFBBFRLR"
    , "FBBBBBFLRR"
    , "FBFFFFBRLL"
    , "BFFBFFFLRL"
    , "BFBFFFFLLL"
    , "BBFFBFBRLR"
    , "BFBBBFBLLR"
    , "FBBFFBBRLL"
    , "FBFBFBFRLL"
    , "BBFBFBBLRL"
    , "BFFBFBBLRL"
    , "FFBBBFBLRL"
    , "FFBBFBBLLR"
    , "BFFBFBFLRR"
    , "FBBBFBFRRL"
    , "BFFBBBFLRL"
    , "BFBBFBBLLR"
    , "BFBFFFBLRR"
    , "FBFFBBBLRL"
    , "FBFFBFFLLL"
    , "BBFFBFFRRR"
    , "BFFBFBBRLL"
    , "BFFFBFFRRR"
    , "BFFBBBBLRL"
    , "FBBFFBFRLR"
    , "FBFFBFFRRL"
    , "FBFFFBBRRR"
    , "BBFFFFBLRR"
    , "FBBBFFFLRL"
    , "FFBBBBFLRL"
    , "BFFFBFFLLL"
    , "BFBBBFFRLR"
    , "FFBFBBFRRL"
    , "FBFBBBFLRR"
    , "FFFBBBFLRR"
    , "BFFFBFBRLR"
    , "FBBBFBBLRR"
    , "FFBBBFFLLL"
    , "FFFBFBFRLR"
    , "FBBFFFBRLL"
    , "FBBFBBBRRR"
    , "BFBFFFFRRR"
    , "BFBBBFBLRL"
    , "BBFFFBBLRR"
    , "BFBFFBBLLR"
    , "BFBBFBFLLR"
    , "BBFFBBBRRL"
    , "FBBFFFFLLL"
    , "BBFBFFBLLR"
    , "BFBBBBBLLR"
    , "FFBFFBBRLR"
    , "FFBBBFBRLR"
    , "FBFBBBBLRR"
    , "FBBFBFBLRR"
    , "BBFFBBFRRL"
    , "BBFFBFFRLL"
    , "FBBBFFBLRR"
    , "BFFFBFBRRR"
    , "BFFBFFFLRR"
    , "FFBBFBBRRL"
    , "FBFBBBBRRR"
    , "BBFBBFFLLL"
    , "FBFFBBBLLL"
    , "FBBFFFBLRR"
    , "BFBBFFBLLL"
    , "FBFFFFBLLL"
    , "BFBFBBBLRR"
    , "BFFFFFBLLR"
    , "BFFBBFBLLR"
    , "FBFFBFFLRR"
    , "FBBFBBBLLR"
    , "FFBBBBBRLL"
    , "BFFFBBFLLR"
    , "FFBFBBBLRL"
    , "FBFBBBFRRL"
    , "BFFFFBFLRL"
    , "FBBFFBFRRL"
    , "FFFBBFBRRL"
    , "FFBBBBBRRL"
    , "BBFFFBFLRL"
    , "FBBFFFFLRR"
    , "BFBBBBFRLL"
    , "BFFBFFBRRR"
    , "FFBBFFFLLL"
    , "BFFBBBBRLR"
    , "BFBBFFFLRL"
    , "BFBFFBBLRL"
    , "BBFFFBFRLR"
    , "FBFBFBFLLR"
    , "BBFFFBBRLR"
    , "FBBBFFBLLL"
    , "FBBBFFFRRL"
    , "BFFFFFFRLL"
    , "FFBFBFFRRR"
    , "BFFFBFBRLL"
    , "FBBBFFFRLR"
    , "BFBBBFFLLL"
    , "FBBFBFBLLL"
    , "FFBBFFFLLR"
    , "BFFFBBFRLR"
    , "BBFFFBFRLL"
    , "FBBBBBBLRL"
    , "BFBFBFBRLL"
    , "FBBBBBFRRL"
    , "BBFBFFFLRL"
    , "BFBBBBFRRR"
    , "BFBFFFBLRL"
    , "FFBFBFBRRL"
    , "BFBFBFBRRR"
    , "FFBFFFFRLL"
    , "BBFBBFFLLR"
    , "FFBFBBBLLR"
    , "BBFBBBFLRL"
    , "FBFBBBBRLL"
    , "FFBBBBFLRR"
    , "FFBFFBBLRL"
    , "BBFFBBBRLR"
    , "BFBBFBFLLL"
    , "FBFBFFBLRL"
    , "BFFFFFBLLL"
    , "FBFFBFBRLR"
    , "FBBBBFBLLL"
    , "FBBFFBFLRL"
    , "BFFFBBBLLL"
    , "FBBFBFFLRL"
    , "FFFBBFFLLL"
    , "BFBFBFFRRL"
    , "BFFFFFBRLL"
    , "BFFBFBFLRL"
    , "BFFBBFBRRL"
    , "BFBBFFBRRL"
    , "FFFBBBBLRL"
    , "FFBFBBBRRR"
    , "FBFBBFBRRR"
    , "FFBBBBFLLL"
    , "BBFFBFBRLL"
    , "FBFFBBFRLL"
    , "FBFBFFFLLR"
    , "BFFFFBFRRR"
    , "FFBBBFBLLL"
    , "FBBBFFBLRL"
    , "BFFFBBBLRR"
    , "FFFBFBFRRR"
    , "FBFFFBBRLR"
    , "FBFBFFFLRR"
    , "FBBBFBBLRL"
    , "FBBBFBBRRR"
    , "BBFBFBBLRR"
    , "BFFBBBFLRR"
    , "BFFFFFFLLR"
    , "BBFBFBFRLL"
    , "BFFBFBBLLL"
    , "FFBBBBFLLR"
    , "BFFFFBBLRR"
    , "FBFBFFFRLL"
    , "BFBFFFBRRL"
    , "BBFBFBBLLR"
    , "FFFBFBBLLR"
    , "FBFFBBBRRR"
    , "FBBFBFFLLR"
    , "FBFBFBBRLL"
    , "BFFBBBBRRR"
    , "BFFBFFFLLR"
    , "BFBFBFBRRL"
    , "BFBBBBFLLR"
    , "FBBFBFBLLR"
    , "BFFFFFBRLR"
    , "FBFFFBBLLL"
    , "BBFFFFFLLL"
    , "FFBBBBBLRR"
    , "FFBBFBBLRL"
    , "BBFFFFFRLL"
    , "FBFBBFFRRL"
    , "FFBFBBBLLL"
    , "BFFFBBBRLR"
    , "FBBBFBFRLR"
    , "FBBFFFFLRL"
    , "FFBBFFBRRR"
    , "FBFBFBFLRR"
    , "BFBFBBBRLL"
    , "BFBFBFFLLL"
    , "FBFFBBBLLR"
    , "BFFFBFBLRL"
    , "FBBFFFFRRR"
    , "FBBBBBFLLR"
    , "BFFFFBBLLL"
    , "FBBFBFBLRL"
    , "BFFFBBFRRR"
    , "BBFFBFBRRR"
    , "BBFFBFBRRL"
    , "FFFBBBBRLL"
    , "BBFFBBBLRL"
    , "BFBBFBBRLR"
    , "BBFBBFBLLR"
    , "BFBBFBFLRR"
    , "FBFFFFBRRL"
    , "BFFBFBBLRR"
    , "BBFFBFBLLL"
    , "FBBBFBBLLR"
    , "FBFBBFBLLL"
    , "BBFBFBFRLR"
    , "BFFBBBBLLL"
    , "BFFBFFBRLL"
    , "BBFBBFBLRR"
    , "FBFFBBFLRR"
    , "BBFFBFFRLR"
    , "BFFFBFFRLR"
    , "FBFBBFFRLL"
    , "BFFBBBFRRR"
    , "FBBBFBFLLL"
    , "BBFBBBFLRR"
    , "FBBFFBFLLL"
    , "BBFBBFBLRL"
    , "FBFFFBBLRL"
    , "FBFBBFBRLL"
    , "BFBBBBFRRL"
    , "BFFFBFFRLL"
    , "BFBFBBBRLR"
    , "FFBFFFFLRL"
    , "FFBFFFBRRL"
    , "FBFFBBFRRR"
    , "BBFFFFBRLR"
    , "BFFFBFBLRR"
    , "BBFFBBFLRL"
    , "FFBBFFFRRL"
    , "FBFBFBBRLR"
    , "FBBFBFFRLL"
    , "FBBBFFBRLL"
    , "FBBFBBBLLL"
    , "FBBFFBBRRL"
    , "BFBFBBFLLR"
    , "FFBBFFBLRR"
    , "FFBBBBBLLL"
    , "BBFFFBFLLR"
    , "FBFBBBBRLR"
    , "BFBFBFFLRL"
    , "FFBBBBBRRR"
    , "BFBFFBFRLR"
    , "FBBBBFBRLL"
    , "BFBBBBBRLL"
    , "BFBBBBBRLR"
    , "FBBBBFFLLL"
    , "FBBFFFBLLL"
    , "BBFBFBFLLL"
    , "BFFFFFBLRL"
    , "FBBFBFBRLL"
    , "BBFBFBBRLR"
    , "BFFBFBBLLR"
    , "FFBBFBFLRL"
    , "FBFBBBFRLR"
    , "FBBBFFBRLR"
    , "FBFFFBFLRR"
    , "BFBFBFFLRR"
    , "BFFFFFBRRR"
    , "BFFBBFBRLL"
    , "FBFBFBFRRL"
    , "BBFBBFFRRR"
    , "FBBFBBBLRR"
    , "FBFFBBBRLR"
    , "BBFBFBBLLL"
    , "FFBFBBFRRR"
    , "FBFBBFBLLR"
    , "BFBFBFFRRR"
    , "BBFBBFBRRR"
    , "FFBFBBBRLR"
    , "FBFBFBBRRL"
    , "BFBFFFBLLL"
    , "FBFBFFBRLL"
    , "FBFFFBFRLR"
    , "FBFFFBBLRR"
    , "FBBFFFFRLR"
    , "BFBBFBFRLL"
    , "FBFBFBBLRR"
    , "FFBBBFBRRR"
    , "FBBFFFFRRL"
    , "FBFBBFFLRR"
    , "FBBBFFBRRL"
    , "FBFFFBFLLR"
    , "FFBFBFFRLR"
    , "FBBFFBBLLL"
    , "FFFBBFFRLR"
    , "BFFFFFFLLL"
    , "FFFBBBBLLR"
    , "FFBFBFFRRL"
    , "BBFBBFFRLL"
    , "FFFBBFFRLL"
    , "BBFFFBFRRL"
    , "FFBBFFBLLL"
    , "FBFFBBFRRL"
    , "BFBBBFBRLR"
    , "BFBFFBBRLR"
    , "FBFBFFFRRR"
    , "BFBBBFFLLR"
    , "FBFBFFFRRL"
    , "BFFBBFFLLR"
    , "FBFBBBBLLR"
    , "FFBBFFBRLR"
    , "FBFFFFFLLL"
    , "BBFBFBFRRL"
    , "FBBBBFFLRL"
    , "BFBBBFBRRR"
    , "BFFBBFFLRL"
    , "BFFBBFFRRL"
    , "BBFBFBFLRL"
    , "FBBFFFBRRL"
    , "BFFFBFBRRL"
    , "FBFFFFBLLR"
    , "FFBBFBFRRL"
    , "BFFBBBBRLL"
    , "BFBFFFFLLR"
    , "FFBBFFFRLR"
    , "BFBFFBBLLL"
    , "BFFBBFBRRR"
    , "BFFFBBBRLL"
    , "FFFBBFBLRL"
    , "FFBFBFBLRR"
    , "FFFBBFFRRL"
    , "FFBBBBBLRL"
    , "BFBBBFFLRR"
    , "FBBBBBFLRL"
    , "FBBBFFFLRR"
    , "BFFBBFBRLR"
    , "BBFFFBBLLL"
    , "FBBBBBBLRR"
    , "FBFBFFBRLR"
    , "FFBBBBFRLL"
    ]


passports =
    """hgt:176cm
               iyr:2013
               hcl:#fffffd ecl:amb
               byr:2000
               eyr:2034
               cid:89 pid:934693255
               
               hcl:#b5c3db ecl:grn hgt:155cm pid:#baec97 iyr:2017
               byr:1939
               eyr:2020
               
               pid:526669252 eyr:1972
               hgt:152cm ecl:dne byr:1960 hcl:z iyr:2023
               
               eyr:2028 hcl:#c0946f hgt:73in byr:1926 ecl:#473aaf iyr:2016 pid:565318180
               
               pid:472686027 ecl:oth iyr:2019
               cid:277 byr:1940
               eyr:2030 hgt:170cm
               hcl:#62e117
               
               ecl:oth
               iyr:2017
               pid:938461813 hcl:#733820 byr:1959 hgt:159cm eyr:2022
               
               iyr:2011 eyr:2021 hcl:z
               ecl:hzl byr:2002 pid:17324328 cid:140
               hgt:186cm
               
               byr:2022 pid:3164234967 iyr:1984
               hgt:76cm hcl:6b3837
               ecl:#fa362b
               eyr:2037
               
               hcl:z eyr:1945
               pid:9247286687 hgt:75cm
               iyr:1934 cid:326 ecl:zzz
               byr:2005
               
               byr:2005
               ecl:lzr
               eyr:2021 pid:152cm
               cid:254 iyr:2020 hcl:z hgt:157cm
               
               iyr:2020 eyr:2020 hcl:#18171d ecl:gry pid:914128753 hgt:168cm
               byr:2002
               
               hcl:#7d3b0c hgt:160cm eyr:2020 iyr:2015
               pid:054067854 ecl:brn byr:2023
               
               hcl:#cfa07d hgt:157cm
               byr:1994 eyr:2027 pid:344443856
               iyr:2016
               
               pid:762423097
               iyr:2014 hcl:#a97842 ecl:brn hgt:180cm byr:1927 eyr:2021
               
               pid:6645616064 hcl:#ceb3a1 byr:2030
               eyr:2032 hgt:158cm iyr:2012
               ecl:#e9619e
               
               eyr:2022
               ecl:brn
               byr:1986
               hgt:161cm cid:99 pid:288726584 hcl:#6b5442 iyr:2019
               
               cid:75
               pid:117771843
               hgt:184cm byr:1937 ecl:brn
               hcl:#d88fd9
               iyr:2015 eyr:2027
               
               iyr:2016 hcl:#fffffd hgt:170cm eyr:2022 ecl:oth pid:629454113
               byr:1952
               
               hcl:#c0946f iyr:2018 hgt:189cm
               byr:1971 ecl:oth eyr:2029
               pid:800207810
               
               eyr:2022 hcl:#7d3b0c pid:969986413
               byr:1978 iyr:2020 hgt:186cm
               ecl:gry
               
               hgt:171cm byr:1949 hcl:#341e13
               ecl:amb eyr:2030 pid:359107274 iyr:2013
               
               pid:839751525 eyr:2024 byr:1921
               iyr:2012 ecl:amb hcl:#b0ed6f hgt:154cm
               
               pid:32592758
               byr:2009
               hgt:107 iyr:2019 hcl:#866857
               eyr:2036 ecl:amb
               
               eyr:2040 hcl:#733820 cid:199
               byr:2027
               pid:7791792988 ecl:blu iyr:2026
               hgt:63cm
               
               iyr:2011 cid:119 pid:344693475
               ecl:grn hgt:160cm eyr:2029 hcl:#346973 byr:1996
               
               hgt:161in byr:2025 cid:167 iyr:2024 eyr:2040 pid:034804648
               hcl:#efcc98 ecl:oth
               
               ecl:#ba14f0 iyr:1935
               hgt:60cm
               byr:2003 eyr:1987
               hcl:8e509b pid:161cm
               
               iyr:2018 pid:620508652 ecl:amb eyr:2023 hgt:183cm hcl:#a97842
               byr:1967 cid:117
               
               eyr:2022 ecl:amb
               pid:476049089 iyr:2012
               hgt:165cm
               byr:1955 hcl:#602927
               
               byr:2014 hcl:z iyr:2029 cid:279 pid:28914607 hgt:75cm ecl:xry
               
               hgt:156cm eyr:2023 iyr:2011 ecl:oth hcl:#7d3b0c pid:561313217 byr:1952
               
               iyr:2011 byr:1935
               hcl:#cfa07d ecl:oth pid:830614209
               eyr:2028 hgt:173cm
               
               iyr:2012 cid:210 eyr:2022
               pid:652810130 hcl:#18171d ecl:grn byr:1960 hgt:152cm
               
               eyr:2026 pid:815848563 hgt:75in iyr:2019 ecl:gry byr:1947
               hcl:#cfa07d
               
               cid:181 iyr:2012
               eyr:2024 byr:1934 hcl:#c0946f
               hgt:165cm ecl:oth pid:232944581
               
               cid:135 iyr:2020
               byr:1971 hcl:#733820 pid:531877857 hgt:179cm eyr:2027 ecl:amb
               
               byr:1987 hcl:936807 eyr:2032 ecl:#4bec4a pid:605628619 cid:180 hgt:150in
               iyr:2015
               
               hcl:b62ef0 ecl:#092141
               pid:876635399 byr:1944 hgt:158cm iyr:2017 eyr:1924
               
               iyr:2016 pid:7039815301 byr:2014 hgt:150 eyr:2032 ecl:blu hcl:z
               
               byr:1979 eyr:2030 iyr:1978 hgt:63 pid:1554613758 hcl:z ecl:amb
               
               hgt:70cm hcl:e45897 iyr:2020 eyr:1977 ecl:dne pid:2878189427 byr:1973
               
               iyr:2003
               hcl:#cfa07d
               pid:260517078
               byr:2030 hgt:175cm eyr:2020
               ecl:brn
               
               pid:460604681 eyr:2022
               cid:138 iyr:2016 hgt:163cm
               byr:1922
               hcl:#ceb3a1 ecl:oth
               
               hgt:167cm byr:2009 eyr:1975 cid:295 pid:174cm iyr:2029
               hcl:z
               
               hgt:67in ecl:grn
               eyr:2023
               cid:122 pid:281246917 byr:1990 iyr:2011 hcl:#866857
               
               ecl:#ed7ddc byr:1922 cid:234 hcl:e61b1e iyr:1932 eyr:1996 pid:31344005 hgt:62cm
               
               byr:1949
               cid:275 iyr:2017 ecl:grn
               hgt:164cm eyr:2027 hcl:#18171d
               pid:751342937
               
               ecl:blu hgt:162cm
               pid:432600613 byr:1923 eyr:2029 iyr:2011 hcl:#623a2f cid:315
               
               iyr:2020
               hcl:#b2bb11 pid:055891584 ecl:grn
               hgt:67in
               eyr:2029 byr:1937
               
               iyr:2012
               hcl:#a97842 pid:325640714 ecl:blu hgt:185cm eyr:2024 byr:1971
               
               hcl:#b6652a pid:485327267
               ecl:brn hgt:155cm eyr:2028
               iyr:2019
               
               pid:902164867 hgt:77 cid:283 eyr:2027
               iyr:2020 ecl:hzl byr:1935 hcl:#efcc98
               
               ecl:grn
               hcl:#ceb3a1 byr:1977 hgt:165cm
               pid:850700221 eyr:2030
               iyr:2012
               
               byr:1989 ecl:brn eyr:2026 pid:919138357 iyr:2016
               hcl:#623a2f cid:319 hgt:161cm
               
               iyr:2017
               byr:1973 pid:293382118 hcl:#341e13 cid:143 ecl:hzl
               hgt:166cm eyr:2022
               
               pid:517102798
               hcl:f9d9dd
               eyr:1933 iyr:2019 hgt:164cm
               byr:2017 ecl:utc
               
               eyr:2023 pid:757868802 hcl:#18171d cid:244
               hgt:156cm
               ecl:blu iyr:2015 byr:1926
               
               eyr:2022
               iyr:2020
               hgt:158cm ecl:grn
               byr:1988
               pid:979194751 hcl:#888785
               
               eyr:2039
               pid:3867868142 byr:1936 ecl:dne iyr:2022 hcl:4b43b8
               hgt:115 cid:241
               
               iyr:2015 eyr:2026
               hcl:#ceb3a1 pid:539099924
               cid:234
               ecl:brn
               byr:1920 hgt:163cm
               
               cid:259 iyr:2020
               pid:949453818 eyr:2022 hgt:181cm
               byr:1997 ecl:blu hcl:#18171d
               
               byr:2016
               iyr:2012
               ecl:utc
               hgt:68in eyr:1993
               pid:1542134802 hcl:486699
               cid:239
               
               iyr:2018
               hgt:154cm ecl:brn byr:1970
               eyr:2021 pid:581775861 hcl:#888785
               
               iyr:2012
               eyr:2027 hgt:67cm hcl:#efcc98 ecl:zzz pid:312104916 byr:2020
               
               hcl:#b6652a ecl:hzl eyr:2023 iyr:2012 pid:513268492
               hgt:159cm
               
               hgt:162in hcl:z
               byr:2029
               eyr:2023 ecl:#e2e7ab iyr:2016 pid:65979982
               
               cid:84 hgt:71in ecl:blu pid:982719716
               eyr:2020 iyr:2014
               
               eyr:2028 hgt:181cm
               ecl:hzl pid:255796693 hcl:#341e13 byr:1994 iyr:2011 cid:218
               
               ecl:blu
               byr:2029 iyr:2017 pid:468504566 eyr:2020 hcl:z hgt:163cm
               
               hgt:158cm
               eyr:2025 ecl:hzl cid:295 pid:601339484
               hcl:#7d3b0c byr:1991 iyr:2013
               
               eyr:2028
               iyr:2018 pid:2236240873
               hgt:172cm
               ecl:#0e337e hcl:#b6652a cid:108 byr:1930
               
               ecl:gry hcl:#888785
               eyr:2020 pid:442479017 iyr:2016
               
               iyr:2014 ecl:grn
               cid:313 eyr:2023
               hgt:183cm
               byr:1976
               pid:499580308 hcl:#53efe6
               
               eyr:2034
               cid:235 hcl:8f3cf5
               byr:2027
               hgt:161in pid:3259965094 ecl:xry iyr:2026
               
               eyr:1978 byr:1925 iyr:2018 hgt:170cm ecl:#0c94e8
               pid:562699017 hcl:#816949
               
               eyr:2023 hcl:#866857 hgt:179cm
               pid:785862442 iyr:2014 cid:165 ecl:amb byr:1939
               
               hgt:187cm
               pid:64469711 ecl:gry eyr:2023 cid:225 hcl:#341e13 iyr:2011 byr:1958
               
               hgt:162cm byr:2028 ecl:#37e345
               eyr:2037 hcl:19fb3d
               iyr:2021
               pid:#87921a
               
               eyr:2027 hcl:#18171d
               byr:2002 ecl:gry iyr:2014
               pid:561506850 hgt:177cm
               
               hgt:64cm pid:#a92686
               eyr:2029 cid:122
               byr:2026
               iyr:2017 hcl:z ecl:grn
               
               eyr:2028 byr:2007 hgt:155cm ecl:#86fa1b hcl:#733820 pid:562889497
               iyr:2019
               
               pid:880698787
               byr:1992
               hcl:#7d3b0c hgt:163cm ecl:hzl
               iyr:2011 eyr:2021
               
               eyr:2020 byr:1994 iyr:2011 hgt:186cm pid:841855425 hcl:#cfa07d ecl:gry
               
               byr:1923 iyr:2015 ecl:amb pid:414655744
               hcl:#b6652a
               hgt:159cm
               eyr:2026
               
               hgt:171cm ecl:amb pid:363065723 iyr:2020
               cid:66 hcl:#b6652a eyr:2021
               byr:1960
               
               eyr:2002
               hcl:2627b2 ecl:#1bf21d pid:168cm byr:2024 iyr:2020
               hgt:186in
               
               iyr:2011 byr:1924 eyr:2024
               hcl:#b6652a ecl:brn
               pid:794477411 hgt:162in
               
               hcl:z hgt:67cm
               byr:2025
               pid:582569979
               iyr:2013
               ecl:oth eyr:2025
               
               cid:50 hcl:931e2c
               hgt:172in eyr:1994 iyr:2023
               ecl:#cd2204
               byr:2015
               pid:157cm
               
               hgt:173cm eyr:2028
               ecl:amb pid:569607283
               byr:1942
               iyr:2019
               cid:228
               hcl:#866857
               
               cid:109
               ecl:oth eyr:1933 byr:1982 pid:173cm hcl:#b6652a hgt:174cm
               iyr:2023
               
               cid:69 hcl:#9ad05b pid:341135641
               byr:1968 ecl:brn
               iyr:2012 hgt:156cm
               eyr:2020
               
               hgt:176cm
               byr:1954 ecl:blu
               eyr:2020
               pid:478462637 iyr:2019
               hcl:#888785
               
               iyr:2026 hgt:193in
               byr:2018 pid:162cm hcl:605e7f eyr:1948 ecl:utc
               
               byr:1962
               eyr:2022 pid:445346117 iyr:2019 hgt:158cm hcl:#623a2f ecl:hzl
               
               cid:278 hgt:187cm eyr:2024 iyr:2016 byr:1964
               ecl:grn pid:450739552 hcl:#733820
               
               ecl:grn byr:2000 eyr:2023
               pid:344489911 hcl:#7d3b0c iyr:2011 hgt:177cm
               
               iyr:2015 hgt:180cm cid:190 hcl:#a97842 pid:359774842 eyr:2029 byr:2002 ecl:amb
               
               eyr:2027 iyr:2015 ecl:hzl
               pid:082733109
               byr:1975 hgt:191cm cid:251 hcl:#888785
               
               hcl:#c0946f iyr:2015
               hgt:167cm byr:1990 ecl:amb pid:168cm eyr:2023
               
               ecl:gry eyr:2028
               byr:1934 iyr:2013 hcl:#6b5442
               pid:424412120 hgt:173cm
               
               pid:273352568
               eyr:2024
               iyr:2013 byr:1926 hcl:#602927
               ecl:brn hgt:180cm
               
               hcl:#7d3b0c hgt:70in ecl:amb iyr:2019
               byr:1937
               eyr:2030 pid:309011548
               
               ecl:grn
               hgt:64in pid:796889811 hcl:#18171d
               byr:1929 eyr:2027
               
               ecl:amb hcl:#888785
               pid:412449028 cid:316 byr:1982
               iyr:2019 eyr:2030 hgt:193cm
               
               eyr:1927
               hcl:z hgt:158cm byr:1930
               ecl:lzr iyr:2018
               cid:197
               pid:0906120002
               
               ecl:grn byr:1970 hgt:181cm
               pid:376212702 eyr:2030 iyr:2017 cid:266 hcl:#f8b0f5
               
               iyr:2018 hgt:73in pid:652356158 hcl:#c0946f
               ecl:grn byr:1973
               
               cid:170 hcl:#b6652a byr:2011
               ecl:gry iyr:2025 pid:#b6e567 hgt:67cm eyr:2016
               
               hgt:192cm ecl:amb eyr:2026 pid:201824712 hcl:#888785 byr:1966 iyr:2019
               
               iyr:2013 byr:1995 eyr:2028 hcl:#b6652a ecl:brn cid:53 pid:705606447 hgt:176cm
               
               hcl:#341e13 byr:1951
               hgt:161cm pid:231973770 iyr:2015 ecl:hzl
               eyr:2030
               
               cid:210 ecl:brn iyr:2017 eyr:2030
               hgt:176cm hcl:#efcc98
               byr:1965
               
               eyr:2020 hcl:#7d3b0c
               pid:872088079 ecl:oth iyr:2017 byr:1920
               hgt:180cm
               
               hcl:#0b540c iyr:2019
               byr:1938
               hgt:153cm ecl:gry pid:236785988
               eyr:2020
               
               eyr:2020 hgt:184cm iyr:2019
               pid:673186642 ecl:oth byr:1977 hcl:#866857
               
               eyr:2025
               ecl:gry hcl:#341e13 byr:1970 iyr:2010 pid:972122542 hgt:184cm
               
               ecl:grn byr:1992 hgt:71in
               iyr:2014 cid:254 hcl:#fffffd pid:749733013
               eyr:2026
               
               cid:98 ecl:amb eyr:2022
               hgt:169cm pid:022677680
               byr:1937 iyr:2014 hcl:#e62c71
               
               hgt:192cm
               iyr:2015
               eyr:2028 ecl:oth pid:6000619833 hcl:#c0946f
               byr:1930
               
               byr:1938 hcl:#efcc98 hgt:178cm iyr:1953 eyr:2038
               ecl:brn pid:#cdc55a
               
               hgt:66in byr:1951 iyr:2016 hcl:#18171d
               eyr:2027
               ecl:lzr pid:834188980
               
               iyr:2012 eyr:2025
               hcl:#7d3b0c pid:330325803 cid:166 hgt:186cm byr:1938
               ecl:amb
               
               iyr:2015 hcl:#602927 cid:268 eyr:2021
               ecl:amb hgt:186cm pid:318676962
               
               hcl:#3d6f3c iyr:2014 pid:665730784 cid:191 hgt:150cm byr:1981 ecl:oth eyr:2024
               
               ecl:grn hcl:#733820
               eyr:2028 iyr:2010
               hgt:162cm byr:1944 pid:872962499
               
               eyr:2028 byr:1974
               ecl:brn
               iyr:2010 hcl:#18171d hgt:160cm
               
               hcl:#602927
               byr:1959 eyr:2027 iyr:2016 ecl:brn hgt:169cm pid:078503025
               
               hcl:#623a2f pid:326300051 hgt:153cm
               byr:1973 iyr:2012
               ecl:gry eyr:2026
               
               hgt:151cm
               byr:1966 eyr:2029 pid:026952622 hcl:#18171d ecl:gry iyr:2010
               
               hcl:#7d3b0c byr:1974 pid:444713591 iyr:2017 eyr:2030
               hgt:165cm ecl:oth
               
               iyr:2026 pid:184cm
               ecl:gmt hcl:z hgt:71cm
               eyr:2029
               
               cid:310 hcl:#fffffd byr:1998
               pid:450705840 iyr:2015
               ecl:grn eyr:2021 hgt:165cm
               
               byr:1939 hcl:#623a2f ecl:gry hgt:69in pid:539812641 eyr:2027 iyr:2013
               
               pid:207645014
               iyr:2015
               cid:314 ecl:oth
               byr:1942
               eyr:2027 hgt:186cm hcl:#fffffd
               
               ecl:#fb7e3d eyr:2031 iyr:1956
               hgt:188 pid:160cm hcl:z byr:2027
               
               byr:1972 iyr:2020 eyr:2026 hcl:#b6652a pid:289088329 hgt:65in ecl:gry
               
               eyr:2027
               hgt:59cm
               byr:2022
               pid:938063769 ecl:zzz iyr:2028 hcl:23c762
               
               byr:2004 hgt:74 iyr:2017
               eyr:2040 ecl:blu pid:4611117799 cid:73 hcl:z
               
               ecl:brn byr:1962 cid:321
               iyr:2019 eyr:2026
               hgt:159cm
               hcl:#667310 pid:439864945
               
               iyr:2026 eyr:2039 pid:633263851 cid:321 ecl:lzr hgt:166cm
               byr:2023 hcl:fc3c63
               
               byr:1961 iyr:2010 ecl:blu
               eyr:2023 pid:245858010
               
               hgt:193cm pid:821303249 eyr:2020 hcl:#6b5442 cid:130 byr:1946
               
               eyr:2026 ecl:brn
               hcl:#733820 byr:1983 hgt:182cm pid:727380954 cid:188 iyr:2015
               
               hgt:152cm cid:206 iyr:2012 byr:1947 hcl:#888785 ecl:gry
               pid:720312394 eyr:2023
               
               hgt:150cm ecl:gry pid:863712648
               iyr:2019 cid:349 byr:1976 hcl:#602927 eyr:2022
               
               hgt:164in pid:953500867
               eyr:2021
               iyr:2014
               hcl:z cid:343 ecl:amb
               
               byr:1981 pid:529710230 iyr:2013 eyr:2023
               hcl:#c0946f ecl:amb
               hgt:151cm
               
               pid:706204190 hgt:154cm cid:317
               hcl:#602927 byr:1949 ecl:blu iyr:2010 eyr:2028
               
               iyr:2019 hcl:#0219e6
               pid:850093151 ecl:gry
               eyr:2030
               byr:1938 hgt:177cm
               
               ecl:brn hcl:#efcc98 eyr:2029 byr:1963
               hgt:185cm pid:611279647 iyr:2011
               
               ecl:blu eyr:2022 byr:1941 hgt:167cm
               iyr:2012 hcl:#7d3b0c pid:415739564
               cid:193
               
               eyr:2027 ecl:blu byr:1968 pid:479994566
               hcl:#733820 hgt:151cm
               iyr:2011
               
               pid:263729839 hgt:189cm eyr:2030 ecl:gry byr:2001 hcl:#602927
               
               byr:1985
               ecl:amb pid:672663977 cid:139
               hgt:159cm hcl:#733820 iyr:2018 eyr:2020
               
               byr:1998
               hcl:#cfa07d eyr:2023 pid:255046063 iyr:2011 ecl:blu hgt:177cm
               
               ecl:oth
               byr:1980 pid:253747166 eyr:2029
               hcl:#6b5442 hgt:186cm
               
               eyr:2030 hcl:#866857
               hgt:165cm
               ecl:amb
               iyr:2017 pid:241240220 cid:164 byr:2001
               
               byr:1994 hcl:#b6652a iyr:2015
               pid:753831241
               hgt:175cm
               eyr:2027 ecl:blu
               
               hcl:#b6652a pid:471594512
               byr:1961 ecl:hzl hgt:175cm
               iyr:2020 eyr:2025
               
               byr:1987 pid:112366159
               eyr:2028 hcl:22b2d7
               hgt:64in cid:222
               ecl:#b40dca iyr:2019
               
               iyr:2015 hcl:e1ed55 hgt:160in ecl:utc byr:2015 eyr:2036
               
               byr:1935
               hcl:#7d3b0c hgt:152cm ecl:gry
               pid:160090332 iyr:2020 eyr:2020
               
               pid:552779024 byr:1998 hgt:185cm ecl:gry eyr:2026 iyr:2013 hcl:#d46cd6
               
               ecl:oth pid:311860969
               cid:57
               hgt:60in
               eyr:2026
               hcl:#ceb3a1
               byr:1961 iyr:2011
               
               eyr:2021 hgt:162cm cid:240
               pid:259997995
               hcl:#efcc98
               ecl:gry byr:1962 iyr:2017
               
               hcl:#866857
               iyr:2016
               eyr:2029
               ecl:blu byr:1927 cid:249 pid:665324615 hgt:65in
               
               byr:1931
               cid:331
               hgt:66in
               ecl:grn iyr:2020 hcl:#efcc98 eyr:2025 pid:175780921
               
               hgt:98
               eyr:2040 ecl:blu byr:2029
               iyr:1967 hcl:0d76e9
               pid:#c9053a cid:296
               
               pid:370918950
               hcl:#602927
               byr:1938
               hgt:178cm iyr:2018 eyr:2030
               ecl:oth
               
               hgt:185cm
               eyr:1984 ecl:oth pid:851080398
               hcl:z byr:2027 iyr:2017
               
               pid:095078224 byr:1957 hcl:#45bcf4 ecl:#f643f9 hgt:63cm eyr:2036 iyr:1978
               
               hcl:z
               eyr:2023 ecl:oth hgt:162cm
               iyr:2016 byr:1938 pid:#fdcddf
               
               hcl:#341e13 iyr:2013 hgt:189cm
               pid:982271041 ecl:brn
               byr:1930 eyr:2030
               
               eyr:2026
               iyr:2012 hcl:#cfa07d cid:59 pid:105862717 ecl:blu
               hgt:159cm byr:1943
               
               ecl:hzl
               pid:604172804 iyr:2016 hgt:174cm cid:79 eyr:2025
               hcl:#733820 byr:1994
               
               iyr:2011 pid:452628771 ecl:gry hgt:182cm hcl:#623a2f
               eyr:2023
               byr:1986
               
               hcl:#341e13 iyr:2010 byr:1946 eyr:2021
               cid:350 pid:049684494 hgt:180cm
               ecl:grn
               
               iyr:2020
               hgt:173cm pid:384503937
               byr:1986
               hcl:#341e13
               cid:113
               eyr:2025 ecl:amb
               
               hgt:180cm byr:1949
               hcl:#733820 iyr:2010 eyr:2030
               cid:123 pid:065609606 ecl:oth
               
               iyr:2010 eyr:2028
               pid:231750173
               hgt:63in ecl:brn
               byr:1948 hcl:#18171d
               
               iyr:2020 hcl:#623a2f
               ecl:gry
               byr:1922 pid:961213634 eyr:2022 hgt:177cm
               
               hcl:#18171d eyr:2020 iyr:2014 byr:1983
               pid:183568344 hgt:72in
               ecl:gry
               
               eyr:2023 pid:102781246 ecl:brn
               hcl:#888785 byr:1929 hgt:167cm iyr:2010
               
               pid:362873066 byr:1994 hcl:#de545f iyr:2018 hgt:177cm ecl:blu cid:86
               eyr:2024
               
               hcl:842f2d iyr:1983
               byr:1954 eyr:2037
               ecl:lzr pid:3915492573 hgt:166cm
               
               ecl:grn
               hcl:#fffffd iyr:2014
               hgt:173cm
               byr:1939
               pid:930650489
               eyr:2025
               
               eyr:2028 ecl:brn hcl:#7d3b0c hgt:166cm byr:1938 pid:992958531 iyr:2011
               
               pid:101149939 eyr:2024 iyr:2018 hgt:165cm
               ecl:hzl
               hcl:#ceb3a1 cid:176
               
               cid:62
               pid:651390352 hcl:#efcc98
               iyr:2018
               eyr:2027
               ecl:brn
               hgt:66in byr:1953
               
               hcl:#623a2f byr:1978
               iyr:2013
               hgt:180cm eyr:2027 ecl:amb pid:836425641
               
               pid:557464096 hgt:155cm ecl:blu cid:142 byr:1936 iyr:2010
               hcl:#cfa07d eyr:2027
               
               ecl:gry iyr:2024 hcl:#341e13 pid:442593279 cid:314 hgt:186cm byr:1960
               eyr:2022
               
               cid:123 iyr:2014
               byr:2000
               pid:878733390 eyr:2021 ecl:hzl hgt:162cm
               
               byr:1959 cid:259
               pid:722895016
               ecl:brn iyr:2018 eyr:2027 hgt:185cm
               
               pid:163697814 ecl:hzl
               iyr:2013 byr:1932
               hgt:68in cid:286 eyr:2025 hcl:#efcc98
               
               byr:1927
               hgt:72cm ecl:oth
               eyr:2021 hcl:#99e959
               pid:669724466 iyr:2010
               
               byr:1943 iyr:2011 eyr:2024 pid:384419879 ecl:hzl hcl:#7d3b0c hgt:170cm
               
               pid:137944386 ecl:gry
               byr:1953 hcl:#733820 iyr:2013 eyr:2025 hgt:184cm
               
               iyr:2017 eyr:2023 pid:288078785
               hgt:179cm
               byr:1993 hcl:#602927 ecl:hzl
               
               ecl:brn
               hgt:187cm eyr:2024 byr:1971 iyr:2020 hcl:#b6652a pid:622975646
               cid:290
               
               pid:371817422 ecl:blu byr:1964
               iyr:2018
               eyr:2021 cid:176
               hgt:153cm hcl:#888785
               
               byr:2002
               cid:256 iyr:2014 eyr:2024 ecl:blu hcl:#18171d hgt:187cm
               pid:050022911
               
               hgt:178cm pid:211144001 eyr:2027 iyr:2013
               byr:1947
               hcl:#7d3b0c ecl:grn
               
               eyr:2025 ecl:blu pid:046417901 byr:1950
               iyr:2015 hgt:165cm
               hcl:#7d3b0c cid:128
               
               ecl:hzl eyr:2029
               iyr:2015
               hgt:171cm hcl:#341e13
               pid:561680375 byr:1997
               
               byr:1948 iyr:2023 pid:17288381 hcl:6a34a3 ecl:#671ece eyr:2001
               cid:152
               
               eyr:2036 hgt:141 iyr:1957 byr:1987 hcl:z
               pid:86986187 ecl:utc
               
               eyr:2024 hcl:#b6652a iyr:2017 ecl:blu byr:1988 cid:348 hgt:152cm pid:068684272
               
               iyr:2011 pid:989825275
               cid:78 hcl:#341e13 byr:1983 ecl:blu hgt:158cm eyr:2020
               
               ecl:grn hgt:187cm eyr:2027 iyr:2015
               hcl:#866857 pid:240650427
               byr:1940
               cid:91
               
               hcl:#888785 cid:185 byr:1925
               hgt:155cm iyr:2015 ecl:blu eyr:2027 pid:851697441
               
               iyr:2016 ecl:oth pid:056439470 byr:1985 eyr:2026
               hgt:154cm hcl:#282539
               
               ecl:hzl hcl:#a97842
               iyr:1944
               pid:118846711 eyr:2026 byr:1922 hgt:185cm
               
               iyr:2020 hcl:#733820
               pid:854531642 hgt:165cm
               ecl:hzl eyr:2022
               
               iyr:2014
               byr:1957 hcl:#7fa674 hgt:189cm
               eyr:2023 pid:740871941 ecl:brn
               
               ecl:amb cid:349 hgt:170cm
               byr:1952 hcl:#ceb3a1 iyr:2020
               eyr:2026
               pid:730499325
               
               eyr:2027 ecl:amb
               byr:1975 pid:985687961
               hcl:z hgt:157cm
               iyr:2013
               cid:133
               
               ecl:blu
               hgt:193cm iyr:2015 hcl:#10f2ba byr:1989 pid:939704495 eyr:2021
               
               ecl:oth eyr:2025 hgt:69in iyr:2014 cid:258 pid:477970733 byr:1984 hcl:#b6652a
               
               hcl:z byr:2013
               ecl:zzz
               pid:1904741884 hgt:180 cid:138 eyr:1985 iyr:1935
               
               eyr:2025
               iyr:2026 hgt:190in pid:#43ca33
               ecl:#3e1ef1 hcl:#7d3b0c byr:2030
               
               eyr:2029 hgt:191cm
               byr:1986 hcl:#ceb3a1 cid:327 pid:795060714 iyr:2012 ecl:hzl
               
               eyr:2025 iyr:2017 ecl:grn
               hcl:z
               pid:8886398 hgt:174cm byr:2016
               
               hcl:#a97842
               eyr:2021 ecl:grn iyr:2013 pid:565234133 byr:1998
               hgt:161cm
               
               eyr:2029 hgt:163cm byr:1933 cid:86 iyr:2011
               ecl:grn
               hcl:#fffffd
               pid:818769307
               
               hgt:190cm eyr:2030 hcl:#af5b5d iyr:2011 ecl:brn pid:359524299 byr:1969
               
               ecl:amb iyr:2011 eyr:2022
               cid:141
               byr:1978 hgt:69in hcl:#fffffd pid:013006109
               
               ecl:blu hgt:164cm iyr:2019 eyr:2027 pid:899103430 hcl:#cfa07d
               byr:1976
               
               eyr:1938
               ecl:#a03c41 pid:708735698
               iyr:2030
               hgt:184cm hcl:#b6652a byr:2013
               
               ecl:hzl byr:1997 hcl:#a97842 cid:60 pid:172cm
               eyr:2023 hgt:161in iyr:1936
               
               ecl:hzl
               byr:1938 pid:094889181
               hgt:162cm iyr:2020
               eyr:2028
               hcl:#623a2f
               
               hgt:162cm cid:86
               hcl:#623a2f pid:738174580 ecl:brn byr:1980 eyr:2028 iyr:2014
               
               byr:2007 hgt:150in hcl:z
               eyr:2032
               ecl:#114f3b
               iyr:2030 pid:5129772
               
               ecl:hzl iyr:2017
               hcl:#18171d
               pid:696283412 byr:1976 hgt:168cm
               eyr:2028
               
               eyr:1922 ecl:#84b0d4 byr:2013 hcl:#ceb3a1 pid:150cm iyr:2030
               hgt:71cm
               
               hgt:164cm byr:1949 ecl:gry eyr:2026
               hcl:#623a2f
               
               ecl:oth
               iyr:2013 hgt:166cm hcl:#50e385
               pid:478852286
               eyr:2030 byr:1930
               
               cid:129
               iyr:2020 byr:1978 pid:907580992 eyr:1955
               hcl:#602927
               ecl:grn hgt:165cm
               
               ecl:blu iyr:2018 byr:1953
               hgt:177cm pid:126681706 eyr:2025 hcl:#c0946f
               
               byr:1984 pid:275799917
               ecl:oth hcl:#623a2f cid:348 iyr:2020
               hgt:189cm eyr:2024
               
               iyr:2016
               ecl:hzl byr:1954
               hcl:#623a2f pid:810508839 eyr:2026
               hgt:185cm
               
               byr:1967
               eyr:2021 hcl:#ceb3a1
               pid:406634908 hgt:158cm iyr:2018 ecl:hzl
               
               iyr:2019 eyr:2030 pid:995681076 hcl:#341e13
               cid:101 hgt:162cm ecl:blu byr:1925
               
               eyr:2026 pid:272513479 hcl:#b6652a byr:1973 iyr:2016 ecl:amb hgt:182cm
               
               pid:298704871 eyr:2024 hcl:#efcc98 byr:1959
               iyr:2014 hgt:191cm ecl:grn
               
               hgt:193cm pid:750729809 ecl:oth
               cid:324
               iyr:2011 hcl:#efcc98 byr:1954 eyr:2020
               
               byr:1966 iyr:2019 eyr:2025 ecl:#2df4b6
               hgt:184cm pid:#fc17f4 cid:161 hcl:#602927
               
               byr:1955 hcl:299464 ecl:amb
               hgt:157cm iyr:2017 eyr:2021
               pid:239450987
               
               hgt:172cm
               ecl:hzl
               pid:839804598
               hcl:#341e13 eyr:2030 byr:1964 iyr:2013
               
               iyr:2018 hgt:152cm byr:1948 hcl:#623a2f pid:400121515
               ecl:blu
               eyr:2020
               
               cid:296
               ecl:grn
               byr:1960 iyr:2028 pid:#1f4b95 eyr:2033 hcl:#602927
               hgt:66cm
               
               iyr:1933 ecl:#232e20 pid:#d03ca7
               eyr:2030 hcl:598ed6 hgt:154in byr:2011
               
               cid:247 ecl:grn iyr:2014
               hgt:178cm
               byr:1992 hcl:#602927 eyr:2021
               pid:678964478
               
               iyr:2010 pid:623705680
               ecl:hzl hgt:181cm byr:1980 hcl:#341e13 eyr:2028"""


topology : List (Array.Array String)
topology =
    List.map (String.split "" >> Array.fromList)
        [ "....#............#.###...#.#.#."
        , ".#.#....##.........#.....##.#.."
        , ".#..#.#...####.##..#......#..##"
        , "......#...#...#.......#........"
        , "........#...###..#.#....#....#."
        , "..##.....#.....#.#.........#.#."
        , ".##.......#.#.#...#..#...##...#"
        , "...##.....#....##....#...###.#."
        , "..#...#......##.#.##.....#.#..#"
        , ".#....#.###.........#.........."
        , ".#.#..##.....###.....###....#.#"
        , "....###....#......#...#......##"
        , "......##...#.##.........#.#..#."
        , "##.#....##...#..##....#.#..#.##"
        , ".#...#..#.....#.#.......#...#.."
        , "..........#..###.###......##..#"
        , "..#.##.#..#......#.......###.#."
        , "...#...#.#.#..#...#.#.........."
        , "#........#..#..#.#....#.##..###"
        , "#...#.....#..####.........####."
        , ".....###..........#.#...##...#."
        , ".....#...#..#.......#....##.#.."
        , "...........#..##.....#...#..#.."
        , "......##..#........#..........."
        , "#.#..#.#.#..#.....#....#.....#."
        , "..#....##....##...#.....#......"
        , ".#.#....#..#.#......#..###...#."
        , ".......#...#.#....##..#..#..#.."
        , ".#.#.#.......#....#.#.#.......#"
        , ".#..........#.##.#...#..#.#.##."
        , "..#.#..........#.#....##.#.##.."
        , "###..#..#.#...##.#.#..#........"
        , "##....#...#....#....#...#.#...."
        , "#...#.#....#.##..##...#.#......"
        , "......#...#.###......##....#..."
        , ".................#.###......#.."
        , "##..#....#....##...###.#.#..###"
        , "..#..........#..####..##..#...#"
        , ".#......#..#.#...........##.#.."
        , ".#..#......#...#.#.#..#.#.#.#.#"
        , ".#......###.....#.#.#......##.."
        , "#..........#.##...#...........#"
        , "..#....#.##....#.........#....."
        , ".#..##....#...##.........#..#.."
        , "....##..#.###..#.#...#..###..#."
        , "..#......#........#...#.#......"
        , "........#..#..#..#...#.##......"
        , ".##.#.#......#...#.........#..."
        , "#..###.#...#....###.##..###...."
        , "........##.............#....#.."
        , "...#...............#....#.#...."
        , "#..........#..#..#.#.....#...#."
        , ".#.............#...#.......#..#"
        , ".#..#..#...#........##........."
        , ".....#.#..#.#..#..##.........#."
        , "..#..##...#....#.#...#.###..#.."
        , "#...........##.....#...#.##...."
        , "#.#.#.#........##......#...#.#."
        , "......#..#.###.#...#.##.##....#"
        , ".#....#...#....#........#....#."
        , "..#.#..........#..##.......#..#"
        , ".....#...##..#................#"
        , ".#...............##...#.##...##"
        , "#.####....##.....#.......#.##.."
        , "......#.##.#...##..###..#.#...."
        , ".#.##.#...##..#.......#.#..#..."
        , "#...#.##..........##..........#"
        , "#.###...#...#..#.....#.#.##..##"
        , ".##.....#....#...##.....##....."
        , "...#........#..###.###...#....."
        , "##..#....#.....#...#.#....#.#.."
        , "#....#....#.#..........#...#..#"
        , "...##..#......#..#..#..#..#...."
        , ".....##...#..####..##.........#"
        , ".....#..#.#...#..#....##..##..."
        , "..#.......##.#..#.##...#.#....#"
        , ".#..#.#...##..##....#..#......#"
        , "..##.##..##...###..#....#...#.."
        , "........##.......##...##.....##"
        , ".#....###...#..#..#..#.......#."
        , "#.###............#....##.....#."
        , "..........#...#...##..#...#...."
        , "..#......#.##.......#....##..##"
        , "..#..###.....#...#.......#....."
        , "#.#...##.....#...#....#.......#"
        , "....##.##.#....#.....#.#....#.."
        , "...#....#.###............#..###"
        , "#..##..#.........##.....#.#...#"
        , "....#.......##......#....#...#."
        , "....#..##.#..........#........."
        , "....#...#.###.......#...#.#...."
        , "#..#..#...#.......##...#..#.##."
        , "#.......#...##.##......#......."
        , "##..##...##...#......#...#...##"
        , "..#...#.#.####.#...##.....##..."
        , "#...#..#..#...##......#.#..#..#"
        , "..##..##.#.#..#...####.....###."
        , ".#........#..##.###...#.##.#..."
        , "........#..#...##......#.#....#"
        , "..#...###.......##..##..#....#."
        , ".##...#.#..#.##.......##.###..."
        , "#....#.#.#........#....#..#.##."
        , "....#.##.#.##..#.#####.....###."
        , "#.#..#..#...#.#..#.......#.#..."
        , "....#...#....###..............."
        , ".###.#.....#.#.......###......#"
        , "##...#.#.###....##..#...##....."
        , "...#.#..#.###.#.......#...#.#.."
        , ".#...#....#...#..####....###..."
        , "..#....##.....##.#.#.##....#..."
        , "#....#..##.......#...##.##....#"
        , ".##..#.......#..#....###......."
        , "#.##.....##.#.........#......##"
        , ".####.#...#.....#..#...#.##..#."
        , "....#...........#.....#........"
        , ".#............##...#.......#.#."
        , "#....#.##........#....#.#..#..#"
        , "#....#.##....#...##...#..#..#.."
        , "...#..#.####.#....#............"
        , "....#......#.........#........."
        , "#....##....###.....#......#.#.."
        , "...#..#....#........###..#...#."
        , "..#.#........#.#.#.###..#.#.#.."
        , ".....###.....##.#....###.#....."
        , "##.#....#....##...##.###.#.##.."
        , ".###.#..#.......##...#...##...."
        , ".#...###........#.......##.##.."
        , "#......####...#...##.#.######.."
        , "....##.............#..##.##...#"
        , "...........#..##.#...#.#.#...#."
        , "###.......#.##..#....#...#....#"
        , ".........#.....#.#.#..##.#....."
        , "#...##..#....#..#.............#"
        , "...#.......#.##.............#.#"
        , ".....#..#...##......####..#...."
        , ".#.#.#.....#...####..#...##...#"
        , "#...#.#..#..#.#..#.##.........."
        , ".....#.##..#.#.##..#.#.#....#.#"
        , "...##..#...#...#..#....#......."
        , "........#.#..#...#...#.#...#..."
        , "##..#........#..#.....#......##"
        , ".........#..#...#......#......#"
        , "..#.#.#........##...#.##.....##"
        , ".###....##....#...#....#..#...."
        , ".#.............###...#..##..###"
        , ".##.##.##.......###.........#.#"
        , "..#..###...#...#....#..#.#..#.#"
        , "......#..#.#..#.....#.#........"
        , "......#...####...#.#.....#....."
        , ".#...##.......#..#......#...#.."
        , "#..#...#.......###..#..#.#.#.#."
        , ".....#.....###.##....#.#.##.#.#"
        , "#........#....##...#..#.##..#.."
        , "...#.#........##....#.#..###.#."
        , "#...#...##.........#........###"
        , "##...#.##..##...#.....#.###.#.."
        , "#.###.#.#..#...........##..#..."
        , "........#.......#..#..#.###...."
        , "#........#....#......###......."
        , "..#.###.######...#.###..#......"
        , "...#...######..#.....#....#.#.."
        , "..#.......#..#..#.........#...#"
        , ".#...#..##.##.........##......."
        , ".........#.#.##.#..#....#.#...#"
        , "#.......#....#......#.....###.#"
        , "##..............#.###........#."
        , "..#.##..#.##.....#...#.#.#..###"
        , "..#.#......#..#..##.#........#."
        , "..#.....#...#.#...#...###..#.#."
        , ".......#...........#..#..#.#.##"
        , ".......#...##..#.###..........."
        , ".#........#.###.#..#..#..#..#.."
        , "##.#.##....#..###..#.##.##...#."
        , ".....#....##.#........#.#.#...."
        , "....##....#..#..#....##....#.#."
        , "#.....##....#.....#.###.#....#."
        , ".#.##.##..#..#...#...........##"
        , "...#..###..#.....##....#......."
        , "...#..##..###.#..#..#.#........"
        , "......##..#.......#..##.....###"
        , ".#...##.#.#.#......#...#.#.#.##"
        , "....#.#....#...#........#...#.."
        , "....#.#......#.#.###.#.#.##.#.."
        , "#..#........###..#..#..#.....#."
        , "...#....#...##...#........##.##"
        , ".....#..#..#.....#....#.#...#.."
        , "..#.###....#.#..##......#.##.#."
        , "..####......#..#.#.#..#.#####.."
        , ".......##..#..###.#............"
        , "..###.#........#..........##.##"
        , "#.#.........#.##.#......#..#..."
        , "...#.....#.....##..#..##.##..#."
        , "#.#.##....#.......###....##...."
        , "...##.#..#...##.#..#......#..#."
        , "..##.........#.##.#####...#.#.."
        , ".#....#...#....#.#.....##...###"
        , "##.....#..####............###.#"
        , "......#...........#....#......."
        , ".#......#.....##...........###."
        , "#......##.......#.#.#..##.....#"
        , "...###.#.....##.#...#.#....#.#."
        , "...###.......#...#............."
        , "..#..#.#....#.#.###.#.#.##..##."
        , "..##...#..#.#..##.#.##....##..."
        , "..#...........#..#....#....#..."
        , "#.##...........#..#.#..##.#.#.."
        , "...##...##................#..#."
        , ".#...#.##......#.#......#.####."
        , "#.##....#....#.........#....###"
        , ".....###........#.#.#.##...#.##"
        , ".....#....#.#....#.........#..#"
        , "..#...#.#.#.#...#...#...##.#..#"
        , "###.......#.....#.............#"
        , "#.####.#.......#.#.#.#..#.#...."
        , "#..#..#####......#....#..##...."
        , "...............#.....#.#....###"
        , ".###.....#...#.##..#.#..#.#####"
        , "#.##.....#......##.......##...."
        , "..........###.......#...#.#...."
        , "..#.#..#...##.....#........#.#."
        , "........##.##....#####.#.#..##."
        , "..##.#.#...#####..........#.#.#"
        , "#.........#......##...#.....#.."
        , ".##.#........#...#..##...#...#."
        , ".......##..#...#.....#.##......"
        , "....#.#...##..##..#....##......"
        , "#........#..........##..####.#."
        , "...###...#.#.###.#...#....#.#.#"
        , ".....##.#.....#........#.#....#"
        , "#.......#....#...##..#......#.."
        , "...#..........#.#.#...#.#.###.#"
        , "....##.....#.##..#.#.#........."
        , "#.##..##..#....#.........#...#."
        , ".###..........#...##.#..#......"
        , ".....####.............##...###."
        , ".#..#....#..#...#..#..........."
        , "#..#..##..#...#.##..#.###.#...#"
        , "......#.#..###...#..#.....#..#."
        , "##.##......#...#.#...#........."
        , "....##.#.......#.#..##....#.#.#"
        , "#..##..#...###.#....##........."
        , ".............#.#....#...##..#.."
        , "..#....#...#.....#.##.#..##..##"
        , "##.#..##.#..##.#.#.##.#...#.#.."
        , ".##.#..#.#........##.#...##...."
        , "#.........##....##..#......#..."
        , ".#.#.......##...#..#......###.#"
        , "........#.#.#.#......#....#..#."
        , "...##..#...#...#.##..#....#.#.."
        , "...#.#.#.#.......#.......###..#"
        , "...#..##..#####.#.....##.#..#.."
        , ".......#.#.....#.....#...#...##"
        , "#...#...#......##.#....##......"
        , "#.....#.#.#.....#....#......#.."
        , "..#..#.##.#......##..#.#..#..##"
        , "####...#.....#....#.#.........."
        , "....#.....###...#...##......#.."
        , ".....#....#...#............#..."
        , "...#...#..##.........#...#...##"
        , "#.#..#.#...##.#.......#..#.#..."
        , ".#.....#...##.............#...#"
        , ".....#..##..#....#......#.##..#"
        , "....#...###.................#.."
        , "...###...#....#...#...#........"
        , "....#.##.#.......#..#.........."
        , "...#..#......#.#...###...#.#..."
        , "..#.#..#...#.......#.......#.#."
        , ".#.#...#.#.##........#........."
        , "...#..#...#....#.#.#.#.#..###.."
        , ".#..##......#.#.##..#.##....#.."
        , "#....#.......##.....#.#........"
        , "..###..#.#.#.......##....#....."
        , "........#.#.#....##...##..#...."
        , "#....##.#....#...##..##...#...."
        , "...#..##.#.....#...#.....##...."
        , ".#.#..#..#...#....#..##.#....#."
        , "##.#.##....#.....#....#....#.#."
        , ".##......#............##...#..."
        , "#..##.#.####.#.#....#..#..#.#.#"
        , "#...##...#......##....###.....#"
        , "..#.##.....#....#....#......#.."
        , ".##.#...#.....#.#.#.#........##"
        , ".#..#....#.#...........#...#..."
        , "#.....#..#.....#.#.##.#.....#.."
        , "....#.....#..#.#....###........"
        , ".....###...........#.#..##.#.#."
        , "....###....#.......###..#...#.#"
        , ".###.....#...##.#...##........#"
        , "..#..#.#..#...#.#...#.#..#...#."
        , "#.####.......#....##.#..#.#..#."
        , "....#.#.##.#..###.........##.#."
        , "..#..#.#....#....#.##.........."
        , "..##.###..#.#..#.#......#....#."
        , ".#..#.....##...#.#......##.#..#"
        , "#.#....#..#.#.#........#.###..."
        , "...#....##....##..###.###.#.#.."
        , "..#....#.....#....##.#........."
        , "#.......#....#.........##..#..."
        , ".#..#...#.#..#.#....#.#........"
        , "...#..###...#.....#......##...."
        , "..#...........#.....#.........."
        , "....###.#...#......#...#..#...."
        , ".....#.##..#..#....#.......#..#"
        , "....##..#.#.#..............#.#."
        , ".#.#..#..#.#......#...#.#......"
        , "....#.......#.##....##.#.#.#..#"
        , "............#.#.#.....##......."
        , "........#...##.#..#......#...##"
        , ".........#...#...#....#...#.##."
        , "..#.....#......#......#.....#.."
        , "#....#...##..#.#....#.#...#.###"
        , ".......#..#..#..#.#...#.....#.#"
        , "...#.#...#......##.....#..#...."
        , "...#.#.####..##.#..#..........."
        , "..##..##....#.....####...#....#"
        , "###.......#...##.#...#...#...#."
        , ".##..#.....#..####......#....#."
        , "#.....#..#..##..##...#..#..#..."
        , ".#....#.....#...####..####....."
        , "..#....#...#......#........#.#."
        , "##.#.......#..#.....#..##..##.."
        , ".#..#..#.#.#...#....##...#.##.#"
        , "##...#..#....#.........##......"
        ]


passwords =
    [ ( ( 1, 2 ), "x", "xpxc" )
    , ( ( 1, 5 ), "b", "bwlbbbbcq" )
    , ( ( 3, 5 ), "v", "qvjjdhvl" )
    , ( ( 9, 12 ), "t", "ttfjvvtgxtctrntnhtt" )
    , ( ( 3, 4 ), "r", "rqjw" )
    , ( ( 3, 7 ), "p", "ppfpppppp" )
    , ( ( 5, 6 ), "q", "qqqqgq" )
    , ( ( 7, 10 ), "v", "gpvgmqkvxgbvs" )
    , ( ( 4, 12 ), "b", "kkdnrhwzbbbb" )
    , ( ( 3, 7 ), "r", "rrkwrshls" )
    , ( ( 3, 4 ), "l", "ldltwzclnrllhkb" )
    , ( ( 4, 6 ), "m", "mfcmmdvmmmm" )
    , ( ( 6, 16 ), "c", "ccccczcccccccccgcc" )
    , ( ( 5, 7 ), "k", "kkppkrr" )
    , ( ( 2, 5 ), "p", "bpppmpcjrgwp" )
    , ( ( 8, 14 ), "c", "dcwklzcckccwdw" )
    , ( ( 4, 7 ), "j", "qhjjjhsj" )
    , ( ( 2, 5 ), "c", "jcdclznbzb" )
    , ( ( 7, 8 ), "x", "xxxxxxxsxxxxlxxxxxx" )
    , ( ( 6, 7 ), "s", "rhsstssmvssss" )
    , ( ( 8, 16 ), "j", "rhsxwjrtpjjjjxhcjhx" )
    , ( ( 13, 14 ), "q", "lqmqqqzsvqqjqq" )
    , ( ( 5, 7 ), "g", "gggsfggj" )
    , ( ( 15, 16 ), "s", "ssssssssssssssxd" )
    , ( ( 3, 5 ), "d", "dmwsm" )
    , ( ( 4, 5 ), "v", "vbvvvg" )
    , ( ( 5, 6 ), "f", "jfzbgfp" )
    , ( ( 1, 4 ), "k", "qkkkk" )
    , ( ( 11, 15 ), "l", "lllllllllllllln" )
    , ( ( 12, 16 ), "n", "nfpnnnnnnhncnjnnls" )
    , ( ( 6, 8 ), "l", "llllllllll" )
    , ( ( 13, 15 ), "p", "pppppppppppphppp" )
    , ( ( 4, 9 ), "k", "bkvqvwkgk" )
    , ( ( 1, 3 ), "j", "jsrg" )
    , ( ( 10, 14 ), "r", "rrvfrvrrrrtrrmsr" )
    , ( ( 2, 4 ), "r", "tcfnd" )
    , ( ( 5, 6 ), "t", "ttwtjk" )
    , ( ( 7, 18 ), "h", "wjjfhphhbqlvqkhjwhk" )
    , ( ( 6, 9 ), "p", "phkkzvppppjpcpnfpsxt" )
    , ( ( 5, 6 ), "f", "ffffmfffffff" )
    , ( ( 9, 16 ), "p", "gbwsmxplndwmrpps" )
    , ( ( 1, 6 ), "s", "sczssw" )
    , ( ( 5, 14 ), "t", "ctxlqhrlvvdttwlnt" )
    , ( ( 2, 5 ), "n", "nndkqnnft" )
    , ( ( 7, 8 ), "c", "zclccrwc" )
    , ( ( 4, 11 ), "q", "pqrqdkpqbjshn" )
    , ( ( 5, 6 ), "m", "nmcmrbmfcgmfw" )
    , ( ( 16, 17 ), "h", "hhhhhhhxhhrhhhhhlh" )
    , ( ( 5, 6 ), "v", "vvvvvv" )
    , ( ( 2, 11 ), "m", "wpsmlpznxdkhs" )
    , ( ( 3, 4 ), "s", "sswf" )
    , ( ( 2, 3 ), "s", "hsbczzspqkwjr" )
    , ( ( 4, 7 ), "s", "zsjrrsvssss" )
    , ( ( 11, 16 ), "j", "hpjdcwpjjnjfgkjlxt" )
    , ( ( 5, 7 ), "b", "rcbbbbg" )
    , ( ( 13, 15 ), "w", "wwwwwwwwwwwwwwww" )
    , ( ( 1, 6 ), "c", "cccmgc" )
    , ( ( 2, 4 ), "v", "vvgv" )
    , ( ( 4, 5 ), "m", "mfmmhms" )
    , ( ( 1, 3 ), "t", "mntqgkdfjsxzptk" )
    , ( ( 2, 7 ), "v", "nvnqmvv" )
    , ( ( 19, 20 ), "c", "ccccccccccccccpcccfc" )
    , ( ( 11, 12 ), "t", "wttmnqtbkttc" )
    , ( ( 3, 5 ), "p", "ptpvp" )
    , ( ( 1, 11 ), "l", "lglwgtlqlnxl" )
    , ( ( 4, 8 ), "m", "mprmmmmwmmfmm" )
    , ( ( 9, 10 ), "d", "ddddddddxdd" )
    , ( ( 16, 20 ), "r", "rrrrrrrrrrrrrrrlrrrt" )
    , ( ( 1, 4 ), "g", "gggg" )
    , ( ( 2, 12 ), "b", "bczgbbbfbwbprbbbtb" )
    , ( ( 2, 7 ), "n", "nnnmnxkntwwxnr" )
    , ( ( 14, 18 ), "z", "tzzzqzzzlnpqzpzzkz" )
    , ( ( 5, 7 ), "p", "ppppmkp" )
    , ( ( 9, 14 ), "c", "vvcgvrxlccxvlpfml" )
    , ( ( 2, 3 ), "l", "jlzpf" )
    , ( ( 3, 5 ), "p", "pbpbp" )
    , ( ( 9, 13 ), "j", "jjjjjjjjjjjjj" )
    , ( ( 5, 7 ), "k", "fmckjkkklkxpf" )
    , ( ( 5, 6 ), "d", "ddddrd" )
    , ( ( 9, 10 ), "s", "sssnsgssbs" )
    , ( ( 9, 10 ), "p", "ppwvppbpptpp" )
    , ( ( 1, 8 ), "z", "kmfszzrx" )
    , ( ( 9, 10 ), "v", "vvjjvsklvdkrkvs" )
    , ( ( 2, 17 ), "k", "kkctmcfzhtvskxlkq" )
    , ( ( 10, 12 ), "n", "vjnndvnlgnhmfc" )
    , ( ( 5, 6 ), "n", "hnnnnntn" )
    , ( ( 1, 6 ), "f", "fptffkhhkktfbtst" )
    , ( ( 4, 6 ), "k", "kqnkjhhwqhpzb" )
    , ( ( 6, 12 ), "r", "rrrrrrrrrrrv" )
    , ( ( 8, 13 ), "l", "llllllllwlllllll" )
    , ( ( 4, 6 ), "p", "qxprzs" )
    , ( ( 2, 10 ), "w", "wswpdwwwrcth" )
    , ( ( 4, 6 ), "n", "gnnfnnnnnnn" )
    , ( ( 10, 14 ), "s", "ssssssprbfssssw" )
    , ( ( 3, 4 ), "f", "ftfk" )
    , ( ( 6, 16 ), "x", "cqxxqwrdxxxxsxbxxxxt" )
    , ( ( 4, 8 ), "f", "ffsqvfpm" )
    , ( ( 8, 11 ), "t", "ttztttttttnttt" )
    , ( ( 13, 15 ), "q", "qqnqqqqqqqqqqqq" )
    , ( ( 2, 3 ), "w", "wwww" )
    , ( ( 2, 8 ), "n", "ntnnnnnrnn" )
    , ( ( 2, 3 ), "k", "jkzkk" )
    , ( ( 3, 4 ), "s", "sscscp" )
    , ( ( 14, 19 ), "g", "gzggggggggggfgfgggqg" )
    , ( ( 5, 6 ), "n", "nnnnwlnn" )
    , ( ( 11, 12 ), "b", "bbmbbbbbbbxbbn" )
    , ( ( 5, 6 ), "t", "zntzfk" )
    , ( ( 4, 5 ), "j", "ljphjl" )
    , ( ( 3, 12 ), "d", "zndtlvdvvdzzn" )
    , ( ( 7, 8 ), "h", "hhhhhhhwhh" )
    , ( ( 12, 13 ), "s", "sssssshssxssss" )
    , ( ( 4, 5 ), "h", "nhsxxmh" )
    , ( ( 7, 9 ), "f", "fzfkffffsfxn" )
    , ( ( 1, 8 ), "c", "cccfcpccmhcch" )
    , ( ( 1, 2 ), "d", "kfdwwm" )
    , ( ( 13, 14 ), "l", "llllllllllllcll" )
    , ( ( 2, 5 ), "p", "jpxdpkg" )
    , ( ( 2, 4 ), "h", "hvhbmhhhhhnh" )
    , ( ( 5, 9 ), "g", "ngqgtqtggdgg" )
    , ( ( 15, 17 ), "b", "brhlrjflddssrrjxb" )
    , ( ( 10, 15 ), "v", "vkfvvqtcxvvvtvcbvv" )
    , ( ( 1, 3 ), "g", "pvkqsgzggg" )
    , ( ( 7, 8 ), "j", "jjjjjjbjj" )
    , ( ( 3, 4 ), "w", "jwrw" )
    , ( ( 4, 7 ), "c", "mhcmkcjrpncxmcrccbc" )
    , ( ( 9, 12 ), "q", "qqqqqqqqqqqs" )
    , ( ( 13, 16 ), "n", "nwngndnnnnnnnnnnnn" )
    , ( ( 3, 4 ), "b", "fjbbb" )
    , ( ( 8, 9 ), "d", "jdfdsqnmdwfdnddkd" )
    , ( ( 1, 4 ), "f", "ggfwgbfhvs" )
    , ( ( 4, 5 ), "g", "gggvg" )
    , ( ( 8, 12 ), "x", "gxhxxxxkxzmfxxx" )
    , ( ( 1, 5 ), "q", "dqqhq" )
    , ( ( 3, 9 ), "m", "mmdmmmzmmp" )
    , ( ( 1, 2 ), "l", "llll" )
    , ( ( 6, 8 ), "q", "qjwhqqhpkbzppc" )
    , ( ( 3, 10 ), "m", "mmcjgrtzmmdmmm" )
    , ( ( 2, 4 ), "q", "cxvq" )
    , ( ( 11, 13 ), "v", "fvvvvvvvvvvvv" )
    , ( ( 7, 13 ), "b", "bbbgbnbkbkbrldbbtc" )
    , ( ( 14, 16 ), "m", "wmmmmmzxrmmjmwmh" )
    , ( ( 6, 10 ), "b", "bwvwbbvshbgtbsrlwbzt" )
    , ( ( 6, 8 ), "q", "qdwhcgpqxw" )
    , ( ( 16, 17 ), "l", "llllbjlrllllcbdhllpl" )
    , ( ( 3, 4 ), "m", "mmmrv" )
    , ( ( 7, 8 ), "m", "mhjnnchg" )
    , ( ( 12, 13 ), "p", "ppppppppppppt" )
    , ( ( 1, 4 ), "s", "sssx" )
    , ( ( 1, 2 ), "d", "xmpdq" )
    , ( ( 10, 11 ), "x", "xxxxxxxxxbbx" )
    , ( ( 2, 4 ), "s", "lxds" )
    , ( ( 1, 4 ), "b", "jbsxbbmbbj" )
    , ( ( 6, 8 ), "q", "qqqqqqblqq" )
    , ( ( 15, 16 ), "q", "qqqqqwzqqqqqnqqqqfq" )
    , ( ( 5, 7 ), "s", "fzvsssr" )
    , ( ( 6, 7 ), "l", "lncbgqr" )
    , ( ( 7, 8 ), "s", "ssssssvs" )
    , ( ( 3, 5 ), "r", "rbrjt" )
    , ( ( 3, 8 ), "j", "ksjjtvnjbjppjjjl" )
    , ( ( 6, 10 ), "s", "sszlkrsssss" )
    , ( ( 1, 4 ), "z", "znzfpz" )
    , ( ( 7, 11 ), "m", "dfkcbxmxmnmmtvmtdn" )
    , ( ( 6, 9 ), "h", "hlhhkhhhq" )
    , ( ( 8, 9 ), "p", "ppppppppvp" )
    , ( ( 6, 9 ), "c", "cccgccccmcch" )
    , ( ( 5, 8 ), "g", "bgkggjgtvggn" )
    , ( ( 3, 4 ), "x", "xxhk" )
    , ( ( 10, 12 ), "h", "hhhhhhhhhlhhhhdnh" )
    , ( ( 5, 6 ), "j", "zjjsjn" )
    , ( ( 9, 14 ), "s", "ksclwttsmpjtds" )
    , ( ( 6, 7 ), "l", "gtdcblql" )
    , ( ( 1, 4 ), "d", "dkndjkcd" )
    , ( ( 1, 6 ), "k", "kkkkkckmc" )
    , ( ( 10, 12 ), "x", "xxxxxxxxxrxl" )
    , ( ( 2, 5 ), "v", "fxdjtv" )
    , ( ( 3, 5 ), "q", "pjmkqdmqnzqppr" )
    , ( ( 5, 8 ), "t", "xtgtgtcht" )
    , ( ( 6, 11 ), "j", "nftjzjmfljqjrc" )
    , ( ( 6, 9 ), "g", "rskgggmgmwjggggvgb" )
    , ( ( 11, 12 ), "v", "vkvdmvdvvvdv" )
    , ( ( 15, 16 ), "z", "zzzzzzzzzzzzzzgxz" )
    , ( ( 13, 17 ), "v", "vvvvvvvvvvvvvvvvnv" )
    , ( ( 9, 14 ), "j", "clrfkrwhjtvzvqqj" )
    , ( ( 1, 12 ), "l", "lljljznslllffhblz" )
    , ( ( 4, 7 ), "c", "cccgcxclc" )
    , ( ( 6, 11 ), "z", "tbxqrzzbwbr" )
    , ( ( 18, 19 ), "m", "jmbmmqmshmczlphfgmf" )
    , ( ( 1, 5 ), "s", "ssvsq" )
    , ( ( 4, 5 ), "k", "kkkkw" )
    , ( ( 4, 7 ), "f", "fcqffxff" )
    , ( ( 3, 8 ), "f", "fffzthzf" )
    , ( ( 9, 12 ), "v", "vvvvvvvvvvvmvv" )
    , ( ( 14, 17 ), "f", "ftflcfffjtjrvfkffmvf" )
    , ( ( 4, 7 ), "n", "pnmnxnqqjp" )
    , ( ( 6, 7 ), "r", "rrrkrmr" )
    , ( ( 4, 13 ), "k", "drckdzxrsmzrkqckn" )
    , ( ( 5, 14 ), "t", "dttttttttttttt" )
    , ( ( 13, 14 ), "v", "vvvvfvvvvvvvvvv" )
    , ( ( 7, 12 ), "j", "jrljwnctjqjjxj" )
    , ( ( 6, 7 ), "v", "wchfzvm" )
    , ( ( 1, 8 ), "d", "dddddddzd" )
    , ( ( 10, 12 ), "g", "gvvzrglgrgggggggggg" )
    , ( ( 3, 4 ), "n", "ngtnnn" )
    , ( ( 2, 4 ), "b", "fzbb" )
    , ( ( 1, 15 ), "x", "cxxfxxxckxxhxlxxxxxx" )
    , ( ( 7, 19 ), "f", "ffkzcglddffcfvfhffv" )
    , ( ( 9, 12 ), "s", "sssssssmssss" )
    , ( ( 13, 20 ), "t", "ttttmttttttthtttddtt" )
    , ( ( 2, 15 ), "v", "vvqvcwvvvvsvvqvwm" )
    , ( ( 5, 10 ), "w", "wxcstswwwwnc" )
    , ( ( 3, 4 ), "v", "tjvvnvvtzfdcjjwb" )
    , ( ( 1, 2 ), "l", "lbclr" )
    , ( ( 2, 13 ), "d", "dkdlddcddddddd" )
    , ( ( 2, 7 ), "n", "npnngnnn" )
    , ( ( 4, 12 ), "g", "kmvvmfngwmlg" )
    , ( ( 1, 2 ), "w", "wwwww" )
    , ( ( 5, 11 ), "t", "ttttjtttttttttttt" )
    , ( ( 4, 5 ), "r", "srlrrr" )
    , ( ( 5, 8 ), "q", "qhqfpjqsnqqkq" )
    , ( ( 8, 15 ), "s", "hvtnslpsfbsssrw" )
    , ( ( 11, 16 ), "n", "gnwnfndrnnhnnknsnnc" )
    , ( ( 2, 7 ), "r", "tdrrshrrhsxrr" )
    , ( ( 16, 18 ), "m", "mmbmmmjmmmmmmmmmmbm" )
    , ( ( 6, 7 ), "n", "nnnnnxt" )
    , ( ( 4, 6 ), "k", "dpxzklksk" )
    , ( ( 1, 9 ), "g", "ggkxhgggggggggggqg" )
    , ( ( 1, 8 ), "l", "lllglllh" )
    , ( ( 1, 4 ), "c", "cwtc" )
    , ( ( 5, 6 ), "h", "vhhhvshh" )
    , ( ( 10, 11 ), "x", "xxxxxxxxxxc" )
    , ( ( 2, 3 ), "q", "qhqqgqmt" )
    , ( ( 3, 6 ), "k", "hkqqshgjnxmlkrjdzg" )
    , ( ( 9, 11 ), "l", "llprlllllllll" )
    , ( ( 5, 7 ), "l", "lknflmrv" )
    , ( ( 8, 9 ), "h", "hhhhhhhhh" )
    , ( ( 7, 8 ), "z", "zzzzzgvzzzzz" )
    , ( ( 18, 20 ), "v", "vvvvvvvhbvqvgvlvjbrv" )
    , ( ( 13, 15 ), "k", "xkfcvkrnfkkkvcpt" )
    , ( ( 3, 5 ), "l", "llnnglmgtz" )
    , ( ( 15, 19 ), "t", "tmtsfttxtctdtgtmpttt" )
    , ( ( 6, 8 ), "f", "gmffwvffff" )
    , ( ( 10, 13 ), "d", "dndsddddddpdjndddd" )
    , ( ( 7, 10 ), "r", "rjzqrpgrrrcmrrg" )
    , ( ( 1, 4 ), "m", "hlmm" )
    , ( ( 9, 15 ), "d", "pdddlrwdzddddddd" )
    , ( ( 6, 13 ), "q", "qqqhnvqqqqqqfbqq" )
    , ( ( 1, 11 ), "z", "wzsqmnrzwzzhzxczzzzd" )
    , ( ( 6, 11 ), "t", "tptnjttkttttvtttr" )
    , ( ( 3, 5 ), "n", "nnznnn" )
    , ( ( 5, 6 ), "t", "trtttslv" )
    , ( ( 5, 6 ), "g", "gggggt" )
    , ( ( 15, 19 ), "s", "sssssssssssxsswsssss" )
    , ( ( 1, 13 ), "q", "wzqjljdqqqqnqq" )
    , ( ( 6, 7 ), "k", "kkkkkgkkk" )
    , ( ( 4, 5 ), "k", "zkxvk" )
    , ( ( 7, 14 ), "t", "thsstltbvmsctqkfhdzc" )
    , ( ( 2, 5 ), "n", "hnnnn" )
    , ( ( 2, 16 ), "t", "gsvkhmhktcxkfqbtd" )
    , ( ( 8, 9 ), "q", "qqtzznrqg" )
    , ( ( 17, 18 ), "v", "vvzvvvvvvvvvvvvvlk" )
    , ( ( 3, 4 ), "v", "vvvl" )
    , ( ( 3, 4 ), "b", "bbvb" )
    , ( ( 10, 12 ), "w", "wwwcwwwwwwkzwhw" )
    , ( ( 1, 3 ), "d", "ntps" )
    , ( ( 8, 9 ), "j", "mqcjcjjfjjhjbjj" )
    , ( ( 1, 7 ), "j", "mjjjjjjj" )
    , ( ( 13, 14 ), "f", "bzffglvfcfsfjb" )
    , ( ( 2, 3 ), "k", "kqkq" )
    , ( ( 7, 15 ), "c", "fccpccshcccccccc" )
    , ( ( 12, 13 ), "k", "kkkkkkpkktksqk" )
    , ( ( 12, 13 ), "w", "rwwwwwkwwwwswwwhw" )
    , ( ( 5, 12 ), "k", "nlkthkkklkkktchmhb" )
    , ( ( 15, 16 ), "f", "fffffffdffffffbf" )
    , ( ( 3, 4 ), "k", "kqkprkkp" )
    , ( ( 4, 5 ), "p", "dcpdppzpppjqm" )
    , ( ( 4, 7 ), "b", "qbbkgbgz" )
    , ( ( 10, 11 ), "n", "nnnnnnnnnnw" )
    , ( ( 9, 12 ), "h", "hhhchbhhvhrhhh" )
    , ( ( 3, 5 ), "h", "hrhnbcl" )
    , ( ( 6, 10 ), "v", "nvlvhvrpvvvvvvv" )
    , ( ( 3, 6 ), "d", "dddddjd" )
    , ( ( 4, 5 ), "r", "rrcvr" )
    , ( ( 7, 12 ), "l", "llllllllllllltll" )
    , ( ( 3, 6 ), "b", "zbbbbt" )
    , ( ( 6, 10 ), "z", "zznzzzzzbzbhzz" )
    , ( ( 2, 5 ), "h", "rfwbmkhmhhhmjhmh" )
    , ( ( 11, 13 ), "q", "wkkzzqxvqqsqx" )
    , ( ( 2, 15 ), "p", "hbpjpppppptppppzb" )
    , ( ( 9, 10 ), "b", "bbmbbbbbsb" )
    , ( ( 3, 10 ), "t", "cqmtttjtttttf" )
    , ( ( 8, 11 ), "v", "tvgcvvvvvkv" )
    , ( ( 6, 9 ), "g", "tggnggtggkg" )
    , ( ( 3, 6 ), "w", "dfwnht" )
    , ( ( 8, 14 ), "c", "pncwqccsfgctpccxc" )
    , ( ( 6, 9 ), "p", "bpppjtzprggp" )
    , ( ( 15, 18 ), "j", "sjjjjjjdjmjbjjpvjj" )
    , ( ( 1, 6 ), "m", "mhmkrhxn" )
    , ( ( 10, 11 ), "d", "xcjtpdwdcfvhqdksfhd" )
    , ( ( 16, 17 ), "t", "txtlrttctwtztttnx" )
    , ( ( 13, 14 ), "j", "jjtjjmjjnjjjjjjj" )
    , ( ( 10, 12 ), "m", "ldqmmmgmmxrmfwrbv" )
    , ( ( 4, 6 ), "p", "psmpnpkfq" )
    , ( ( 13, 14 ), "t", "tltttsttmtttjttt" )
    , ( ( 7, 9 ), "g", "ggggggbgv" )
    , ( ( 8, 9 ), "q", "qqqqqqqqd" )
    , ( ( 4, 5 ), "d", "ddddl" )
    , ( ( 14, 16 ), "g", "gggggggwggpgfpgm" )
    , ( ( 4, 5 ), "v", "vvvvl" )
    , ( ( 5, 8 ), "v", "gtjpvvdv" )
    , ( ( 5, 11 ), "s", "dsslsvqpwsss" )
    , ( ( 4, 6 ), "h", "hhhghh" )
    , ( ( 16, 17 ), "k", "hkkkkkkkkkkkkkkqj" )
    , ( ( 5, 10 ), "d", "dddtddddjd" )
    , ( ( 6, 7 ), "v", "vclfvvzvj" )
    , ( ( 6, 8 ), "m", "dtkbcblppzx" )
    , ( ( 1, 4 ), "g", "hggggg" )
    , ( ( 9, 11 ), "q", "qdqvdqkdfqvqzqkq" )
    , ( ( 2, 6 ), "s", "ssgsbswhs" )
    , ( ( 3, 8 ), "j", "jjpjjjjv" )
    , ( ( 3, 8 ), "d", "dddddddqdddd" )
    , ( ( 6, 8 ), "v", "vvvvhcvn" )
    , ( ( 6, 12 ), "z", "gzzzzzzzzzzkzzzzz" )
    , ( ( 5, 12 ), "k", "nrkzklbxcwbc" )
    , ( ( 10, 14 ), "p", "clxjpnhsvttnjp" )
    , ( ( 6, 17 ), "w", "vztxwwwgwlwcwwwtw" )
    , ( ( 8, 11 ), "c", "cctzcccqcjc" )
    , ( ( 1, 3 ), "b", "zdqx" )
    , ( ( 3, 5 ), "x", "dvxxxx" )
    , ( ( 6, 13 ), "b", "gvbbbbbbbbvpkbb" )
    , ( ( 7, 12 ), "k", "hkbkkqkvkmpkrhk" )
    , ( ( 3, 6 ), "c", "ccrbcdccc" )
    , ( ( 4, 6 ), "m", "znhphh" )
    , ( ( 4, 11 ), "x", "xmmgbxxgdxxtbwg" )
    , ( ( 15, 16 ), "m", "nmmbmmbjmrbvmmbm" )
    , ( ( 11, 12 ), "j", "jdcjjtsjjdjj" )
    , ( ( 1, 4 ), "c", "cccfcc" )
    , ( ( 6, 15 ), "n", "ssvnnnnnnwnggzmp" )
    , ( ( 4, 6 ), "l", "qwfllpx" )
    , ( ( 6, 9 ), "b", "bbbbbsbbmb" )
    , ( ( 3, 6 ), "j", "ljjgfh" )
    , ( ( 5, 9 ), "t", "tttttphtwtvtf" )
    , ( ( 8, 12 ), "x", "xtdxxxdjghxxpxhkbxx" )
    , ( ( 5, 9 ), "r", "rrprrmrrrjvszrrtp" )
    , ( ( 15, 16 ), "r", "lrrrrrrrrrrrkrrrr" )
    , ( ( 2, 5 ), "q", "ltfgqcqmt" )
    , ( ( 7, 13 ), "k", "zkkkkkkkkkkkhkkkkk" )
    , ( ( 5, 6 ), "z", "zzzzzszz" )
    , ( ( 2, 7 ), "g", "tnjqnsgkdtc" )
    , ( ( 3, 4 ), "j", "njjjgkxcgckj" )
    , ( ( 4, 7 ), "j", "rxmjlxzhjjjsgjcj" )
    , ( ( 7, 10 ), "f", "rmfbffhffcf" )
    , ( ( 11, 12 ), "h", "hdhhhhhhhhhsh" )
    , ( ( 7, 8 ), "v", "nwrvvvvdv" )
    , ( ( 8, 9 ), "l", "llllllllf" )
    , ( ( 4, 5 ), "r", "rmxrrrrx" )
    , ( ( 2, 3 ), "c", "ccgdcc" )
    , ( ( 13, 15 ), "r", "rrwrrrnrrrrrdrslr" )
    , ( ( 4, 16 ), "x", "cnlxmtpxdzxblfxxjd" )
    , ( ( 4, 5 ), "m", "mmmmtm" )
    , ( ( 9, 13 ), "x", "gxxxxxxlxxqxxxxx" )
    , ( ( 1, 3 ), "d", "ddhd" )
    , ( ( 11, 14 ), "f", "tffffffffqlfff" )
    , ( ( 2, 4 ), "r", "xrrf" )
    , ( ( 1, 11 ), "m", "mtdmsmmmmdmmmmmsmtmr" )
    , ( ( 1, 8 ), "g", "pggtggggdgmgggn" )
    , ( ( 7, 8 ), "f", "ffvfffpff" )
    , ( ( 2, 7 ), "k", "khqgfzk" )
    , ( ( 11, 12 ), "s", "ssssssssssbsss" )
    , ( ( 7, 14 ), "h", "hthpwhhxhglzqtmhh" )
    , ( ( 2, 4 ), "z", "zzpmz" )
    , ( ( 16, 18 ), "x", "xxxqxxmlgbxxxxxxxx" )
    , ( ( 9, 11 ), "v", "dblhzhvvvnfvptvmf" )
    , ( ( 4, 11 ), "n", "nxsddnsnnngsdnghngk" )
    , ( ( 8, 11 ), "x", "xxxxxxxwxxxxxxxxx" )
    , ( ( 1, 4 ), "s", "swst" )
    , ( ( 13, 14 ), "m", "mgmmghmmmmmmrmmfmmmg" )
    , ( ( 4, 5 ), "c", "dcccc" )
    , ( ( 4, 5 ), "r", "jzrrc" )
    , ( ( 13, 19 ), "b", "bbbbbbbbbbbcbcbbbbb" )
    , ( ( 11, 14 ), "c", "ccccncfclccccfcccm" )
    , ( ( 3, 4 ), "t", "tstl" )
    , ( ( 1, 20 ), "v", "vzrzgsvsfgxjqkxgdpwv" )
    , ( ( 14, 15 ), "h", "hhvkbhhhhhhhhmhhsh" )
    , ( ( 9, 13 ), "b", "bbbbbbbbtbbbbbb" )
    , ( ( 2, 3 ), "b", "zbbb" )
    , ( ( 17, 18 ), "s", "smsssssrsssssssssfss" )
    , ( ( 5, 10 ), "v", "vfvvvfvdvjvlltv" )
    , ( ( 9, 10 ), "n", "nnnqnnnnxtn" )
    , ( ( 6, 7 ), "w", "pwtwwwfkwvk" )
    , ( ( 11, 14 ), "z", "wzzzzzjzzzlzzkz" )
    , ( ( 5, 6 ), "l", "lxlllv" )
    , ( ( 5, 8 ), "v", "vvvvvvthhv" )
    , ( ( 1, 9 ), "r", "rrrrjkzrdqmr" )
    , ( ( 6, 8 ), "s", "sssssssg" )
    , ( ( 2, 4 ), "f", "frfff" )
    , ( ( 1, 16 ), "r", "pzbdrgnpndnrrwkczmr" )
    , ( ( 8, 9 ), "b", "sbbbbbbblkwb" )
    , ( ( 2, 5 ), "z", "zzjzz" )
    , ( ( 3, 6 ), "q", "qqwqqr" )
    , ( ( 2, 13 ), "v", "vbvvbvvjvvnvcdnvc" )
    , ( ( 12, 15 ), "p", "pppppppppppppppp" )
    , ( ( 2, 7 ), "m", "mmmmmmd" )
    , ( ( 6, 11 ), "f", "ffffffffffz" )
    , ( ( 5, 6 ), "r", "drrthrzrrrp" )
    , ( ( 2, 7 ), "q", "fntqnbqqzb" )
    , ( ( 5, 14 ), "w", "wlfwstdfzvwvqw" )
    , ( ( 4, 7 ), "s", "mgsssslfjzsssv" )
    , ( ( 7, 8 ), "g", "tgtgjrggggsggtg" )
    , ( ( 11, 19 ), "z", "fkzzzvzzvzdzzzzzfzz" )
    , ( ( 3, 7 ), "w", "kwcwwww" )
    , ( ( 6, 14 ), "s", "sssssssssssswjss" )
    , ( ( 7, 8 ), "v", "vvmbxvxv" )
    , ( ( 2, 6 ), "n", "nnnnnp" )
    , ( ( 7, 8 ), "b", "bbbbbbbb" )
    , ( ( 3, 6 ), "z", "zzzzhz" )
    , ( ( 11, 17 ), "t", "bltttdttttttttttzt" )
    , ( ( 1, 9 ), "l", "llllllvll" )
    , ( ( 10, 11 ), "n", "tznsxfhdpnn" )
    , ( ( 6, 8 ), "t", "tttttnttt" )
    , ( ( 4, 10 ), "p", "pppppppbppppppnc" )
    , ( ( 4, 11 ), "j", "rhvjjjjjjwjnrcp" )
    , ( ( 3, 4 ), "j", "cjjj" )
    , ( ( 7, 12 ), "v", "kmctjvksqzvv" )
    , ( ( 16, 17 ), "w", "wwwwwwwwcwwwwwwwwww" )
    , ( ( 12, 16 ), "f", "fffffjbfffwffwffff" )
    , ( ( 9, 10 ), "p", "ppntppppjppkpdp" )
    , ( ( 3, 4 ), "l", "lllcf" )
    , ( ( 5, 6 ), "b", "dbbbbsbtb" )
    , ( ( 2, 3 ), "p", "pvpz" )
    , ( ( 5, 6 ), "f", "pqffdf" )
    , ( ( 1, 3 ), "l", "lnlpxl" )
    , ( ( 8, 10 ), "n", "nnnjttnxmmns" )
    , ( ( 1, 10 ), "j", "xjjwtjtjjjjjjj" )
    , ( ( 2, 8 ), "m", "smwmcmzrfqbmmwdmm" )
    , ( ( 1, 6 ), "k", "jxpsfkkkgm" )
    , ( ( 5, 9 ), "f", "zjfffjjwknqh" )
    , ( ( 1, 6 ), "c", "rcccczcccccc" )
    , ( ( 13, 17 ), "g", "zsgpfppggwshgbtggxzh" )
    , ( ( 12, 14 ), "n", "qmknbfcgnnnhwn" )
    , ( ( 1, 6 ), "k", "vdklkkzkkkkfkm" )
    , ( ( 1, 3 ), "h", "hhlhhhl" )
    , ( ( 16, 18 ), "p", "qggnxmswcppklptgsp" )
    , ( ( 1, 4 ), "m", "vmmqmmmmmmm" )
    , ( ( 8, 10 ), "l", "lllllxlllvllg" )
    , ( ( 4, 12 ), "g", "gjgghggwctzvgggggg" )
    , ( ( 8, 11 ), "x", "jxhxxxxxxxx" )
    , ( ( 4, 16 ), "n", "xnrnbkrkdvntnjkc" )
    , ( ( 2, 4 ), "m", "mdmmj" )
    , ( ( 6, 7 ), "n", "nnnnnngnnnntn" )
    , ( ( 1, 13 ), "j", "jjjgjjjfgjjmj" )
    , ( ( 8, 10 ), "z", "zzzzzzpjtz" )
    , ( ( 1, 18 ), "f", "ffkwvfgcrnffgnffmf" )
    , ( ( 4, 5 ), "j", "jjtjvb" )
    , ( ( 6, 11 ), "s", "ssscsnslsssssssshsss" )
    , ( ( 11, 12 ), "n", "nnnnnnnnnnmd" )
    , ( ( 2, 10 ), "n", "cpnhnrnbknnkwnbnlb" )
    , ( ( 2, 4 ), "d", "dddnh" )
    , ( ( 9, 12 ), "f", "fffffffffffldfff" )
    , ( ( 1, 9 ), "d", "ddddddvdlddddd" )
    , ( ( 1, 8 ), "w", "wnwwwdwww" )
    , ( ( 3, 4 ), "h", "bhgv" )
    , ( ( 1, 4 ), "x", "vxxj" )
    , ( ( 3, 4 ), "g", "gmgbg" )
    , ( ( 7, 8 ), "j", "nzwgbtnj" )
    , ( ( 3, 6 ), "z", "zzpzzhzw" )
    , ( ( 8, 10 ), "h", "hmhhhhszgz" )
    , ( ( 1, 5 ), "m", "dnqgnxjm" )
    , ( ( 11, 12 ), "z", "zkzpbjxszzzhwgdz" )
    , ( ( 10, 11 ), "r", "rlrrrrrrrrr" )
    , ( ( 1, 2 ), "v", "vvvvtsvvvvvvvvqvvvn" )
    , ( ( 13, 14 ), "n", "nrfzqlxxxsxqhnkhrmws" )
    , ( ( 1, 4 ), "z", "znftzjjwzc" )
    , ( ( 6, 15 ), "v", "fvvvlvvhvvvvvzhvv" )
    , ( ( 5, 10 ), "x", "mtxprgbqxxkfnssvq" )
    , ( ( 8, 9 ), "f", "lffffffwf" )
    , ( ( 1, 4 ), "g", "grxgvlhflrbghj" )
    , ( ( 3, 5 ), "c", "fcxcl" )
    , ( ( 6, 7 ), "s", "ssssdds" )
    , ( ( 10, 13 ), "l", "llllllllllllxl" )
    , ( ( 12, 15 ), "j", "jjvjjbjcjjjjsjjj" )
    , ( ( 1, 2 ), "c", "ctggc" )
    , ( ( 2, 4 ), "w", "wbwwwwr" )
    , ( ( 8, 20 ), "v", "phvvvvvrbvvfvvvvvvhv" )
    , ( ( 5, 8 ), "v", "cvvnvjbl" )
    , ( ( 4, 19 ), "x", "xhvxflxpkxxcfvwxxhl" )
    , ( ( 1, 2 ), "m", "mgqj" )
    , ( ( 5, 6 ), "q", "wpxdbq" )
    , ( ( 19, 20 ), "d", "ddddddbxddddddddddpd" )
    , ( ( 5, 11 ), "d", "dhhwddjddkdd" )
    , ( ( 6, 7 ), "g", "ggggggn" )
    , ( ( 1, 7 ), "h", "zhphhhhhgn" )
    , ( ( 7, 11 ), "s", "ssssssssssksssss" )
    , ( ( 2, 3 ), "n", "hnwn" )
    , ( ( 8, 9 ), "h", "hhsshhhhh" )
    , ( ( 1, 2 ), "c", "ccwcc" )
    , ( ( 2, 5 ), "s", "cdsmmfqfcrsh" )
    , ( ( 3, 5 ), "m", "mwmjt" )
    , ( ( 1, 4 ), "n", "ndntnnnnnnnnnn" )
    , ( ( 4, 6 ), "s", "ssslsssshsssmq" )
    , ( ( 5, 16 ), "r", "rrrrcrrrjrrrrrrrrr" )
    , ( ( 1, 6 ), "v", "bvvvvvvv" )
    , ( ( 9, 10 ), "t", "tsttttztxtttttb" )
    , ( ( 8, 12 ), "d", "tvrbvwxdddxmhfsd" )
    , ( ( 3, 9 ), "w", "wbwwwwwwww" )
    , ( ( 3, 5 ), "g", "bgglcqg" )
    , ( ( 8, 12 ), "f", "fqffvdzslhksrv" )
    , ( ( 1, 4 ), "h", "hsqh" )
    , ( ( 6, 12 ), "b", "hbwhxbfppkbb" )
    , ( ( 12, 15 ), "l", "llllllllllllllplv" )
    , ( ( 16, 17 ), "m", "mmmmmzmvmmmmmmkmhmmm" )
    , ( ( 2, 8 ), "p", "mpnnnpwpv" )
    , ( ( 9, 10 ), "x", "xxpxxxxlcxj" )
    , ( ( 10, 14 ), "c", "mccclvcccfcckwcbczc" )
    , ( ( 2, 3 ), "v", "vvsrg" )
    , ( ( 13, 15 ), "h", "hhhhrlhfhhhhvhhhshh" )
    , ( ( 3, 8 ), "z", "vsbkqlzzzzzsmzw" )
    , ( ( 9, 11 ), "h", "qhhhhhhhddnh" )
    , ( ( 4, 5 ), "h", "hhhkxhh" )
    , ( ( 7, 12 ), "t", "dtcvttttbhnntft" )
    , ( ( 1, 5 ), "z", "kksnxzzxz" )
    , ( ( 1, 3 ), "j", "cjjjjjjjfjj" )
    , ( ( 12, 15 ), "s", "sslssstssssssszss" )
    , ( ( 2, 4 ), "c", "mntc" )
    , ( ( 5, 8 ), "v", "mvbsvfvvvlsrv" )
    , ( ( 5, 6 ), "z", "zmhfjq" )
    , ( ( 10, 15 ), "r", "rrrrrrrjrbrmrjr" )
    , ( ( 9, 11 ), "j", "jjjjjjjjjjxjjj" )
    , ( ( 1, 2 ), "d", "jwhdd" )
    , ( ( 4, 5 ), "m", "mmmkm" )
    , ( ( 1, 7 ), "j", "rprmjbxjj" )
    , ( ( 13, 14 ), "g", "ggggggpqggggqgg" )
    , ( ( 1, 5 ), "l", "llxzlkpptdzg" )
    , ( ( 1, 2 ), "z", "zzzzzzzzzzzzjzzz" )
    , ( ( 3, 4 ), "h", "qhhwtz" )
    , ( ( 2, 5 ), "t", "tptttt" )
    , ( ( 1, 14 ), "c", "cccccccccccccxcccc" )
    , ( ( 8, 9 ), "t", "tgtpttwtqttvt" )
    , ( ( 1, 16 ), "m", "mhmtpmmpmmtmzmmcqj" )
    , ( ( 3, 4 ), "q", "qqvq" )
    , ( ( 10, 11 ), "h", "hxhhhhhhhbhh" )
    , ( ( 5, 6 ), "n", "xlchhnljrlnfrlwzs" )
    , ( ( 1, 9 ), "x", "mxxxxxxxtxxxfxx" )
    , ( ( 2, 7 ), "n", "bbnnrqmnnnnnl" )
    , ( ( 2, 7 ), "p", "rgpqnqp" )
    , ( ( 3, 4 ), "f", "fndf" )
    , ( ( 10, 11 ), "c", "cccccccccqc" )
    , ( ( 3, 10 ), "l", "lpzxlhpslfh" )
    , ( ( 3, 5 ), "k", "kkkkkkk" )
    , ( ( 14, 17 ), "b", "bbbbbbbtbbbbbfbbbb" )
    , ( ( 1, 2 ), "f", "gfff" )
    , ( ( 10, 14 ), "j", "jjjjjjhjjjdjrjc" )
    , ( ( 1, 9 ), "s", "wszsswssspsss" )
    , ( ( 4, 6 ), "k", "dckkkkkk" )
    , ( ( 3, 13 ), "h", "hhvkvhhhhhhdhh" )
    , ( ( 15, 16 ), "g", "ggggggggggggggngg" )
    , ( ( 2, 11 ), "m", "nzdsmbqtmmmmxskcmmv" )
    , ( ( 3, 11 ), "m", "mmmkmhxmwmcmqdlpmf" )
    , ( ( 1, 8 ), "n", "snnnbnwn" )
    , ( ( 1, 13 ), "j", "pjjjjjgjjjjjxjj" )
    , ( ( 3, 18 ), "m", "mmvvmqmlmmmmzcmkwqlw" )
    , ( ( 1, 4 ), "d", "dbdx" )
    , ( ( 12, 15 ), "r", "rrrrrrmrrrrrrrr" )
    , ( ( 4, 18 ), "s", "sssvsssssszsssssscss" )
    , ( ( 2, 5 ), "q", "nqbmmbqds" )
    , ( ( 3, 12 ), "d", "hrdvzzcrbjwdkgddbrpq" )
    , ( ( 2, 3 ), "r", "rsrghkrmdsfm" )
    , ( ( 5, 9 ), "k", "twfwkkkswqkkkkwv" )
    , ( ( 4, 6 ), "p", "tppxpstmxcw" )
    , ( ( 12, 13 ), "k", "kkkktkkkkrkksk" )
    , ( ( 1, 2 ), "m", "lmmm" )
    , ( ( 3, 5 ), "s", "shsss" )
    , ( ( 6, 7 ), "c", "ccccclc" )
    , ( ( 10, 17 ), "s", "ssssshsssssssssshs" )
    , ( ( 6, 15 ), "n", "nnnxnrtfnnnnnnnnn" )
    , ( ( 3, 18 ), "s", "jsfcdsscssmnsgssnj" )
    , ( ( 7, 8 ), "x", "xxcxxxxr" )
    , ( ( 3, 5 ), "l", "lvlllll" )
    , ( ( 11, 12 ), "h", "hmhhhhhhhcxjhhfdh" )
    , ( ( 3, 4 ), "d", "wdfdd" )
    , ( ( 3, 4 ), "r", "qrvr" )
    , ( ( 10, 18 ), "j", "mvwlxblnhjddlzkhqjfj" )
    , ( ( 6, 20 ), "b", "bhbbbbbbbbbtbbkbbbbc" )
    , ( ( 8, 9 ), "c", "cclccmnrr" )
    , ( ( 3, 6 ), "w", "wwwwwww" )
    , ( ( 5, 9 ), "k", "dlgkjnqxk" )
    , ( ( 12, 18 ), "f", "fqfffbfffffcfffhfkf" )
    , ( ( 1, 3 ), "w", "fwwgjsclwpw" )
    , ( ( 6, 7 ), "z", "zwzzzzl" )
    , ( ( 14, 16 ), "r", "jrrrrrrrrrrrrfrrrr" )
    , ( ( 11, 14 ), "b", "bbbbbbbbbbbbbw" )
    , ( ( 9, 11 ), "h", "hhhzhhhfxhhhh" )
    , ( ( 3, 4 ), "p", "pplnp" )
    , ( ( 2, 3 ), "f", "ffff" )
    , ( ( 5, 8 ), "p", "lppppppsppppppp" )
    , ( ( 17, 18 ), "w", "wwwwwwwwwwwwwwwwzcww" )
    , ( ( 11, 13 ), "n", "nnnnnnnqnnnnfn" )
    , ( ( 7, 12 ), "f", "fxmfpdfjrffjgtffzlfg" )
    , ( ( 4, 16 ), "w", "bctwmwtxvwqzrwwwwhw" )
    , ( ( 2, 7 ), "m", "gmmmmmjmmmm" )
    , ( ( 1, 15 ), "q", "tqqqqqqqqqqqqqqq" )
    , ( ( 3, 4 ), "q", "gqwq" )
    , ( ( 3, 12 ), "s", "ssssssssssrhpsg" )
    , ( ( 6, 8 ), "m", "mrmlmhcrsm" )
    , ( ( 4, 9 ), "q", "gdbffcqbqt" )
    , ( ( 1, 17 ), "k", "kkkkkkkkkkkkkkkkkmk" )
    , ( ( 15, 16 ), "h", "hghhhhhhhhhhhhrhh" )
    , ( ( 4, 5 ), "p", "pkpzmb" )
    , ( ( 2, 18 ), "h", "khvkdpbxdptllfdxvhh" )
    , ( ( 18, 20 ), "z", "zzczzzzzzzzzzzzzzpzs" )
    , ( ( 1, 11 ), "p", "ppppppcpzppppppppp" )
    , ( ( 4, 9 ), "z", "ztpfrjzwnv" )
    , ( ( 6, 11 ), "x", "snxxtstcqhv" )
    , ( ( 3, 5 ), "c", "nrlcccbcpsvcc" )
    , ( ( 2, 7 ), "z", "dztxzzqmfzrpz" )
    , ( ( 5, 14 ), "w", "pbcjnqpwwlccfscz" )
    , ( ( 1, 5 ), "f", "rfndsxdmhbgf" )
    , ( ( 8, 14 ), "t", "ttttpdfwtxfttd" )
    , ( ( 2, 11 ), "l", "lndmmrnxdmdpdmlzll" )
    , ( ( 3, 4 ), "h", "chzl" )
    , ( ( 10, 17 ), "d", "ngkkdbvflmcssmgmdk" )
    , ( ( 4, 7 ), "d", "bhksdtd" )
    , ( ( 2, 6 ), "k", "ktkdkzwsgkhkk" )
    , ( ( 1, 4 ), "r", "hrrs" )
    , ( ( 15, 19 ), "j", "ndnvjfjljnwklsmdbjj" )
    , ( ( 5, 12 ), "v", "vhvvvrvgvvqgwvvbfv" )
    , ( ( 2, 3 ), "r", "rfkkhrrhqhks" )
    , ( ( 13, 17 ), "q", "qqmlqqqqqmqqvqqqcqq" )
    , ( ( 4, 15 ), "z", "zvbkvbzczkrttcz" )
    , ( ( 4, 8 ), "s", "ssssssss" )
    , ( ( 13, 14 ), "x", "xmxxrxxxgxxxmb" )
    , ( ( 7, 10 ), "s", "sfjzslwsqsss" )
    , ( ( 4, 13 ), "c", "clccncccccccpc" )
    , ( ( 2, 4 ), "l", "lddlpplrqqs" )
    , ( ( 12, 13 ), "j", "jjjvjjhjjjjmjjjjj" )
    , ( ( 6, 9 ), "n", "lnnznnpnclnnn" )
    , ( ( 6, 10 ), "g", "gggggggwgjgg" )
    , ( ( 4, 6 ), "l", "tjhqmr" )
    , ( ( 2, 4 ), "d", "hddxjdvj" )
    , ( ( 5, 13 ), "t", "tzftwttwttjttt" )
    , ( ( 1, 9 ), "j", "jnjjjkjftjjfmjhjkj" )
    , ( ( 8, 9 ), "q", "qqqsqqqjj" )
    , ( ( 15, 19 ), "l", "lllllbtdlsllllllxlfl" )
    , ( ( 5, 6 ), "g", "gkgkrsgg" )
    , ( ( 2, 4 ), "t", "tttb" )
    , ( ( 12, 15 ), "p", "jpppppspgpppppkxb" )
    , ( ( 10, 13 ), "n", "nznprnnhnmgxhxnknnnn" )
    , ( ( 12, 13 ), "d", "dddsdddddddsd" )
    , ( ( 5, 15 ), "q", "qqqqkqqqmqfzqqqw" )
    , ( ( 5, 9 ), "s", "nmgslvgdz" )
    , ( ( 1, 4 ), "d", "gddkddd" )
    , ( ( 12, 16 ), "v", "zvdsdsgjrtjvzsjtx" )
    , ( ( 11, 14 ), "q", "pqdgjqqqqgqqjwlqqqmq" )
    , ( ( 2, 7 ), "p", "pkpqsppqgz" )
    , ( ( 6, 10 ), "b", "bzdbbbbbbvbbbx" )
    , ( ( 14, 15 ), "v", "vvvvqvvvcvvvvvvv" )
    , ( ( 4, 5 ), "w", "wjwwwhjwg" )
    , ( ( 5, 10 ), "x", "wgthfxtdpxx" )
    , ( ( 6, 7 ), "c", "ccqcfcbcccbml" )
    , ( ( 6, 7 ), "w", "rwwwwxb" )
    , ( ( 4, 5 ), "n", "jnnnngvljjmnr" )
    , ( ( 3, 11 ), "m", "lbmmmmmmmmtxgxmmzm" )
    , ( ( 1, 2 ), "b", "bbbvjcbbb" )
    , ( ( 6, 9 ), "b", "tbwbbcbbbb" )
    , ( ( 11, 13 ), "d", "sdkwqrjdddbdd" )
    , ( ( 9, 15 ), "t", "ttttpqttjttttsjt" )
    , ( ( 5, 7 ), "j", "jjjjjjzj" )
    , ( ( 12, 13 ), "v", "vvjvmvvqvfzvcvvvvvv" )
    , ( ( 6, 7 ), "d", "ddlddrd" )
    , ( ( 5, 6 ), "j", "jjjjwj" )
    , ( ( 5, 6 ), "f", "fffffp" )
    , ( ( 6, 7 ), "w", "zwmwdwww" )
    , ( ( 1, 4 ), "d", "jddddppdktdgh" )
    , ( ( 4, 14 ), "n", "nnnnncnnnnnnnnrn" )
    , ( ( 14, 17 ), "c", "ccccccsdccccccccn" )
    , ( ( 3, 4 ), "z", "zzzgqz" )
    , ( ( 5, 17 ), "m", "mmrsmmnzqlnbmmlljwpm" )
    , ( ( 3, 5 ), "j", "cgvjh" )
    , ( ( 12, 13 ), "w", "wtgblrdchjjkfhg" )
    , ( ( 4, 7 ), "t", "rgclgtt" )
    , ( ( 1, 3 ), "k", "wckhkkkjkk" )
    , ( ( 6, 11 ), "n", "nnnnnnnnnnvn" )
    , ( ( 17, 18 ), "k", "kktkkkknczkkkkhkkk" )
    , ( ( 1, 6 ), "x", "rwxqgxrxxxmsmkrx" )
    , ( ( 17, 18 ), "g", "ggggggggggggggqgjp" )
    , ( ( 14, 17 ), "w", "wwwwwwwwwwwwwnwww" )
    , ( ( 11, 12 ), "w", "vcbmkbwnwbwww" )
    , ( ( 15, 16 ), "g", "gggggggggghjgwgggjvg" )
    , ( ( 5, 9 ), "n", "nnnnwnnnfnnnnnnsnnnn" )
    , ( ( 3, 4 ), "k", "kkkjhk" )
    , ( ( 5, 8 ), "k", "kkkkmkkkk" )
    , ( ( 9, 13 ), "k", "kkrskkkkkkkqfkknmz" )
    , ( ( 2, 3 ), "j", "jtjcj" )
    , ( ( 7, 8 ), "c", "ccvcrcsxc" )
    , ( ( 5, 9 ), "k", "kkkkgkkkkk" )
    , ( ( 4, 5 ), "h", "hhzsxv" )
    , ( ( 1, 7 ), "d", "lgdbdhdddd" )
    , ( ( 5, 6 ), "j", "dsjjkj" )
    , ( ( 7, 20 ), "x", "xnxwmwkbbbkjbpfwkpgx" )
    , ( ( 11, 12 ), "q", "wmbqtffthfcqgq" )
    , ( ( 7, 16 ), "h", "hhfkhhdhhhhhhhhhhhh" )
    , ( ( 9, 13 ), "b", "bhbfbmbbsgbbfbj" )
    , ( ( 8, 10 ), "w", "xwwmwwwgfwwzpwnw" )
    , ( ( 7, 11 ), "m", "bmrmbwmmmmmmmm" )
    , ( ( 8, 9 ), "d", "lshdfglpdq" )
    , ( ( 11, 13 ), "w", "vxwwwwxckwwkww" )
    , ( ( 8, 13 ), "x", "xxzxgtpxxlxxx" )
    , ( ( 8, 13 ), "z", "jrsfgvzzzwrdxz" )
    , ( ( 10, 11 ), "q", "qqqqqlqqqqq" )
    , ( ( 2, 7 ), "m", "knxnmxm" )
    , ( ( 2, 4 ), "n", "znnhnnnnnnn" )
    , ( ( 4, 6 ), "k", "kmxgkkk" )
    , ( ( 10, 18 ), "z", "qhhzhzbldchlmwdzfrsz" )
    , ( ( 3, 4 ), "n", "nnnt" )
    , ( ( 11, 15 ), "v", "vvvvvvvvvvwvwvf" )
    , ( ( 4, 9 ), "x", "dxjxnmghvrxbnzgxljc" )
    , ( ( 1, 2 ), "m", "mmgm" )
    , ( ( 18, 19 ), "z", "zzzzczzzzczzzzzzzjsz" )
    , ( ( 6, 20 ), "p", "pkhzdzpppfbphphpxppp" )
    , ( ( 3, 9 ), "h", "zxhqqkkqknkfvq" )
    , ( ( 5, 8 ), "l", "lllltlll" )
    , ( ( 8, 10 ), "z", "zdzzzzmszz" )
    , ( ( 10, 17 ), "l", "txhgwzsrjlvlvglxl" )
    , ( ( 1, 12 ), "s", "bvgswssssmssvssssssb" )
    , ( ( 3, 6 ), "j", "xjjbjt" )
    , ( ( 3, 5 ), "x", "xxlxq" )
    , ( ( 5, 15 ), "r", "htprxzjstgzpddrtjrr" )
    , ( ( 1, 10 ), "x", "xzftsqxxpgzdlcth" )
    , ( ( 6, 9 ), "w", "wbdwwpbwwwwcrx" )
    , ( ( 4, 11 ), "n", "nnknnhnnnnk" )
    , ( ( 8, 11 ), "f", "ffffffpsfffff" )
    , ( ( 6, 9 ), "h", "hhhnhhqhhhnhvv" )
    , ( ( 6, 9 ), "x", "gqxzhlpnxlcrwnxxp" )
    , ( ( 5, 7 ), "k", "kkkkjkkk" )
    , ( ( 5, 7 ), "x", "xxdxxsqcx" )
    , ( ( 6, 7 ), "j", "jfjljjfp" )
    , ( ( 7, 8 ), "l", "clsldvlc" )
    , ( ( 5, 10 ), "h", "qhqmchbzhlfhc" )
    , ( ( 5, 9 ), "m", "mpdnhsmmb" )
    , ( ( 2, 4 ), "k", "jvmkjrkhkctwlrq" )
    , ( ( 2, 3 ), "s", "ssgstssds" )
    , ( ( 8, 9 ), "t", "tvttttttht" )
    , ( ( 5, 6 ), "n", "nnnpnpn" )
    , ( ( 8, 9 ), "x", "xxxxqxxxsp" )
    , ( ( 6, 7 ), "z", "zzzzzzl" )
    , ( ( 4, 5 ), "f", "fffpkffq" )
    , ( ( 1, 12 ), "b", "bsfbclbxbkbbmbmb" )
    , ( ( 14, 15 ), "b", "rcnwnhbdfbhtblvb" )
    , ( ( 7, 9 ), "j", "jjjjjjjjx" )
    , ( ( 2, 3 ), "x", "xxxx" )
    , ( ( 13, 14 ), "z", "zqzzzzzdztzzzmzz" )
    , ( ( 2, 6 ), "r", "rmlbjrrbrc" )
    , ( ( 2, 3 ), "m", "mwmm" )
    , ( ( 9, 10 ), "d", "ddddddjddz" )
    , ( ( 15, 18 ), "p", "pppppppzppppppzppj" )
    , ( ( 3, 6 ), "g", "glfgdgfgbgdkg" )
    , ( ( 1, 3 ), "s", "sdsblxzscp" )
    , ( ( 5, 6 ), "v", "vvvvsv" )
    , ( ( 1, 3 ), "d", "vdxdkd" )
    , ( ( 6, 8 ), "w", "wkzwcwvwwwqwd" )
    , ( ( 9, 10 ), "h", "hhhhhhhhwh" )
    , ( ( 9, 12 ), "b", "bdbbbbbwbbmbbbb" )
    , ( ( 2, 8 ), "b", "bbbbbbbcb" )
    , ( ( 2, 9 ), "v", "nvtgsfvpv" )
    , ( ( 11, 13 ), "v", "hvvgvvvvvvbvphlhnv" )
    , ( ( 6, 7 ), "r", "rrrrprr" )
    , ( ( 10, 16 ), "w", "wlxptrzwmwxhspcww" )
    , ( ( 5, 7 ), "f", "ffpfshf" )
    , ( ( 3, 6 ), "t", "rnttvx" )
    , ( ( 8, 16 ), "b", "pvlbtnfbvspdhtkk" )
    , ( ( 1, 4 ), "v", "vlvd" )
    , ( ( 4, 17 ), "l", "qflfllkllplllllkl" )
    , ( ( 1, 3 ), "s", "psswjplkhvxssftnpl" )
    , ( ( 6, 11 ), "t", "tthmbtwkfct" )
    , ( ( 11, 17 ), "w", "wwwwjwdtwcnwwwxkx" )
    , ( ( 9, 11 ), "s", "sssssssslsss" )
    , ( ( 8, 10 ), "n", "nnnnnpnwnnnvw" )
    , ( ( 12, 13 ), "m", "mmmmmmmmmmmnpmm" )
    , ( ( 14, 17 ), "w", "xbswvmsflkmqlpkxwm" )
    , ( ( 1, 3 ), "w", "mzww" )
    , ( ( 5, 6 ), "g", "ggggdw" )
    , ( ( 1, 15 ), "r", "rslcrjzhrjdpwqm" )
    , ( ( 7, 12 ), "g", "ggdgfggdzlxfkg" )
    , ( ( 2, 11 ), "x", "cpsxxkxxqhsxdxxjkgbt" )
    , ( ( 7, 8 ), "w", "wdvhwwwp" )
    , ( ( 1, 4 ), "z", "zmfzllxnrnlw" )
    , ( ( 9, 10 ), "b", "rkbbbbksbpdsbcm" )
    , ( ( 1, 8 ), "h", "sqdmcjpw" )
    , ( ( 2, 6 ), "x", "pxxvrx" )
    , ( ( 5, 6 ), "x", "xjshxxqt" )
    , ( ( 1, 13 ), "b", "fbbbbbbbbbbbbbb" )
    , ( ( 11, 13 ), "t", "bwhtttdvtbtkw" )
    , ( ( 2, 6 ), "j", "rjrggj" )
    , ( ( 5, 6 ), "v", "fvvvwvtv" )
    , ( ( 10, 15 ), "s", "ssdsstswssssssc" )
    , ( ( 2, 6 ), "h", "hnqzhlclp" )
    , ( ( 8, 12 ), "t", "pjztttrjtvttt" )
    , ( ( 5, 6 ), "g", "gwxrggtmg" )
    , ( ( 1, 8 ), "z", "kzzzzzzvz" )
    , ( ( 10, 15 ), "p", "pppppppppvpppppp" )
    , ( ( 3, 4 ), "g", "ngxdgg" )
    , ( ( 2, 5 ), "x", "xcxxnbwh" )
    , ( ( 3, 10 ), "s", "sgkghshxdssws" )
    , ( ( 1, 2 ), "s", "pssldmf" )
    , ( ( 2, 5 ), "m", "jmxmm" )
    , ( ( 5, 6 ), "n", "pnsjqnnn" )
    , ( ( 13, 17 ), "t", "ttxslvttlnttrdwtt" )
    , ( ( 1, 6 ), "n", "nnpnsn" )
    , ( ( 3, 20 ), "m", "mmmmmwjmmmmmtmmvmmmm" )
    , ( ( 15, 17 ), "s", "ssszsslsssszssssss" )
    , ( ( 5, 8 ), "s", "hsgzspsk" )
    , ( ( 7, 8 ), "c", "ccccccchc" )
    , ( ( 14, 17 ), "l", "llllllllllllllllk" )
    , ( ( 7, 14 ), "p", "xjbxdpkbgcpbfpptfx" )
    , ( ( 5, 6 ), "s", "sghmss" )
    , ( ( 4, 6 ), "s", "ssssss" )
    , ( ( 1, 2 ), "c", "kcwpwc" )
    , ( ( 5, 6 ), "m", "mmmqtmt" )
    , ( ( 1, 9 ), "l", "glllllllslllll" )
    , ( ( 3, 4 ), "r", "rrcr" )
    , ( ( 6, 9 ), "r", "rpcbrrrrdvrrwf" )
    , ( ( 3, 7 ), "l", "wglsfjtwlldg" )
    , ( ( 6, 9 ), "g", "gggbgggxw" )
    , ( ( 9, 10 ), "j", "jjjjjjjjrjjjjjjjjjj" )
    , ( ( 4, 14 ), "p", "vbppfpncsmhctp" )
    , ( ( 10, 13 ), "k", "kkkkkkkkkkkkkkkkk" )
    , ( ( 3, 5 ), "p", "dnlpp" )
    , ( ( 11, 15 ), "f", "fsffzftkfqflnflf" )
    , ( ( 9, 11 ), "q", "bqdqcqqqqgffqfqmrqlq" )
    , ( ( 1, 10 ), "l", "lszxlhdkgtprglxxl" )
    , ( ( 16, 18 ), "l", "sllllllmlllllllllwl" )
    , ( ( 4, 7 ), "b", "brblbbbtbj" )
    , ( ( 3, 6 ), "n", "rhnntq" )
    , ( ( 7, 9 ), "k", "kjnkjpbkkkkvkjm" )
    , ( ( 11, 12 ), "g", "kvjpqmhcgbrl" )
    , ( ( 3, 12 ), "h", "khhhvhhmchhgfh" )
    , ( ( 3, 4 ), "r", "xmpr" )
    , ( ( 3, 7 ), "m", "mmlmmmmhm" )
    , ( ( 7, 16 ), "m", "mmmlmmlmmmmmmmmmmm" )
    , ( ( 3, 4 ), "b", "sdbbbr" )
    , ( ( 14, 19 ), "k", "hkkkkkjclkgmzvgkkkk" )
    , ( ( 12, 14 ), "w", "ssqgwwcxcqwwww" )
    , ( ( 2, 3 ), "k", "lkkr" )
    , ( ( 1, 7 ), "t", "wtttttlt" )
    , ( ( 4, 8 ), "d", "wdjnqgdf" )
    , ( ( 8, 9 ), "j", "jjsjwjjlj" )
    , ( ( 4, 7 ), "h", "hnhphxhhhq" )
    , ( ( 2, 5 ), "d", "qdjgqdb" )
    , ( ( 3, 5 ), "w", "wpwzwdm" )
    , ( ( 3, 12 ), "n", "pnnngxnjqjhpcntfrvz" )
    , ( ( 10, 15 ), "h", "hhhhhvhhhhhhhhg" )
    , ( ( 4, 6 ), "s", "dwrsksjhtsrjdvmbsbwr" )
    , ( ( 8, 11 ), "v", "vvvvvvvcvvvvvv" )
    , ( ( 4, 5 ), "m", "lnmlmmwsmfsm" )
    , ( ( 7, 16 ), "c", "kvzcrcbcvkcpptdccq" )
    , ( ( 2, 3 ), "b", "bnbbpjp" )
    , ( ( 3, 5 ), "m", "hpjkrmmlwq" )
    , ( ( 3, 7 ), "v", "vvvnlhn" )
    , ( ( 3, 4 ), "b", "bnbbb" )
    , ( ( 3, 6 ), "d", "tkdktrctmjw" )
    , ( ( 3, 5 ), "f", "pffffj" )
    , ( ( 6, 10 ), "t", "ltrgjvjthtpttphrttk" )
    , ( ( 3, 8 ), "s", "ssrkstfgssxxxc" )
    , ( ( 1, 2 ), "d", "sdhkcfdcdg" )
    , ( ( 6, 12 ), "h", "shhhhhzzzhfh" )
    , ( ( 4, 7 ), "j", "jjkzgrj" )
    , ( ( 13, 15 ), "l", "llltlwlllllqzlbldl" )
    , ( ( 5, 9 ), "d", "dzxjdrftsprbldvddk" )
    , ( ( 4, 14 ), "q", "wqsqqxtbfnckzqcqqqq" )
    , ( ( 1, 2 ), "v", "lvdxdwpphqv" )
    , ( ( 5, 6 ), "z", "zpzhzjzqtzh" )
    , ( ( 3, 4 ), "q", "qqqlq" )
    , ( ( 9, 10 ), "v", "svvvhvvvtv" )
    , ( ( 3, 12 ), "g", "kjgmbzgklwfb" )
    , ( ( 10, 15 ), "v", "vvddvvvrhvvmvwvvv" )
    , ( ( 1, 20 ), "j", "kjjjjjjjjkjjpjjjjjjj" )
    , ( ( 6, 8 ), "t", "tttttdtt" )
    , ( ( 11, 12 ), "v", "vvvvvqvvqvxvvv" )
    , ( ( 12, 13 ), "h", "hnhshhhhshhhh" )
    , ( ( 7, 8 ), "z", "vzzzzzrzzzfpz" )
    , ( ( 7, 8 ), "x", "xkxhxxhn" )
    , ( ( 4, 7 ), "b", "hbbzptb" )
    , ( ( 5, 9 ), "d", "fddqjsdbj" )
    , ( ( 3, 10 ), "l", "llllllglxslll" )
    , ( ( 1, 9 ), "b", "dbsbbbbgbb" )
    , ( ( 5, 8 ), "n", "dtnnsnnnn" )
    , ( ( 7, 16 ), "m", "mmmmmmmmmmmmmmmsm" )
    , ( ( 3, 4 ), "f", "nhwk" )
    , ( ( 15, 17 ), "w", "wwfwwxwmwwwwwdswwwww" )
    , ( ( 1, 11 ), "l", "llllllllllll" )
    , ( ( 4, 9 ), "c", "cccccccchcc" )
    , ( ( 2, 3 ), "k", "kkkkbskk" )
    , ( ( 3, 6 ), "s", "nssqtf" )
    , ( ( 4, 5 ), "m", "mmrhm" )
    , ( ( 9, 11 ), "f", "nfnsrfdfnfff" )
    , ( ( 15, 16 ), "k", "kkkkkkkkkkkkkkzhk" )
    , ( ( 6, 9 ), "q", "tzqqxqhnq" )
    , ( ( 3, 11 ), "k", "kkkkkkkkkkck" )
    , ( ( 2, 5 ), "p", "wmpgpmjmrqg" )
    , ( ( 15, 19 ), "r", "rrrrrsrrrrrrhfrrjrr" )
    , ( ( 4, 10 ), "l", "lllsldllll" )
    , ( ( 4, 7 ), "s", "sjhzqns" )
    , ( ( 1, 3 ), "n", "nnknnp" )
    , ( ( 13, 14 ), "j", "hjjgxjzjvjpxjj" )
    , ( ( 4, 5 ), "r", "rrrgrrrrr" )
    , ( ( 10, 11 ), "p", "ppptphpxkpppp" )
    , ( ( 2, 7 ), "j", "fjsnxwpjgqnzjjj" )
    , ( ( 6, 8 ), "k", "kdkkwnvkkkk" )
    , ( ( 2, 5 ), "q", "qdqqjqqwq" )
    , ( ( 5, 7 ), "x", "xdxddbcxvnxxxxhxxxq" )
    , ( ( 2, 6 ), "n", "cnqlmrlwqhdbbvbnhskh" )
    , ( ( 7, 8 ), "z", "zzzzzzzwz" )
    , ( ( 6, 8 ), "r", "llrrtzrpr" )
    , ( ( 1, 7 ), "d", "ddlddvmkddjpd" )
    , ( ( 8, 9 ), "v", "vvvvvvvrkv" )
    , ( ( 18, 19 ), "t", "vtststttfmtqtmttdnz" )
    , ( ( 3, 9 ), "b", "nbwbzntrb" )
    , ( ( 3, 4 ), "r", "pzrrqqrj" )
    , ( ( 5, 9 ), "x", "bvxxllwcf" )
    , ( ( 4, 6 ), "f", "fxmlxf" )
    , ( ( 11, 15 ), "n", "nnqnwnnnwnknnnnnfnn" )
    , ( ( 9, 11 ), "n", "nnnnqnnnnnj" )
    , ( ( 7, 12 ), "k", "kkkkkvjkkksskrkkk" )
    , ( ( 2, 3 ), "b", "cbbvbv" )
    , ( ( 3, 6 ), "x", "xxfldxxxc" )
    , ( ( 6, 11 ), "k", "fkvvkkwkvkpjkjk" )
    , ( ( 10, 16 ), "f", "ffffffmffffffffffff" )
    , ( ( 7, 8 ), "p", "fppplpnc" )
    , ( ( 11, 20 ), "r", "srrrfrrrrrrrrhrrbrrr" )
    , ( ( 13, 17 ), "s", "smssssssssssssssb" )
    , ( ( 5, 8 ), "q", "fcqlqqqq" )
    , ( ( 6, 10 ), "g", "rmpsgrlxcvgtggwgvk" )
    , ( ( 13, 15 ), "h", "hhhhhhhhhcmfhhldhzh" )
    , ( ( 5, 10 ), "q", "qqqqjqqqqqcq" )
    , ( ( 5, 9 ), "m", "lmvcmmsznmmgmmmcs" )
    , ( ( 5, 6 ), "h", "hhhbzr" )
    , ( ( 3, 4 ), "d", "dzdg" )
    , ( ( 11, 14 ), "h", "rfvjnjbzvrhthdxhv" )
    , ( ( 14, 19 ), "g", "ggggggggggggggggggcg" )
    , ( ( 6, 7 ), "m", "mmmmmphg" )
    , ( ( 13, 14 ), "p", "ftzfrppkzrrpgp" )
    , ( ( 12, 16 ), "n", "lxnnnnnngnnbnncnn" )
    , ( ( 8, 9 ), "c", "dqgzbncfccrjtdkc" )
    , ( ( 6, 9 ), "r", "jdrrfrtkmkfltkm" )
    , ( ( 4, 6 ), "g", "dnggrr" )
    , ( ( 3, 4 ), "s", "ssssvs" )
    , ( ( 18, 19 ), "f", "wffffffffsffffffffvf" )
    , ( ( 6, 10 ), "l", "klllbxltll" )
    , ( ( 6, 7 ), "r", "rbdgrrr" )
    , ( ( 17, 18 ), "l", "vjplzpcftlkrllsbqlqg" )
    , ( ( 3, 9 ), "n", "bqnnnnrbxkdsdwnvtwwh" )
    , ( ( 1, 2 ), "w", "qwwt" )
    , ( ( 5, 18 ), "z", "zzzzzzzzzzzzzzzzzlz" )
    , ( ( 2, 7 ), "n", "nbnnnnnnn" )
    , ( ( 14, 15 ), "g", "mcdcmxpxmgkqdhm" )
    , ( ( 18, 19 ), "s", "gsssssssssswssssssss" )
    , ( ( 5, 6 ), "s", "tptssvs" )
    , ( ( 8, 12 ), "c", "cccnbcccmcctclccccx" )
    , ( ( 6, 15 ), "t", "tttttttttmttstf" )
    , ( ( 5, 6 ), "l", "lllklq" )
    , ( ( 7, 9 ), "d", "dqdcdcddxcddmdkrd" )
    , ( ( 4, 5 ), "r", "rrvrxqnzrm" )
    , ( ( 9, 11 ), "p", "pjpppppppppppppp" )
    , ( ( 4, 6 ), "v", "vpvvvvv" )
    , ( ( 6, 9 ), "h", "wwchhhgfh" )
    , ( ( 10, 11 ), "f", "flfcjvtljftfffhff" )
    , ( ( 6, 7 ), "v", "vvvvvvvv" )
    , ( ( 12, 15 ), "k", "kjkkkktkkkkkzvn" )
    , ( ( 6, 9 ), "v", "rsrvvgnwktwvvnvclvvc" )
    , ( ( 2, 12 ), "c", "ccvqsctcwkmkqzc" )
    , ( ( 16, 18 ), "w", "wwwwwwwwwwwwwwwwwwww" )
    , ( ( 17, 18 ), "g", "ggzgggggggglggggsgg" )
    , ( ( 13, 18 ), "v", "vvvvvnvvvgrvvkvtqv" )
    , ( ( 5, 11 ), "k", "kkkkkkkkkkkkkkk" )
    , ( ( 11, 12 ), "f", "ffffffffffvf" )
    , ( ( 1, 7 ), "h", "rstpvhh" )
    , ( ( 11, 14 ), "l", "lrnllwvlnflllfdfllt" )
    , ( ( 5, 7 ), "g", "gcgjgrkgj" )
    , ( ( 7, 18 ), "z", "zzzzzzgzztzzzzzzzxzz" )
    , ( ( 17, 18 ), "v", "vvvvvvvvvvvvmvvvvvvv" )
    , ( ( 16, 18 ), "m", "mmmmhmmmmmtmmmmvmx" )
    , ( ( 1, 3 ), "z", "vzzzwz" )
    , ( ( 5, 6 ), "n", "nnnhnq" )
    , ( ( 8, 15 ), "r", "jsrprrrrmrrkgrkrr" )
    , ( ( 2, 12 ), "g", "txwxcgwfqkfg" )
    , ( ( 9, 15 ), "l", "ldlllllllllllll" )
    , ( ( 3, 5 ), "f", "gfbsf" )
    , ( ( 15, 16 ), "v", "vvhrnzxfvvvvcwjv" )
    , ( ( 4, 15 ), "c", "cccmccccccccccccccc" )
    , ( ( 7, 13 ), "l", "bwlzlxzllctjcf" )
    , ( ( 1, 3 ), "q", "rsgtq" )
    , ( ( 4, 9 ), "n", "npznnnvvnzg" )
    , ( ( 3, 7 ), "z", "sqtczzfzzrzfz" )
    , ( ( 2, 3 ), "k", "ckkrjnkglnz" )
    , ( ( 9, 10 ), "q", "qqqqqqwqjqqfq" )
    , ( ( 4, 11 ), "v", "vvvbvvvvvvnvvd" )
    , ( ( 5, 7 ), "n", "lbwxnnnncnnwnv" )
    , ( ( 8, 9 ), "k", "kgkkkkkjf" )
    , ( ( 7, 9 ), "l", "llllllllll" )
    , ( ( 15, 19 ), "p", "pppbpcppxcptppvmpppb" )
    , ( ( 3, 4 ), "m", "fqmwcncsmp" )
    ]


data1 : List number
data1 =
    [ 1227
    , 1065
    , 329
    , 1063
    , 1889
    , 1700
    , 1805
    , 1373
    , 389
    , 1263
    , 1276
    , 1136
    , 1652
    , 1981
    , 1406
    , 1249
    , 1197
    , 1379
    , 1050
    , 1791
    , 1703
    , 2001
    , 1842
    , 1707
    , 1486
    , 1204
    , 1821
    , 1807
    , 1712
    , 1871
    , 1599
    , 1390
    , 1219
    , 1612
    , 1980
    , 1857
    , 1511
    , 1702
    , 1455
    , 1303
    , 1052
    , 1754
    , 1545
    , 1488
    , 1848
    , 1236
    , 1549
    , 1887
    , 1970
    , 1123
    , 1686
    , 1404
    , 1688
    , 1106
    , 1296
    , 401
    , 1829
    , 1693
    , 1389
    , 1957
    , 914
    , 1176
    , 1348
    , 1275
    , 1624
    , 1401
    , 1045
    , 1396
    , 1352
    , 1569
    , 1060
    , 1235
    , 1679
    , 1503
    , 1340
    , 1872
    , 1410
    , 1077
    , 958
    , 1681
    , 1189
    , 1466
    , 1087
    , 1852
    , 1293
    , 1139
    , 1300
    , 1323
    , 661
    , 1388
    , 1983
    , 1325
    , 1112
    , 1774
    , 1858
    , 1785
    , 1616
    , 1255
    , 1198
    , 1354
    , 1124
    , 1834
    , 1417
    , 1918
    , 1496
    , 33
    , 1150
    , 1861
    , 1172
    , 2006
    , 1199
    , 1558
    , 1919
    , 1620
    , 1613
    , 1710
    , 1477
    , 1592
    , 1709
    , 1909
    , 1670
    , 1922
    , 1840
    , 1768
    , 1982
    , 1193
    , 1736
    , 1877
    , 1770
    , 1191
    , 1433
    , 1072
    , 1148
    , 1225
    , 1147
    , 1171
    , 1424
    , 1913
    , 1228
    , 1339
    , 1814
    , 1504
    , 1251
    , 1240
    , 1272
    , 1500
    , 1927
    , 1428
    , 1641
    , 1453
    , 1729
    , 1976
    , 1808
    , 1180
    , 1024
    , 1108
    , 1085
    , 1669
    , 1636
    , 1005
    , 1520
    , 1929
    , 1626
    , 1551
    , 1234
    , 1988
    , 1256
    , 1524
    , 1571
    , 1506
    , 1977
    , 1749
    , 1408
    , 1540
    , 1934
    , 1810
    , 1328
    , 1910
    , 1478
    , 1600
    , 1699
    , 1413
    , 1446
    , 1798
    , 1013
    , 1998
    , 1661
    , 1058
    , 1051
    , 1220
    , 1447
    , 1675
    , 1912
    , 1668
    , 1932
    , 1962
    , 1055
    , 1757
    , 1116
    , 1090
    ]
