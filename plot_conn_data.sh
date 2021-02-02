
get_source_dir(){
    ( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd )
}

while true
do 
    (
    cd $(get_source_dir)
    ./plot_data.py 
    sleep 30
)
done 
