#!/usr/bin/fish

set install_location $__fish_config_dir/config.fish

if [ (ls -d */ | wc -l) != 0] 
    if [ (count $argv) != 1 ]
        echo "Error: Only accept one argument (Linux, WSL)"
        exit 1
    else
        for arg in $argv
            if test -d $arg
                set config_file "./$arg/config.fish"
                cp $config_file $install_location
                source $install_location
                echo "Success: $arg installed in $install_location"
                echo "Please run 'source $install_location' to apply the changes"
                echo
            else
                echo "Error: $arg is not a valid type, only accept (Linux, WSL)"
            end
        end
    end
else
    cp ./config.fish $install_location
    source $install_location
    echo "Success: Fish installed in $install_location"
    echo "Please run 'source $install_location' to apply the changes"
    echo
end




