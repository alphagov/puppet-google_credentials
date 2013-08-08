define google_credentials::refresh_token($client_id, $client_secret, $refresh_token) {
  file { "/var/lib/google/oauth/${name}.db":
    ensure  => present,
    content => template('google_credentials/tokens.db.erb'),
    owner   => 'root',
    require => File['/var/lib/google/oauth'],
    mode    => 'a=rw',
  }
}