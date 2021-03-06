class apache {

	# install
	package{'apache2':
		ensure => latest,
	}
	
	file{'/etc/apache2/apache2.conf':
		ensure  => present,
		source  => ["puppet:///modules/apache/apache2.conf",],
		require => Package['apache2'],
	}	

	#webpage resource
	file{'/var/www/html/':
		ensure  => directory,
                recurse => true,
		source  => ["puppet:///modules/apache/html",],
		require => Package['apache2'],
	}

	#keeps service running
	service{'apache2':
		ensure     => running,
		enable     => true,
		hasrestart => true, 
		require    => Package['apache2'],
	}
}
