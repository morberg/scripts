#! /usr/local/bin/fish
# Make an intelligent guess on whether or not to set proxy based on internet access
# https://stackoverflow.com/questions/929368/how-to-test-an-internet-connection-with-bash

if wget --tries=1 --timeout=3 -q --spider http://google.com
    # Internet connection working, do nothing
    echo "Internet access is working fine, no action."
else
    # No Internet access
    echo "Can't reach www.google.com"
    if set -q http_proxy
        echo "Removing proxies."
        set --erase --universal http_proxy
        set --erase --universal https_proxy
    else
        echo "Adding proxies."
        set --universal --export http_proxy http://wwwproxy.se.axis.com:3128
        set --universal --export https_proxy http://wwwproxy.se.axis.com:3128
    end
end
