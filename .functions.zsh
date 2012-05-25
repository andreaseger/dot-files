function c { cd ~/code/$1; }
compdef '_files -W ~/code -/' c
function h { cd ~/$1; }
compdef '_files -W ~ -/' h
