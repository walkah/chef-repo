name "openphoto"
description "Deploys an OpenPhoto instance"
run_list("role[lamp]",
         "recipe[git]",
         "recipe[openphoto]"
)        
