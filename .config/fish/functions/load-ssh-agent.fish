function load-ssh-agent
  set -l ssh_env $HOME/.ssh/env
  set -l ssh_agent_sockets (find /tmp/ -type s -name agent.\* 2> /dev/null | grep '/tmp/ssh-.*/agent.*')
  #set -l gnome_keyring_sockets (find /run/user/(id -u) -type s -name ssh 2> /dev/null | grep 'keyring-.*/ssh$')
  #set -l sockets $gnome_keyring_sockets $ssh_agent_sockets
  set -l socket $ssh_agent_sockets[1]

  if test $socket
    #echo "setting SSH_AUTH_SOCK to $socket"
    if test (grep $socket $ssh_env)
      . $ssh_env
    else
      setenv SSH_AUTH_SOCK $socket
    end
  else
    #echo 'no socket running, starting a new one'
    ssh-agent -c | sed 's/^echo/#echo/' > $ssh_env
    chmod 600 $ssh_env
    . $ssh_env
  end

  for x in $__local_identities
    if not test (ssh-add -l | grep $x)
      ssh-add $x
    end
  end

  if test (ssh-add -l | grep "The agent has no identities")
    #echo 'loading identities'
    ssh-add
    for x in $__local_identities
      ssh-add $x
    end
  end
end
