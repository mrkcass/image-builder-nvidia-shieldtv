require 'spec_helper'

Specinfra::Runner.run_command('modprobe configs')

describe command('zcat /proc/config.gz') do
#  its(:stdout) { should match /CONFIG_KPROBES=y/ }
#  its(:stdout) { should match /CONFIG_UPROBES=y/ }
#  its(:stdout) { should match /CONFIG_HAVE_KPROBES=y/ }
  its(:stdout) { should match /CONFIG_EVENT_TRACING=y/ }
#  its(:stdout) { should match /CONFIG_KPROBE_EVENT=y/ }
#  its(:stdout) { should match /CONFIG_UPROBE_EVENT=y/ }
#  its(:stdout) { should match /CONFIG_PROBE_EVENTS=y/ }
  its(:stdout) { should match /CONFIG_FTRACE=y/ }
#  its(:stdout) { should match /CONFIG_FTRACE_SYSCALLS=y/ }
#  its(:stdout) { should match /CONFIG_DYNAMIC_FTRACE=y/ }
  its(:stdout) { should match /CONFIG_HAVE_DYNAMIC_FTRACE=y/ }

  # Docker specific kernel settings (see https://github.com/docker/docker/blob/master/contrib/check-config.sh)
  ## Generally Necessary:
  its(:stdout) { should match /CONFIG_NAMESPACES=y/ }
  its(:stdout) { should match /CONFIG_NET_NS=y/ }
  its(:stdout) { should match /CONFIG_PID_NS=y/ }
  its(:stdout) { should match /CONFIG_IPC_NS=y/ }
  its(:stdout) { should match /CONFIG_UTS_NS=y/ }
  its(:stdout) { should match /CONFIG_DEVPTS_MULTIPLE_INSTANCES=y/ }
  its(:stdout) { should match /CONFIG_CGROUPS=y/ }
  its(:stdout) { should match /CONFIG_CGROUP_CPUACCT=y/ }
  its(:stdout) { should match /CONFIG_CGROUP_DEVICE=y/ }
  its(:stdout) { should match /CONFIG_CGROUP_FREEZER=y/ }
  its(:stdout) { should match /CONFIG_CGROUP_SCHED=y/ }
  its(:stdout) { should match /CONFIG_CPUSETS=y/ }
#  its(:stdout) { should match /CONFIG_MEMCG=y/ }
  its(:stdout) { should match /CONFIG_MACVLAN=y/ }
  its(:stdout) { should match /CONFIG_VETH=y/ }
  its(:stdout) { should match /CONFIG_BRIDGE=y/ }
  its(:stdout) { should match /CONFIG_BRIDGE_NETFILTER=y/ }
  its(:stdout) { should match /CONFIG_NF_NAT_IPV4=y/ }
  its(:stdout) { should match /CONFIG_IP_NF_FILTER=y/ }
  its(:stdout) { should match /CONFIG_IP_NF_TARGET_MASQUERADE=y/ }
  its(:stdout) { should match /CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=y/ }
  its(:stdout) { should match /CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y/ }
  its(:stdout) { should match /CONFIG_NF_NAT=y/ }
  its(:stdout) { should match /CONFIG_NF_NAT_NEEDED=y/ }
  its(:stdout) { should match /CONFIG_POSIX_MQUEUE=y/ }

  ## Optional Features:
#  its(:stdout) { should match /CONFIG_USER_NS=y/ }
  its(:stdout) { should match /CONFIG_SECCOMP=y/ }
#  its(:stdout) { should match /CONFIG_MEMCG_KMEM=y/ }
#  its(:stdout) { should match /CONFIG_MEMCG_SWAP=y/ }
#  its(:stdout) { should match /CONFIG_MEMCG_SWAP_ENABLED=y/ }
  its(:stdout) { should match /CONFIG_RESOURCE_COUNTERS=y/ }
  its(:stdout) { should match /CONFIG_BLK_CGROUP=y/ }
  its(:stdout) { should match /CONFIG_IOSCHED_CFQ=y/ }
  its(:stdout) { should match /CONFIG_BLK_DEV_THROTTLING=y/ }
  its(:stdout) { should match /CONFIG_CGROUP_PERF=y/ }
#  its(:stdout) { should match /CONFIG_CGROUP_HUGETLB=y/ }
  its(:stdout) { should match /CONFIG_NET_CLS_CGROUP=y/ }
  its(:stdout) { should match /CONFIG_NETPRIO_CGROUP=y/ }
  its(:stdout) { should match /CONFIG_CFS_BANDWIDTH=y/ }
  its(:stdout) { should match /CONFIG_FAIR_GROUP_SCHED=y/ }
  its(:stdout) { should match /CONFIG_RT_GROUP_SCHED=y/ }
  its(:stdout) { should match /CONFIG_EXT3_FS=y/ }
  its(:stdout) { should match /CONFIG_EXT3_FS_XATTR=y/ }
  its(:stdout) { should match /CONFIG_EXT3_FS_POSIX_ACL=y/ }
  its(:stdout) { should match /CONFIG_EXT3_FS_SECURITY=y/ }
  its(:stdout) { should match /CONFIG_EXT4_FS=y/ }
  its(:stdout) { should match /CONFIG_EXT4_FS_POSIX_ACL=y/ }
  its(:stdout) { should match /CONFIG_EXT4_FS_SECURITY=y/ }

  ## Storage Drivers:
#  its(:stdout) { should match /CONFIG_AUFS_FS=m/ }
  its(:stdout) { should match /CONFIG_BTRFS_FS=y/ }
  its(:stdout) { should match /CONFIG_BLK_DEV_DM=y/ }
  its(:stdout) { should match /CONFIG_DM_THIN_PROVISIONING=y/ }
#  its(:stdout) { should match /CONFIG_OVERLAY_FS=m/ }
  its(:exit_status) { should eq 0 }
end
