# The libinput-config library uses the /etc/ld.so.preload file
# To allow it to wrap libinput and modify its config settings.
# This script is based on the preload.sh script that comes with
# libinput-config and normally gets run by 'meson install'.

case "$(uname -m)" in
  *64) prefix="/usr/lib64" ;;
  *) prefix="/usr/lib" ;;
esac

lib="${prefix}/libinput-config.so"
ld_preload="/etc/ld.so.preload"

if test -z $(grep ${lib} ${ld_preload} 2> /dev/null); then
  echo ${lib} >> ${ld_preload}
fi
