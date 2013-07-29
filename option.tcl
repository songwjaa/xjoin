# function to easily parse variable number of
# arguments in procedures
# a call like:
# myproc req1 req2 -opt1 1 -opt2 2 -opt3
#
# in myproc:
# puts [option::value -opt1 $args]
#
# Laurent Cazalet


package provide util 1.0

namespace eval option {

}


# opt: name of the option to lookup
# vars: list of all arguments
# returns true if found in list of args, false otherwise
proc option::exist { opt vars } {
    set i [ lsearch -exact $vars $opt ]
    return [expr $i != -1 ]
}

# opt: name of the option to lookup
# vars: list of all arguments
# returns the value of the option
#         (element right after the option name)
proc option::value { opt vars {defaultvalue 0 } } {
    set i [lsearch -exact $vars $opt ]
    if { $i != -1 } {
        return [lindex $vars [expr $i + 1] ]
    } else {
        return $defaultvalue
    }
}



