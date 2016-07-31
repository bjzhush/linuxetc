# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/bin/python /usr/lib/command-not-found -- $1
                   return $?
                elif [ -x /usr/share/command-not-found ]; then
		   /usr/bin/python /usr/share/command-not-found -- $1
                   return $?
		else
		   return 127
		fi
	}
fi
# function to print colorful words in shell
function ecolor()
{

case $1 in
	black)
	    color=30
	    ;;
	red)
	    color=31
	    ;; 
	green)
	    color=32
	    ;;
	yellow)
	    color=33
	    ;;
	blue)
	    color=34
	    ;;
	white)
	    color=37
	    ;;
	*)
	    echo $2
	    return 1
	    ;;
esac

echo -e "\033[49;${color};1m$2\033[0m" 

return 0

}
# load bashrc.local  ,put some uncompetical config  file here
if [ -f /etc/bashrc.local ]; then
	. /etc/bashrc.local
fi

if [ -f /home/zs/linuxetc/alias.bashrc ]; then
	. /home/zs/linuxetc/alias.bashrc
fi

