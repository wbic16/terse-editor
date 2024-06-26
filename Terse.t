Phext Notepad
-------------

Phext Notepad provides a reference implementation of plain hierarchical text ("phext") using delimiters of unusual size. The format was created by Will Bickford, and is intended to assist humans with leaning into the Singularity.

Knowledge Trees
---------------
Phext formatted files extend line breaks to 9 additional dimensions. Everything that's great about text survives this transition. Phext does not require any addressing or encoding rules. Scrolls provide you with infinite freedom to tinker and think. You can bundle up a set of scrolls and share them with others - while preserving the relational structure of your ideas.

High-Bandwidth I/O
------------------
For most of human history, we've been exchanging ideas at tragically slow rates. If you read very quickly, you might hit 3 bytes per second of compressed text. This is essentially a biological limit, but not one that will survive forever.

PCIe 5.0 SSDs are now providing us with 2-10 GB/sec data transfer speeds. For small files, these disks can sustain 200 MB/sec. Considering that text is highly-compressible, we now have access to disks that can transfer an effective 1 trillion words per minute.

  10 GB/sec x 10:1 compression ratio x 60sec/min
  ---------------------------------------------- = 1 trillion words/min
                  6 bytes/word

If you typed at 120 wpm for 15,000 years (without rest), you would only hit 950 billion words (5.7 GB). We now have an abundance of disk I/O at our disposal. It is time to re-think how we design our systems - the days of worrying about files measured in KB or MB are gone.

Machine Learning
----------------
Phext is especially well-suited for machine learning, because the content and structure of ideas can be encoded in ways that are familiar to both humans and computers.Documentation
-------------

File
----
 * New: Create a Blank Phext File (Ctrl-N)
 * Open: Open an Existing Phext File (Ctrl-O)
 * Reload: Reloads the current Phext File (Ctrl-/)
 * Save: Write all scrolls to the current file (Ctrl-S)
 * Save As: Write all scrolls to a new file (Ctrl-Shift-S)
 * Recent: Provides a list of files in recently-used order
 * Exit: Quit the app

Edit
----
 * Preferences: Open phext.ini (Ctrl-,)

View
----
 * Lock to Scroll: Toggles the Tree View On/Off
 * Word Wrap: Controls text editor word wrap
 * Dark Mode: Toggles a white or black background
 * Show Coordinates: Display coordinates in the Tree View

Help
----
 * About: Display Program Version
Bug List v0.3.1
---------------

Bugs
----
🐛 Unicode glyphs aren't fixed width with Font = Cascadia Code

Key
---
🪲: Major Flaw
🐜: Minor Flaw
🐛: Curiosity
Roadmap

v0.4.0
------
  * add multiple viewports
  * add tabs
  * add zoomed UI

Editor List
-----------
* TRSH: The Terse-Native Shell [C]
* Terse Notepad: Reference Editor [C#]
* Web Terse: Web-based single .html file editor [JS]
* Flownote: One infinite scroll [C++]
* Dreamnote: A place for all of your notes [Rust]Release Notes
-------------
(c) 2022-2024 Phext, Inc.
MIT License

v0.3.1 (2024-02-08)
➕ Improved Coordinate Editing, Byte Count, and Word Count Tracking
➕ Updated Copyright to Phext, Inc.

v0.3.0 (2024-02-07)
➕ Rebranded as Phext Notepad

v0.2.3 (2023-07-28)
➕ Added Color1-Color4 Customization (request submitted by Luke Whipple)

v0.2.2 (2023-07-14)
-------------------
➕ Removed extra scroll bars
➕ Removed Vim integration

v0.2.1 (2022-12-19)
-------------------
🐛 Fixed Tree View Labels
➕ Added Show Coordinates setting

v0.2.0 (2022-12-19)
-------------------
🐛 Fixed keyboard navigation - dimension breaks are less glitchy
🪲 Chapter 1 problems were being caused by re-use of 1-1-1 for a null state \o/
➕ Increased Tree View width to 450 pixels
➕ New coordinate format
 ➕ p_g_s_y_h_e_w_i_m
 ➕ p = Scroll Index
 ➕ g = Section Index
 ➕ s = Chapter Index
 ➕ y = Book Index
 ➕ h = Collection Index
 ➕ e = Volume Index
 ➕ w = Series Index
 ➕ i = Shelf Index
 ➕ m = Library Index
➕ Enabled All Dimensions! \o/
 ➕ Book - F5
 ➕ Collection - F6
 ➕ Volume - F7
 ➕ Series - F8
 ➕ Shelf - F9
 ➕ Library - F10

v0.1.9 (2022-12-14)
-------------------
🪲 Fixed page checkout mechanism - scroll collect depends upon prior checkout now
🏎️ Added node cache and moved tree node creation to TerseModel

v0.1.8 (2022-12-14)
-------------------
🪲 Delete Node now reliably destroys only the selected node
➕ Ctrl-/ now reloads from disk

v0.1.7 (2022-12-13)
-------------------
🐛 Fixed a loading bug from Tersify-produced files that did not include section or chapter breaks
🐛 Improved scroll summaries to strip leading blank space
🐛 Improved readability for word counts (styled with commas and 10.1K/100K styling)

v0.1.6 (2022-12-10)
-------------------
🐜 Recent files is now sorted by recent use \o/
🐛 Recent files no longer shows dead files

v0.1.5 (2022-12-09)
-------------------
🧪 Improved Diagnostics (Coordinates are now visible in the Tree View)
🧪 Added "scroll checkout" tracking
🧪 7/7 unit tests passing
➕ Font settings now apply to the tree view for improved readability
🥼 F3 and Shift-F3 now reset Scroll ID to 1
🥼 F4 and Shift-F4 now reset both Scroll ID and Section ID to 1
👏 Delete Node now prompts the user to confirm when more than 1 node is affected
👏 Lock to Scroll now follows the keyboard's Scroll Lock
👏 Double-click on a node to jump to the text box

v0.1.4 (2022-12-08)
-------------------
👏 Fixed volumeID is blank bug
👏 Fixed wonky text paste
👏 Terse.t: Revised Scroll Names
👏 Fixed Text Box Width with Tree View Disabled
👏 Improved current page visibility
➕ Release Notes: Started using emojii bullet points
➕ Added SCROLL LOCK Support \o/
 ➕ Renamed "Tree View" Checkbox on the View menu to "Lock to Scroll"
 ➕ Scroll lock now controls tree view visibility
 ➕ The editor no longer responds to dimension switch events when the tree view is hidden

v0.1.3 (2022-12-08)
-------------------
💿 Settings Version 5
 ➕ Added the Preferences Overview Scroll
 ➕ Added VimMode - Edits Locked While Active
 👏 Fixed Preferences Edit Bug
🗒️ Added Vim Mode (OLE Integration)

v0.1.2 (2022-12-07)
-------------------
🧪 Added full test coverage for chapters, word count, and node count
📜  Added Automatic Word Counters for Current Page and Terse Doc
🏎️ Improved Terse File Parsing Performance
🌲  Reduced tree View Flicker
🎡 Added Dark and Light Themes

v0.1.1 (2022-12-05)
-------------------
🧪 Added unit test coverage for scrolls and sections

v0.1.0 (2022-12-04)
-------------------
🛣️ Renamed Requests to Roadmap
📜  Witness Operational Scrollbars!

v0.0.9 (2022-12-04)
-------------------
🌲 Tree view now updates in real-time

v0.0.8 (2022-12-04)
-------------------
🌲 Tree view is now instant! \o/
 📃 New pages appear in the tree view once a line break occurs
 🫗Empty pages are cleared on save

v0.0.7 (2022-12-04)
-------------------
💿 Settings Version 3
 🔍 Added ZoomFactor to preserve text resizing (separate from font size) - 1.0 = 100%
 📂 Added Recent File List (Sorted)
👏 User Requests
 🆕 Selecting the end of the row no longer selects the newline \o/

v0.0.6 (2022-12-03)
-------------------
📃 Editor Improvements
 ➕ 🚄 Editor State is now synchronized across sessions
 ➕ 💡 Added Save As Menu Item
💿 Settings Version 2
 🏷️ Added Dimension Labels (Dimension1 through Dimension11)
 🎁 Added WordWrap boolean - controls text box word wrapping
 🗨️ Added Font and FontSize
🍰 Program Enhancements
 👏 Renamed executable to trs.exe
 👏 Renamed TODO.t to Terse.t
 ➕ Added Release Notes to Terse.t
 ➕ Added File Formats to Terse.t
 ➕ Added Terse Notepad Documentation to Terse.t
 ➕ Added "Welcome to the Terse" Summary
 ➕ Embedded a copy of Terse.t on Build
 ➕ Added License.md
👏 User Requests
 🦘 Removed the Jump button - pages load as you type now!
 🌲 Tree view updates on save and delete - more to come🎉
 🎄 Tree view selection is now single-click \o/

v0.0.5 (2022-12-02)
-------------------
➕ Switched to TODO.t
➕ First Version with .ini support
➕ Added Tree View
👏 Revised Coordinates: Library, Shelf, Series, Collection, Volume, Book, Chapter, Section, and Scroll
➕ Implemented Direct Page Jumps

v0.0.4 (2022-12-01)
-------------------
👏 Performance Tweaks and Bug fixes
👏 Limited Dimension Inputs to 4 digits

v0.0.3 (2022-11-30)
------
➕ Added TODO.md
👏 Fixed Bugs with 5D Editing

v0.0.2 (2022-11-30)
-------------------
➕ Added Dimension Report to Assist with Sparse Page Views
➕ Added README.md
➕ Added Dimension Input Boxes

v0.0.1 (2022-11-30)
-------------------
➕ Proof of Concept with 5 of 11 dimensions
➕ Multiverse, Galaxy, World, Language, Branch, Volume, Set, Group, and Page
File Formats
This is a list of Terse-based file formats.

Extension  Status       Description
---------  ------       -----------
.t         Implemented  Reference File Format
.tweb      Proposed     HTML + Resources in One Byte Stream
.todb      Proposed     Text-Only Database
.tfl       Proposed     Text Flow Notes
.tjur      Proposed     Jurassic Park Style Viewer
Preferences
------------
Terse configuration files are simple key-value .ini files.
The main terse configuration block is denoted by "[TerseConfig]".

Supported fields and hints for configuration are listed below.
No fields require quotation marks - values are taken verbatim.

* Format      'TerseConfig' is the only valid value
* Version     '5' is the latest config format version
* Filename    The editor's current file path
* TreeView    Boolean: Controls visibility for the tree view
* Coords      Current coordinates in {scroll}-{section}-{chapter} format
              Note: This will expand to the right as new dimensions are added.
* Font        Font family such as 'Cascadia Code' or 'Courier New'
* FontSize    Sets the font size in points, such as '11' or '14'
* LastError   Diagnostic message from Terse
* Dimension1  Custom label for the Column dimension
* Dimension2  Custom label for the Line dimension
* Dimension3  Custom label for the Scroll dimension
* Dimension4  Custom label for the Section dimension
* Dimension5  Custom label for the Chapter dimension
* Dimension6  Custom label for the Book dimension
* Dimension7  Custom label for the Volume dimension
* Dimension8  Custom label for the Collection dimension
* Dimension9  Custom label for the Series dimension
* Dimension10 Custom label for the Shelf dimension
* Dimension11 Custom label for the Library dimension
* WordWrap    Boolean: Controls editor word wrap
* ZoomFactor  Scale factor for text size - 1.0 is normal
* Theme       'Light' or 'Dark' currently
* VimMode     Boolean: 'True' for Vim as your editor ('False' is default)