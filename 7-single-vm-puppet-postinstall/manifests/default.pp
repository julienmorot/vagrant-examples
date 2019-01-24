node default {
  exec { 'apt_up':
    command  => 'apt update && apt -y dist-upgrade && apt -y --purge autoremove && touch /root/.firstboot_updates',
    path     => '/usr/bin:/usr/sbin:/bin:/sbin',
    provider => shell,
    unless   => ['test -f /root/.firstboot_updates'],
  }

  Package { 'apache2':
    ensure   => 'present',
  }

  Service { 'apache2':
    ensure   => 'running',
    enable   => 'true',
  }
}


