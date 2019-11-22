#!/bin/zsh

read "?Choose name for the first folder (files will be placed as origin): " folder1
read "?Choose name for the second folder (files will be placed with the new atts): " folder2
read "?Choose name for the third folder (files will be placed as -1y old): " folder3

function creating_test_env {
    echo "Test files and folders will be created with the delays to make different time stamps for the testing purpose, please keep calm, it will took apprx. 15 seconds :)"
    touch ~/test1 && sleep 2 && touch ~/test2 && sleep 4 && touch ~/test3 && sleep 6
    mkdir ~/$folder1"_1" && sleep 2 && mkdir ~/$folder2"_2" && sleep 1 && mkdir ~/$folder3"_3"
    echo "Task of creating test files makred as completed"
}

function create_dir {
    echo "Creating Directories..."
    mkdir ~/$folder1
    mkdir ~/$folder2
    mkdir ~/$folder3
    echo "Directories created."
}

function copy_as_origin {
    cp -p ~/test1 ~/$folder1/
    cp -pr ~/$folder1"_1" ~/$folder1/
    echo "File and folder copied with the origin att"
}

function copy_as_current {
    cp ~/test2 ~/$folder2/
    cp -r ~/$folder2"_2" ~/$folder2/
    echo "Files and folder copied with the new att"
}

function copy_as_last_year {
    cp ~/test3 ~/$folder3/
    cp -r ~/$folder3"_3" ~/$folder3/
    touch -d "1 year ago" ~/$folder3/test3
    touch -d "1 year ago" ~/$folder3/$folder3"_3"/
    echo "Files and folder copied witht the time stamp for 1 year ago"
}

creating_test_env
create_dir
copy_as_origin
copy_as_current
copy_as_last_year

echo "All is done. Ending."