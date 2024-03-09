set current_script_path [info script]
set current_dir [file dirname $current_script_path]
set opt_file [file join $current_dir "opt.tcl"]
if {[file exists $opt_file]} {
    puts "Sourcing $opt_file"
    source $opt_file
} else {
    puts "No opt.tcl file found in the current dir"
}