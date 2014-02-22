function snapper-history
  for snpconfig in home root usr
    echo "snapper list for $snpconfig"
    sudo snapper -c $snpconfig list
  end
end

