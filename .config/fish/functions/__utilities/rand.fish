function rand
 command dd if=/dev/urandom bs=124 count=1 2>/dev/null | sha256sum | cut -c1-$argv
end
