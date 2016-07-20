# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

#Po add
unset JAVA_TOOL_OPTIONS
export Po_bin=/home/benson/bin
export PATH=$PATH:$Po_bin
export OBU39=/home/benson/Andia_data/SourceCode_codebase/OBU3_9
export AT302=/home/benson/Andia_data/SourceCode_codebase/AT302
export suspend9SVN=/home/benson/Andia_data/android/source_code/OBU3_code/9inch/from_svn/suspend9
export luxgen9SVN=/home/benson/Andia_data/android/source_code/OBU3_code/9inch/from_svn/luxgen9
export system9SVN=/home/benson/Andia_data/android/source_code/OBU3_code/9inch/from_svn/system9
export system9org=/home/benson/Andia_data/android/source_code/OBU3_code/9inch/from_svn/sys9_bsp_tar

#Po End

