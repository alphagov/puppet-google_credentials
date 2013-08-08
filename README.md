# [puppet-google_credentials](https://github.com/alphagov/puppet-google_credentials)

Puppet module for managing Google API credentials (OAuth). It stores the client secrets file in `/etc/google/oauth` and various refresh token files in `/var/lib/google/oauth` (they get updated by the application).

## Usage

### `google_credentials`

```
google_credentials($client_id, $client_secret, {
  analytics => {
    refresh_token => $analytics_refresh_token,
  },
  drive => {
    refresh_token => $drive_refresh_token,
  }
});
```
