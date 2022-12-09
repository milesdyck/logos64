5 rem - logos64 by Miles Dyck; November 2022
8 rem - dimensioning arrays and populating the screen keyboard array
10 clr:dimu%(675):dimky%(26):dimq$(4):dimf$(12):dimf%(11):diml$(5):diml1%(26)
20 diml2%(26):diml3%(26):dimg1%(26):dimg2%(26):dimg3%(26):dims1%(5):dimgg$(5)
30 dimgy$(5):dimg$(6)
40 ky%(1)=120:ky%(2)=2100:ky%(3)=1700:ky%(4)=160:ky%(5)=15:ky%(6)=180
50 ky%(7)=200:ky%(8)=220:ky%(9)=25:ky%(10)=240:ky%(11)=260:ky%(12)=280
60 ky%(13)=2500:ky%(14)=2300:ky%(15)=27:ky%(16)=29:ky%(17)=11:ky%(18)=17
70 ky%(19)=140:ky%(20)=19:ky%(21)=23:ky%(22)=1900:ky%(23)=13:ky%(24)=1500
80 ky%(25)=21:ky%(26)=1300
85 rem - welcome screen, choose random or daily, name and date input, check player database
90 poke53280,0:poke53281,0:poke53272,21:ck%=0:r%=0:er%=0:na$="":z%=0
100 print"{147}{white}";spc(7);"welcome to {156}l{31}o{30}g{158}o{28}s{155}64{159} 2023!{white}"
110 print"{19}{17}{17}{29}{29}{29}{29}{29}{white}options:";"{17}{17}{157}{157}{157}{157}{157}{157}{157}{157}1) play the daily game."
120 print"{17}{29}{29}{29}{29}{29}2) play the random game."
130 print"{17}{29}{29}{29}{29}{29}{white}enter 1 or 2: {159}{64}";"{157}";
140 getu$:ifu$=""goto140
150 if(u$<>"1"andu$<>"2")goto140
160 printu$;"{white}"
170 print"{19}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{29}{29}{29}{29}{29}{white}enter your name and hit return:"
180 print"{17}";spc(15);"{159}{64}{157}";
190 getb$:ifb$=""goto190
200 if(z%=0andb$=chr$(20))thenb$="":z%=z%-1:goto190
210 if(z%>0andb$=chr$(20))thenprint"{157} {157}";:b$="":z%=z%-1:na$=left$(na$,len(na$)-1):goto190
220 if(b$=chr$(13)andz>0)goto250
230 if(asc(b$)>31andasc(b$)<91)thenprintb$;:z%=z%+1:nn$=nn$+b$:na$=nn$:goto190
240 iflen(na$)>5thenna$=left$(na$,5)
245 rem - call check player database (scores.rel) subroutine
250 print"{19}{white}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{29}{29}{29}{29}{29}checking player database..."
255 gosub3585
260 print"{19}{white}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{29}{29}{29}{29}{29}";
265 rem - depending on value of ck%, the player is welcomed back or greeted for the first time
270 ifck%=0thengoto290
280 ifck%=1thengoto300
290 print"hello, ";nn$;", nice to meet you!":goto310
300 print"welcome back, ";nn$;"!"
305 rem - if the random game was chosen, the prompt to enter the date is skipped.
310 ifu$="1"goto340
320 ifu$="2"thengosub2735
330 ifu$="2"goto720
335 rem - player is prompted to enter the date if the daily game was chosen
340 print"{19}{white}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{29}{29}{29}{29}{29}and hit return."
350 print"{145}{145}{29}{29}{29}{29}{29}enter date (mm / dd):{159} {64}{64} / {64}{64}{157}{157}{157}{157}{157}{157}{157}";
360 j%=0
370 get x$:if x$=""goto370
380 if((j%>0andj%<2)andx$=chr$(20))thenprint"{157}{64}{157}";:x$="":j%=j%-1:q$(j%)="":goto370
390 if((j%>2andj%<5)andx$=chr$(20))thenprint"{157}{64}{157}";:x$="":j%=j%-1:q$(j%)="":goto370
400 if(j%=2andx$=chr$(20))thenprint"{157}{157}{157}{157}{64}{157}";:x$="":j%=j%-1:q$(j%)="":goto370
410 if(j%=4andx$<>chr$(13))goto370
420 if(j%=4andx$=chr$(13))goto550
430 if (asc(x$)<48 or asc(x$)>57) then x$="":goto370
440 print x$;
450 q$(j%)=x$
460 ifj%=1thenm$=q$(0)+q$(1)
470 if (j%=1andleft$(m$,1)="0")thenm$=right$(m$,1)
480 if j%=1 then m%=val(m$)
490 if(j%=1and(m%=>13 or m%<1))thenj%=0:print"{157}{157}{64}{64}{157}{157}";:goto370
500 ifj%=3thend$=q$(2)+q$(3)
510 if (j%=3andleft$(d$,1)="0")thend$=right$(d$,1)
520 if j%=3thend%=val(d$)
530 if(j%=3and(d%>30and(m%=4orm%=6orm%=11)))thenj%=1:print"{157}{157}{64}{64}{157}{157}";:goto370
540 if(j%=3and(d%>31or(d%>29andm=2)))thenj%=1:print"{157}{157}{64}{64}{157}{157}";:goto370
550 j%=j%+1
560 if(j%=2andx$<>chr$(20))thenprint"{29}{29}{29}";
570 ifj%<5goto370
580 print chr$(13);"{17}{17}{17}{17}{white}{29}{29}{29}{29}{29}setting up the game for";m%;"/";d%
585 rem - date is converted to Julian day in order to find the right word in the 2022words.rel file
590 ifm%=1thenjd%=d%
600 ifm%=2thenjd%=31+d%
610 ifm%=3thenjd%=60+d%
620 ifm%=4thenjd%=91+d%
630 ifm%=5thenjd%=121+d%
640 ifm%=6thenjd%=152+d%
650 ifm%=7thenjd%=182+d%
660 ifm%=8thenjd%=213+d%
670 ifm%=9thenjd%=244+d%
680 ifm%=10thenjd%=274+d%
690 ifm%=11thenjd%=305+d%
700 ifm%=12thenjd%=335+d%
705 rem - call word retrieval based on date subroutine
710 gosub2325
715 rem - w$ is the the daily word and is split into single letters
718 rem - l1 array records the location (1 through 5) of each letter; l2 and l3 used if a letter is repeated
720 for k=1to5:l$(k)=mid$(w$,k,1):next
730 fork=1to5
740 y=asc(l$(k))-64
750 if(l2%(y)>0andl3%(y)=0)thenl3%(y)=k
760 if(l1%(y)>0andl2%(y)=0)thenl2%(y)=k
770 if(l1%(y)=0)thenl1%(y)=k
780 next k
790 fork=1to5:y=asc(l$(k))-64
800 ifl2%(y)=0thenl2%(y)=-100
810 ifl3%(y)=0thenl3%(y)=-100
820 nextk
825 rem - populate master words.rel index array before moving to the game screen
830 fork=0to675:reada%:u%(k)=a%:nextk
835 rem - game screen; user is prompted to enter guesses
840 print"{147}";tab(6);"hit return after each guess"
850 print chr$(13);"{156} l{white}";spc(13);"{18} {146} {18} {146} {18} {146} {18} {146} {18} {146}";spc(13);"{156}l"
860 print chr$(13);"{31} o{white}";spc(13);"{18} {146} {18} {146} {18} {146} {18} {146} {18} {146}";spc(13);"{31}o"
870 print chr$(13);"{30} g{white}";spc(13);"{18} {146} {18} {146} {18} {146} {18} {146} {18} {146}";spc(13);"{30}g"
880 print chr$(13);"{158} o{white}";spc(13);"{18} {146} {18} {146} {18} {146} {18} {146} {18} {146}";spc(13);"{158}o"
890 print chr$(13);"{28} s{white}";spc(13);"{18} {146} {18} {146} {18} {146} {18} {146} {18} {146}";spc(13);"{28}s"
900 print chr$(13);"{155}{29}6{17}{157}4{145}{white}";spc(13);"{18} {146} {18} {146} {18} {146} {18} {146} {18} {146}";spc(13);"{155}6{17}{157}4{145}{white}"
905 rem - might as well intialize guess counter since i thought of it
910 ng%=0
920 print"{17}{17}{17}";spc(10);"q w e r t y u i o p"
930 print"{17}";spc(11);"a s d f g h j k l"
940 print"{17}";spc(12);"z x c v b n m"
950 print"{19}{17}{17}";
960 print"{white}";spc(15)
965 rem - g1 array records the location (1 through 5) of each letter in the guess; g2 and g3 used if a letter is repeated
970 fork=0to26:g1%(k)=0:g2%(k)=0:g3%(k)=0:nextk
980 for k=1to6
990 get g$(k):if g$(k)="" goto 990
1000 if(k=6andg$(k)=chr$(13))thenprintg$(k):goto1140
1010 if(g$(k)=chr$(20)andk>1)thenprint"{157}{157}{18} {146}{157}";:g$(k)="":k=k-1:bs%=1:goto1050
1020 if (asc(g$(k))<65 or asc(g$(k))>90) then g$(k)="":goto 990
1030 if(k=6andg$(k)<>chr$(13))thengoto990
1040 bs%=0
1050 y=asc(g$(k))-64
1060 if(g3%(y)>0andbs%=0)theng$(k)="":goto990
1070 if(g2%(y)>0andg3%(y)=0andbs%=0)theng3%(y)=k
1080 if(g1%(y)>0andg2%(y)=0andbs%=0)theng2%(y)=k
1090 if(g1%(y)=0andbs%=0)theng1%(y)=k
1100 if(g3%(y)>0andbs%=1)theng3%(y)=0:g$(k)="":goto990
1110 if(g2%(y)>0andg3%(y)=0andbs%=1)theng2%(y)=0:g$(k)="":goto990
1120 if(g1%(y)>0andg2%(y)=0andbs%=1)theng1%(y)=0:g$(k)="":goto990
1130 print g$(k);"{29}";
1140 next k
1150 forj=0to5:s1%(j)=0:nextj
1155 rem - call subroutine to check if the guess is in the master words file (words.rel)
1160 gosub2445
1165 rem - subroutine assigns value to io% depending on whether the guess word was matched to a word in words.rel
1168 rem - if the guess is not a word, the squares turn red and the user is prommpted to re-enter a guess
1170 ifio%=1thengoto1190
1180 print"{145}{145}";spc(15);"{150}{18} {146} {18} {146} {18} {146} {18} {146} {18} {146}{white}":print"{145}{145}":goto960
1190 print"{145}{145}";
1195 rem - if guess is a word, the guess counter is incremented
1200 ng%=ng%+1
1205 rem - subroutines comparing guess to word are called, depending on repeated letters in the word
1210 for k=1to26
1220 ifl3%(k)>0thenny%=3:gosub2275
1230 if(l3%(k)=-100andl2%(k)>0)thenny%=2:gosub2275
1240 if(l3%(k)=-100andl2%(k)=-100andl1%(k)>0)thenny%=1:gosub2275
1250 nextk
1255 rem - subroutines assign a value to the s1% array for each guessed letter - green[1], yellow[2] or gray[0]
1258 rem - score counter, sc%, reset to zero; each green letter increments the counter by 1
1260 sc%=0
1270 print"{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}";
1280 for k=1to5
1290 if s1%(k)=1 then print"{30}";g$(k);"{29}{white}";
1300 if s1%(k)=2 then print"{158}";g$(k);"{29}{white}";
1310 if s1%(k)=0 then print"{151}";g$(k);"{29}";
1320 if s1%(k)=1 then sc%=sc%+s1%(k)
1330 next k
1335 rem - green, yellow and gray letters are printed to the screen keyboard
1340 print chr$(13)
1350 fork=1to5
1360 y=asc(g$(k))-64
1370 s1%(0)=0:dx=0
1380 if(ky%(y)<100)thendx=ky%(y)-1:goto1410
1390 if(ky%(y)>100andky%(y)<1000)thendx=(ky%(y)/10)-1:goto1420
1400 if(ky%(y)>1000)thendx=(ky%(y)/100)-1:goto1430
1410 print"{19}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}";spc(dx):goto1440
1420 print"{19}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}";spc(dx):goto1440
1430 print"{19}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}";spc(dx):goto1440
1435 rem - subroutines to keep green letters green - and yellow letters yellow unless they turn green - are called
1440 if(s1%(k)=0)thengosub3235
1450 if(s1%(k)=2)thengosub3285
1460 if(s1%(k)=1)thenprint"{30}";g$(k)
1470 nextk
1475 rem - if sc%=5, the guessed word is correct and messages are printed to the screen according to number of guesses
1480 if sc%=5 goto 1520
1490 ifng%<6thengoto1510
1500 ifng%=6thengoto1590
1510 print"{19}{17}{17}";:fork=1tong%:print"{17}":next:goto960
1520 ifng%=1thenprint"{19}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}";tab(12);"{159}super fantastic!"
1530 if ng%=2 then print"{19}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}";tab(15);"{159}fantastic!"
1540 if ng%=3 then print"{19}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}";tab(17);"{159}nice!"
1550 if ng%=4 then print"{19}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}";tab(15);"{159}well done!"
1560 if ng%=5 then print"{19}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}";tab(18);"{159}ok!"
1570 if(ng%=6andsc%=5)thenprint"{19}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}";
1580 if(ng%=6andsc%=5)thenprinttab(9);"{159}crikey, that was close!"
1585 rem - if word not guessed in 6 tries, then the player gets a bummer message
1590 if(ng%=6andsc%<>5)thenprint"{19}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}";
1600 if(ng%=6andsc%<>5)thenprint"{159}bummer, ";nn$;"! the word was, {150}";w$;"."
1605 rem - update f$ and f% arrays to be written to scores.rel for next game
1610 ifck%=0thenf$(0)=na$:f%(2)=0
1620 ifu$="2"thenm$="12":f$(1)=m$:d$="31":f$(2)=d$
1630 ifu$="1"thenf$(1)=m$:f$(2)=d$
1640 rem f%(11) is available for whatever f%(11)=f%(11)+1
1650 f%(3)=f%(3)+1:f$(4)=str$(f%(3))
1660 ifng%=1thenf%(4)=f%(4)+1:f%(10)=f%(10)+1
1670 f$(5)=str$(f%(4))
1680 ifng%=2thenf%(5)=f%(5)+1:f%(10)=f%(10)+1
1690 f$(6)=str$(f%(5))
1700 ifng%=3thenf%(6)=f%(6)+1:f%(10)=f%(10)+1
1710 f$(7)=str$(f%(6))
1720 ifng%=4thenf%(7)=f%(7)+1:f%(10)=f%(10)+1
1730 f$(8)=str$(f%(7))
1740 ifng%=5thenf%(8)=f%(8)+1:f%(10)=f%(10)+1
1750 f$(9)=str$(f%(8))
1760 if(ng%=6andsc%=5)thenf%(9)=f%(9)+1:f%(10)=f%(10)+1
1770 f$(10)=str$(f%(9))
1780 if(ng%=6andsc%<>5)thenf%(10)=0
1790 f$(11)=str$(f%(10))
1800 f$(12)=str$(f%(11))
1810 iff%(10)=>f%(2)thenf%(2)=f%(10):f$(3)=str$(f%(2))
1820 wn%=f%(4)+f%(5)+f%(6)+f%(7)+f%(8)+f%(9):wp%=int((wn%/f%(3)*100)+0.5)
1830 a0%=f%(4):fork=4to9
1840 iff%(k)>a%thena%=f%(k):lg%=k
1850 nextk:l0%=-1
1860 l0%=l0%+1
1870 if(int((f%(lg%)/wn%)*(20+l0%))<20)goto1860
1880 t1$="":forj=0toint((f%(4)/wn%)*(20+l0%)):t1$=t1$+"{155}{18}{184}{146}":nextj
1890 t2$="":forj=0toint((f%(5)/wn%)*(20+l0%)):t2$=t2$+"{155}{18}{184}{146}":nextj
1900 t3$="":forj=0toint((f%(6)/wn%)*(20+l0%)):t3$=t3$+"{155}{18}{184}{146}":nextj
1910 t4$="":forj=0toint((f%(7)/wn%)*(20+l0%)):t4$=t4$+"{155}{18}{184}{146}":nextj
1920 t5$="":forj=0toint((f%(8)/wn%)*(20+l0%)):t5$=t5$+"{155}{18}{184}{146}":nextj
1930 t6$="":forj=0toint((f%(9)/wn%)*(20+l0%)):t6$=t6$+"{155}{18}{184}{146}":nextj
1935 rem after short delay, the statistics screen is printed over the game screen
1940 print"{19}{29}{29}{29}{29}{29}{153}{18}                            {146}"
1950 print"{29}{29}{29}{29}{29}{18}         statistics         {146}"
1960 print"{29}{29}{29}{29}{29}{18} {184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184} {146}"
1970 print"{29}{29}{29}{29}{29}{18} played win% current max    {146}"
1980 print"{29}{29}{29}{29}{29}{18}             streak  streak {146}"
1990 print"{29}{29}{29}{29}{29}{18}                            {146}"
2000 print"{29}{29}{29}{29}{29}{18}                            {146}"
2010 print"{19}{17}{17}{17}{17}{17}{17}{29}{29}{29}{29}{29}{29}{29}{18}";f%(3);
2020 print"{19}{17}{17}{17}{17}{17}{17}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{18}";wp%;
2030 print"{19}{17}{17}{17}{17}{17}{17}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{18}";f%(10);
2040 print"{19}{17}{17}{17}{17}{17}{17}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{18}";f%(2)
2050 print"{29}{29}{29}{29}{29}{18} {184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184}{184} {146}"
2060 print"{29}{29}{29}{29}{29}{18}                            {146}"
2070 print"{29}{29}{29}{29}{29}{18}     guess distribution     {146}"
2080 print"{29}{29}{29}{29}{29}{18}                            {146}"
2090 print"{29}{29}{29}{29}{29}{18}                            {146}"
2100 print"{29}{29}{29}{29}{29}{18}                            {146}"
2110 print"{29}{29}{29}{29}{29}{18}                            {146}"
2120 print"{29}{29}{29}{29}{29}{18}                            {146}"
2130 print"{29}{29}{29}{29}{29}{18}                            {146}"
2140 print"{29}{29}{29}{29}{29}{18}                            {146}"
2150 print"{19}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{29}{29}{29}{29}{29}{29}{29}{153}{18}1{182}{146}";t1$;"{153}{18}";f%(4);"{146}";
2160 print"{19}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{29}{29}{29}{29}{29}{29}{29}{153}{18}2{182}{146}";t2$;"{153}{18}";f%(5);"{146}";
2170 print"{19}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{29}{29}{29}{29}{29}{29}{29}{153}{18}3{182}{146}";t3$;"{153}{18}";f%(6);"{146}";
2180 print"{19}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{29}{29}{29}{29}{29}{29}{29}{153}{18}4{182}{146}";t4$;"{153}{18}";f%(7);"{146}";
2190 print"{19}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{29}{29}{29}{29}{29}{29}{29}{153}{18}5{182}{146}";t5$;"{153}{18}";f%(8);"{146}";
2200 print"{19}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{17}{29}{29}{29}{29}{29}{29}{29}{153}{18}6{182}{146}";t6$;"{153}{18}";f%(9);"{146}"
2210 print"{29}{29}{29}{29}{29}{153}{18}                            {146}"
2220 print"{29}{29}{29}{29}{29}{18}                            {146}"
2230 print"{29}{29}{29}{29}{29}{18}  saving your score...      {146}"
2240 print"{29}{29}{29}{29}{29}{18}                            {146}"
2245 rem - call subroutine to store updated scores in scores.rel
2250 gosub3785
2260 print"{145}{145}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{29}{18}bye!{146}"
2270 end
2272 rem - end of main program
2275 rem - subroutine called on line 1220-1240; calls other subroutines to compare guess to word depending on repeated letters in guess
2280 p1%=g1%(k):p2%=g2%(k):p3%=g3%(k)
2290 ifg3%(k)>0thengosub2835
2300 if(g3%(k)=0andg2%(k)>0)thengosub3045
2310 if(g3%(k)=0andg2%(k)=0andg1%(k)>0)thengosub3175
2320 return
2325 rem - subroutine called on line 710 to retrieve word according to date
2330 b%=jd%:c%=b%:d%=b%+20
2340 open3,8,4,"2023words"
2350 open15,8,15
2360 if(b%>=256)thenb%=b%-256:goto2360
2370 r1%=b%
2380 r2%=int(jd%/256)
2390 print#15,"p"+chr$(100)+chr$(r1%)+chr$(r2%)+chr$(1)
2400 input#3,w$
2410 rem printw$
2420 close3
2430 close15
2440 return
2445 rem - subroutine called on line 1160 to check if guess is an actual word
2450 a$=g$(1)+g$(2)+g$(3)+g$(4)+g$(5):io%=0
2460 m1%=asc(mid$(a$,1,1))-65:m2%=asc(mid$(a$,2,1))-65:m3%=m1%*26+m2%:v%=0
2470 rem printchr$(13):print"{147}";m3%,u%(m3%)
2480 rem geth$:ifh$=""thengoto3030
2490 ifu%(m3%)=-1thenio%=0:goto2730
2500 v%=v%+1:nx%=u%(m3%+v%)
2510 ifnx%<>-1goto2530
2520 if(nx%=-1and(m3%+v%)<675)goto2500
2530 b1%=u%(m3%):b2%=u%(m3%+v%)
2540 rem printchr$(13):printb1%,b2%
2550 rem geth$:ifh$=""thengoto3073
2560 ifb2%=-1thenb2%=5757
2570 w1%=int(b1%/256):w2%=b1%-w1%*256
2580 w3%=int(b2%/256):w4%=b2%-w3%*256
2590 rem printchr$(13):print"b2:";b2%,"w1:";w1%,"w2:";w2%,"w3:";w3%,"w4:";w4%
2600 rem geth$:ifh$=""thengoto3078
2610 open3,8,2,"words"
2620 open15,8,15
2630 v%=0:r1%=w2%:r2%=w1%
2640 fork=b1%tob2%-1
2650 if((r1%+v%)=256)thenr1%=0:v%=0:r2%=w3%
2660 print#15,"p"+chr$(96+2)+chr$(r1%+v%)+chr$(r2%)+chr$(1)
2670 input#3,n$
2680 rem print"r1+v:";r1%+v%,"r2:";r2%,a$,n$
2690 v%=v%+1
2700 ifa$=n$thenio%=1:k=b2%-1
2710 nextk
2720 close3:close15
2730 return
2735 rem - subroutine to randomly choose a word from words.rel called on line 320
2740 print chr$(13);"{17}{17}{17}{17}{29}{29}{29}{29}{29}{white}setting up the random game..."
2750 rc%=int(rnd(0)*5756)+1
2760 w1%=int(rc%/256):w2%=rc%-w1%*256
2770 open3,8,3,"words"
2780 open15,8,15
2790 print#15,"p"+chr$(96+3)+chr$(w2%)+chr$(w1%)+chr$(1)
2800 input#3,w$
2810 close3
2820 close15
2830 return
2835 rem - subroutine called on line 2290 for guesses with a letter repeated 3 times
2840 cy%=0
2850 d0%=0:d1%=0:d2%=0:d3%=0:d4%=0:d5%=0:d6%=0:d7%=0:d8%=0
2860 d0%=l1%(k)-g1%(k):d1%=l1%(k)-g2%(k):d2%=l1%(k)-g3%(k)
2870 d0%=abs(d0%):d1%=abs(d1%):d2%=abs(d2%)
2880 d3%=l2%(k)-g1%(k):d4%=l2%(k)-g2%(k):d5%=l2%(k)-g3%(k)
2890 d3%=abs(d3%):d4%=abs(d4%):d5%=abs(d5%)
2900 d6%=l3%(k)-g1%(k):d7%=l3%(k)-g2%(k):d8%=l3%(k)-g3%(k)
2910 d6%=abs(d6%):d7%=abs(d7%):d8%=abs(d8%)
2920 if(d0%=0andcy%<ny%)thency%=cy%+1:s1%(g1%(k))=1:gg$(g1%(k))=g$(g1%(k))
2930 if(d3%=0andcy%<ny%)thency%=cy%+1:s1%(g1%(k))=1:gg$(g1%(k))=g$(g1%(k))
2940 if(d6%=0andcy%<ny%)thency%=cy%+1:s1%(g1%(k))=1:gg$(g1%(k))=g$(g1%(k))
2950 if(d4%=0andcy%<ny%)thency%=cy%+1:s1%(g2%(k))=1:gg$(g2%(k))=g$(g2%(k))
2960 if(d1%=0andcy%<ny%)thency%=cy%+1:s1%(g2%(k))=1:gg$(g2%(k))=g$(g2%(k))
2970 if(d7%=0andcy%<ny%)thency%=cy%+1:s1%(g2%(k))=1:gg$(g2%(k))=g$(g2%(k))
2980 if(d8%=0andcy%<ny%)thency%=cy%+1:s1%(g3%(k))=1:gg$(g3%(k))=g$(g3%(k))
2990 if(d2%=0andcy%<ny%)thency%=cy%+1:s1%(g3%(k))=1:gg$(g3%(k))=g$(g3%(k))
3000 if(d5%=0andcy%<ny%)thency%=cy%+1:s1%(g3%(k))=1:gg$(g3%(k))=g$(g3%(k))
3010 ifs1%(p1%)<>1thengosub3335
3020 ifs1%(p2%)<>1thengosub3375
3030 ifs1%(p3%)<>1thengosub3415
3040 return
3045 rem - subroutine called on line 2300 for guesses with a letter repeated 2 times
3050 cy%=0
3060 h0%=0:h1%=0:h2%=0:h3%=0
3070 h0%=l1%(k)-g1%(k):h1%=l1%(k)-g2%(k)
3080 h0%=abs(h0%):h1%=abs(h1%)
3090 h2%=l2%(k)-g1%(k):h3%=l2%(k)-g2%(k)
3100 h2%=abs(h2%):h3%=abs(h3%)
3110 if(h0%=0andcy%<ny%)thency%=cy%+1:s1%(g1%(k))=1:gg$(g1%(k))=g$(g1%(k))
3120 if(h2%=0andcy%<ny%)thency%=cy%+1:s1%(g1%(k))=1:gg$(g1%(k))=g$(g1%(k))
3130 if(h3%=0andcy%<ny%)thency%=cy%+1:s1%(g2%(k))=1:gg$(g2%(k))=g$(g2%(k))
3140 if(h1%=0andcy%<ny%)thency%=cy%+1:s1%(g2%(k))=1:gg$(g2%(k))=g$(g2%(k))
3150 ifs1%(p1%)<>1thengosub3455
3160 ifs1%(p2%)<>1thengosub3485
3170 return
3175 rem - subroutine called on line 2310 for guesses with no repeat letters
3180 cy%=0
3190 if(g1%(k)=l1%(k)andcy%<ny%)thency%=cy%+1:s1%(p1%)=1:gg$(p1%)=g$(p1%)
3200 if(g1%(k)=l2%(k)andcy%<ny%)thency%=cy%+1:s1%(p1%)=1:gg$(p1%)=g$(p1%)
3210 if(g1%(k)=l3%(k)andcy%<ny%)thency%=cy%+1:s1%(p1%)=1:gg$(p1%)=g$(p1%)
3220 ifs1%(p1%)<>1thengosub3515
3230 return
3235 rem - subroutine called on line 1440 to print gray letters on screen keyboard
3240 forj=1to5
3250 if(g$(k)=gg$(j)org$(k)=gy$(j))thenreturn
3260 nextj
3270 print"{151}";g$(k)
3280 return
3285 rem - subroutine called on line 1450 to print yellow letters on screen keyboard
3290 forj=1to5
3300 ifg$(k)=gg$(j)thenreturn
3310 nextj
3320 print"{158}";g$(k)
3330 return
3335 rem - subroutine called on line 3010; contstraint for printing yellow letters
3340 if(d3%>0andd3%<10andcy%<ny%)thency%=cy%+1:s1%(p1%)=2:gy$(p1%)=g$(p1%)
3350 if(d0%>0andd0%<10andcy%<ny%)thency%=cy%+1:s1%(p1%)=2:gy$(p1%)=g$(p1%)
3360 if(d6%>0andd6%<10andcy%<ny%)thency%=cy%+1:s1%(p1%)=2:gy$(p1%)=g$(p1%)
3370 return
3375 rem - subroutine called on line 3020; contstraint for printing yellow letters
3380 if(d1%>0andd1%<10andcy%<ny%)thency%=cy%+1:s1%(p2%)=2:gy$(p2%)=g$(p2%)
3390 if(d4%>0andd4%<10andcy%<ny%)thency%=cy%+1:s1%(p2%)=2:gy$(p2%)=g$(p2%)
3400 if(d7%>0andd7%<10andcy%<ny%)thency%=cy%+1:s1%(p2%)=2:gy$(p2%)=g$(p2%)
3410 return
3415 rem - subroutine called on line 3030; contstraint for printing yellow letters
3420 if(d2%>0andd2%<10andcy%<ny%)thency%=cy%+1:s1%(p3%)=2:gy$(p3%)=g$(p3%)
3430 if(d8%>0andd8%<10andcy%<ny%)thency%=cy%+1:s1%(p3%)=2:gy$(p3%)=g$(p3%)
3440 if(d5%>0andd5%<10andcy%<ny%)thency%=cy%+1:s1%(p3%)=2:gy$(p3%)=g$(p3%)
3450 return
3455 rem - subroutine called on line 3150; contstraint for printing yellow letters
3460 if(h2%>0andh2%<10andcy%<ny%)thency%=cy%+1:s1%(p1%)=2:gy$(p1%)=g$(p1%)
3470 if(h0%>0andh0%<10andcy%<ny%)thency%=cy%+1:s1%(p1%)=2:gy$(p1%)=g$(p1%)
3480 return
3485 rem - subroutine called on line 3160; contstraint for printing yellow letters
3490 if(h1%>0andh1%<10andcy%<ny%)thency%=cy%+1:s1%(p2%)=2:gy$(p2%)=g$(p2%)
3500 if(h3%>0andh3%<10andcy%<ny%)thency%=cy%+1:s1%(p2%)=2:gy$(p2%)=g$(p2%)
3510 return
3515 rem - subroutine called on line 3220; contstraint for printing yellow letters
3520 m1%=abs(l1%(k)-g1%(k))
3530 m2%=abs(l2%(k)-g1%(k))
3540 m3%=abs(l3%(k)-g1%(k))
3550 if(m1%>0andm1%<10andcy%<ny%)thency%=cy%+1:s1%(p1%)=2:gy$(p1%)=g$(p1%)
3560 if(m2%>0andm2%<10andcy%<ny%)thency%=cy%+1:s1%(p1%)=2:gy$(p1%)=g$(p1%)
3570 if(m3%>0andm3%<10andcy%<ny%)thency%=cy%+1:s1%(p1%)=2:gy$(p1%)=g$(p1%)
3580 return
3585 rem - subroutine called on line 245 to check for player in database
3590 open3,8,4,"scores"
3600 open15,8,15
3610 fork=1to15
3620 print#15,"p"+chr$(100)+chr$(k)+chr$(0)+chr$(1)
3630 input#3,n$
3640 if(er%=0andn$=chr$(255))thener%=k
3650 ifn$=na$thenck%=1:r%=k
3660 nextk
3670 forj=0to11:f%(j)=0:nextj
3680 ifck%=1thengoto3710
3690 close3:close15
3700 return
3710 print#15,"p"+chr$(100)+chr$(r%)+chr$(0)+chr$(1)
3720 j%=0
3730 input#3,f$(j%)
3740 if(st=0andj%>0)thenf%(j%-1)=val(f$(j%)):j%=j%+1:goto3730
3750 if(st<>0andj%=12)thenf%(j%-1)=val(f$(j%)):j%=j%+1:goto3770
3760 if(st<>64andj%=0)thennm$=f$(j%):j%=j%+1:goto3730
3770 close3:close15
3780 return
3785 rem - subroutine called on line 2250 to update players scores
3790 b$=""
3800 forj=0to12
3810 b$=b$+f$(j)+chr$(13)
3820 nextj
3830 open3,8,4,"scores"
3840 open15,8,15
3850 print#15,"p"+chr$(100)+chr$(r%)+chr$(0)+chr$(1)
3860 print#3,b$;
3870 close3:close15
3880 return
3890 data 1,2,27,43,62,64,70,85,88,-1,99,100,137
3900 data 161,187,188,204,206,229,247,255,266,274,283,292,293
3910 data 296,-1,-1,-1,375,-1,-1,439,441,-1,-1,480,-1
3920 data -1,528,-1,-1,604,-1,-1,666,-1,723,-1,724,-1
3930 data 728,-1,-1,-1,812,-1,-1,823,891,-1,-1,904,-1
3940 data -1,955,-1,-1,1060,-1,-1,1125,-1,-1,-1,1163,1167
3950 data 1168,-1,-1,-1,1200,-1,-1,1257,1258,1322,-1,-1,-1
3960 data -1,1323,-1,-1,1386,-1,-1,1432,-1,1470,-1,1474,-1
3970 data 1479,1493,1495,1497,1505,-1,1506,-1,1510,1512,1513,1514,1527
3980 data 1537,-1,1552,1560,1562,1569,1573,-1,1579,-1,1586,1605,-1
3990 data 1608,-1,-1,-1,1665,-1,-1,-1,1701,1754,-1,1755,-1
4000 data -1,1814,-1,-1,1861,-1,1894,1895,-1,-1,-1,-1,-1
4010 data 1926,-1,-1,-1,1975,-1,-1,1992,1995,-1,-1,2024,-1
4020 data 2056,-1,2061,-1,2104,-1,-1,2167,-1,2199,-1,2200,-1
4030 data 2205,-1,-1,-1,2269,-1,-1,-1,2314,-1,-1,-1,-1
4040 data -1,2339,-1,-1,-1,-1,-1,2403,-1,-1,-1,2434,-1
4050 data 2444,-1,2445,2451,-1,-1,2461,-1,-1,-1,2462,2464,2468
4060 data 2477,2501,-1,-1,2505,2509,2512,-1,2514,-1,2517,-1,-1
4070 data 2518,-1,-1,-1,2531,-1,-1,-1,2544,-1,-1,-1,-1
4080 data -1,2558,-1,-1,-1,-1,-1,2574,-1,-1,-1,-1,-1
4090 data 2591,-1,-1,-1,2602,-1,-1,2619,2621,-1,-1,2643,-1
4100 data 2648,2668,-1,-1,2673,-1,-1,2678,-1,-1,-1,2681,-1
4110 data 2682,-1,-1,-1,2750,-1,-1,-1,2790,-1,-1,2849,-1
4120 data -1,2850,-1,-1,-1,-1,-1,2916,-1,-1,-1,2947,-1
4130 data 2953,-1,-1,-1,3031,-1,-1,-1,3073,-1,-1,-1,-1
4140 data -1,3124,-1,-1,3203,-1,-1,3204,-1,-1,-1,3246,-1
4150 data 3251,-1,-1,-1,3278,-1,-1,-1,3301,-1,-1,-1,-1
4160 data -1,3322,-1,-1,-1,-1,-1,3355,-1,-1,-1,3367,-1
4170 data 3369,3376,3381,3387,3392,-1,3397,3401,3403,-1,3407,3410,3416
4180 data 3420,3423,3427,-1,3434,3444,3445,3447,3458,3466,3472,-1,3476
4190 data 3477,-1,-1,-1,3557,3605,-1,3606,3614,-1,-1,3663,-1
4200 data -1,3704,-1,-1,3764,3816,-1,3822,-1,-1,-1,3859,-1
4210 data -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
4220 data -1,3863,-1,-1,-1,-1,-1,3864,-1,-1,-1,-1,-1
4230 data 3902,-1,-1,-1,3962,-1,-1,4038,4043,-1,-1,-1,-1
4240 data -1,4085,-1,-1,-1,-1,-1,4139,-1,-1,-1,-1,-1
4250 data 4170,-1,4221,-1,-1,4273,-1,4321,4411,-1,4455,4477,4535
4260 data 4553,4586,4633,4711,-1,-1,4717,4817,-1,4848,-1,4889,-1
4270 data 4894,-1,-1,-1,4957,-1,-1,5002,5042,-1,-1,-1,-1
4280 data -1,5082,-1,-1,5146,5206,-1,5207,5242,-1,-1,5261,5269
4290 data -1,-1,-1,5270,-1,-1,-1,-1,-1,-1,5271,5272,5276
4300 data 5282,-1,5324,-1,5328,5334,5341,-1,5344,-1,-1,-1,-1
4310 data 5345,-1,-1,-1,5366,-1,-1,-1,5392,-1,-1,-1,-1
4320 data -1,5433,-1,-1,5451,-1,-1,5452,-1,-1,-1,5453,-1
4330 data 5454,-1,-1,-1,5512,-1,-1,5542,5588,-1,-1,-1,-1
4340 data -1,5630,-1,-1,5663,-1,-1,5681,-1,-1,-1,-1,-1
4350 data -1,-1,-1,-1,5682,-1,-1,-1,-1,-1,-1,-1,-1
4360 data -1,5684,-1,-1,-1,-1,-1,-1,-1,-1,-1,5685,-1
4370 data 5686,-1,-1,-1,5696,-1,-1,-1,5706,-1,-1,-1,-1
4380 data -1,5709,-1,-1,-1,-1,-1,5727,-1,-1,-1,-1,-1
4390 data 5733,-1,-1,-1,5735,-1,-1,-1,5742,-1,-1,5747,-1
4400 data -1,5748,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1