function press($note, [int] $interval ) {
    if($interval -eq 0){
        $interval = 350;}

    $interval = $interval*1.4;
    Write-Host $interval;
    [console]::beep($note, $interval);
}

function C($interval) {
    press 261 $interval
}
function CSharp($interval) {
    press 277 $interval
}
function D($interval) {
    press 293 $interval
}
function DSharp($interval) {
    press 311 $interval
}
function E($interval) {
    press 329 $interval
}
function F($interval) {
    press 349 $interval
}
function FSharp($interval) {
    press 370 $interval
}
function G($interval) {
    press 392 $interval
}
function GSharp($interval) {
    press 415 $interval
}
function A($interval) {
    press 440 $interval
}
function ASharp($interval) {
    press 466 $interval
}
function B($interval) {
    press 493 $interval
}
function C1($interval) {
    press 523 $interval
}
function D1($interval) {
    press 555 $interval
}
function E1($interval) {
    press 587 $interval
}
function F1($interval) {
    press 622 $interval
}
function G1($interval) {
    press 659 $interval
}
function A1($interval) {
    press 698 $interval
}
function B1($interval) {
    press 739 $interval
}
function C2($interval) {
    press 784 $interval
}

G
G
G
DSharp 250
ASharp 25
G
DSharp 250
ASharp 25   #-l 25 -f 466 -D 100
G 700   #-l 700 -f 392 -D 100
E1      #-l 350 -f 5872 -D 100
E1      #-l 350 -f 5872 -D 100
E1      #-l 350 -f 5872 -D 100
F1 250  #-l 250 -f 6226 -D 100
ASharp 25   # -l 25 -f 466 -D 100
FSharp      # -l 350 -f 3699 -D 100
DSharp 250  # -l 250 -f 311 -D 100
ASharp 25   # -l 25 -f 466 -D 100
G 700   # -l 700 -f 392 -D 100
C2      # -l 350 -f 784 -D 100
G 250   # -l 250 -f 392 -D 100
G 25    # -l 25 -f 392 -D 100
C2      # -l 350 -f 784 -D 100
B1 250  # -l 250 -f 7398 -D 100
A1 25   # -l 25 -f 6986 -D 100
G1 25   # -l 25 -f 6596 -D 100
F1 25   # -l 25 -f 6226 -D 100
G1 50   # -l 50 -f 6596 -D 400
GSharp 25   # -l 25 -f 415 -D 200
D1      # -l 350 -f 5546 -D 100
C1 250  # -l 250 -f 5235 -D 100
B 25    # -l 25 -f 4938 -D 100
ASharp 25   # -l 25 -f 4666 -D 100
A 25    # -l 25 -f 440 -D 100
ASharp 50   # -l 50 -f 4666 -D 400
DSharp 25   # -l 25 -f 3113 -D 200
FSharp      # -l 350 -f 3699 -D 100
DSharp 250  # -l 250 -f 3113 -D 100
G 25    # -l 25 -f 392 -D 100
ASharp      # -l 350 -f 4666 -D 100
G 250   # -l 250 -f 392 -D 100
ASharp 25   # -l 25 -f 4666 -D 100
E1 700  # -l 700 -f 5872 -D 100
C2      # -l 350 -f 784 -D 100
G 250   # -l 250 -f 392 -D 100
G 25    # -l 25 -f 392 -D 100
C2      # -l 350 -f 784 -D 100
B1 250  # -l 250 -f 7398 -D 100
A1 25   # -l 25 -f 6986 -D 100
G1 25   # -l 25 -f 6596 -D 100
F1 25   # -l 25 -f 6226 -D 100
G1 50   # -l 50 -f 6596 -D 400
GSharp 25   # -l 25 -f 415 -D 200
D1      # -l 350 -f 5546 -D 100
C1 250  # -l 250 -f 5235 -D 100
B 25    # -l 25 -f 4938 -D 100
A1 25   # -l 25 -f 4666 -D 100
A 25    # -l 25 -f 440 -D 100
ASharp 50   # -l 50 -f 4666 -D 400
DSharp 25   # -l 25 -f 3113 -D 200
G       # -l 350 -f 392 -D 100
DSharp 250  # -l 250 -f 3113 -D 100
ASharp 25   # -l 25 -f 4666 -D 100
G 300   # -l 300 -f 3920 -D 150
DSharp 250  # -l 250 -f 3113 -D 100
ASharp 25   # -l 25 -f 4666 -D 100
G 700   # -l 700 -f 392
