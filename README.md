# the3dPen
view vertices with 3D rotations in Love2D

modify  data/model.lua  in order to view a different object

created in gEdit

---

To figure out 3D rotations, I looked at Tic-80 code for  
FlamingPandas > Demos > MODELRENDERER  
https://tic.computer/play?cart=415

Already had an idea of how to do it,  
but sometimes it's hard to keep track of which is which  
with the sin() and cos() of the various X Y Z combinations.  

It's not a direct copy, but yea, looked at that one  
to keep all the rotations facing the right way.

Tho I might reverse the Z axis, so - is Down and + is Up;  we'll see.

---
To use this, you'll need Löve2d
https://love2d.org

Linux: *enter dir, then type*
`love .`

Win, Mac:  *drag folder on Love shortcut*

for more info, see https://love2d.org/wiki/Getting_Started

Android:  use any file manager that lets you *Open As...*  
https://play.google.com/store/apps/details?id=com.alphainventor.filemanager

Open a .love file as other, complete action using Löve for Android.  
Alternatively, open the folder, and do the same thing with *main.lua*

---
The spacing is so I can explain it to my kid.

'space space equals' accentuates the difference between = and ==  
You'll see inside the code.  It's not that hard to figure out.

Lua doesn't mind spacing, so you can do a  
find 'space dot' and replace with 'dot' easily enough,  
substitute 'space space equals' with 'equals' if you prefer.

The idea is to make simple models in Lua easy.  
If my kid can get it, you can too.

---
**YouTube clips to help speed up the learning process.**

I hate "Learn X programming language in an Hour" vids,  
'cuz they skim over everything, to cram it all in.

That said, this one is decent.

Learn Lua in an Hour - by Tyler Neylon  
https://www.youtube.com/watch?v=S4eNl1rA1Ns


Here's a playlist that breaks down the steps involved.  
Make your own game - by goature  
https://www.youtube.com/playlist?list=PL924F20B05A624D91  
I got the simple gamestate-management from his vid 14.


Here's a cheat-sheet that's decent, easier than listening to the guy rattle on.  
http://www.newthinktank.com/2015/06/learn-lua-one-video

I've watched a ton of Lua vids, and that might be the best way,  
'cuz you'll get something from one, and something else from another.

---
Obviously, you'll want to refer to the Love2D wiki, and Lua docs.  
https://love2d.org/wiki/Main_Page

You might find useful source code examples in other GitHub projects,  
or games at itch.io  https://itch.io/games/tag-love2d

http://howtomakeanrpg.com/a/classes-in-lua.html

Reddit is a good source for info.  
> /r/lua  
> /r/love2d  
> /r/gamedev  
> /r/lua_questions

To try out code, you can type **lua**  
in your comand prompt / console, to get an interactive interpreter.  
No exit command, must tap *(Linux, Mac)* **Ctrl-D** or *(Win)* **Ctrl-Z**, to exit.

Can try out snippets of code online  
https://repl.it/languages/lua

If you're stumped, can look / ask at StackOverflow,  
but their whole conversational ranking system **sux**.  
https://stackoverflow.com/questions/tagged/lua

Tic-80 carts have good code.

To a lesser degree, Pico8 carts might be of some use,  
https://www.lexaloffle.com/bbs/?cat=7&sub=2&mode=carts  
But you have to be aware there will be specifics that won't transfer well.

---

