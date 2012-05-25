# Usage: extract <file>
# Description: extracts archived files (maybe)
extract () {
    if [ -f $1 ]; then
            case $1 in
            *.tar.bz2)  tar -jxvf $1        ;;
            *.tar.gz)   tar -zxvf $1        ;;
            *.bz2)      bzip2 -d $1         ;;
            *.gz)       gunzip -d $1        ;;
            *.tar)      tar -xvf $1         ;;
            *.tgz)      tar -zxvf $1        ;;
            *.zip)      unzip $1            ;;
            *.Z)        uncompress $1       ;;
            *.rar)      unrar x $1            ;;
            *)          echo "'$1' Error. Please go away" ;;
            esac
            else
            echo "'$1' is not a valid file"
  fi
  }

# Usage: show-archive <archive>
# Description: view archive without unpack
show-archive() {
   if [ -f $1 ]; then
         case $1 in
         *.tar.bz2)     tar -jtf $1 ;;
         *.tar.gz)      tar -ztf $1 ;;
         *.tar)         tar -tf $1  ;;
         *.tgz)         tar -ztf $1 ;;
         *.zip)         unzip -l $1 ;;
         *.rar)         rar vb $1   ;;
         *)             echo "'$1' Error. Please go away" ;;
         esac
         else
         echo "'$1' is not a valid archive"
  fi
  }