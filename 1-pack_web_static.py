#!/usr/bin/python3

import os
from fabric.api import local
from datetime import datetime


def do_pack():
    now_time = datetime.now().strftime("%Y%m%d%H%M%S")
    file_bk = "versions/web_static_{:s}.tgz".format(now_time)
    local("mkdir -p versions")
    local("tar -cvzf {:s} web_static".format(file_bk))
    if os.path.exist(file_bk):
        return file_bk
    else:
        return None
