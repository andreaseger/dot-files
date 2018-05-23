function __fish_oc_projects
  oc projects -q
end

function __fish_oc_all
  oc get all -o name
end

function __fish_oc_pods
  oc get pods -o name
end

function __fish_oc_pods_no_prefix
  oc get pods -o name | cut -d/ -f2
end

function __fish_oc_buildconfigs
  oc get bc -o name | cut -d/ -f2
end


function __fish_oc_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'oc' ]
    return 0
  end
  return 1
end

function __fish_oc_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

function __fish_oc_resource
  for r in appliedclusterresourcequota appliedclusterresourcequotas all brokertemplateinstance brokertemplateinstances build buildconfig buildconfigs builds certificatesigningrequest certificatesigningrequests cluster clusternetwork clusternetworks clusterpolicies clusterpolicy clusterpolicybinding clusterpolicybindings clusterresourcequota clusterresourcequotas clusterrole clusterrole clusterrolebinding clusterrolebinding clusterrolebindings clusterrolebindings clusterroles clusterroles clusters cm componentstatus componentstatuses configmap configmaps cronjob cronjobs cs csr daemonset daemonsets deploy deployment deploymentconfig deploymentconfigs deployments ds egressnetworkpolicies egressnetworkpolicy endpoints endpoints ep ev event events group groups horizontalpodautoscaler horizontalpodautoscalers hostsubnet hostsubnets hpa hpa identities identity image images imagestream imagestreamimage imagestreamimages imagestreams imagestreamtag imagestreamtags ing ingress ingresses ispersonalsubjectaccessreview ispersonalsubjectaccessreviews job jobs limitrange limitranges limits namespace namespaces netnamespace netnamespaces networkpolicies networkpolicy no node nodes ns oauthaccesstoken oauthaccesstokens oauthauthorizetoken oauthauthorizetokens oauthclient oauthclientauthorization oauthclientauthorizations oauthclients pdb persistentvolume persistentvolumeclaim persistentvolumeclaims persistentvolumes po pod poddisruptionbudget poddisruptionbudgets podpreset podpresets pods podsecuritypolicies podsecuritypolicy podtemplate podtemplates policies policy policybinding policybindings project projects pv pvc quota rc replicaset replicasets replicationcontroller replicationcontrollers resourcequota resourcequotas role role rolebinding rolebinding rolebindingrestriction rolebindingrestrictions rolebindings rolebindings roles roles route routes rs sa secret secrets securitycontextconstraints securitycontextconstraintses service serviceaccount serviceaccounts services statefulset statefulsets status statuses storageclass storageclasses svc template templateinstance templateinstances templates thirdpartyresource thirdpartyresourcedata thirdpartyresourcedatas thirdpartyresources user useridentitymapping useridentitymappings users
    echo $r
  end
end

### commands

complete -f -c oc -n '__fish_oc_needs_command' -a types           -d "An introduction to concepts and types"
complete -f -c oc -n '__fish_oc_needs_command' -a login           -d "Log in to a server"
complete -f -c oc -n '__fish_oc_needs_command' -a new-project     -d "Request a new project"
complete -f -c oc -n '__fish_oc_needs_command' -a new-app         -d "Create a new application"
complete -f -c oc -n '__fish_oc_needs_command' -a status          -d "Show an overview of the current project"
complete -f -c oc -n '__fish_oc_needs_command' -a project         -d "Switch to another project"
complete -f -c oc -n '__fish_oc_needs_command' -a projects        -d "Display existing projects"
complete -f -c oc -n '__fish_oc_needs_command' -a explain         -d "Documentation of resources"
complete -f -c oc -n '__fish_oc_needs_command' -a cluster         -d "Start and stop OpenShift cluster"
complete -f -c oc -n '__fish_oc_needs_command' -a rollout         -d "Manage a Kubernetes deployment or OpenShift deployment config"
complete -f -c oc -n '__fish_oc_needs_command' -a deploy          -d "View, start, cancel, or retry a deployment"
complete -f -c oc -n '__fish_oc_needs_command' -a rollback        -d "Revert part of an application back to a previous deployment"
complete -f -c oc -n '__fish_oc_needs_command' -a new-build       -d "Create a new build configuration"
complete -f -c oc -n '__fish_oc_needs_command' -a start-build     -d "Start a new build"
complete -f -c oc -n '__fish_oc_needs_command' -a cancel-build    -d "Cancel running, pending, or new builds"
complete -f -c oc -n '__fish_oc_needs_command' -a import-image    -d "Imports images from a Docker registry"
complete -f -c oc -n '__fish_oc_needs_command' -a tag             -d "Tag existing images into image streams"
complete -f -c oc -n '__fish_oc_needs_command' -a get             -d "Display one or many resources"
complete -f -c oc -n '__fish_oc_needs_command' -a describe        -d "Show details of a specific resource or group of resources"
complete -f -c oc -n '__fish_oc_needs_command' -a edit            -d "Edit a resource on the server"
complete -f -c oc -n '__fish_oc_needs_command' -a set             -d "Commands that help set specific features on objects"
complete -f -c oc -n '__fish_oc_needs_command' -a label           -d "Update the labels on a resource"
complete -f -c oc -n '__fish_oc_needs_command' -a annotate        -d "Update the annotations on a resource"
complete -f -c oc -n '__fish_oc_needs_command' -a expose          -d "Expose a replicated application as a service or route"
complete -f -c oc -n '__fish_oc_needs_command' -a delete          -d "Delete one or more resources"
complete -f -c oc -n '__fish_oc_needs_command' -a scale           -d "Change the number of pods in a deployment"
complete -f -c oc -n '__fish_oc_needs_command' -a autoscale       -d "Autoscale a deployment config, deployment, replication controller, or replica set"
complete -f -c oc -n '__fish_oc_needs_command' -a secrets         -d "Manage secrets"
complete -f -c oc -n '__fish_oc_needs_command' -a serviceaccounts -d "Manage service accounts in your project"
complete -f -c oc -n '__fish_oc_needs_command' -a logs            -d "Print the logs for a resource"
complete -f -c oc -n '__fish_oc_needs_command' -a rsh             -d "Start a shell session in a pod"
complete    -c oc -n '__fish_oc_needs_command' -a rsync           -d "Copy files between local filesystem and a pod"
complete -f -c oc -n '__fish_oc_needs_command' -a port-forward    -d "Forward one or more local ports to a pod"
complete -f -c oc -n '__fish_oc_needs_command' -a debug           -d "Launch a new instance of a pod for debugging"
complete -f -c oc -n '__fish_oc_needs_command' -a exec            -d "Execute a command in a container"
complete -f -c oc -n '__fish_oc_needs_command' -a proxy           -d "Run a proxy to the Kubernetes API server"
complete -f -c oc -n '__fish_oc_needs_command' -a attach          -d "Attach to a running container"
complete -f -c oc -n '__fish_oc_needs_command' -a run             -d "Run a particular image on the cluster"
complete    -c oc -n '__fish_oc_needs_command' -a cp              -d "Copy files and directories to and from containers."
complete -f -c oc -n '__fish_oc_needs_command' -a adm             -d "Tools for managing a cluster"
complete    -c oc -n '__fish_oc_needs_command' -a create          -d "Create a resource by filename or stdin"
complete    -c oc -n '__fish_oc_needs_command' -a replace         -d "Replace a resource by filename or stdin"
complete    -c oc -n '__fish_oc_needs_command' -a apply           -d "Apply a configuration to a resource by filename or stdin"
complete -f -c oc -n '__fish_oc_needs_command' -a patch           -d "Update field(s) of a resource using strategic merge patch"
complete -f -c oc -n '__fish_oc_needs_command' -a process         -d "Process a template into list of resources"
complete -f -c oc -n '__fish_oc_needs_command' -a export          -d "Export resources so they can be used elsewhere"
complete -f -c oc -n '__fish_oc_needs_command' -a extract         -d "Extract secrets or config maps to disk"
complete -f -c oc -n '__fish_oc_needs_command' -a idle            -d "Idle scalable resources"
complete -f -c oc -n '__fish_oc_needs_command' -a observe         -d "Observe changes to resources and react to them (experimental)"
complete -f -c oc -n '__fish_oc_needs_command' -a policy          -d "Manage authorization policy"
complete -f -c oc -n '__fish_oc_needs_command' -a auth            -d "Inspect authorization"
complete    -c oc -n '__fish_oc_needs_command' -a convert         -d "Convert config files between different API versions"
complete -f -c oc -n '__fish_oc_needs_command' -a import          -d "Commands that import applications"
complete -f -c oc -n '__fish_oc_needs_command' -a logout          -d "End the current server session"
complete    -c oc -n '__fish_oc_needs_command' -a config          -d "Change configuration files for the client"
complete -f -c oc -n '__fish_oc_needs_command' -a whoami          -d "Return information about the current session"
complete -f -c oc -n '__fish_oc_needs_command' -a completion      -d "Output shell completion code for the specified shell (bash or zsh)"
complete -f -c oc -n '__fish_oc_needs_command' -a help            -d "Help about any command"
complete -f -c oc -n '__fish_oc_needs_command' -a version         -d "Display client and server versions"


complete -f -c oc -n '__fish_oc_using_command project' -a '(__fish_oc_projects)'

complete -f -c oc -n '__fish_oc_using_command describe' -a '(__fish_oc_all)'

complete -f -c oc -n '__fish_oc_using_command rsh' -a '(__fish_oc_pods)'
complete -f -c oc -n '__fish_oc_using_command rsync' -a '(__fish_oc_pods_no_prefix)'

complete -f -c oc -n '__fish_oc_using_command start-build' -a '(__fish_oc_buildconfigs)'

complete -f -c oc -n '__fish_oc_using_command logs' -a '(__fish_oc_all)'
complete -f -c oc -n '__fish_oc_using_command logs' -s f -d "logs should be streamed."

complete -f -c oc -n '__fish_oc_using_command edit' -a '(__fish_oc_resource)'
complete -f -c oc -n '__fish_oc_using_command export' -a '(__fish_oc_resource)'
complete -f -c oc -n '__fish_oc_using_command get' -a '(__fish_oc_resource)'
