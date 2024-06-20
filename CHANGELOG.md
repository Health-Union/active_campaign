# Changelog

## 0.3.1

### Enhancements

* Event tracking endpoint is now configurable via `:event_endpoint`, allowing it to be changed for testing purposes.

### Fixes

* `ActiveCampaign.Tracking.Event.track/3` response json is now decoded.

## 0.3.0

### Enhancements

* Add event tracking functionality.
* Bumped ssl_verify_fun to 1.1.7

## 0.2.5

### Enhancements

* HTTP request options are now configurable.

## 0.2.4

### Enhancements

* The query argument for `ActiveCampaign.Contact.CustomField.list/1` is optional now
* The query_params argument for `ActiveCampaign.CustomObject.Schema.list/1` is optional now

### Potentially Breaking Changes
* If Active Campaign HTTP requests return an error, such as a timeout, the error will now be returned instead of raising an exception. If your application relies on these exceptions for control flow or a retry mechanism, you should make changes.

For example:

```elixir
case ActiveCampaign.Contact.search(%{limit: 10, offset: 0}) do
  {:ok, response} -> # all good
  error_response -> # raise my own exception here or handle failure state
end
```

## 0.2.3

### Enhancements

* The `http_library` is configurable now, the default library is [HTTPoison](https://github.com/edgurgel/httpoison)
* Some additional example responses in some function docs

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
