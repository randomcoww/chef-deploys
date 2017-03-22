node.default['sshd']['pkg_update_command'] = "apt-get update -qqy"
node.default['sshd']['pkg_names'] = ['openssh-server', 'git']

node.default['sshd']['docker']['config'] = {
  "UsePrivilegeSeparation" => "sandbox",
  "Subsystem" => ["sftp", "internal-sftp"],
  "PermitRootLogin" => false,
  "PasswordAuthentication" => false,
  "ChallengeResponseAuthentication" => false
}

node.default['sshd']['docker']['user'] = {
  'username' => 'randomcoww',
  'home' => '/home/randomcoww',
  'shell' => '/bin/bash',
  'git_repo' => "https://github.com/randomcoww/sshd_user_config.git",
  'git_branch' => "master"
}
