#!/bin/sh

ngx_path=$HOME/nginx
src_path=$HOME/ngx_cpp_dev

build_date="build at `date '+%Y.%m.%d %H:%M'`"
cc_opt="-g -O0"

ngxpp_module="--add-module=${src_path}/ngxpp"

http_modules="--add-module=${src_path}/modules/test     \
              --add-module=${src_path}/modules/echo     \
              --add-module=${src_path}/modules/datahook \
              --add-module=${src_path}/modules/filter   \
              --add-module=${src_path}/modules/upstream \
              --add-module=${src_path}/modules/loadbalance \
              --add-module=${src_path}/modules/subrequest \
              --add-module=${src_path}/modules/shmem    \
              --add-module=${src_path}/modules/variables
             "
opts="${ngxpp_module}     \
      ${http_modules}
      "
cd $ngx_path

./configure                     \
    --build="${build_date}"     \
    --with-cc-opt="${cc_opt}"   \
    ${opts}

#    --with-ld-opt="-lrt"

cd -
