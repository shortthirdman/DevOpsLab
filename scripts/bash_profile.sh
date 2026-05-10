#!/bin/bash

mkcd() {
  mkdir -p "$1" && cd "$1"
}

up() {
  local d=""
  for ((i=1;i<=$1;i++)); do
    d+="../"
  done
  cd "$d"
}

ff() {
  find . -type f -iname "*$1*"
}

fd() {
  find . -type d -iname "*$1*"
}

psg() {
  ps aux | grep -i "$1" | grep -v grep
}

h() {
  history | tail -n "$1"
}

hg() {
  history | grep "$1"
}

dirsize() {
  du -sh "$1"
}

extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz) tar xzf "$1" ;;
      *.bz2) bunzip2 "$1" ;;
      *.rar) unrar x "$1" ;;
      *.gz) gunzip "$1" ;;
      *.tar) tar xf "$1" ;;
      *.tbz2) tar xjf "$1" ;;
      *.tgz) tar xzf "$1" ;;
      *.zip) unzip "$1" ;;
      *.7z) 7z x "$1" ;;
      *) echo "unknown archive" ;;
    esac
  fi
}

serve() {
  python3 -m http.server "${1:-8000}"
}

myip() {
  curl -s ifconfig.me
}

ipinfo() {
  dig +short "$1"
}

ports() {
  ss -tuln
}

cls() {
  clear && printf '\e[3J'
}

rm() {
  ls -FCsd -- "$@"
  read -p 'Delete? [y/N] ' ans
  if [ "$ans" = "y" ]; then
    command rm -rf -- "$@"
  fi
}
