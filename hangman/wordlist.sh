#!/usr/bin/env bash
set -uo pipefail

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
wordfile="$dir/wordlist_de.txt"

init_wordfile(){
  [[ -s "$wordfile" ]] && return
  cat >"$wordfile"<<'LIST'
apfel
birne
banane
kirsche
traube
pfirsich
melone
wasserbrot
broetchen
butter
kaese
schokolade
kaffee
tee
milch
salat
tomate
gurke
karotte
zwiebel
knoblauch
kartoffel
reis
nudeln
pizza
burger
suppe
kuchen
kekse
muffin
croissant
eis
hund
katze
pferd
vogel
fisch
auto
fahrrad
bus
zug
taxi
flugzeug
schiff
haus
wohnung
garten
blume
baum
wald
berg
see
fluss
strand
sommer
herbst
winter
fruehling
sonne
mond
stern
wolke
regen
schnee
arbeit
schule
freund
familie
musik
sport
buch
film
spiel
LIST
}

choose_word() {
	init_wordfile
	local w=""
	# so lange wiederholen, bis wir wirklich ein nicht‑leeres Wort haben
	while [[ -z "$w" ]]; do
		w=$(shuf -n1 "$wordfile" | tr -d '\r\n')
	done
	# einmalig anhängen, falls neu (nice‑to‑have)
	grep -qxF "$w" "$wordfile" || echo "$w" >> "$wordfile"
	echo "$w"
}
