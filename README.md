nim-consensus tests
===================

Test-case for the problem discussed at
* https://forum.nim-lang.org/t/2887/2

Directions
----------

    make init
    make
    make long
    make fail

Eventually, run the failing "huge" test in gdb/lldb. Even though the dataset is nearly 1GB, it fails quickly.

Problem
-------
In order to avoid memory fragmentation, I am trying to run each job in a new thread.
That way, when a thread exits, its memory will be recovered quickly and completely,
unfragmented.

But on my largest test-case, I have a seg-fault in the Nim memory manager.
(See forum link.) Maybe this is my own bug, but I have no idea.
