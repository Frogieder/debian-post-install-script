alias hamachi_daemon='sudo /etc/init.d/logmein-hamachi'
alias hamachi='sudo hamachi'
alias join_sf='sudo hamachi join SF4-server SKYfactory4'
alias bind_jeblina='sudo rfcomm bind rfcomm0 98:D3:11:F8:A2:62'
alias docker_nvidia='sudo docker container run -it --volume /home/martin/Documents/programming/cuda:/mnt/cuda_include --gpus all julianassmann/opencv-cuda:cuda-10.2-opencv-4.2'
alias retry_dl='wget -c --retry-connrefused --tries=0 --timeout=5'
alias dGPU_render="__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia"
alias download_sound="youtube-dl -x --audio-format mp3"

function cl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        ls -F --color=auto
}
