langs = %i(
A
A+
ABAP
ABC
ABCL
ActionScript
ActiveBasic
Ada
Advanced Boolean Expression Language（ABEL）
Agena
AHDL
ALGOL
Alice
ash
APL
AppleScript
as
Atom
AutoIt
AutoLISP（英語版）
AWK
B
B
Bash
BASIC
BCPL
Befunge
BF-BASIC'n
Bioera
BLISS
Bluespec
Boo
BrainCrash
Brainfuck
C
C
C#
C++
C++/CLI (C++ Common Language Infrastructure)
C++/CX（英語版） (C++ Component Extensions)
CAL
Caml
Cantata
CAP-X
CASL
Cecil
CFScript（英語版）
Cg
Chapel
Chef
CHILL
Clipper
Clojure
CLU
Co-array Fortran
COBOL
CoffeeScript
Common Lisp
Component Pascal
Concurrent Clean
Concurrent Prolog
Constraint Handling Rules
CPL
csh
CUDA C/C++
Curl
Curry
Cω
D
D
Dart
dBase
Delphi
Dylan
E
ECMAScript
Eiffel
Elixir
Emacs Lisp
Enterprise Generation Language
Erlang
Escapade
Esterel
Euclid
Euphoria
F
F*
F#
Factor
False
Fantom
Ferite
Ficl
Flavors
FlowDesigner
Forth
FORTRAN
Fortress
FoxPro
G
GLSL
Go
Groovy
Guarded Horn Clauses
H
Hack
HAL/S
Hardware Join Java
Haskell
Haxe
HDCaml
HLASM
HLSL
HML
HOLON
HSP
HQ9+
Hydra
HyperTalk
I
Icon
ID
IDL (interactive data language)
Inform
InScript
INTERCAL
Io
IPL
ISWIM
J
J
Java
Jancy
Java FX Script（英語版）
JavaScript
JHDL
JScript .NET
J#
JSX
Jolie
Julia
K
KEMURI
Kent Recursive Calculator (KRC)
Kuin
KL1
KornShell (ksh)
Kotlin
L
LabVIEW
Lazy K
Lava
LFE（英語版）
Limbo
Linda
Linden Scripting Language (LSL)
Lingo
Lisaac
LISP
LOGO
Lola
LotusScript
Lua
Lucid
Lush
Lustre
M
M言語
m4
Malbolge
Mana
Maple
MASM
MATLAB
Mathematica
Max
Mercury（英語版）
Mesa
MIL/W
Mind
Mindscript
Miranda
Misa
MixJuice
ML
Modula-2
Modula-3
MONAmona
Mops
MQL4（英語版）
MQL5（英語版）
MSIL
MyHDL
N
Napier88
NASM
Nemerle
Nim
Noop
NScripter
O
O
Oberon
Oberon-2
Object Pascal
Object REXX
Object Tcl (OTcl)
Objective-C
Objective Caml (OCaml)
Occam
Ook!
OpenOffice.org Basic
OPS
Oz
P
P′′
Pacbase
PALASM
PARLOG
Pascal
PBASIC
PCN (program composition notation)
Perl
PHP
Pic
Piet
Pike
pine
PL/0
PL/I
Planner
pnuts
PostScript
PowerBuilder
PowerShell
Processing
Prograph CPX
Prolog
Pure Data
PureScript
Pxem
Python
Q
QtScript
Quorum
R
R
Racket
REALbasic
REBOL
REXX
RHDL
Ring
RPG
RPL（Reverse Polish LISP）
Ruby（汎用プログラミング言語）
Ruby（ハードウェア記述言語）
Rust
S
SAL
SAS
Sather
Scala
Scheme
Scratch
Seed7
Self
SFL
sh
Shakespeare
Short Code
Simula
Simulink
SISAL
SKILL
SLIP (プログラミング言語)（英語版）
Smalltalk
SMILEBASIC
SNOBOL
SPARK（英語版）
Squeak
Squirrel
SPSS
Standard ML
Stata
superC
Swift
SystemC
SystemVerilog
T
t3x
TAL
Telescript
TeX
Text Executive Programming Language（英語版）
Tcl
tcsh
Tenems
TL/I
Tonyu System
TTS
TTSneo
Turing
TypeScript
U
Unified Parallel C （UPC）
Unlambda
UnrealScript
V
VBScript
Visual Basic
Visual Basic .NET
Visual C .NET
Visual C++ .NET
Visual C# .NET
Verilog HDL
VHDL
Viscuit
Vala
W
Whirl
Whitespace
WICS
WMLScript
Wyvern
X
X10
XQuery
XSLT
)

Question.all.each do |q|
  q.tag_list << langs.sample(3)
  q.save!
end
