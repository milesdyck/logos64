1 rem - cre82023words, a basic program to create a relative file containing
2 rem - 366 words for logos64; written by Miles Dyck, November 2022
7900 rem - prior to running the program, the 2023words.rel file can be
7901 rem - created using live basic with the following commands:
7902 rem - open15,8,15
7903 rem - open2,8,2,"2023words,l,"+chrs$(6)
7904 rem - print#15,"p"+chr$(96+2)+chr$(110)+chr$(1)+chr$(1)
7905 rem - print#2,"leach";
7906 rem - close2
7907 rem - close15
7908 rem - ignore the blinking disk drive light
7909 rem - each record in the words.rel file is 6 characters, 5 letters
7910 rem - plus a carriage return [chr$(13)] 
7911 rem - a helpful tutorial on relative files can be found here:
7912 rem - https://www.atarimagazines.com/compute/issue40/relative-files.php 
8000 open3,8,4,"2023words"
8010 open15,8,15
8012 rem - r1% is the high index for the record and r2% is the low index
8014 rem - r1% ranges between 0 & 255; r2% ranges between 0 & 22
8015 r1%=0
8020 fork=1to366
8022 readn$
8025 r2%=int(k/256):r1%=r1%+1
8027 ifr1%=256thenr1%=0
8030 print#15,"p"+chr$(100)+chr$(r1%)+chr$(r2%)+chr$(1)
8032 rem - k is the record number, r1% and r2% the high/low indices and
8034 rem - n$ the word read from the data list below
8035 print k,r1%,r2%,n$
8040 print#3,n$;
8070 nextk
8080 close3
8100 close15:end
10000 data mucus,favor,sully,wails,squid,vexes
10010 data unlit,ducts,boner,hexer,sushi,retch
10020 data nanny,atone,clink,oboes,mourn,carer
10030 data super,shark,volts,whims,wrong,visor
10040 data bossa,truss,alkyl,limbs,pivot,erode
10050 data leech,dolls,olive,levis,shoer,their
10060 data plans,bound,alloy,toyed,grogs,frats
10070 data koine,nards,brass,brisk,ratty,fleet
10080 data barge,nerts,deque,nomad,deans,shoos
10090 data spire,zayin,exeat,hived,fondu,muted
10100 data muley,nines,socks,futon,jumpy,rills
10110 data doled,think,weans,wired,smack,tumor
10120 data grasp,trend,gazer,inner,llama,kinks
10130 data anode,order,delft,reins,weest,rover
10140 data delay,dross,barks,deems,facer,flute
10150 data shake,dozer,saucy,taxol,moult,dilly
10160 data whiny,rainy,tress,maybe,stops,hurls
10170 data lifts,smoke,cants,cages,myths,toque
10180 data baker,quads,maids,reels,oasis,shown
10190 data mails,mimed,sable,moats,vaunt,musty
10200 data twins,tells,skoal,lasso,washy,fares
10210 data gilts,gists,veers,pries,raced,wonks
10220 data gazes,array,nasal,caves,squat,trite
10230 data bhoys,duchy,slogs,scops,giber,ingot
10240 data cramp,harks,aside,coats,humps,three
10250 data waive,adios,judge,monte,grave,hanks
10260 data primp,plunk,waken,bloat,staph,birch
10270 data opine,sprog,knish,cowls,mothy,soaps
10280 data spier,smell,parks,refly,waspy,semen
10290 data fixit,stoas,garde,yours,crone,cured
10300 data finch,pooch,shahs,glyph,books,tubes
10310 data outer,boned,fella,honor,tramp,tempo
10320 data wadis,gaped,cycad,riled,dower,hacks
10330 data caret,sally,serge,bosom,softs,roams
10340 data major,fucks,dacha,kaiak,plant,berry
10350 data rosin,curia,inter,ultra,honed,moped
10360 data cozen,bluff,awoke,stock,overt,muffs
10370 data diddy,endue,salon,tales,pages,wiled
10380 data tubal,demur,flics,rowan,ukase,trail
10390 data molas,gunks,treed,salty,calls,scaly
10400 data champ,gummy,wears,ploys,treat,devil
10410 data thanx,sumac,beaux,whine,loots,bigot
10420 data bolas,ftped,franc,melba,punky,stile
10430 data unsay,forge,bring,creme,tommy,sorry
10440 data glees,belay,biddy,eager,brush,argon
10450 data whore,dusks,mango,quash,yolks,lithe
10460 data shush,biked,stand,amaze,crink,wicks
10470 data brims,edger,gonna,boost,spazz,heigh
10480 data plume,mooed,tweet,gives,rimed,pearl
10490 data regal,tasty,below,abuts,stuns,rooky
10500 data mauls,jived,fungi,stats,odium,scram
10510 data befit,elves,wises,forum,hussy,hauls
10520 data cords,blade,mungs,bares,mouth,album
10530 data shrub,foggy,caron,tamer,viper,clefs
10540 data blear,yella,fresh,aglow,buses,queer
10550 data cheek,swept,tides,tufts,vivid,muser
10560 data throb,anded,wreck,weald,barky,foamy
10570 data unfed,snafu,spear,crony,kiwis,going
10580 data rarer,color,hasty,teeth,gleam,girls
10590 data movie,loped,gimel,polka,tunes,pulps
10600 data extol,scabs,boffo,scars,phony,leach
