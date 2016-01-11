function snapper-history
  for snpconfig in home root opt
    echo "snapper list for $snpconfig"
    sudo snapper -c $snpconfig list
    echo ""
  end
end

