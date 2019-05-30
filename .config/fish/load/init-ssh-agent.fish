if test -z "$SSH_ENV"
    set -xg SSH_ENV $HOME/.ssh/environment
end

if not __ssh_agent_is_started
    __ssh_agent_start
end

for x in $__local_identities
  if not test (ssh-add -l | grep $x)
    ssh-add $x
  end
end

if test (ssh-add -l | grep "The agent has no identities")
  ssh-add
  for x in $__local_identities
    ssh-add $x
  end
end