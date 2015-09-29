# Get current git status
function get_git_prompt() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        ICON=""
        COLOR="${GRN}"

        # Parse the Status
        status=`git status 2>&1 | tee`
        dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
        untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
        ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
        behind=`echo -n "${status}" 2> /dev/null | grep "Your branch is behind" &> /dev/null; echo "$?"`
        newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
        renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
        deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`

        # Set the Prompt
        
        # Check branch status
        if [ "${ahead}" == "0" ]; then
            ICON="\xE2\x86\x91"
        fi
        if [ "${behind}" == "0" ]; then
            ICON="\xE2\x86\x93"
        fi
        if [ "${ahead}" == "0" ] && [ "${behind}" == "0" ]; then
            ICON="\xE2\x86\x95"
        fi
        
        # Check file status
        if [ "${untracked}" == "0" ]; then
            COLOR="${RED}"
        fi
        if [ "${renamed}" == "0" ]; then
            COLOR="${YEL}"
        fi
        if [ "${newfile}" == "0" ]; then
            COLOR="${YEL}"
        fi
        if [ "${deleted}" == "0" ]; then
            COLOR="${YEL}"
        fi
        if [ "${dirty}" == "0" ]; then
            COLOR="${YEL}"
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
