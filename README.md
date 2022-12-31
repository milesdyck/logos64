# logos64
logos64 is a version of Wordle coded in BASIC on the Commodore 64.  
Josh Wardle is the original creator of Wordle and is now owned by the New York Times.  
Play it online here: https://www.nytimes.com/games/wordle/index.html.  
OR...
Play logos64 on the C64 by downloading the d64 disk image here!
See a demo at: https://youtu.be/r69JtBaMoS4

## why logos?
The Greek word "logos" as it appears in the Bible (the book of John in the New Testament) was translated into english word, "word".  The actual meaning of "logos" is much more than "word" in the context of Wordle. A better translation of "logos" is the word of God. So, perhaps logos isn't the best name for this version of Wordle, but I like it because it's catchy. 

## play it now - Release 1.0.2 
https://github.com/milesdyck/logos64/releases/tag/v1.0.2
Dowload the logos2023v101.d64 disk image and use the VICE C64 emulator (https://vice-emu.sourceforge.io/) or your own c64 to play it. It works with a pi1541 emulator, but I have not tested the game using a s2deic, real 1541 floppy drive or other disk drive substitute. 

## development notes
I am a bit late to the party. There are other examples of Wordle for the C64 available (just ask Google). 
The code in the uploaded .bas files is my original [inefficient] code. Most of it was typed into a real C64. 
I imported the prg files in CBM prg Studio (https://www.ajordison.co.uk/) to renumber the code and add remarks.
There are many solutions to the Wordle problem.  This is my solution.  I did not consult or borrow any other code.

## unique features of this version of wordle for the C64
The master words file, words.rel, contains over 5000 words. 
The source of these words is: https://github.com/charlesreid1/five-letter-words/blob/master/sgb-words.txt.
The player can choose to play a the "random" or "daily game".  The random game chooses a word randomly from the words.rel file.
The daily game prompts the player to ener the date and chooses pre-selected word for that date from the 2023words.rel file.
The players name and cumulative play statistics are stored in the scores.rel file.

## code files
logos2023v101.bas - the main code for the game
cre82023words.bas, cre8words.bas and cre8scores.bas contain the code used to create the supporting 2023words, words and scores relative files accessed by the game. In addition, there are PDF files of the PETSCII listings as you would see in the built-in c64 text editor.

## future development 

Being written and executed in basic makes the game a bit slow. I am looking into a few options to make it faster.
