# Changelog

## 0.2.3

### Enhancements

* The `http_library` is configurable now, the default library is [HTTPoison](https://github.com/edgurgel/httpoison)
* Some additional function docs and example responses

## 0.2.2

### Enhancements

* Support optional callback arg for `ActiveCampaign.Contact.bulk_import/2`

### Fixes

* Fix `ActiveCampaign.Contact.get/1`. It was previously returning the same results from `ActiveCampaign.Contact.get_data/1`

## 0.2.1

### Enhancements

* Relax elixir version down to 1.12
* Relax [HTTPoison](https://github.com/edgurgel/httpoison) version down to 1.4
* The `json_library` is configurable now, the default library is [Jason](https://github.com/michalmuskala/jason)

## 0.2.0

### Enhancements

* Updated documentation
* Implement all API endpoints
