# The libinput-config library uses the /etc/ld.so.preload file
# To allow it to wrap libinput and modify its config settings.
# This script is based on the unpreload.sh script that comes with
# libinput-config and normally gets run by 'meson uninstall'.

case "$(uname -m)" in
  *64) prefix="/usr/lib64" ;;
  *) prefix="/usr/lib" ;;
esac

lib="${prefix}/libinput-config.so"
ld_preload="/etc/ld.so.preload"

if test -f ${ld_preload}; then
 sed -i "\|${lib}|d" ${ld_preload} 
fi
