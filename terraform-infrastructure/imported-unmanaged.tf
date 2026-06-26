# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourceGroups/thanu-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/coderaptor-workload-mi"
resource "azurerm_user_assigned_identity" "workload" {
  isolation_scope     = null
  location            = "australiaeast"
  name                = "coderaptor-workload-mi"
  resource_group_name = "thanu-rg"
  tags                = {}
}

# __generated__ by Terraform from "/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourceGroups/thanu-rg/providers/Microsoft.AlertsManagement/prometheusRuleGroups/KubernetesRecordingRulesRuleGroup - coderaptor-prod-aks"
resource "azurerm_monitor_alert_prometheus_rule_group" "kubernetes_recording" {
  cluster_name        = "coderaptor-prod-aks"
  description         = "Kubernetes Recording Rules RuleGroup"
  interval            = "PT1M"
  location            = "australiaeast"
  name                = "KubernetesRecordingRulesRuleGroup - coderaptor-prod-aks"
  resource_group_name = "thanu-rg"
  rule_group_enabled  = true
  scopes              = ["/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourcegroups/defaultresourcegroup-eau/providers/microsoft.monitor/accounts/defaultazuremonitorworkspace-eau", "/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourcegroups/thanu-rg/providers/microsoft.containerservice/managedclusters/coderaptor-prod-aks"]
  tags                = {}
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (cluster, namespace, pod, container) (  irate(container_cpu_usage_seconds_total{job=\"cadvisor\", image!=\"\"}[5m])) * on (cluster, namespace, pod) group_left(node) topk by (cluster, namespace, pod) (  1, max by(cluster, namespace, pod, node) (kube_pod_info{node!=\"\"}))"
    for         = null
    labels      = {}
    record      = "node_namespace_pod_container:container_cpu_usage_seconds_total:sum_irate"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "container_memory_working_set_bytes{job=\"cadvisor\", image!=\"\"}* on (namespace, pod) group_left(node) topk by(namespace, pod) (1,  max by(namespace, pod, node) (kube_pod_info{node!=\"\"}))"
    for         = null
    labels      = {}
    record      = "node_namespace_pod_container:container_memory_working_set_bytes"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "container_memory_rss{job=\"cadvisor\", image!=\"\"}* on (namespace, pod) group_left(node) topk by(namespace, pod) (1,  max by(namespace, pod, node) (kube_pod_info{node!=\"\"}))"
    for         = null
    labels      = {}
    record      = "node_namespace_pod_container:container_memory_rss"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "container_memory_cache{job=\"cadvisor\", image!=\"\"}* on (namespace, pod) group_left(node) topk by(namespace, pod) (1,  max by(namespace, pod, node) (kube_pod_info{node!=\"\"}))"
    for         = null
    labels      = {}
    record      = "node_namespace_pod_container:container_memory_cache"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "container_memory_swap{job=\"cadvisor\", image!=\"\"}* on (namespace, pod) group_left(node) topk by(namespace, pod) (1,  max by(namespace, pod, node) (kube_pod_info{node!=\"\"}))"
    for         = null
    labels      = {}
    record      = "node_namespace_pod_container:container_memory_swap"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "kube_pod_container_resource_requests{resource=\"memory\",job=\"kube-state-metrics\"}  * on (namespace, pod, cluster)group_left() max by (namespace, pod, cluster) (  (kube_pod_status_phase{phase=~\"Pending|Running\"} == 1))"
    for         = null
    labels      = {}
    record      = "cluster:namespace:pod_memory:active:kube_pod_container_resource_requests"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (namespace, cluster) (    sum by (namespace, pod, cluster) (        max by (namespace, pod, container, cluster) (          kube_pod_container_resource_requests{resource=\"memory\",job=\"kube-state-metrics\"}        ) * on(namespace, pod, cluster) group_left() max by (namespace, pod, cluster) (          kube_pod_status_phase{phase=~\"Pending|Running\"} == 1        )    ))"
    for         = null
    labels      = {}
    record      = "namespace_memory:kube_pod_container_resource_requests:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "kube_pod_container_resource_requests{resource=\"cpu\",job=\"kube-state-metrics\"}  * on (namespace, pod, cluster)group_left() max by (namespace, pod, cluster) (  (kube_pod_status_phase{phase=~\"Pending|Running\"} == 1))"
    for         = null
    labels      = {}
    record      = "cluster:namespace:pod_cpu:active:kube_pod_container_resource_requests"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (namespace, cluster) (    sum by (namespace, pod, cluster) (        max by (namespace, pod, container, cluster) (          kube_pod_container_resource_requests{resource=\"cpu\",job=\"kube-state-metrics\"}        ) * on(namespace, pod, cluster) group_left() max by (namespace, pod, cluster) (          kube_pod_status_phase{phase=~\"Pending|Running\"} == 1        )    ))"
    for         = null
    labels      = {}
    record      = "namespace_cpu:kube_pod_container_resource_requests:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "kube_pod_container_resource_limits{resource=\"memory\",job=\"kube-state-metrics\"}  * on (namespace, pod, cluster)group_left() max by (namespace, pod, cluster) (  (kube_pod_status_phase{phase=~\"Pending|Running\"} == 1))"
    for         = null
    labels      = {}
    record      = "cluster:namespace:pod_memory:active:kube_pod_container_resource_limits"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (namespace, cluster) (    sum by (namespace, pod, cluster) (        max by (namespace, pod, container, cluster) (          kube_pod_container_resource_limits{resource=\"memory\",job=\"kube-state-metrics\"}        ) * on(namespace, pod, cluster) group_left() max by (namespace, pod, cluster) (          kube_pod_status_phase{phase=~\"Pending|Running\"} == 1        )    ))"
    for         = null
    labels      = {}
    record      = "namespace_memory:kube_pod_container_resource_limits:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "kube_pod_container_resource_limits{resource=\"cpu\",job=\"kube-state-metrics\"}  * on (namespace, pod, cluster)group_left() max by (namespace, pod, cluster) ( (kube_pod_status_phase{phase=~\"Pending|Running\"} == 1) )"
    for         = null
    labels      = {}
    record      = "cluster:namespace:pod_cpu:active:kube_pod_container_resource_limits"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (namespace, cluster) (    sum by (namespace, pod, cluster) (        max by (namespace, pod, container, cluster) (          kube_pod_container_resource_limits{resource=\"cpu\",job=\"kube-state-metrics\"}        ) * on(namespace, pod, cluster) group_left() max by (namespace, pod, cluster) (          kube_pod_status_phase{phase=~\"Pending|Running\"} == 1        )    ))"
    for         = null
    labels      = {}
    record      = "namespace_cpu:kube_pod_container_resource_limits:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "max by (cluster, namespace, workload, pod) (  label_replace(    label_replace(      kube_pod_owner{job=\"kube-state-metrics\", owner_kind=\"ReplicaSet\"},      \"replicaset\", \"$1\", \"owner_name\", \"(.*)\"    ) * on(replicaset, namespace) group_left(owner_name) topk by(replicaset, namespace) (      1, max by (replicaset, namespace, owner_name) (        kube_replicaset_owner{job=\"kube-state-metrics\"}      )    ),    \"workload\", \"$1\", \"owner_name\", \"(.*)\"  ))"
    for         = null
    labels = {
      workload_type = "deployment"
    }
    record   = "namespace_workload_pod:kube_pod_owner:relabel"
    severity = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "max by (cluster, namespace, workload, pod) (  label_replace(    kube_pod_owner{job=\"kube-state-metrics\", owner_kind=\"DaemonSet\"},    \"workload\", \"$1\", \"owner_name\", \"(.*)\"  ))"
    for         = null
    labels = {
      workload_type = "daemonset"
    }
    record   = "namespace_workload_pod:kube_pod_owner:relabel"
    severity = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "max by (cluster, namespace, workload, pod) (  label_replace(    kube_pod_owner{job=\"kube-state-metrics\", owner_kind=\"StatefulSet\"},    \"workload\", \"$1\", \"owner_name\", \"(.*)\"  ))"
    for         = null
    labels = {
      workload_type = "statefulset"
    }
    record   = "namespace_workload_pod:kube_pod_owner:relabel"
    severity = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "max by (cluster, namespace, workload, pod) (  label_replace(    kube_pod_owner{job=\"kube-state-metrics\", owner_kind=\"Job\"},    \"workload\", \"$1\", \"owner_name\", \"(.*)\"  ))"
    for         = null
    labels = {
      workload_type = "job"
    }
    record   = "namespace_workload_pod:kube_pod_owner:relabel"
    severity = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum(  node_memory_MemAvailable_bytes{job=\"node\"} or  (    node_memory_Buffers_bytes{job=\"node\"} +    node_memory_Cached_bytes{job=\"node\"} +    node_memory_MemFree_bytes{job=\"node\"} +    node_memory_Slab_bytes{job=\"node\"}  )) by (cluster)"
    for         = null
    labels      = {}
    record      = ":node_memory_MemAvailable_bytes:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum(rate(node_cpu_seconds_total{job=\"node\",mode!=\"idle\",mode!=\"iowait\",mode!=\"steal\"}[5m])) by (cluster) /count(sum(node_cpu_seconds_total{job=\"node\"}) by (cluster, instance, cpu)) by (cluster)"
    for         = null
    labels      = {}
    record      = "cluster:node_cpu:ratio_rate5m"
    severity    = 0
  }
}

# __generated__ by Terraform from "/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourceGroups/thanu-rg/providers/Microsoft.AlertsManagement/prometheusRuleGroups/UXRecordingRulesRuleGroup - coderaptor-prod-aks"
resource "azurerm_monitor_alert_prometheus_rule_group" "ux_recording" {
  cluster_name        = "coderaptor-prod-aks"
  description         = "UX Recording Rules for Linux"
  interval            = "PT1M"
  location            = "australiaeast"
  name                = "UXRecordingRulesRuleGroup - coderaptor-prod-aks"
  resource_group_name = "thanu-rg"
  rule_group_enabled  = true
  scopes              = ["/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourcegroups/defaultresourcegroup-eau/providers/microsoft.monitor/accounts/defaultazuremonitorworkspace-eau", "/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourcegroups/thanu-rg/providers/microsoft.containerservice/managedclusters/coderaptor-prod-aks"]
  tags                = {}
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "(sum by (namespace, pod, cluster, microsoft_resourceid) (\n\tirate(container_cpu_usage_seconds_total{container != \"\", pod != \"\", job = \"cadvisor\"}[5m])\n)) * on (pod, namespace, cluster, microsoft_resourceid) group_left (node, created_by_name, created_by_kind)\n(max by (node, created_by_name, created_by_kind, pod, namespace, cluster, microsoft_resourceid) (kube_pod_info{pod != \"\", job = \"kube-state-metrics\"}))"
    for         = null
    labels      = {}
    record      = "ux:pod_cpu_usage:sum_irate"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (namespace, node, cluster, created_by_name, created_by_kind, microsoft_resourceid) (\nux:pod_cpu_usage:sum_irate\n)\n"
    for         = null
    labels      = {}
    record      = "ux:controller_cpu_usage:sum_irate"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "(\n\t    sum by (namespace, pod, cluster, microsoft_resourceid) (\n\t\tcontainer_memory_working_set_bytes{container != \"\", pod != \"\", job = \"cadvisor\"}\n\t    )\n\t) * on (pod, namespace, cluster, microsoft_resourceid) group_left (node, created_by_name, created_by_kind)\n(max by (node, created_by_name, created_by_kind, pod, namespace, cluster, microsoft_resourceid) (kube_pod_info{pod != \"\", job = \"kube-state-metrics\"}))"
    for         = null
    labels      = {}
    record      = "ux:pod_workingset_memory:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (namespace, node, cluster, created_by_name, created_by_kind, microsoft_resourceid) (\nux:pod_workingset_memory:sum\n)"
    for         = null
    labels      = {}
    record      = "ux:controller_workingset_memory:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "(\n\t    sum by (namespace, pod, cluster, microsoft_resourceid) (\n\t\tcontainer_memory_rss{container != \"\", pod != \"\", job = \"cadvisor\"}\n\t    )\n\t) * on (pod, namespace, cluster, microsoft_resourceid) group_left (node, created_by_name, created_by_kind)\n(max by (node, created_by_name, created_by_kind, pod, namespace, cluster, microsoft_resourceid) (kube_pod_info{pod != \"\", job = \"kube-state-metrics\"}))"
    for         = null
    labels      = {}
    record      = "ux:pod_rss_memory:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (namespace, node, cluster, created_by_name, created_by_kind, microsoft_resourceid) (\nux:pod_rss_memory:sum\n)"
    for         = null
    labels      = {}
    record      = "ux:controller_rss_memory:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (node, created_by_name, created_by_kind, namespace, cluster, pod, microsoft_resourceid) (\n(\n(\nsum by (container, pod, namespace, cluster, microsoft_resourceid) (kube_pod_container_info{container != \"\", pod != \"\", container_id != \"\", job = \"kube-state-metrics\"})\nor sum by (container, pod, namespace, cluster, microsoft_resourceid) (kube_pod_init_container_info{container != \"\", pod != \"\", container_id != \"\", job = \"kube-state-metrics\"})\n)\n* on (pod, namespace, cluster, microsoft_resourceid) group_left (node, created_by_name, created_by_kind)\n(\nmax by (node, created_by_name, created_by_kind, pod, namespace, cluster, microsoft_resourceid) (\n\tkube_pod_info{pod != \"\", job = \"kube-state-metrics\"}\n)\n)\n)\n\n)"
    for         = null
    labels      = {}
    record      = "ux:pod_container_count:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (node, created_by_name, created_by_kind, namespace, cluster, microsoft_resourceid) (\nux:pod_container_count:sum\n)"
    for         = null
    labels      = {}
    record      = "ux:controller_container_count:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "max by (node, created_by_name, created_by_kind, namespace, cluster, pod, microsoft_resourceid) (\n(\n(\nmax by (container, pod, namespace, cluster, microsoft_resourceid) (kube_pod_container_status_restarts_total{container != \"\", pod != \"\", job = \"kube-state-metrics\"})\nor sum by (container, pod, namespace, cluster, microsoft_resourceid) (kube_pod_init_status_restarts_total{container != \"\", pod != \"\", job = \"kube-state-metrics\"})\n)\n* on (pod, namespace, cluster, microsoft_resourceid) group_left (node, created_by_name, created_by_kind)\n(\nmax by (node, created_by_name, created_by_kind, pod, namespace, cluster, microsoft_resourceid) (\n\tkube_pod_info{pod != \"\", job = \"kube-state-metrics\"}\n)\n)\n)\n\n)"
    for         = null
    labels      = {}
    record      = "ux:pod_container_restarts:max"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "max by (node, created_by_name, created_by_kind, namespace, cluster, microsoft_resourceid) (\nux:pod_container_restarts:max\n)"
    for         = null
    labels      = {}
    record      = "ux:controller_container_restarts:max"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "(sum by (cluster, pod, namespace, resource, microsoft_resourceid) (\n(\n\tmax by (cluster, microsoft_resourceid, pod, container, namespace, resource)\n\t (kube_pod_container_resource_limits{container != \"\", pod != \"\", job = \"kube-state-metrics\"})\n)\n)unless (count by (pod, namespace, cluster, resource, microsoft_resourceid)\n\t(kube_pod_container_resource_limits{container != \"\", pod != \"\", job = \"kube-state-metrics\"})\n!= on (pod, namespace, cluster, microsoft_resourceid) group_left()\n sum by (pod, namespace, cluster, microsoft_resourceid)\n (kube_pod_container_info{container != \"\", pod != \"\", job = \"kube-state-metrics\"}) \n)\n\n)* on (namespace, pod, cluster, microsoft_resourceid) group_left (node, created_by_kind, created_by_name)\n(\n\tkube_pod_info{pod != \"\", job = \"kube-state-metrics\"}\n)"
    for         = null
    labels      = {}
    record      = "ux:pod_resource_limit:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (cluster, namespace, created_by_name, created_by_kind, node, resource, microsoft_resourceid) (\nux:pod_resource_limit:sum\n)"
    for         = null
    labels      = {}
    record      = "ux:controller_resource_limit:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (cluster, phase, node, created_by_kind, created_by_name, namespace, microsoft_resourceid) ( (\n(kube_pod_status_phase{job=\"kube-state-metrics\",pod!=\"\"})\n or (label_replace((count(kube_pod_deletion_timestamp{job=\"kube-state-metrics\",pod!=\"\"}) by (namespace, pod, cluster, microsoft_resourceid) * count(kube_pod_status_reason{reason=\"NodeLost\", job=\"kube-state-metrics\"} == 0) by (namespace, pod, cluster, microsoft_resourceid)), \"phase\", \"terminating\", \"\", \"\"))) * on (pod, namespace, cluster, microsoft_resourceid) group_left (node, created_by_name, created_by_kind)\n(\nmax by (node, created_by_name, created_by_kind, pod, namespace, cluster, microsoft_resourceid) (\nkube_pod_info{job=\"kube-state-metrics\",pod!=\"\"}\n)\n)\n)"
    for         = null
    labels      = {}
    record      = "ux:controller_pod_phase_count:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (cluster, phase, node, namespace, microsoft_resourceid) (\nux:controller_pod_phase_count:sum\n)"
    for         = null
    labels      = {}
    record      = "ux:cluster_pod_phase_count:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (instance, cluster, microsoft_resourceid) (\n(1 - irate(node_cpu_seconds_total{job=\"node\", mode=\"idle\"}[5m]))\n)"
    for         = null
    labels      = {}
    record      = "ux:node_cpu_usage:sum_irate"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (instance, cluster, microsoft_resourceid) ((\nnode_memory_MemTotal_bytes{job = \"node\"}\n- node_memory_MemFree_bytes{job = \"node\"} \n- node_memory_cached_bytes{job = \"node\"}\n- node_memory_buffers_bytes{job = \"node\"}\n))"
    for         = null
    labels      = {}
    record      = "ux:node_memory_usage:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (instance, cluster, microsoft_resourceid) (irate(node_network_receive_drop_total{job=\"node\", device!=\"lo\"}[5m]))"
    for         = null
    labels      = {}
    record      = "ux:node_network_receive_drop_total:sum_irate"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (instance, cluster, microsoft_resourceid) (irate(node_network_transmit_drop_total{job=\"node\", device!=\"lo\"}[5m]))"
    for         = null
    labels      = {}
    record      = "ux:node_network_transmit_drop_total:sum_irate"
    severity    = 0
  }
}

# __generated__ by Terraform from "/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourceGroups/thanu-rg/providers/Microsoft.AlertsManagement/prometheusRuleGroups/NodeRecordingRulesRuleGroup-Win - coderaptor-prod-aks"
resource "azurerm_monitor_alert_prometheus_rule_group" "node_recording_windows" {
  cluster_name        = "coderaptor-prod-aks"
  description         = "Node Recording Rules RuleGroup for Windows"
  interval            = "PT1M"
  location            = "australiaeast"
  name                = "NodeRecordingRulesRuleGroup-Win - coderaptor-prod-aks"
  resource_group_name = "thanu-rg"
  rule_group_enabled  = false
  scopes              = ["/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourcegroups/defaultresourcegroup-eau/providers/microsoft.monitor/accounts/defaultazuremonitorworkspace-eau", "/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourcegroups/thanu-rg/providers/microsoft.containerservice/managedclusters/coderaptor-prod-aks"]
  tags                = {}
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "count (windows_system_system_up_time{job=\"windows-exporter\"})"
    for         = null
    labels      = {}
    record      = "node:windows_node:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "count by (instance) (sum by (instance, core) (windows_cpu_time_total{job=\"windows-exporter\"}))"
    for         = null
    labels      = {}
    record      = "node:windows_node_num_cpu:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "1 - avg(rate(windows_cpu_time_total{job=\"windows-exporter\",mode=\"idle\"}[5m]))"
    for         = null
    labels      = {}
    record      = ":windows_node_cpu_utilisation:avg5m"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "1 - avg by (instance) (rate(windows_cpu_time_total{job=\"windows-exporter\",mode=\"idle\"}[5m]))"
    for         = null
    labels      = {}
    record      = "node:windows_node_cpu_utilisation:avg5m"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "1 -sum(windows_memory_available_bytes{job=\"windows-exporter\"})/sum(windows_os_visible_memory_bytes{job=\"windows-exporter\"})"
    for         = null
    labels      = {}
    record      = ":windows_node_memory_utilisation:"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum(windows_memory_available_bytes{job=\"windows-exporter\"} + windows_memory_cache_bytes{job=\"windows-exporter\"})"
    for         = null
    labels      = {}
    record      = ":windows_node_memory_MemFreeCached_bytes:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "(windows_memory_cache_bytes{job=\"windows-exporter\"} + windows_memory_modified_page_list_bytes{job=\"windows-exporter\"} + windows_memory_standby_cache_core_bytes{job=\"windows-exporter\"} + windows_memory_standby_cache_normal_priority_bytes{job=\"windows-exporter\"} + windows_memory_standby_cache_reserve_bytes{job=\"windows-exporter\"})"
    for         = null
    labels      = {}
    record      = "node:windows_node_memory_totalCached_bytes:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum(windows_os_visible_memory_bytes{job=\"windows-exporter\"})"
    for         = null
    labels      = {}
    record      = ":windows_node_memory_MemTotal_bytes:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (instance) ((windows_memory_available_bytes{job=\"windows-exporter\"}))"
    for         = null
    labels      = {}
    record      = "node:windows_node_memory_bytes_available:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (instance) (windows_os_visible_memory_bytes{job=\"windows-exporter\"})"
    for         = null
    labels      = {}
    record      = "node:windows_node_memory_bytes_total:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "(node:windows_node_memory_bytes_total:sum - node:windows_node_memory_bytes_available:sum) / scalar(sum(node:windows_node_memory_bytes_total:sum))"
    for         = null
    labels      = {}
    record      = "node:windows_node_memory_utilisation:ratio"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "1 - (node:windows_node_memory_bytes_available:sum / node:windows_node_memory_bytes_total:sum)"
    for         = null
    labels      = {}
    record      = "node:windows_node_memory_utilisation:"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "irate(windows_memory_swap_page_operations_total{job=\"windows-exporter\"}[5m])"
    for         = null
    labels      = {}
    record      = "node:windows_node_memory_swap_io_pages:irate"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "avg(irate(windows_logical_disk_read_seconds_total{job=\"windows-exporter\"}[5m]) + irate(windows_logical_disk_write_seconds_total{job=\"windows-exporter\"}[5m]))"
    for         = null
    labels      = {}
    record      = ":windows_node_disk_utilisation:avg_irate"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "avg by (instance) ((irate(windows_logical_disk_read_seconds_total{job=\"windows-exporter\"}[5m]) + irate(windows_logical_disk_write_seconds_total{job=\"windows-exporter\"}[5m])))"
    for         = null
    labels      = {}
    record      = "node:windows_node_disk_utilisation:avg_irate"
    severity    = 0
  }
}

# __generated__ by Terraform from "/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourceGroups/thanu-rg/providers/Microsoft.AlertsManagement/prometheusRuleGroups/NodeAndKubernetesRecordingRulesRuleGroup-Win - coderaptor-prod-aks"
resource "azurerm_monitor_alert_prometheus_rule_group" "node_and_kubernetes_recording_windows" {
  cluster_name        = "coderaptor-prod-aks"
  description         = "Node and Kubernetes Recording Rules RuleGroup for Windows"
  interval            = "PT1M"
  location            = "australiaeast"
  name                = "NodeAndKubernetesRecordingRulesRuleGroup-Win - coderaptor-prod-aks"
  resource_group_name = "thanu-rg"
  rule_group_enabled  = false
  scopes              = ["/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourcegroups/defaultresourcegroup-eau/providers/microsoft.monitor/accounts/defaultazuremonitorworkspace-eau", "/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourcegroups/thanu-rg/providers/microsoft.containerservice/managedclusters/coderaptor-prod-aks"]
  tags                = {}
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "max by (instance,volume)((windows_logical_disk_size_bytes{job=\"windows-exporter\"} - windows_logical_disk_free_bytes{job=\"windows-exporter\"}) / windows_logical_disk_size_bytes{job=\"windows-exporter\"})"
    for         = null
    labels      = {}
    record      = "node:windows_node_filesystem_usage:"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "max by (instance, volume) (windows_logical_disk_free_bytes{job=\"windows-exporter\"} / windows_logical_disk_size_bytes{job=\"windows-exporter\"})"
    for         = null
    labels      = {}
    record      = "node:windows_node_filesystem_avail:"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum(irate(windows_net_bytes_total{job=\"windows-exporter\"}[5m]))"
    for         = null
    labels      = {}
    record      = ":windows_node_net_utilisation:sum_irate"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (instance) ((irate(windows_net_bytes_total{job=\"windows-exporter\"}[5m])))"
    for         = null
    labels      = {}
    record      = "node:windows_node_net_utilisation:sum_irate"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum(irate(windows_net_packets_received_discarded_total{job=\"windows-exporter\"}[5m])) + sum(irate(windows_net_packets_outbound_discarded_total{job=\"windows-exporter\"}[5m]))"
    for         = null
    labels      = {}
    record      = ":windows_node_net_saturation:sum_irate"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (instance) ((irate(windows_net_packets_received_discarded_total{job=\"windows-exporter\"}[5m]) + irate(windows_net_packets_outbound_discarded_total{job=\"windows-exporter\"}[5m])))"
    for         = null
    labels      = {}
    record      = "node:windows_node_net_saturation:sum_irate"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "windows_container_available{job=\"windows-exporter\", container_id != \"\"} * on(container_id) group_left(container, pod, namespace) max(kube_pod_container_info{job=\"kube-state-metrics\", container_id != \"\"}) by(container, container_id, pod, namespace)"
    for         = null
    labels      = {}
    record      = "windows_pod_container_available"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "windows_container_cpu_usage_seconds_total{job=\"windows-exporter\", container_id != \"\"} * on(container_id) group_left(container, pod, namespace) max(kube_pod_container_info{job=\"kube-state-metrics\", container_id != \"\"}) by(container, container_id, pod, namespace)"
    for         = null
    labels      = {}
    record      = "windows_container_total_runtime"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "windows_container_memory_usage_commit_bytes{job=\"windows-exporter\", container_id != \"\"} * on(container_id) group_left(container, pod, namespace) max(kube_pod_container_info{job=\"kube-state-metrics\", container_id != \"\"}) by(container, container_id, pod, namespace)"
    for         = null
    labels      = {}
    record      = "windows_container_memory_usage"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "windows_container_memory_usage_private_working_set_bytes{job=\"windows-exporter\", container_id != \"\"} * on(container_id) group_left(container, pod, namespace) max(kube_pod_container_info{job=\"kube-state-metrics\", container_id != \"\"}) by(container, container_id, pod, namespace)"
    for         = null
    labels      = {}
    record      = "windows_container_private_working_set_usage"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "windows_container_network_receive_bytes_total{job=\"windows-exporter\", container_id != \"\"} * on(container_id) group_left(container, pod, namespace) max(kube_pod_container_info{job=\"kube-state-metrics\", container_id != \"\"}) by(container, container_id, pod, namespace)"
    for         = null
    labels      = {}
    record      = "windows_container_network_received_bytes_total"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "windows_container_network_transmit_bytes_total{job=\"windows-exporter\", container_id != \"\"} * on(container_id) group_left(container, pod, namespace) max(kube_pod_container_info{job=\"kube-state-metrics\", container_id != \"\"}) by(container, container_id, pod, namespace)"
    for         = null
    labels      = {}
    record      = "windows_container_network_transmitted_bytes_total"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "max by (namespace, pod, container) (kube_pod_container_resource_requests{resource=\"memory\",job=\"kube-state-metrics\"}) * on(container,pod,namespace) (windows_pod_container_available)"
    for         = null
    labels      = {}
    record      = "kube_pod_windows_container_resource_memory_request"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "kube_pod_container_resource_limits{resource=\"memory\",job=\"kube-state-metrics\"} * on(container,pod,namespace) (windows_pod_container_available)"
    for         = null
    labels      = {}
    record      = "kube_pod_windows_container_resource_memory_limit"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "max by (namespace, pod, container) ( kube_pod_container_resource_requests{resource=\"cpu\",job=\"kube-state-metrics\"}) * on(container,pod,namespace) (windows_pod_container_available)"
    for         = null
    labels      = {}
    record      = "kube_pod_windows_container_resource_cpu_cores_request"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "kube_pod_container_resource_limits{resource=\"cpu\",job=\"kube-state-metrics\"} * on(container,pod,namespace) (windows_pod_container_available)"
    for         = null
    labels      = {}
    record      = "kube_pod_windows_container_resource_cpu_cores_limit"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (namespace, pod, container) (rate(windows_container_total_runtime{}[5m]))"
    for         = null
    labels      = {}
    record      = "namespace_pod_container:windows_container_cpu_usage_seconds_total:sum_rate"
    severity    = 0
  }
}

# __generated__ by Terraform from "/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourceGroups/thanu-rg/providers/Microsoft.Network/bastionHosts/coderaptor-prod-vnet-bastion"
resource "azurerm_bastion_host" "unmanaged_bastion" {
  copy_paste_enabled        = true
  file_copy_enabled         = false
  ip_connect_enabled        = false
  kerberos_enabled          = false
  location                  = "australiaeast"
  name                      = "coderaptor-prod-vnet-bastion"
  resource_group_name       = "thanu-rg"
  scale_units               = 2
  session_recording_enabled = false
  shareable_link_enabled    = false
  sku                       = "Developer"
  tags                      = {}
  tunneling_enabled         = false
  virtual_network_id        = "/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourceGroups/thanu-rg/providers/Microsoft.Network/virtualNetworks/coderaptor-prod-vnet"
  zones                     = []
}

# __generated__ by Terraform from "/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourceGroups/thanu-rg/providers/Microsoft.Insights/dataCollectionEndpoints/MSProm-australiaeast-coderaptor-prod-aks"
resource "azurerm_monitor_data_collection_endpoint" "aks_prometheus" {
  description                   = null
  kind                          = "Linux"
  location                      = "australiaeast"
  name                          = "MSProm-australiaeast-coderaptor-prod-aks"
  public_network_access_enabled = true
  resource_group_name           = "thanu-rg"
  tags                          = {}
}

# __generated__ by Terraform from "/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourceGroups/thanu-rg/providers/Microsoft.Insights/metricAlerts/cpu"
resource "azurerm_monitor_metric_alert" "manual_cpu" {
  auto_mitigate            = true
  description              = null
  enabled                  = true
  frequency                = "PT5M"
  name                     = "cpu"
  resource_group_name      = "thanu-rg"
  scopes                   = ["/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourceGroups/thanu-rg/providers/Microsoft.ContainerService/managedClusters/coderaptor-prod-aks"]
  severity                 = 3
  tags                     = {}
  target_resource_location = "australiaeast"
  target_resource_type     = "Microsoft.ContainerService/managedClusters"
  window_size              = "PT5M"
  criteria {
    aggregation            = "Average"
    metric_name            = "node_cpu_usage_percentage"
    metric_namespace       = "Microsoft.ContainerService/managedClusters"
    operator               = "GreaterThan"
    skip_metric_validation = false
    threshold              = 75
    dimension {
      name     = "node"
      operator = "Include"
      values   = ["*"]
    }
    dimension {
      name     = "nodepool"
      operator = "Exclude"
      values   = ["workload", "system"]
    }
  }
}

# __generated__ by Terraform from "/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourceGroups/thanu-rg/providers/Microsoft.Insights/dataCollectionRules/MSProm-australiaeast-coderaptor-prod-aks"
resource "azurerm_monitor_data_collection_rule" "aks_prometheus" {
  data_collection_endpoint_id = "/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourceGroups/thanu-rg/providers/Microsoft.Insights/dataCollectionEndpoints/MSProm-australiaeast-coderaptor-prod-aks"
  description                 = null
  kind                        = "Linux"
  location                    = "australiaeast"
  name                        = "MSProm-australiaeast-coderaptor-prod-aks"
  resource_group_name         = "thanu-rg"
  tags                        = {}
  data_flow {
    built_in_transform = null
    destinations       = ["MonitoringAccount1"]
    output_stream      = null
    streams            = ["Microsoft-PrometheusMetrics"]
    transform_kql      = null
  }
  data_sources {
    prometheus_forwarder {
      name    = "PrometheusDataSource"
      streams = ["Microsoft-PrometheusMetrics"]
    }
  }
  destinations {
    monitor_account {
      monitor_account_id = "/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourcegroups/defaultresourcegroup-eau/providers/microsoft.monitor/accounts/defaultazuremonitorworkspace-eau"
      name               = "MonitoringAccount1"
    }
  }
}

# __generated__ by Terraform from "/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourceGroups/thanu-rg/providers/Microsoft.Insights/metricAlerts/cpu  usage"
resource "azurerm_monitor_metric_alert" "manual_cpu_usage" {
  auto_mitigate            = true
  description              = null
  enabled                  = true
  frequency                = "PT5M"
  name                     = "cpu  usage"
  resource_group_name      = "thanu-rg"
  scopes                   = ["/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourceGroups/thanu-rg/providers/Microsoft.ContainerService/managedClusters/coderaptor-prod-aks"]
  severity                 = 3
  tags                     = {}
  target_resource_location = "australiaeast"
  target_resource_type     = "Microsoft.ContainerService/managedClusters"
  window_size              = "PT5M"
  criteria {
    aggregation            = "Average"
    metric_name            = "node_cpu_usage_percentage"
    metric_namespace       = "Microsoft.ContainerService/managedClusters"
    operator               = "GreaterThan"
    skip_metric_validation = false
    threshold              = 75
  }
}

# __generated__ by Terraform from "/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourceGroups/thanu-rg/providers/Microsoft.AlertsManagement/prometheusRuleGroups/UXRecordingRulesRuleGroup-Win - coderaptor-prod-aks"
resource "azurerm_monitor_alert_prometheus_rule_group" "ux_recording_windows" {
  cluster_name        = "coderaptor-prod-aks"
  description         = "UX Recording Rules for Windows"
  interval            = "PT1M"
  location            = "australiaeast"
  name                = "UXRecordingRulesRuleGroup-Win - coderaptor-prod-aks"
  resource_group_name = "thanu-rg"
  rule_group_enabled  = false
  scopes              = ["/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourcegroups/defaultresourcegroup-eau/providers/microsoft.monitor/accounts/defaultazuremonitorworkspace-eau", "/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourcegroups/thanu-rg/providers/microsoft.containerservice/managedclusters/coderaptor-prod-aks"]
  tags                = {}
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (cluster, pod, namespace, node, created_by_kind, created_by_name, microsoft_resourceid) (\n\t(\n\t\tmax by (instance, container_id, cluster, microsoft_resourceid) (\n\t\t\tirate(windows_container_cpu_usage_seconds_total{ container_id != \"\", job = \"windows-exporter\"}[5m])\n\t\t) * on (container_id, cluster, microsoft_resourceid) group_left (container, pod, namespace) (\n\t\t\tmax by (container, container_id, pod, namespace, cluster, microsoft_resourceid) (\n\t\t\t\tkube_pod_container_info{container != \"\", pod != \"\", container_id != \"\", job = \"kube-state-metrics\"}\n\t\t\t)\n\t\t)\n\t) * on (pod, namespace, cluster, microsoft_resourceid) group_left (node, created_by_name, created_by_kind)\n\t(\n\t\tmax by (node, created_by_name, created_by_kind, pod, namespace, cluster, microsoft_resourceid) (\n\t\t  kube_pod_info{ pod != \"\", job = \"kube-state-metrics\"}\n\t\t)\n\t)\n)"
    for         = null
    labels      = {}
    record      = "ux:pod_cpu_usage_windows:sum_irate"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (namespace, node, cluster, created_by_name, created_by_kind, microsoft_resourceid) (\nux:pod_cpu_usage_windows:sum_irate\n)\n"
    for         = null
    labels      = {}
    record      = "ux:controller_cpu_usage_windows:sum_irate"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (cluster, pod, namespace, node, created_by_kind, created_by_name, microsoft_resourceid) (\n\t(\n\t\tmax by (instance, container_id, cluster, microsoft_resourceid) (\n\t\t\twindows_container_memory_usage_private_working_set_bytes{ container_id != \"\", job = \"windows-exporter\"}\n\t\t) * on (container_id, cluster, microsoft_resourceid) group_left (container, pod, namespace) (\n\t\t\tmax by (container, container_id, pod, namespace, cluster, microsoft_resourceid) (\n\t\t\t\tkube_pod_container_info{container != \"\", pod != \"\", container_id != \"\", job = \"kube-state-metrics\"}\n\t\t\t)\n\t\t)\n\t) * on (pod, namespace, cluster, microsoft_resourceid) group_left (node, created_by_name, created_by_kind)\n\t(\n\t\tmax by (node, created_by_name, created_by_kind, pod, namespace, cluster, microsoft_resourceid) (\n\t\t  kube_pod_info{ pod != \"\", job = \"kube-state-metrics\"}\n\t\t)\n\t)\n)"
    for         = null
    labels      = {}
    record      = "ux:pod_workingset_memory_windows:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (namespace, node, cluster, created_by_name, created_by_kind, microsoft_resourceid) (\nux:pod_workingset_memory_windows:sum\n)"
    for         = null
    labels      = {}
    record      = "ux:controller_workingset_memory_windows:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (instance, cluster, microsoft_resourceid) (\n(1 - irate(windows_cpu_time_total{job=\"windows-exporter\", mode=\"idle\"}[5m]))\n)"
    for         = null
    labels      = {}
    record      = "ux:node_cpu_usage_windows:sum_irate"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (instance, cluster, microsoft_resourceid) ((\nwindows_os_visible_memory_bytes{job = \"windows-exporter\"}\n- windows_memory_available_bytes{job = \"windows-exporter\"}\n))"
    for         = null
    labels      = {}
    record      = "ux:node_memory_usage_windows:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (instance, cluster, microsoft_resourceid) (irate(windows_net_packets_received_discarded_total{job=\"windows-exporter\", device!=\"lo\"}[5m]))"
    for         = null
    labels      = {}
    record      = "ux:node_network_packets_received_drop_total_windows:sum_irate"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum by (instance, cluster, microsoft_resourceid) (irate(windows_net_packets_outbound_discarded_total{job=\"windows-exporter\", device!=\"lo\"}[5m]))"
    for         = null
    labels      = {}
    record      = "ux:node_network_packets_outbound_drop_total_windows:sum_irate"
    severity    = 0
  }
}

# __generated__ by Terraform from "/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourceGroups/thanu-rg/providers/Microsoft.AlertsManagement/prometheusRuleGroups/NodeRecordingRulesRuleGroup - coderaptor-prod-aks"
resource "azurerm_monitor_alert_prometheus_rule_group" "node_recording" {
  cluster_name        = "coderaptor-prod-aks"
  description         = "Node Recording Rules RuleGroup"
  interval            = "PT1M"
  location            = "australiaeast"
  name                = "NodeRecordingRulesRuleGroup - coderaptor-prod-aks"
  resource_group_name = "thanu-rg"
  rule_group_enabled  = true
  scopes              = ["/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourcegroups/defaultresourcegroup-eau/providers/microsoft.monitor/accounts/defaultazuremonitorworkspace-eau", "/subscriptions/76f96adf-7aa2-4cbd-9923-41400cfd5f95/resourcegroups/thanu-rg/providers/microsoft.containerservice/managedclusters/coderaptor-prod-aks"]
  tags                = {}
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "count without (cpu, mode) (  node_cpu_seconds_total{job=\"node\",mode=\"idle\"})"
    for         = null
    labels      = {}
    record      = "instance:node_num_cpu:sum"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "1 - avg without (cpu) (  sum without (mode) (rate(node_cpu_seconds_total{job=\"node\", mode=~\"idle|iowait|steal\"}[5m])))"
    for         = null
    labels      = {}
    record      = "instance:node_cpu_utilisation:rate5m"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "(  node_load1{job=\"node\"}/  instance:node_num_cpu:sum{job=\"node\"})"
    for         = null
    labels      = {}
    record      = "instance:node_load1_per_cpu:ratio"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "1 - (  (    node_memory_MemAvailable_bytes{job=\"node\"}    or    (      node_memory_Buffers_bytes{job=\"node\"}      +      node_memory_Cached_bytes{job=\"node\"}      +      node_memory_MemFree_bytes{job=\"node\"}      +      node_memory_Slab_bytes{job=\"node\"}    )  )/  node_memory_MemTotal_bytes{job=\"node\"})"
    for         = null
    labels      = {}
    record      = "instance:node_memory_utilisation:ratio"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "rate(node_vmstat_pgmajfault{job=\"node\"}[5m])"
    for         = null
    labels      = {}
    record      = "instance:node_vmstat_pgmajfault:rate5m"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "rate(node_disk_io_time_seconds_total{job=\"node\", device!=\"\"}[5m])"
    for         = null
    labels      = {}
    record      = "instance_device:node_disk_io_time_seconds:rate5m"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "rate(node_disk_io_time_weighted_seconds_total{job=\"node\", device!=\"\"}[5m])"
    for         = null
    labels      = {}
    record      = "instance_device:node_disk_io_time_weighted_seconds:rate5m"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum without (device) (  rate(node_network_receive_bytes_total{job=\"node\", device!=\"lo\"}[5m]))"
    for         = null
    labels      = {}
    record      = "instance:node_network_receive_bytes_excluding_lo:rate5m"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum without (device) (  rate(node_network_transmit_bytes_total{job=\"node\", device!=\"lo\"}[5m]))"
    for         = null
    labels      = {}
    record      = "instance:node_network_transmit_bytes_excluding_lo:rate5m"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum without (device) (  rate(node_network_receive_drop_total{job=\"node\", device!=\"lo\"}[5m]))"
    for         = null
    labels      = {}
    record      = "instance:node_network_receive_drop_excluding_lo:rate5m"
    severity    = 0
  }
  rule {
    alert       = null
    annotations = {}
    enabled     = false
    expression  = "sum without (device) (  rate(node_network_transmit_drop_total{job=\"node\", device!=\"lo\"}[5m]))"
    for         = null
    labels      = {}
    record      = "instance:node_network_transmit_drop_excluding_lo:rate5m"
    severity    = 0
  }
}
