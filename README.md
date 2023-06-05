# logos64
logos64 is a version of Wordle coded in BASIC on the Commodore 64.  
Josh Wardle is the original creator of Wordle and is now owned by the New York Times.  
Play it online here: https://www.nytimes.com/games/wordle/index.html.  
OR...
Play logos64 on the C64 by downloading the d64 disk image here!
See a demo at: https://youtu.be/r69JtBaMoS4

## Latest version (v2.0.2) in Vision BASIC 
With help from Dennis Osborn, creator of Vision BASIC, I have ported the code to Vision BASIC (https://visionbasic.net/). This version is available on the disk image in logos2023v201.d64 available for download above. LOAD"*",8 for the executable file. 

## why logos?
The Greek word "logos" as it appears in the Bible (the book of John in the New Testament) was translated into english word, "word".  The actual meaning of "logos" is much more than "word". A better translation of "logos" is the word of God. So, perhaps "logos" isn't the best name for this version of Wordle, but I like it because it's catchy. 

## development notes
I am a bit late to the party. There are other examples of Wordle for the C64 available (just ask Google). 
The original code in v1.0.0, 1.01 and 1.0.2 is in the .bas or PETSCII listing pdf files. Vision Basic code is in v2.0.0, v2.0.1, v2.0.2 files.
There are many solutions to the Wordle problem.  This is my solution.  I did not consult or borrow any other code.

## unique features of this version of wordle for the C64
The master words file, words.rel (compressed version - words v2.rel), contains over 5000 words. 
The source of these words is: https://github.com/charlesreid1/five-letter-words/blob/master/sgb-words.txt.
The player can choose to play the "random" or "daily game".  
The daily game prompts the player to ener the date and chooses pre-selected word for that date.
The players name and cumulative play statistics are stored in the scores.rel file.

## code files
logos2023v202.visPETSCII.pdf - the Vision BASIC code for the latest release   
logos2023v102PETSCII.pdf - the BASIC V2 code

cre8words.prg and cre8scores.prg contain the code used to create the supporting 2023words, words and scores relative files accessed by the game. cre8words2.vis.prg is the Vision BASIC code
for creating the compressed version of the words file. In addition, there are PDF files of the PETSCII listings as you would see in the built-in c64 text editor.


