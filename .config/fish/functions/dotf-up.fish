function dotf-up
    dotf fetch
    dotf rebase --autostash --rebase-merges origin/m
end
