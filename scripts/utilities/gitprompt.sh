# Get current git status
function get_git_prompt() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        ICON=""
        COLOR="${GRN}"

        # Parse the Status
        status=`git status 2>&1 | tee`
        
        ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
        behind=`echo -n "${status}" 2> /dev/null | grep "Your branch is behind" &> /dev/null; echo "$?"`
        diverged=`echo -n "${status}" 2> /dev/null | grep "have diverged" &> /dev/null; echo "$?"`
        
        untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
        unstaged=`echo -n "${status}" 2> /dev/null | grep "Changes not staged for commit" &> /dev/null; echo "$?"`
        tocommit=`echo -n "${status}" 2> /dev/null | grep "Changes to be committed" &> /dev/null; echo "$?"`
        
        # dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
        # newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
        # renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
        # deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`

        # Set the Prompt
        
        # Check branch status
        if [ "${ahead}" == "0" ]; then
            ICON="\xE2\x86\x91"
        elif [ "${behind}" == "0" ]; then
            ICON="\xE2\x86\x93"
        elif [ "${diverged}" == "0" ]; then
            ICON="\xE2\x86\x97"
        fi
        
        # Check file status
        if [ "${untracked}" == "0" ]; then
            COLOR="${RED}"
        fi
        if [ "${unstaged}" == "0" ]; then
            COLOR="${YEL}"
        fi
        if [ "${tocommit}" == "0" ]; then
            COLOR="${BGRN}"
        fi
        # if [ "${ICON}" != "" ]; then
            # ICON="$ICON"
        # fi
        
        echo -e " [${COLOR}${BRANCH}${RST}${ICON}]"
    else
        echo ""
    fi
}


export GIT_PS1="\`get_git_prompt\`"
