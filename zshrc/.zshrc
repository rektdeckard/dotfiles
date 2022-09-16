# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colors for ls output
# LS_COLORS=$LS_COLORS:'di=1;33:ln=36' ; export LS_COLORS;

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tobiasfried/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tobiasfried/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tobiasfried/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tobiasfried/google-cloud-sdk/completion.zsh.inc'; fi

# git aliases
alias ga='git add'
alias gap='git add -p'
alias gc='git commit'
alias gca='git commit -a'
alias gcp='git commit -p'
alias gl='git log'
alias gs='git show'
alias ghpr='gh pr list | fzf --height 20% --reverse | xargs gh pr checkout'

# qatalog env
export BILLING_ENABLED=true
export STRIPE_PUBLIC_KEY='pk_test_51IUxVME6NNXgQe0p7JXGImsDMP17rrwKrEsvdRx3vZdIiqhEbnpEj1xmATas7clfhYa43vdKfn9mDcYtbo1BddDD00JZHM26NQ'
export STRIPE_SECRET_KEY='sk_test_51IUxVME6NNXgQe0pnJxUjPqjTQkbJ7Zz8qxF0aTmfscQbEorOfuR8z9ifgKoDo8TkeKZxfWYQHRpvlbD4mRim1l600SM0XHZU4'

# qatalog dev aliases
export MONOREPO_DIR=~/Documents/Dev/monorepo
alias cdr='cd $MONOREPO_DIR'
alias cdw='cd $MONOREPO_DIR/packages/web-client'
alias cdt='cd $MONOREPO_DIR/packages/toblerone-ui'
alias cdi='cd $MONOREPO_DIR/packages/browser-e2es/cypress/e2e'
alias cdm='cd $MONOREPO_DIR/packages/mosaiq-ui'
alias yso='yarn start onboarded'
alias rsc='yarn pm2 restart client'
alias rst='yarn pm2 restart toblerone-ui'
alias rsa='yarn pm2 restart api'
alias rsm='yarn pm2 restart mosaiq-ui'
alias rsl='yarn pm2 restart language-dot-work'
alias plc='yarn pm2 logs client'
alias plt='yarn pm2 logs toblerone-ui'
alias pla='yarn pm2 logs api'
alias plm='yarn pm2 logs mosaiq-ui'
alias pll='yarn pm2 logs language-dot-work'
alias e2es='cd $MONOREPO_DIR/packages/browser-e2es/cypress/e2e && yarn run cypress'

# db migration
function mdb {
  export PGHOST=127.0.0.1
  export PGPORT=5432
  export PGUSER=qatalog
  cd $MONOREPO_DIR
  packages/backend-common/scripts/ci/up-migrate.sh
  docker-compose restart hasura
}

# mosaiq
function mc {
  if [[ -z $1 ]]
  then
    echo "Must supply component name"
    return 1
  fi

  pushd
  cdm
  mkdir src/components/$1
  cat <<EOF > src/components/$1/$1.tsx
import React from 'react';

import { mosaiqStyled } from '../../lib';
import { ${1}Props } from './types';

const $1 = mosaiqStyled<${1}Props>(() => {
  return null;
});

export default $1;
EOF
  cat <<EOF > src/components/$1/$1.stories.ts
import $1 from '.';

export default {
  title: 'Uncategorized/$1',
  component: $1,
  argTypes: {},
  parameters: {
    // design: {
    //   type: 'figma',
    //   url: ''
    // }
  },
};

const defaultArgs = {};

export const Default = {
  args: { ...defaultArgs },
};
EOF
  touch src/components/$1/$1.styles.ts
  cat <<EOF > src/components/$1/index.ts
export { default } from './$1';
export * from './types';
EOF
  cat <<EOF > src/components/$1/types.ts
export interface ${1}Props {};
EOF

  echo "export * from './$1';" >> src/components/index.ts
  popd
}

# other aliases
alias nnn='NODE_PATH=${pwd} node'

export GPG_TTY=$(tty)

export CLICOLOR=1


# bun completions
[ -s "/Users/tobiasfried/.bun/_bun" ] && source "/Users/tobiasfried/.bun/_bun"

# bun
export BUN_INSTALL="/Users/tobiasfried/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# python
export PATH=/usr/local/opt/python/libexec/bin:$PATH 

# binaries
export PATH=/Users/tobiasfried/bin:$PATH

