if [ -z $DISPLAY ] && [ $(tty)==/dev/tty1 ]; then
  trap '
    test -n "$SSH_AGENT_PID" && eval `ssh-agent -k`
    test -n "$SSH2_AGENT_PID" && kill $SSH2_AGENT_PID
  ' 0

  if [ "$SSH_AGENT_PID" = "" ]; then
    eval `ssh-agent`
    /usr/bin/tty > /dev/null && ssh-add
  fi

  startx
fi
