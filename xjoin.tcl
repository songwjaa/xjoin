#! /usr/bin/tclsh -f 


source [file join [file dirname [info script]] option.tcl]

set index [option::value -index $argv "index"]
set content [option::value -content $argv "content"]
set F [option::value -F $argv ";"]

if [expr [file exists $index] && [file exists $content]] {
    set fI [open $index "r"]
    set data [read $fI]

    foreach key [split $data \n] {
        if ![string equal $key ""] {
            set line [exec grep $key $content]
            
            if ![string equal $line ""] {
                set value [lindex $line 1]
                puts "$key $F $value"
            }
        }
    }
    close $fI
}

