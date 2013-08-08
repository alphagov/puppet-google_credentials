class google_credentials($client_id, $client_secret, $refresh_tokens) {
  file { ['/etc/google', '/etc/google/oauth',
          '/var/lib/google', '/var/lib/google/oauth']:
    ensure  => directory,
    owner   => 'root',
  }

  file { '/etc/google/oauth/client_secrets.json':
    ensure  => present,
    content => template('google_credentials/client_secrets.json.erb'),
    owner   => 'root',
    require => File['/etc/google/oauth'],
    mode    => 'a=r',
  }

  $defaults = {
    client_id => $client_id,
    client_secret => $client_secret,
  }

  create_resources("google_credentials::refresh_token", $refresh_tokens, $defaults)
}